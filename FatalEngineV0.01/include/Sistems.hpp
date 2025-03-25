#ifndef SISTEMS_H
#define SISTEMS_H 1

#include "Components.hpp"

namespace RMPH {
    void RenderingNoShadow(
        std::vector<std::optional<RMPH::RenderComponent>>& renderconp,
        std::vector<std::optional<RMPH::TranformComponent>>& posinfo,
        RMPH::Shader shader,
        std::vector<std::optional<RMPH::LightComponent>>& lightinfo,
        std::optional<RMPH::CameraComponent>& cam,
        std::optional<RMPH::TranformComponent>& camTr,
        float widthScreen,
        float heightScreen
    );

    void RenderingShadow(
        std::vector<std::optional<RMPH::RenderComponent>>& renderconp,
        std::vector<std::optional<RMPH::TranformComponent>>& posinfo,
        RMPH::Shader& shader,
        std::vector<std::optional<RMPH::LightComponent>>& lightinfo,
        std::optional<RMPH::CameraComponent>& cam,
        std::optional<RMPH::TranformComponent>& camTr,
        unsigned int& depthMapFBO,
        unsigned int& depthMap,
        RMPH::Shader& shaderDepth,
        float widthScreen,
        float heightScreen
    );

}

#endif