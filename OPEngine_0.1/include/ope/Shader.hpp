#ifndef SHADER_HPP
#define SHADER_HPP

#include <GL/glew.h>
#include <glm/glm.hpp>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

#include "ope/Texture.hpp"

class Shader {
public:
    unsigned int ID;

    Shader(const char* vertexPath, const char* fragmentPath);
    Shader(const char* vertexPath, const char* fragmentPath, const char* geometryPath);
    void use();
    void setFloat(const std::string& name, float value) const;
    void setInt(const std::string& name, int value) const;
    void setVec2(const std::string& name, const glm::vec2& value) const;
    void setVec3(const std::string& name, const glm::vec3& value) const;
    void setVec4(const std::string& name, const glm::vec4& value) const;
    void setMat4(const std::string& name, const glm::mat4& mat) const;
    ~Shader();


private:
    void checkCompileErrors(unsigned int shader, std::string type);
};


class CustomShaderComponent {
public:
    CustomShaderComponent(const std::shared_ptr<Shader>& shaderPtr, TextureComponent&& texture1, TextureComponent&& texture2) : shader(shaderPtr),
                                                                                                  texture1(std::move(texture1)),
                                                                                                  texture2(std::move(texture2)) {}
    std::shared_ptr<Shader> shader;
    TextureComponent texture1;
    TextureComponent texture2;
};

#endif 