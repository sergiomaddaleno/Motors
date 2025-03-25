#ifndef TEXTURE_HPP
#define TEXTURE_HPP

#include <GL/glew.h>
#include <iostream>
#include <vector>

class Shader;

class TextureImage {
public:
    unsigned char* data;
    int width, height, nrChannels;

    TextureImage(unsigned char* data, int width, int height, int nrChannels);
    ~TextureImage();

    TextureImage(TextureImage&& other) noexcept;
    TextureImage& operator=(TextureImage&& other) noexcept;

private:
    TextureImage(const TextureImage&);
    TextureImage& operator=(const TextureImage&);
};

class TextureComponent {
public:
    GLuint ID;

    TextureComponent(TextureImage image);
    TextureComponent(std::shared_ptr<TextureImage> image);
    std::vector<uint8_t> convertToRGB(const uint8_t* data, int width, int height, int nrChannels);
    ~TextureComponent();

    static TextureImage loadTexture(const char* path);
    void bind(int id, const char* sampler, const std::shared_ptr<Shader>& shader);

    TextureComponent(TextureComponent&& other) noexcept;
    TextureComponent& operator=(TextureComponent&& other) noexcept;

private:
    TextureComponent(const TextureComponent&);
    TextureComponent& operator=(const TextureComponent&);
};

#endif