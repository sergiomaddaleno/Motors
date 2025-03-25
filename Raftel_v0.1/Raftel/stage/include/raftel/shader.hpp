/**
 * @file shader.hpp
 * @brief Defines the `Shader` and `ShaderProgram` classes for managing shaders in OpenGL.
 * @date 2025-03-10
 * @authors Carlos Mazcuñán Blanes, Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 *
 * This file contains the definitions of the `Shader` and `ShaderProgram` classes, which are used to
 * load, compile, and manage shaders (vertex, fragment, etc.) in an OpenGL program.
 *
 * - The `Shader` class provides methods to load shaders either from files or directly from source code,
 *   compile them, and retrieve errors related to shader compilation.
 * - The `ShaderProgram` class allows linking shaders together into a program, setting uniform variables,
 *   and managing OpenGL shader programs (e.g., using, un-using, and setting uniforms).
 *
 * The classes are designed to handle OpenGL shader objects and program management, enabling rendering
 * with custom shaders in a graphics application.
 *
 * @note This code assumes that the GLEW library is initialized before using these classes.
 * @note It is also assumed that the OpenGL context is properly set up.
 */
#ifndef __SHADER_H__
#define __SHADER_H__ 1

#pragma once
#include <GL/glew.h>
#include <string>
#include <glm/mat4x4.hpp>
#include <raftel/global_macros.hpp>


namespace Raftel {

    /**
     * @class Shader
     * @brief A class to represent an OpenGL shader (vertex, fragment, etc.).
     *
     * This class provides functionality to load, compile, and manage OpenGL shader objects.
     * It allows for loading shaders from source code or files, compiling them, and retrieving
     * error information in case of compilation failures.
     */
    class Shader {
    public:
        /**
         * @brief Default constructor for Shader.
         */
        Shader() = default;

        /**
         * @brief Destructor for Shader.
         *
         * Deletes the shader if it was created successfully.
         */
        ~Shader();

        /**
        * @brief Move constructor for Shader.
        *
        * Moves the resources of another Shader to this one.
        * @param other The Shader to move from.
        */
        MOVABLE_BUT_NOT_COPYABLE(Shader);

        /**
         * @brief Loads a shader from a file.
         *
         * @param filePath The path to the shader file.
         * @param shaderType The type of shader (GL_VERTEX_SHADER, GL_FRAGMENT_SHADER, etc.).
         * @return True if the shader was successfully loaded, false otherwise.
         */
        bool loadFromFile(const std::string& filePath, GLenum shaderType);

        /**
         * @brief Loads a shader from source code.
         *
         * @param sourceCode The source code of the shader.
         * @param shaderType The type of shader (GL_VERTEX_SHADER, GL_FRAGMENT_SHADER, etc.).
         * @return True if the shader was successfully loaded, false otherwise.
         */
        bool loadFromSource(const std::string& sourceCode, GLenum shaderType);

        /**
         * @brief Gets the OpenGL shader ID.
         *
         * @return The shader ID.
         */
        GLuint getID() const { return shaderID; }

        /**
         * @brief Gets the last error message.
         *
         * @return The error message.
         */
        const std::string& getLastError() const { return lastError; }

    private:
        GLuint shaderID = 0; ///< The OpenGL shader ID.
        std::string lastError; ///< The last error message.

        /**
        * @brief Sets the error message with file and line information.
        *
        * @param errorMessage The error message.
        * @param file The source file where the error occurred.
        * @param line The line number where the error occurred.
        */
        void setError(const std::string& errorMessage, const char* file, int line);
    };

    /**
    * @class ShaderProgram
    * @brief A class to represent an OpenGL shader program, combining vertex and fragment shaders.
    *
    * This class provides functionality to link multiple shaders into a program, use the program,
    * and set uniforms in the program. It supports handling of both vertex and fragment shaders,
    * and provides methods to set uniform values of various types.
    */
    class ShaderProgram {
    public:
        /**
         * @brief Default constructor for ShaderProgram.
         */
        ShaderProgram() = default;

        /**
         * @brief Constructor for ShaderProgram, loading and linking shaders from files.
         *
         * @param vertexPath Path to the vertex shader file.
         * @param fragmentPath Path to the fragment shader file.
         */
        ShaderProgram(const std::string& vertexPath, const std::string& fragmentPath);

        /**
         * @brief Destructor for ShaderProgram.
         *
         * Deletes the shader program if it was created successfully.
         */
        ~ShaderProgram();
        
        /**
        * @brief Move constructor for ShaderProgram.
        *
        * Moves the resources of another ShaderProgram to this one.
        * @param other The ShaderProgram to move from.
        */
        MOVABLE_BUT_NOT_COPYABLE(ShaderProgram);

        /**
         * @brief Loads and links shaders from files.
         *
         * @param vertexPath Path to the vertex shader file.
         * @param fragmentPath Path to the fragment shader file.
         * @return True if the shaders were successfully loaded and linked, false otherwise.
         */
        bool load(const std::string& vertexPath, const std::string& fragmentPath);

        /**
         * @brief Activates the shader program for use.
         */
        void use();

        /**
         * @brief Deactivates the shader program.
         */
        void unUse();

        /**
         * @brief Sets an integer uniform in the shader program.
         *
         * @param name The name of the uniform variable.
         * @param value The integer value to set.
         */
        void setUniform(const std::string& name, int value);

        /**
         * @brief Sets a float uniform in the shader program.
         *
         * @param name The name of the uniform variable.
         * @param value The float value to set.
         */
        void setUniform(const std::string& name, float value);

        /**
         * @brief Sets a glm::vec3 uniform in the shader program.
         *
         * @param name The name of the uniform variable.
         * @param value The glm::vec3 value to set.
         */
        void setUniform(const std::string& name, glm::vec3 value);

        /**
         * @brief Sets a glm::vec4 uniform in the shader program.
         *
         * @param name The name of the uniform variable.
         * @param value The glm::vec4 value to set.
         */
        void setUniform(const std::string& name, glm::vec4 value);

        /**
         * @brief Sets a glm::mat4 uniform in the shader program.
         *
         * @param name The name of the uniform variable.
         * @param matrix The glm::mat4 value to set.
         */
        void setUniform(const std::string& name, const glm::mat4& matrix);

        /**
        * @brief Gets the OpenGL program ID.
        *
        * @return The program ID.
        */
        GLuint GetProgramID() const { return programID; }

        /**
         * @brief Gets the last error message.
         *
         * @return The error message.
         */
        const std::string& getLastError() const { return lastError; }

        /**
         * @brief Attaches a shader to the shader program.
         *
         * @param shader The shader to attach.
         */
        void attachShader(const Shader& shader);

        /**
        * @brief Prints active uniforms in the shader program.
        */
        void printActiveUniforms();

    private: 
        GLuint programID = 0;  ///< The OpenGL program ID.
        std::string lastError; ///< The last error message.

        /**
         * @brief Sets the error message with file and line information.
         *
         * @param errorMessage The error message.
         * @param file The source file where the error occurred.
         * @param line The line number where the error occurred.
         */
        void setError(const std::string& errorMessage, const char* file, int line);

        /**
        * @brief Links the shader program.
        *
        * @return True if the linking was successful, false otherwise.
        */
        bool link();
    };
} // namespace Raftel
#endif // __SHADER_HPP__