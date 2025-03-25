/**
 * @file transform.hpp
 * @brief Provides the definition of 2D transformation operations for objects.
 * @date 2025-03-10
 * @authors Carlos Mazcuñán Blanes, Marc Folgado Balbás
 *
 * @copyright All rights reserved.
 * 
 * This file contains the `Vec2` structure which represents a 2D vector and the `Transform2D` class
 * which handles 2D transformations such as translation, rotation, and scaling. The `Transform2D` class
 * is commonly used to apply transformations to objects in a 2D space, enabling smooth movement, rotation,
 * and scaling over time.
 */
#ifndef __TRANSFORM_H__
#define __TRANSFORM_H__ 1

#pragma once

namespace Raftel {
	
	/**
     * @struct Vec2
     * @brief Represents a 2D vector with basic arithmetic operations.
     *
     * The `Vec2` structure holds two floating-point values, `x` and `y`, and supports basic operations
     * such as vector addition and scalar multiplication.
     */
	struct Vec2
	{
		float x, y; ///< The x and y components of the vector.

		/**
		* @brief Adds two `Vec2` vectors.
		*
		* This operator adds the `x` and `y` components of two `Vec2` vectors and returns a new vector.
		*
		* @param other The other vector to add.
		* @return A new `Vec2` vector representing the sum of the two vectors.
		*/
		Vec2 operator+(const Vec2& other) const { return { x + other.x, y + other.y }; }

		/**
	     * @brief Multiplies the vector by a scalar value.
	     *
	     * This operator multiplies each component (`x` and `y`) of the vector by a scalar value.
	     *
	     * @param scalar The scalar value to multiply the vector by.
	     * @return A new `Vec2` vector after multiplication.
	     */
		Vec2 operator*(float scalar) const { return { x * scalar, y * scalar }; }
	};
	/**
     * @class Transform2D
     * @brief Represents a 2D transformation for an object (translation, rotation, and scaling).
     *
     * The `Transform2D` class allows you to apply various 2D transformations to an object, including
     * movement (via translation), rotation, and scaling. The transformations are stored in the class's
     * member variables and can be applied to render the object with the desired transformations.
     */
	class Transform2D {
	public:

		/**
		* @brief Default constructor for `Transform2D`.
		*
		* Initializes the transformation with default values:
		* - position: (0,0)
		* - scale: (1.0, 1.0)
		* - angle: 0.0f
		* - velocity: (0.0f, 0.0f)
		*/
		Transform2D();

		Vec2 position_; ///< The position of the object in 2D space.
		Vec2 scale_;    ///< The scale factor applied to the object in 2D space.
		Vec2 velocity_; ///< The velocity of the object for translation.
		float angle_;   ///< The angle of rotation of the object.

		/**
		 * @brief Translates the object by applying its velocity over time.
		 *
		 * This method updates the object's position based on its velocity, scaled by the `deltaTime`.
		 *
		 * @param deltaTime The time elapsed, used to scale the velocity.
		 */
		void Translate(float deltaTime);
		/**
	   * @brief Rotates the object by the specified angle.
	   *
	   * This method updates the object's rotation angle.
	   *
	   * @param angle The angle (in degrees) to rotate the object by.
	   */
		void Rotate(float angle);

		/**
		 * @brief Scales the object by the given factor.
		 *
		 * This method updates the scale of the object by a scaling factor.
		 *
		 * @param scale The scaling factor to apply to the object.
		 * @param deltaTime The time elapsed, used to scale the transformation.
		 */
		void Scale(Vec2 scale, float deltaTime);

		/**
		 * @brief Applies the accumulated transformations (translation, rotation, scaling).
		 *
		 * This method applies the current transformation (position, scale, and rotation) to the object.
		 * The transformation is applied by modifying the OpenGL matrix stack.
		 */
		void ApplyTransform();

		/**
		 * @brief Ends the current transformation and restores the previous matrix state.
		 *
		 * This method pops the current transformation from the OpenGL matrix stack, restoring the previous
		 * transformation state.
		 */
		void EndTransform();

		/**
		 * @brief Destructor for `Transform2D`.
		 *
		 * Cleans up any resources used by the transformation (though none are dynamically allocated here).
		 */
		~Transform2D();
	};
}// namespace Raftel
#endif // !__TRANSFORM_HPP__