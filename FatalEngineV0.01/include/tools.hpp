#ifndef TOOLS_H
#define TOOLS_H 1

#include "Components.hpp"
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <iostream>

namespace RMPH {

    // Asigna una textura a un RenderComponent
    void SetTexture(RMPH::RenderComponent& renderconp, const char* pathTexture);

    // Crea un buffer de profundidad para sombras
    void CreateDepthBuffer(unsigned int& depthMapFBO, unsigned int& depthMap,
        unsigned int SHADOW_WIDTH, unsigned int SHADOW_HEIGHT);

    // Inicializa GLAD
    void StartGlad();

} // namespace RMPH

#endif // TOOLS_H
