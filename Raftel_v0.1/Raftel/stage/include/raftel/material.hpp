/**
 * @file material.hpp
 * @brief Defines the Material class for handling surface properties and textures.
 * @date 2025-03-10
 * @authors Carlos Mazcuñán Blanes, Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 *
 * @details
 * The Material class represents the surface properties of an object.
 * It allows defining textures (albedo, normal, roughness, metallic)
 * and scalar properties such as shininess, roughness value, and metallic value.
 *
 * ## Usage Example:
 *
 * @code
 * auto albedoTexture = std::make_shared<Raftel::Texture>("albedo.png");
 * Raftel::Material material(albedoTexture);
 * material.setRoughness(0.8f);
 * material.setMetallic(0.5f);
 * glm::vec3 color = material.getAlbedoColor();
 * @endcode
 */

#ifndef __MATERIAL_H__
#define __MATERIAL_H__ 1

#pragma once

#include <glm/glm.hpp>
#include <memory>
#include <unordered_map>
#include <string>
#include <iostream>
#include <stdexcept>
#include <raftel/texture.hpp>

namespace Raftel {
    /**
     * @class Material
     * @brief Represents a material with textures and physical properties.
     */
    class Material {
    public:

        //TODO mapa de texturas -> KEY (enum de cada textura) valor -> TEXTURE
        
        /**
        * @brief Default constructor initializes a basic white material with no textures.
        */
        Material();

        /**
        * @brief Constructs a Material with textures and properties.
        * @param albedo Albedo (diffuse) texture.
        * @param normal Normal map texture.
        * @param roughness Roughness texture.
        * @param metallic Metallic texture.
        * @param albedoColor Base color when no albedo texture is provided.
        * @param shininess Shininess factor (Phong lighting model).
        * @param roughnessValue Scalar roughness value (0.0 to 1.0).
        * @param metallicValue Scalar metallic value (0.0 to 1.0).
        * @param fresnel Fresnel reflection coefficient.
        * @param scatt Scattering factor.
        */
        Material(
            std::shared_ptr<Texture> albedo,
            std::shared_ptr<Texture> normal = nullptr,
            std::shared_ptr<Texture> roughness = nullptr,
            std::shared_ptr<Texture> metallic = nullptr,
            const glm::vec3& albedoColor = glm::vec3(1.0f),
            float shininess = 32.0f,
            float roughnessValue = 0.5f,
            float metallicValue = 0.0f,
            float fresnel = 1.0f,
            float scatt = 0.0f
        );


        /**
             * @brief Set the albedo (diffuse) texture of the material.
             * @param texture The texture to set as albedo.
             */
        void setAlbedo(std::shared_ptr<Texture> texture);

        /**
         * @brief Set the normal map texture of the material.
         * @param texture The texture to set as normal.
         */
        void setNormal(std::shared_ptr<Texture> texture);

        /**
         * @brief Set the roughness texture of the material.
         * @param texture The texture to set as roughness.
         */
        void setRoughness(std::shared_ptr<Texture> texture);

        /**
         * @brief Set the metallic texture of the material.
         * @param texture The texture to set as metallic.
         */
        void setMetallic(std::shared_ptr<Texture> texture);

        /**
         * @brief Remove the albedo texture.
         */
        void deleteAlbedo();

        /**
         * @brief Remove the normal texture.
         */
        void deleteNormal();

        /**
         * @brief Remove the roughness texture.
         */
        void deleteRoughness();

        /**
         * @brief Remove the metallic texture.
         */
        void deleteMetallic();

        /**
         * @brief Get the albedo (diffuse) texture.
         * @return A shared pointer to the albedo texture.
         */
        std::shared_ptr<Texture> getAlbedoText();

        /**
         * @brief Get the normal map texture.
         * @return A shared pointer to the normal texture.
         */
        std::shared_ptr<Texture> getNormalText();

        /**
         * @brief Get the roughness texture.
         * @return A shared pointer to the roughness texture.
         */
        std::shared_ptr<Texture> getRoughnessText();

        /**
         * @brief Get the metallic texture.
         * @return A shared pointer to the metallic texture.
         */
        std::shared_ptr<Texture> getMetallicText();

        /**
         * @brief Get the albedo color (used when no albedo texture is provided).
         * @return The albedo color as a glm::vec3.
         */
        glm::vec3 getAlbedoColor() { return albedoColor; }

        /**
         * @brief Get the shininess value of the material.
         * @return The shininess value.
         */
        float getShininessValue() { return shininess; }

        /**
         * @brief Get the roughness value of the material.
         * @return The roughness value.
         */
        float getRoughnessValue() { return roughnessValue; }

        /**
         * @brief Get the metallic value of the material.
         * @return The metallic value.
         */
        float getMetallicValue() { return metallicValue; }

        /**
         * @brief Get the fresnel value of the material.
         * @return The fresnel value.
         */
        float getFresnelValue() { return fresnel; }

        /**
         * @brief Get the scattering value of the material.
         * @return The scattering value.
         */
        float getScatteringValue() { return scattering; }

        /**
         * @brief Set the albedo color (used when no albedo texture is provided).
         * @param color The color to set as albedo.
         */
        void setAlbedoColor(const glm::vec3& color);

        /**
         * @brief Set the shininess value of the material.
         * @param value The shininess value to set.
         */
        void setShininess(float value);

        /**
         * @brief Set the roughness value of the material.
         * @param value The roughness value to set.
         */
        void setRoughness(float value);

        /**
         * @brief Set the metallic value of the material.
         * @param value The metallic value to set.
         */
        void setMetallic(float value);

        /**
         * @brief Set the fresnel value of the material.
         * @param value The fresnel value to set.
         */
        void setFresnel(float value);

        /**
         * @brief Set the scattering value of the material.
         * @param value The scattering value to set.
         */
        void setScattering(float value);

        /**
         * @brief Get the number of active textures assigned to the material.
         * @return The number of textures assigned to the material.
         */
        int GetNTextures() { return texture_counter; }

        //int texture_counter = 0; ///< Number of active textures.

        bool bAlbedo; ///< True if an albedo texture is assigned.
        bool bNormal; ///< True if a normal texture is assigned.
        bool bRoughness; ///< True if a roughness texture is assigned.
        bool bMetallic;  ///< True if a metallic texture is assigned.

        /**
        * @brief Retrieves the last recorded error message.
        * @return A string containing the last error message.
        */
        const std::string& getLastError() const { return lastError; }

        /**
        * @brief Deleted copy constructor and assignment operator.
        *
        * Material instances can be moved but not copied.
        */
        MOVABLE_BUT_NOT_COPYABLE(Material)
    private:
        std::shared_ptr<Texture> albedo; ///< Albedo (diffuse) texture.
        std::shared_ptr<Texture> normal;  ///< Normal map texture.
        std::shared_ptr<Texture> roughness; ///< Roughness texture.
        std::shared_ptr<Texture> metallic;  ///< Metallic texture.

        glm::vec3 albedoColor; ///< Base color of the material when no albedo texture is present.
        float shininess;       ///< Shininess factor for specular highlights.
        float roughnessValue;  ///< Scalar roughness value (0.0 - 1.0).
        float metallicValue;   ///< Scalar metallic value (0.0 - 1.0).
        float fresnel;         ///< Fresnel effect coefficient.
        float scattering;      ///< Scattering factor (0.0 - 1.0).

        int texture_counter = 0; ///< Number of active textures.

        /**
         * @brief Records an error message with file and line information.
         * @param errorMessage The error message to store.
         * @param file The file where the error occurred.
         * @param line The line number where the error occurred.
         */
        void setError(const std::string& errorMessage, const char* file, int line);
        std::string lastError;///< Stores the last error message.
    };
}// namespace Raftel

#endif // __MATERIAL_HPP__