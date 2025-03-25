#ifndef __INPUT_H__
#define __INPUT_H__ 1

#pragma once

#include <unordered_map>
#include <raftel/global_macros.hpp>
#include <glm/vec2.hpp>

struct GLFWwindow;

namespace Raftel {

	/**
	 * @brief Manages keyboard and mouse input.
	 */
	class Input {
	public:
		/**
		 * @brief Enumeration of mouse buttons.
		 */
		enum class Buttons {
			Mouse_Left,   /**< Left mouse button. */
			Mouse_Right,  /**< Right mouse button. */
			Mouse_Middle, /**< Middle mouse button. */

			Button_Count  /**< Number of buttons. */
		};

		/**
		 * @brief Enumeration of keyboard keys.
		 */
		enum class Keys {
			Key_Q, Key_W, Key_E, Key_R, Key_T, Key_Y, Key_U, Key_I, Key_O, Key_P,
			Key_A, Key_S, Key_D, Key_F, Key_G, Key_H, Key_J, Key_K, Key_L,
			Key_Z, Key_X, Key_C, Key_V, Key_B, Key_N, Key_M,

			Key_Space, Key_Escape, Key_Enter, Key_Tab, Key_Backspace, Key_Delete,
			Key_Left, Key_Right, Key_Up, Key_Down, Key_Control, Key_Alt, Key_Shift,
			Key_1, Key_2, Key_3, Key_4, Key_5, Key_6, Key_7, Key_8, Key_9, Key_0,

			Key_Count /**< Number of keys. */
		};

		/**
		 * @brief Stores information about a key's state.
		 */
		struct KeyInfo {
			Keys k; /**< The key. */
			bool up = true; /**< Whether the key is up. */
			bool down = false; /**< Whether the key is down. */
			bool this_frame = false; /**< Whether the key was pressed this frame. */
			bool was_pressed_last_frame = false; /**< Whether the key was pressed in the last frame. */
		};

		/**
		 * @brief Stores information about a mouse button's state.
		 */
		struct ButtonInfo {
			Buttons b; /**< The mouse button. */
			bool up = true; /**< Whether the button is up. */
			bool down = false; /**< Whether the button is down. */
			bool this_frame = false; /**< Whether the button was pressed this frame. */
			bool was_pressed_last_frame = false; /**< Whether the button was pressed in the last frame. */
		};

		/**
		 * @brief Constructs an Input object.
		 * @param window Pointer to the GLFW window.
		 */
		Input(GLFWwindow* window);

		/**
		 * @brief Destructor for Input.
		 */
		~Input();

		friend void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods);
		friend void mouse_button_callback(GLFWwindow* window, int button, int action, int mods);
		friend void scroll_callback(GLFWwindow* window, double xoffset, double yoffset);

		/**
		 * @brief Checks if a key is currently pressed.
		 * @param key The key to check.
		 * @return True if the key is pressed, false otherwise.
		 */
		bool isKeyPressed(Keys key);

		/**
		 * @brief Checks if a key was just released.
		 * @param key The key to check.
		 * @return True if the key was released, false otherwise.
		 */
		bool isKeyRelease(Keys key);

		/**
		 * @brief Checks if a key is currently held down.
		 * @param key The key to check.
		 * @return True if the key is down, false otherwise.
		 */
		bool isKeyDown(Keys key) const;

		/**
		 * @brief Checks if a key is currently up.
		 * @param key The key to check.
		 * @return True if the key is up, false otherwise.
		 */
		bool isKeyUp(Keys key) const;

		/**
		 * @brief Checks if a mouse button is currently pressed.
		 * @param button The button to check.
		 * @return True if the button is pressed, false otherwise.
		 */
		bool isMouseButtonPressed(Buttons button);

		/**
		 * @brief Checks if a mouse button was just released.
		 * @param button The button to check.
		 * @return True if the button was released, false otherwise.
		 */
		bool isMouseButtonRelease(Buttons button);

		/**
		 * @brief Checks if a mouse button is currently held down.
		 * @param button The button to check.
		 * @return True if the button is down, false otherwise.
		 */
		bool isMouseButtonDown(Buttons button) const;

		/**
		 * @brief Checks if a mouse button is currently up.
		 * @param button The button to check.
		 * @return True if the button is up, false otherwise.
		 */
		bool isMouseButtonUp(Buttons button) const;

		/**
		 * @brief Retrieves the scroll delta from the last input frame.
		 * @return The scroll delta as a glm::vec2.
		 */
		glm::vec2 getScrollDelta();

		/**
		 * @brief Resets scroll tracking data.
		 */
		void resetScrollTracking();

		/**
		 * @brief Updates the key states for the current frame.
		 */
		void updateKeys();

		/**
		 * @brief Retrieves the mouse movement delta.
		 * @return The mouse movement delta as a glm::vec2.
		 */
		glm::vec2 getMouseDelta();

		/**
		 * @brief Retrieves the current mouse position.
		 * @return The mouse position as a glm::vec2.
		 */
		glm::vec2 getMousePosition();

		/**
		 * @brief Resets mouse movement tracking data.
		 */
		void resetMouseTracking();

	private:
		glm::vec2 scrollDelta; /**< The scroll delta. */
		glm::vec2 lastScrollOffset; /**< The last recorded scroll offset. */

		GLFWwindow* window_; /**< Pointer to the GLFW window. */

		glm::vec2 lastMousePosition; /**< Last recorded mouse position. */
		bool firstMouseMove = true; /**< Whether the first mouse movement has occurred. */

		/**
		 * @brief Assigns key mappings for input handling.
		 */
		void assignKeys();

		/**
		 * @brief Assigns button mappings for input handling.
		 */
		void assignButtons();

		std::unordered_map<int, KeyInfo> input_map; /**< Key input state map. */
		std::unordered_map<int, ButtonInfo> button_map; /**< Button input state map. */

		MOVABLE_BUT_NOT_COPYABLE(Input);
	};

} // namespace Raftel

#endif