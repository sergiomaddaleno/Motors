#ifndef __DEFERRED_H__
#define __DEFERRED_H__ 1

#pragma once

#include <raftel/global_macros.hpp>
#include <Raftel/shader.hpp>
#include <memory>

namespace Raftel {

    class DeferredRender
    {
     public:
         DeferredRender(int w, int h);
         ~DeferredRender();
         void StartPocess();
         void EndProcess();
         void BindTextures();


        
         NO_COPYABLE_OR_MOVABLE(DeferredRender)
     private:
         std::shared_ptr<ShaderProgram> shader;
         int width;
         int height;
         unsigned int frameBuffer;
         unsigned int gPosition, gNormal, gAlbedoSpec;
         unsigned int rboDepth;
    };
}

#endif