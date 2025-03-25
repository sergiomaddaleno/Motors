/*****************************************************************//**
 * \file   FatalImGui.hpp
 * \brief  Own ImGui Class
 * 
 * \author micopli
 * \date   February 2025
 *********************************************************************/

#ifndef __FATAL_IMGUI_HPP__
#define __FATAL_IMGUI_HPP__ 1

#include <cstdlib>
#include <iostream>
#include <fstream>
#include <filesystem>
#include <vector>
#include <string>
//#include <windows.h>

#include <GLFW/glfw3.h>
#include "../deps/ImGui/imgui.h"
#include "../deps/ImGui/imgui_impl_glfw.h"
#include "../deps/ImGui/imgui_impl_opengl3.h"
#include "stb_image.h"

namespace RMPH {
	class FatalImGui {
		public:
			//FatalImGui();
			FatalImGui(GLFWwindow* window_);
			~FatalImGui();

			void FatalInitFrame();

			// Header Section
			void FatalHeader();
			void FatalToolsHeader();

			// Inspector
			void FatalInspector();

			// Render
			void FatalRender();

			// Explorer
			void FatalFileExplorer(const std::string& directory);

			// Hierarchy
			void FatalHierarchy();

			void DrawFatalInterface();

			// Other Windows
			void AboutWindow();

			// Extra funcs
			void OpenDoc(std::string url);
			std::vector<std::string> GetFilesInDirectory(const std::string& directory);
			GLuint LoadTexture(const char* filename);
			void CopyLuaScript(const std::string& rute_in, const std::string& rute_out, const std::string name);
			void CreateDir(std::string dir_name);

		private:
			std::string url_;
			GLuint textureFolder_;
			GLuint textureScript_;
	};
}

#endif