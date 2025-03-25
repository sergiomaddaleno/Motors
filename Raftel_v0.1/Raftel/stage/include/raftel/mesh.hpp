/**
 * @file mesh.hpp
 * @brief Defines the `Vertex`, `Mesh`, and `MeshFactory` for handling and rendering 3D mesh data.
 * @date 2025-03-10
 * @authors Carlos Mazcuñán Blanes, Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 *
 * @details
 * This file contains definitions for the `Vertex` structure, the `Mesh` class, and the `MeshFactory` class. These are used to handle, load, and render 3D mesh data in a graphics application.
 *
 * The `Vertex` structure represents a 3D vertex with attributes like position, normal, and texture coordinates.
 *
 * The `Mesh` class is responsible for storing and rendering the mesh data, including handling materials and OpenGL buffers.
 *
 * The `MeshFactory` class provides functionality to create and load meshes efficiently, using either single-threaded or multi-threaded operations.
 *
 * ## Usage Example:
 *
 * @code
 * // Example of creating a Mesh and adding materials
 * auto mesh = Raftel::Mesh::Create("path/to/mesh.obj", true);
 * auto material = std::make_shared<Raftel::Material>();
 * mesh->addMaterial(material);
 * mesh->draw(shaderProgram);
 * @endcode
 */

#ifndef __MESH_H__
#define __MESH_H__ 1

#pragma once
#include <vector>
#include <string>
#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include <GL/glew.h>
#include <glm/glm.hpp> 
#include <raftel/material.hpp>
#include <raftel/shader.hpp>
#include <raftel/global_macros.hpp>

#include <raftel/engine.hpp>

namespace Raftel {
    /**
    * @struct Vertex
    * @brief Represents a 3D vertex with attributes like position, normal, and texture coordinates.
    *
    * The `Vertex` structure is used to store vertex data for a 3D mesh, including position, normal vector, and texture coordinates.
    * This structure is typically used as input to shaders for rendering the mesh.
    */
    struct Vertex {
        glm::vec3 position;///< The position of the vertex in 3D space.
        glm::vec3 normal;///< The normal vector of the vertex for lighting calculations.
        glm::vec2 texCoord;///< The texture coordinates of the vertex.

        /**
         * @brief Default constructor for the Vertex structure.
         */
        Vertex() = default;

        /**
        * @brief Constructor for the Vertex structure.
        * @param position The position of the vertex.
        * @param normal The normal vector of the vertex.
        * @param texCoords The texture coordinates of the vertex.
        */
        Vertex(const glm::vec3& position, const glm::vec3& normal, const glm::vec2& texCoord)
            : position(position), normal(normal), texCoord(texCoord) {
        }

        bool operator==(const Vertex& other) const {
            return position == other.position && normal == other.normal && texCoord == other.texCoord;
        }
    };
    
    /**
    * @class Mesh
    * @brief Represents a 3D mesh, including vertex data, indices, and materials.
    *
    * The `Mesh` class is responsible for storing, loading, and rendering 3D mesh data. It handles multiple submeshes, OpenGL buffers,
    * and materials associated with the mesh.
    *
    * @details
    * The class supports the use of multiple materials and submeshes, where each submesh has its own vertex and index data.
    */
    class Mesh {
    public:

        /**
         * @brief Default constructor for the Mesh class.
         */
        Mesh() = default;

        /**
         * @brief Destructor for the Mesh class.
         */
        ~Mesh();

        /**
        * @brief Move constructor for the Mesh class.
        */
        MOVABLE_BUT_NOT_COPYABLE(Mesh)

        /**
         * @brief Static factory method to create a Mesh instance from a file.
         * @param filePath The file path to the mesh file.
         * @param multithread Flag to enable multithreading while loading.
         * @return A shared pointer to the created Mesh instance.
         */
        static std::shared_ptr<Mesh> Create(const std::string& filePath, bool multithread);

        /**
         * @brief Constructor that loads a mesh from a given file path.
         * @param filePath The file path to the mesh file.
         */
        Mesh(const std::string& filePath);

        /**
         * @brief Constructor that takes vertices, indices, and materials directly.
         * @param verticesPerSubmesh A vector of vertex data for each submesh.
         * @param indicesPerSubmesh A vector of index data for each submesh.
         * @param mats A vector of materials for the mesh.
         */
        Mesh(std::vector<std::vector<Vertex>> verticesPerSubmesh,
            std::vector<std::vector<unsigned int>> indicesPerSubmesh,
            std::vector<std::shared_ptr<Material>> mats); 

        /**
         * @brief Constructor that takes vertices and indices data without materials.
         * @param verticesPerSubmesh A vector of vertex data for each submesh.
         * @param indicesPerSubmesh A vector of index data for each submesh.
         */
        Mesh(std::vector<std::vector<Vertex>> verticesPerSubmesh,
            std::vector<std::vector<unsigned int>> indicesPerSubmesh); 

        /**
        * @brief Loads a mesh from a file.
        * @param filePath The file path to the mesh file.
        * @return True if loading was successful, false otherwise.
        */
        bool loadMesh(const std::string& filePath);

        /**
        * @brief Sets the materials for the mesh.
        * @param newMaterials A vector of materials to apply to the mesh.
        */
        void setMaterials(const std::vector<std::shared_ptr<Material>>& newMaterials) {
            materials = newMaterials;
        }

        /**
        * @brief Sets a single material for the mesh.
        * @param mat The material to apply.
        */
        void setMaterial(const std::shared_ptr<Material>& mat) {
            materials.clear();
            materials.push_back(mat);
        }

        /**
         * @brief Adds a material to the mesh.
         * @param mat The material to add.
         */
        void addMaterial(const std::shared_ptr<Material>& mat) {
            materials.push_back(mat);
        }

        /**
        * @brief Initializes OpenGL buffers for the mesh (VAO, VBO, EBO).
        */
        void setupMesh();

        /**
        * @brief Renders the mesh using a specified shader.
        * @param shader The shader program to use for rendering.
        */
        void draw(ShaderProgram& shader);

        /**
        * @brief Sets the uniform variables for the shader program.
        * @param shaderProgramID The ID of the shader program.
        */
        void setUniforms(GLuint shaderProgramID);

        /**
         * @brief Renders the material of the mesh.
         * @param shader The shader program to use for rendering the material.
         */
        void renderMaterial(ShaderProgram& shader);

        /**
         * @brief Retrieves the name of the mesh.
         * @return The name of the mesh.
         */
        std::string getName() { return nameMesh; }

        /**
        * @brief Sets the name of the mesh.
        * @param n_ The name to set for the mesh.
        */
        void setName(std::string n_) {  nameMesh = n_; }

        /**
        * @brief Retrieves the last error encountered during mesh loading.
        * @return The last error message as a string.
        */
        const std::string& getLastError() const { return lastError; }

        /**
         * @brief Retrieves a material by its index.
         * @param index The index of the material.
         * @return A shared pointer to the material at the given index.
         */
        std::shared_ptr<Material> GetMaterialByIndex(int index);

        /**
        * @brief Retrieves all materials associated with the mesh.
        * @return A reference to the vector of materials.
        */
        std::vector<std::shared_ptr<Material>>& GetAllMaterials() { return materials; }

        /**
        * @brief Retrieves all VAOs associated with the mesh.
        * @return A vector of GLuints representing the VAOs.
        */
        std::vector<GLuint> GetVAOs() { return VAOs; }

        /**
        * @brief Retrieves all submesh indices.
        * @return A vector of vectors of unsigned integers representing submesh indices.
        */
        std::vector<std::vector<unsigned int>> GetSubMeshIndex() { return submeshIndices; }

    private:

        /**
        * @brief Loads mesh data from a file.
        * @param filePath The file path to the mesh file.
        * @return True if loading was successful, false otherwise.
        */
        bool loadFromFile(const std::string& filePath);

        /**
        * @brief Loads mesh data using Assimp library.
        * @param filePath The file path to the mesh file.
        * @return True if loading was successful, false otherwise.
        */
        bool loadFromAssimp(const std::string& filePath);

        /**
        * @brief Processes a node in the mesh hierarchy.
        * @param node The Assimp node to process.
        * @param scene The Assimp scene.
        */
        void processNode(aiNode* node, const aiScene* scene);

        /**
        * @brief Processes a mesh within the Assimp scene.
        * @param mesh The Assimp mesh to process.
        * @param scene The Assimp scene.
        */
        void processAssimpMesh(aiMesh* mesh, const aiScene* scene);

        /*@brief Sets an error message.
        * @param errorMessage The error message.
        * @param file The source file where the error occurred.
        * @param line The line number where the error occurred.
        */
        void setError(const std::string& errorMessage, const char* file, int line);

        std::vector<std::shared_ptr<Material>> materials; ///< List of materials assigned to the mesh.
        
        /**
        * @brief Converts an Assimp material into a Raftel Material.
        * @param material The Assimp material to convert.
        * @return A shared pointer to the newly created `Raftel::Material` object.
        */
        std::shared_ptr<Raftel::Material> convertAssimpMaterial(aiMaterial* material);

        std::vector<GLuint> VBOs;  ///< Vertex Buffer Objects.
        std::vector<GLuint> EBOs; ///< Element Buffer Objects.
        std::vector<GLuint> VAOs; ///< Vertex Array Objects.
        std::vector<std::vector<unsigned int>> submeshIndices;  ///< Indices for each submesh.
        std::vector<std::vector<Vertex>> submeshVertex;  ///< Vertices for each submesh.
        //TODO: quitar shared_ptr -> simplemente vector de materiales
        std::string nameMesh; ///< Name of the mesh.

        std::string lastError; ///< Last error encountered during mesh loading.
    };

    /**
     * @class MeshFactory
     * @brief A factory class for creating and loading meshes.
     *
     * The `MeshFactory` class is responsible for loading mesh files from disk, either in a multi-threaded or single-threaded manner.
     * It is designed to make mesh loading efficient and easy to use.
     *
     * @details
     * The factory provides methods to load meshes in the background or synchronously, and it can manage the loading of
     * multiple meshes at once.
     */
    class MeshFactory
    {
    public:

        /**
        * @brief Creates a plane mesh with the given width and height.
        * @param width The width of the plane.
        * @param height The height of the plane.
        * @return A shared pointer to the created plane mesh.
        */
        static std::shared_ptr<Mesh> createPlane(float width, float height);

        /**
         * @brief Creates a cube mesh with the given size.
         * @param size The size of the cube.
         * @return A shared pointer to the created cube mesh.
         */
        static std::shared_ptr<Mesh> createCube(float size);

        /**
        * @brief Creates a sphere mesh with the given radius and number of segments.
        * @param radius The radius of the sphere.
        * @param segments The number of segments used to approximate the sphere's surface.
        * @return A shared pointer to the created sphere mesh.
        */
        static std::shared_ptr<Mesh> createSphere(float radius, int segments);

        /**
         * @brief Creates a terrain mesh from a heightmap image.
         * @param heightMapFile The file path to the heightmap image.
         * @param size The size of the terrain.
         * @param heightMultiplier The multiplier for height values.
         * @param isCentered Whether the terrain should be centered at (0,0,0).
         * @return A shared pointer to the created terrain mesh.
         * @throws std::runtime_error If the heightmap file cannot be loaded.
         */
        static std::shared_ptr<Mesh> createTerrain(const char* heightMapFile,
                                                    float size,
                                                    float heightMultiplier,
                                                    bool isCentered);

        
    };

} // namespace Raftel
#endif // __MESH_HPP__