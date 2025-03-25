#ifndef HEIGHTMAP_HPP
#define HEIGHTMAP_HPP

#include <vector>
#include <cstdint>
#include <string>
#include <stdexcept>
#include <cmath>
#include <random>
#include <numeric>

class PerlinNoise {
public:
    explicit PerlinNoise(unsigned int seed = std::random_device{}()) {
        // Inicializa el generador de números aleatorios con la semilla
        std::mt19937 generator(seed);
        std::vector<int> basePerm(256);
        std::iota(basePerm.begin(), basePerm.end(), 0);
        std::shuffle(basePerm.begin(), basePerm.end(), generator);

        perm = basePerm;
        perm.insert(perm.end(), basePerm.begin(), basePerm.end());
    }

    double noise(double x, double y, double z) {
        int X = static_cast<int>(std::floor(x)) & 255;
        int Y = static_cast<int>(std::floor(y)) & 255;
        int Z = static_cast<int>(std::floor(z)) & 255;

        x -= std::floor(x);
        y -= std::floor(y);
        z -= std::floor(z);

        double u = fade(x);
        double v = fade(y);
        double w = fade(z);

        int A = perm[X] + Y;
        int AA = perm[A] + Z;
        int AB = perm[A + 1] + Z;
        int B = perm[X + 1] + Y;
        int BA = perm[B] + Z;
        int BB = perm[B + 1] + Z;

        double res = lerp(w, lerp(v, lerp(u, grad(perm[AA], x, y, z),
            grad(perm[BA], x - 1, y, z)),
            lerp(u, grad(perm[AB], x, y - 1, z),
                grad(perm[BB], x - 1, y - 1, z))),
            lerp(v, lerp(u, grad(perm[AA + 1], x, y, z - 1),
                grad(perm[BA + 1], x - 1, y, z - 1)),
                lerp(u, grad(perm[AB + 1], x, y - 1, z - 1),
                    grad(perm[BB + 1], x - 1, y - 1, z - 1))));
        return (res + 1.0) / 2.0;
    }

private:
    std::vector<int> perm;

    double fade(double t) {
        return t * t * t * (t * (t * 6 - 15) + 10);
    }

    double lerp(double t, double a, double b) {
        return a + t * (b - a);
    }

    double grad(int hash, double x, double y, double z) {
        int h = hash & 15;
        double u = h < 8 ? x : y;
        double v = h < 4 ? y : h == 12 || h == 14 ? x : z;
        return ((h & 1) == 0 ? u : -u) + ((h & 2) == 0 ? v : -v);
    }
};

class HeightmapGenerator {
public:
    HeightmapGenerator(int width, int height)
    : width(width), height(height), data(width* height) {}

    void generateHeightmap(double scale = 0.02, int octaves = 4, double persistence = 0.5, double lacunarity = 2.0) {
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                double amplitude = 1.0;
                double frequency = 1.0;
                double noiseValue = 0.0;

                for (int i = 0; i < octaves; ++i) {
                    double nx = x * scale * frequency;
                    double ny = y * scale * frequency;
                    double nz = 0.0;

                    noiseValue += perlin.noise(nx, ny, nz) * amplitude;

                    amplitude *= persistence;
                    frequency *= lacunarity;
                }

                noiseValue = std::max(0.0, std::min(1.0, noiseValue));

                uint8_t heightValue = static_cast<uint8_t>(noiseValue * -255);
                data[y * width + x] = heightValue;
            }
        }
    }

    void applyIslandMask(double islandFactor = 1.5) {
        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {

                double dx = x - width / 2.0;
                double dy = y - height / 2.0;
                double distance = std::sqrt(dx * dx + dy * dy);

                double maxDistance = std::sqrt((width / 2.0) * (width / 2.0) + (height / 2.0) * (height / 2.0));
                double normalizedDistance = distance / maxDistance;

                double mask = std::pow(std::max(0.0, 1.0 - normalizedDistance * islandFactor), 2.0);
                data[y * width + x] = static_cast<uint8_t>(data[y * width + x] * mask);
            }
        }
    }

    std::vector<uint8_t> generateColorMap() {

        std::vector<uint8_t> colorMap(width * height * 3);

        for (int y = 0; y < height; ++y) {
            for (int x = 0; x < width; ++x) {
                uint8_t heightValue = data[y * width + x];
                uint8_t r, g, b;

                if (heightValue < 0.5) { //AGUA
                    r = 0;
                    g = 0;
                    b = static_cast<uint8_t>(100 + heightValue);
                }
                else if (heightValue < 6) { //PLAYA
                   
                    r = static_cast<uint8_t>(220 + (heightValue - 70) / 2);
                    g = static_cast<uint8_t>(200 + (heightValue - 70) / 2);
                    b = 90;
                }
                else if (heightValue < 10) { //PRADERA
                    r = static_cast<uint8_t>(15);
                    g = static_cast<uint8_t>(91 + (heightValue - 60) / 3);
                    b = static_cast<uint8_t>(7); 
                }
                else if (heightValue < 65) { //MONTAÑA
                    r = static_cast<uint8_t>(100 + (heightValue - 75));
                    g = static_cast<uint8_t>(80 + (heightValue - 75) / 2);
                    b = static_cast<uint8_t>(50);
                }
                else { //NIEVE
                    r = g = b = static_cast<uint8_t>(200 + (heightValue - 200) / 2);
                }

                int index = (y * width + x) * 3;
                colorMap[index] = r;
                colorMap[index + 1] = g;
                colorMap[index + 2] = b;
            }
        }

        return colorMap;
    }

    bool saveAsImage(const std::string& filename);

    bool saveColorMapAsImage(const std::string& filename, const std::vector<uint8_t>& colorMap, int width, int height);

    int width, height;
    std::vector<uint8_t> data;

private:
    PerlinNoise perlin;
};


#endif
