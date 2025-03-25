/**
 * @file systems.hpp
 * @brief Declares the RenderSystem class for managing rendering systems and updating entities in a graphical environment.
 * @date 2025-03-10
 * @authors Carlos Mazcuñán Blanes, Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 * 
 * This file contains the declaration of the `RenderSystem` class, which is responsible
 * for handling different aspects of rendering in a 3D environment. The `RenderSystem`
 * handles tasks such as updating core systems, rendering with or without shadows,
 * updating the camera system, light system, and the transform system. It also supports
 * deferred rendering and managing entities in the scene.
 *
 * The class offers several static methods to update rendering systems and control
 * the rendering process through different phases and techniques.
 */

#ifndef __SYSTEMS_HPP__
#define __SYSTEMS_HPP__

#pragma once


namespace Raftel {
	class Camera;
	class ShaderProgram;
	class EntityManager;

	/**
	* @class RenderSystem
	* @brief Handles the updating and rendering of entities, camera, and shaders in a graphical environment.
	*
	* The `RenderSystem` class is a core system responsible for the updating and rendering
	* of the scene. It processes different systems such as deferred rendering, camera
	* updates, lighting, shadow rendering, and scripting. The class includes static
	* methods for each of these tasks and manages entities through the `EntityManager`.
	*
	* This class provides the infrastructure for a render loop, including shadow rendering
	* and deferred rendering. It also offers the necessary utilities for integrating
	* shaders and camera updates into the rendering pipeline.
	*/
	class RenderSystem
	{
	public:
		/**
		* @brief Initializes the render system.
		*
		* This method sets up the necessary components for rendering, such as shaders,
		* framebuffers, and other graphical systems needed for rendering the scene.
		*/
		static void Initialize();

		/**
		 * @brief Updates and renders the entire scene based on the current entity manager, camera, and shaders.
		 *
		 * This method is responsible for updating the rendering system by applying
		 * transformations, rendering entities, and handling various systems like
		 * shadow and light rendering. It is the main method responsible for updating
		 * and rendering the scene during the render loop.
		 *
		 * @param em The entity manager that manages entities in the scene.
		 * @param cam The camera used to view the scene.
		 * @param shader The shader program used for rendering.
		 * @param screen The screen resolution for the rendering process.
		 * @param shadow A boolean flag to indicate whether shadows should be rendered. Default is false.
		 */
		static void UpdateRenderSystem(EntityManager& em, Camera& cam, ShaderProgram& shader, glm::ivec2 screen, bool shadow = false);

	private:
		/**
		* @brief Handles deferred rendering of the scene.
		*
		* This method performs deferred rendering, which separates geometry rendering
		* from lighting calculations. It is used in rendering systems that require
		* advanced lighting and shadowing techniques.
		*
		* @param em The entity manager that manages the entities to be rendered.
		* @param shader The shader program used for rendering geometry.
		*/
		static void DrawDeferred(EntityManager& em, ShaderProgram& shader);

		/**
		* @brief Updates the deferred rendering system.
		*
		* This method updates the deferred rendering pipeline, which involves rendering
		* geometry first and later applying lighting and shadows separately.
		*
		* @param em The entity manager that manages the entities to be rendered.
		* @param cam The camera used to view the scene.
		* @param shader The shader program used for rendering geometry.
		*/
		static void UpdateDeferredRenderSystem(EntityManager& em, Camera& cam, ShaderProgram& shader);
		
		/**
		* @brief Updates the core systems for the render process.
		*
		* This method updates all the core systems involved in rendering, including
		* transformations and basic rendering updates.
		*
		* @param em The entity manager that manages the entities in the scene.
		*/
		static void UpdateCoreSystems(EntityManager& em);

		/**
		 * @brief Updates the camera system.
		 *
		 * This method updates the camera parameters, ensuring the camera transforms
		 * and projections are applied correctly for rendering.
		 *
		 * @param cam The camera used to view the scene.
		 * @param shader The shader program used for rendering.
		 */
		static void UpdateCameraSystem(Camera& cam, ShaderProgram& shader);

		/**
		 * @brief Renders the scene with shadows.
		 *
		 * This method handles rendering the scene with shadows enabled, applying
		 * appropriate lighting and shadow mapping techniques.
		 *
		 * @param em The entity manager that manages the entities to be rendered.
		 * @param lit_shader The shader program used for rendering with lighting and shadows.
		 * @param cam The camera used to view the scene.
		 */
		static void RenderWithShadows(EntityManager& em, ShaderProgram& lit_shader, Camera& cam);
		
		/**
	     * @brief Updates the transform system.
	     *
	     * This method updates the transformations applied to entities in the scene,
	     * ensuring that the correct transformations are applied before rendering.
	     *
	     * @param em The entity manager that manages the entities in the scene.
	     */
		static void UpdateTransformSystem(EntityManager& em);

		/**
		 * @brief Updates the light system for rendering.
		 *
		 * This method updates the lighting system, ensuring that lights are properly
		 * applied to the scene.
		 *
		 * @param em The entity manager that manages the entities in the scene.
		 * @param lit_shader The shader program used for rendering with lighting.
		 * @param cam The camera used to view the scene.
		 */
		static void UpdateLightSystem(EntityManager& em, ShaderProgram& lit_shader, Camera& cam);
		
		/**
		* @brief Updates the light shadow system.
		*
		* This method updates the light and shadow systems, ensuring that shadows
		* are correctly applied to entities in the scene.
		*
		* @param em The entity manager that manages the entities in the scene.
		* @param lit_shader The shader program used for rendering with lighting and shadows.
		* @param cam The camera used to view the scene.
		*/
		static void UpdateLightShadowSystem(EntityManager& em, ShaderProgram& lit_shader, Camera& cam);
		
		/**
		* @brief Updates the scripting system.
		*
		* This method updates the scripting system, which handles the execution
		* of scripts related to entities and behaviors in the scene.
		*
		* @param em The entity manager that manages the entities in the scene.
		*/
		static void UpdateScriptingSystem(EntityManager& em);
		
		/**
		* @brief Renders the scene from the perspective of the light source.
		*
		* This method renders the scene from the light's point of view, which
		* is typically used for shadow mapping or light culling purposes.
		*
		* @param em The entity manager that manages the entities in the scene.
		*/
		static void RenderSceneFromLight(EntityManager& em);

		static std::shared_ptr<ShaderProgram> geometryshader; ///< Shared pointer to the geometry shader program.
	};
} // namespace Raftel

#endif // !__SYSTEMS_HPP__ 