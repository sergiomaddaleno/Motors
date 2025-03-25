#ifndef MESH_HPP
#define MESH_HPP

#include <GL/glew.h>
#include <glm/glm.hpp>
#include <tiny_obj_loader.h>
#include <string>
#include <vector>

class Shader;
class TextureImage;

struct Vertex {
    glm::vec3 Position;
    glm::vec3 Normal;
    glm::vec2 TexCoords;
};

struct MeshData {
    std::vector<Vertex> vertices;
    std::vector<unsigned int> indices;
};

class MeshComponent {

public:

    std::vector<Vertex> vertices;
    std::vector<unsigned int> indices;

    unsigned int VAO, VBO, EBO;

    MeshComponent(MeshData data);
    ~MeshComponent();

    static MeshData loadModel(const std::string& path);
    static MeshData loadHeightMap(TextureImage& heightmap, float scaleY, float uvScale);
    void Draw(Shader& shader, glm::mat4 view, glm::mat4 projection);

    void setupMesh();

    MeshComponent(MeshComponent&& other) noexcept;
    MeshComponent& operator=(MeshComponent&& other) noexcept;

private:

    //Desabilitar la copia
    MeshComponent(const MeshComponent&);
    MeshComponent& operator=(const MeshComponent&);

};

#endif  