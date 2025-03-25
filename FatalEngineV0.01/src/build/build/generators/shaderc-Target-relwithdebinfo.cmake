# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(shaderc_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(shaderc_FRAMEWORKS_FOUND_RELWITHDEBINFO "${shaderc_FRAMEWORKS_RELWITHDEBINFO}" "${shaderc_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(shaderc_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET shaderc_DEPS_TARGET)
    add_library(shaderc_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET shaderc_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${shaderc_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${shaderc_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:glslang::glslang;glslang::OSDependent;glslang::OGLCompiler;glslang::HLSL;glslang::SPIRV;SPIRV-Tools-static;SPIRV-Tools-opt;SPIRV-Headers::SPIRV-Headers>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### shaderc_DEPS_TARGET to all of them
conan_package_library_targets("${shaderc_LIBS_RELWITHDEBINFO}"    # libraries
                              "${shaderc_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              shaderc_DEPS_TARGET
                              shaderc_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "shaderc")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${shaderc_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${shaderc_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${shaderc_LIBRARIES_TARGETS}>
                 APPEND)

    if("${shaderc_LIBS_RELWITHDEBINFO}" STREQUAL "")
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
                 $<$<CONFIG:RelWithDebInfo>:${shaderc_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${shaderc_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${shaderc_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET shaderc::shaderc
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${shaderc_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(shaderc_LIBRARIES_RELWITHDEBINFO shaderc::shaderc)
