-- Opción para construir el motor
newoption {
    trigger = "build-engine",
    description = "Builds the engine instead of using a prebuilt one"
}

-- Variables globales
local configs = {'Debug', 'Release', 'RelWithDebInfo'}
local conan = {}

-- Cargar configuraciones de Conan para cada configuración
for _, config in ipairs(configs) do
    include("build/deps/"..config.."/conanbuildinfo.premake.lua")
    conan[config] = {
        build_type = conan_build_type,
        arch = conan_arch,
        includedirs = conan_includedirs,
        libdirs = conan_libdirs,
        bindirs = conan_bindirs,
        libs = conan_libs,
        system_libs = conan_system_libs,
        defines = conan_defines,
        cxxflags = conan_cxxflags,
        cflags = conan_cflags,
        sharedlinkflags = conan_sharedlinkflags,
        exelinkflags = conan_exelinkflags,
        frameworks = conan_frameworks
    }
end

-- Función para configurar los ejecutables
function conan_config_exec()
    for _, config in ipairs(configs) do
        local cfg = conan[config]
        filter("configurations:"..config)
        
        linkoptions { cfg["exelinkflags"] }
        includedirs { cfg["includedirs"] }
        libdirs { cfg["libdirs"] }
        links { cfg["libs"] }
        links { cfg["system_libs"] }
        links { cfg["frameworks"] }
        defines { cfg["defines"] }
        
        if not _OPTIONS["build-engine"] then 
            libdirs { "deps/AEngine/" .. config }
        end
        
        filter{}
    end
end

-- Función para configurar las bibliotecas
function conan_config_lib()
    for _, config in ipairs(configs) do
        local cfg = conan[config]
        filter("configurations:"..config)
        
        linkoptions { cfg["sharedlinkflags"] }
        includedirs { cfg["includedirs"] }
        defines { cfg["defines"] }
        
        filter{}
    end
end

-- Configuración del workspace
workspace "Motor"
    configurations(configs)
    architecture "x64"
    location "build"
    cppdialect "c++20"
    startproject "BlackWindow"
    
    -- Configuraciones específicas
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

-- Incluir build_engine.lua si se especifica la opción
if _OPTIONS["build-engine"] then 
    if os.isfile("build_engine.lua") then 
        include("build_engine.lua")
    else
        -- Si no existe el archivo, creamos el proyecto AEngine directamente
        project "AEngine"
            kind "StaticLib"
            targetdir "build/%{cfg.buildcfg}"
            includedirs { "include", "backends" }
            conan_config_lib()

            files {
                "premake5.lua",
                "src/build/conanfile.txt",
                "src/build/conan.lua",
                "src/**.cpp", 
                "include/**.hpp",
                "backends/imgui_impl_glfw.h",
                "backends/imgui_impl_glfw.cpp",
                "backends/imgui_impl_opengl3.h",
                "backends/imgui_impl_opengl3.cpp"
            }
    end
end

-- Función para crear proyectos de ejemplo
function create_example(name, file)
    project(name)
        kind "ConsoleApp"
        language "C++"
        targetdir "build/%{prj.name}/%{cfg.buildcfg}"
        includedirs { "include", "backends" }
        links "AEngine"
        conan_config_exec()
        debugargs { _MAIN_SCRIPT_DIR .. "/examples/data" }
        files("examples/" .. file)
end

-- Definir todos los proyectos de ejemplo
create_example("BlackWindow", "glfw_window.cpp")
