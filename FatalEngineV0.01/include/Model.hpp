#ifndef MODEL_H
#define MODEL_H

#include <glad/glad.h> 
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <string>
#include <vector>
#include <assimp/scene.h>

#include "Transform.hpp"
#include "mesh.hpp"

using namespace std;

namespace RMPH
{
    unsigned char* GetTextureData(const char* path, const string& directory, int* width, int* height, int* nrComponents, bool gamma = false);
    unsigned int TextureFromFile(const char* path, unsigned char* data, int width, int height, int nrComponents, bool gamma = false);

    class Shader;

    class Model
    {
    public:
        vector<Texture> textures_loaded;
        vector<Mesh> meshes;
        string directory;
        bool gammaCorrection;
        string PathObj;
        unsigned int id_texture;
        int widthTexture, heightTexture, nrComponentTexture;
        unsigned char* dataTexture;
        aiScene* scene;

        Model(string const& path, bool gamma = false);
        void Render(Shader ourShader, Transform3D tr);
        void Draw(Shader shader);

    private:
        void loadModel();
        void processNode(aiNode* node, const aiScene* scene);
        Mesh processMesh(aiMesh* mesh, const aiScene* scene);
        vector<Texture> loadMaterialTextures(aiMaterial* mat, aiTextureType type, string typeName);
    };
}

#endif
