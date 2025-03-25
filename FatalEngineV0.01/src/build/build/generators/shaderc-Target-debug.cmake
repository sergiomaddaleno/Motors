# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(shaderc_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(shaderc_FRAMEWORKS_FOUND_DEBUG "${shaderc_FRAMEWORKS_DEBUG}" "${shaderc_FRAMEWORK_DIRS_DEBUG}")

set(shaderc_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET shaderc_DEPS_TARGET)
    add_library(shaderc_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET shaderc_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${shaderc_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${shaderc_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:glslang::glslang;glslang::OSDependent;glslang::OGLCompiler;glslang::HLSL;glslang::SPIRV;SPIRV-Tools-static;SPIRV-Tools-opt;SPIRV-Headers::SPIRV-Headers>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### shaderc_DEPS_TARGET to all of them
conan_package_library_targets("${shaderc_LIBS_DEBUG}"    # libraries
                              "${shaderc_LIB_DIRS_DEBUG}" # package_libdir
                              shaderc_DEPS_TARGET
                              shaderc_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "shaderc")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${shaderc_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${shaderc_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${shaderc_LIBRARIES_TARGETS}>
                 APPEND)

    if("${shaderc_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET shaderc::shaderc
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     shaderc_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${shaderc_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${shaderc_INCLUDE_DIRS_DEBUG}> APPEND)
    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${shaderc_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${shaderc_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(shaderc_LIBRARIES_DEBUG shaderc::shaderc)
