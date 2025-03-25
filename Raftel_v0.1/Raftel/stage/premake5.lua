newoption {
  trigger = "project",
  value = "NAME",
  description = "Specifies which project to build (e.g., --project=Triangle)"
}

conan = {}
configs = {'Debug','Release','RelWithDebInfo'}
for i = 1,3 do

include("build/deps/"..configs[i].."/conanbuildinfo.premake.lua")
conan[configs[i]] = {}
local cfg = conan[configs[i]]
cfg["build_type"] = conan_build_type
cfg["arch"] = conan_arch
cfg["includedirs"] = conan_includedirs
cfg["libdirs"] = conan_libdirs
cfg["bindirs"] = conan_bindirs
cfg["libs"] = conan_libs
cfg["system_libs"] = conan_system_libs
cfg["defines"] = conan_defines
cfg["cxxflags"] = conan_cxxflags
cfg["cflags"] = conan_cflags
cfg["sharedlinkflags"] = conan_sharedlinkflags
cfg["exelinkflags"] = conan_exelinkflags
cfg["frameworks"] = conan_frameworks

end

function conan_config_exec()

  configs = {'Debug','Release','RelWithDebInfo'}
  for i = 1,3 do
  
  local cfg = conan[configs[i]]
  filter("configurations:"..configs[i])
  
  linkoptions { cfg["exelinkflags"] }
  includedirs{ cfg["includedirs"] }
  -- libdirs{ cfg["libdirs"] }
  libdirs { cfg["libdirs"], "deps/"..configs[i] }
  links{ cfg["libs"] }
  links{ cfg["system_libs"] }
  links{ cfg["frameworks"] }
  defines{ cfg["defines"] }
  if not _OPTIONS["build-engine"] then 
      libdirs { "deps/" .. configs[i] }
  end
  filter{}
  
  end
  
  end

  function conan_config_lib()

      configs = {'Debug','Release','RelWithDebInfo'}
      for i = 1,3 do
      
      local cfg = conan[configs[i]]
      filter("configurations:"..configs[i])
      
      linkoptions { cfg["sharedlinkflags"] }
      includedirs{ cfg["includedirs"] }
      defines{ cfg["defines"] }
      
      filter{}
      
      end
      
      end

      workspace "Raftel"

configurations { "Debug", "Release", "RelWithDebInfo" }
architecture "x64"
location "build"
cppdialect "c++20"
startproject "Window"
filter "configurations:Debug"
defines { "DEBUG" }
symbols "On"
runtime "Debug"

filter "configurations:Release"
defines { "NDEBUG" }
optimize "On"
runtime "Release"

filter "configurations:RelWithDebInfo"

defines { "NDEBUG" }
optimize "On"
runtime "Release"
symbols "On"

filter {}
if _OPTIONS["build-engine"] then 
  if os.isfile("build_engine.lua") then 
      include("build_engine.lua")
  end
end
project "Raftel"

kind "StaticLib"
targetdir "deps/%{cfg.buildcfg}"
includedirs "include"
conan_config_lib()
--[[ pchheader "stdafx.hpp"
pchsource "src/stdafx.cpp"
forceincludes { "stdafx.hpp" } ]]
files {

"premake5.lua",
"src/build/conanfile.txt",
"src/build/conan.lua",
--[[ "src/stdafx.cpp", "src/stdafx.hpp", ]]
"src/**.cpp", "include/raftel/**.hpp",
"src/sound/**.cpp", "include/raftel/sound/**.hpp",
}

  project"Window"

  kind "ConsoleApp"
  language "C++"
  targetdir "build/%{prj.name}/%{cfg.buildcfg}"
  includedirs {"include",  "backends"}
  links "Raftel"
  conan_config_exec("Debug")
  conan_config_exec("Release")
  conan_config_exec("RelWithDebInfo")
  debugargs { _MAIN_SCRIPT_DIR .. "/examples/data" }
  files {"examples/demowindow.cpp", "backends/*.cpp"}
