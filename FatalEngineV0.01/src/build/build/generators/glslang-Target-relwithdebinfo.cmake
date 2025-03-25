# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(glslang_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(glslang_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(glslang_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET glslang_DEPS_TARGET)
    add_library(glslang_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET glslang_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${glslang_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${glslang_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:glslang::MachineIndependent;glslang::GenericCodeGen;glslang::OSDependent;glslang::OGLCompiler;glslang::HLSL;glslang::GenericCodeGen;glslang::OSDependent;glslang::OGLCompiler;SPIRV-Tools-opt;glslang::glslang>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### glslang_DEPS_TARGET to all of them
conan_package_library_targets("${glslang_LIBS_RELWITHDEBINFO}"    # libraries
                              "${glslang_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              glslang_DEPS_TARGET
                              glslang_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "glslang")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${glslang_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES RelWithDebInfo ########################################

    ########## COMPONENT glslang::SPIRV #############

        set(glslang_glslang_SPIRV_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_SPIRV_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_SPIRV_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_SPIRV_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_SPIRV_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_SPIRV_DEPS_TARGET)
            add_library(glslang_glslang_SPIRV_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_SPIRV_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_SPIRV_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_SPIRV_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_SPIRV_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_SPIRV_DEPS_TARGET
                                      glslang_glslang_SPIRV_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_SPIRV")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::SPIRV
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_SPIRV_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::SPIRV
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_SPIRV_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::SPIRV PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::SPIRV PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::SPIRV PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::SPIRV PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPIRV_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## COMPONENT glslang::glslang #############

        set(glslang_glslang_glslang_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_glslang_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_glslang_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_glslang_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_glslang_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_glslang_DEPS_TARGET)
            add_library(glslang_glslang_glslang_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_glslang_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_glslang_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_glslang_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_glslang_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_glslang_DEPS_TARGET
                                      glslang_glslang_glslang_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_glslang")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::glslang
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_glslang_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::glslang
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_glslang_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::glslang PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::glslang PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::glslang PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::glslang PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## COMPONENT glslang::MachineIndependent #############

        set(glslang_glslang_MachineIndependent_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_MachineIndependent_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_MachineIndependent_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_MachineIndependent_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_MachineIndependent_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_MachineIndependent_DEPS_TARGET)
            add_library(glslang_glslang_MachineIndependent_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_MachineIndependent_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_MachineIndependent_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_MachineIndependent_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_MachineIndependent_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_MachineIndependent_DEPS_TARGET
                                      glslang_glslang_MachineIndependent_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_MachineIndependent")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::MachineIndependent
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_MachineIndependent_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::MachineIndependent
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_MachineIndependent_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::MachineIndependent PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::MachineIndependent PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::MachineIndependent PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::MachineIndependent PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_MachineIndependent_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## COMPONENT glslang::glslang-default-resource-limits #############

        set(glslang_glslang_glslang-default-resource-limits_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_glslang-default-resource-limits_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_glslang-default-resource-limits_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_glslang-default-resource-limits_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_glslang-default-resource-limits_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_glslang-default-resource-limits_DEPS_TARGET)
            add_library(glslang_glslang_glslang-default-resource-limits_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_glslang-default-resource-limits_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_glslang-default-resource-limits_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_glslang-default-resource-limits_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_glslang-default-resource-limits_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_glslang-default-resource-limits_DEPS_TARGET
                                      glslang_glslang_glslang-default-resource-limits_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_glslang-default-resource-limits")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::glslang-default-resource-limits
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_glslang-default-resource-limits_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::glslang-default-resource-limits
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_glslang-default-resource-limits_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::glslang-default-resource-limits PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::glslang-default-resource-limits PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::glslang-default-resource-limits PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::glslang-default-resource-limits PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## COMPONENT glslang::SPVRemapper #############

        set(glslang_glslang_SPVRemapper_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_SPVRemapper_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_SPVRemapper_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_SPVRemapper_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_SPVRemapper_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_SPVRemapper_DEPS_TARGET)
            add_library(glslang_glslang_SPVRemapper_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_SPVRemapper_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_SPVRemapper_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_SPVRemapper_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_SPVRemapper_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_SPVRemapper_DEPS_TARGET
                                      glslang_glslang_SPVRemapper_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_SPVRemapper")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::SPVRemapper
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_SPVRemapper_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::SPVRemapper
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_SPVRemapper_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::SPVRemapper PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::SPVRemapper PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::SPVRemapper PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::SPVRemapper PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_SPVRemapper_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## COMPONENT glslang::HLSL #############

        set(glslang_glslang_HLSL_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_HLSL_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_HLSL_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_HLSL_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_HLSL_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_HLSL_DEPS_TARGET)
            add_library(glslang_glslang_HLSL_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_HLSL_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_HLSL_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_HLSL_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_HLSL_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_HLSL_DEPS_TARGET
                                      glslang_glslang_HLSL_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_HLSL")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::HLSL
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_HLSL_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::HLSL
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_HLSL_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::HLSL PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::HLSL PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::HLSL PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::HLSL PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_HLSL_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## COMPONENT glslang::OGLCompiler #############

        set(glslang_glslang_OGLCompiler_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_OGLCompiler_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_OGLCompiler_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_OGLCompiler_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_OGLCompiler_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_OGLCompiler_DEPS_TARGET)
            add_library(glslang_glslang_OGLCompiler_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_OGLCompiler_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_OGLCompiler_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_OGLCompiler_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_OGLCompiler_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_OGLCompiler_DEPS_TARGET
                                      glslang_glslang_OGLCompiler_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_OGLCompiler")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::OGLCompiler
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_OGLCompiler_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::OGLCompiler
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_OGLCompiler_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::OGLCompiler PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::OGLCompiler PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::OGLCompiler PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::OGLCompiler PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OGLCompiler_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## COMPONENT glslang::OSDependent #############

        set(glslang_glslang_OSDependent_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_OSDependent_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_OSDependent_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_OSDependent_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_OSDependent_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_OSDependent_DEPS_TARGET)
            add_library(glslang_glslang_OSDependent_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_OSDependent_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_OSDependent_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_OSDependent_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_OSDependent_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_OSDependent_DEPS_TARGET
                                      glslang_glslang_OSDependent_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_OSDependent")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::OSDependent
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_OSDependent_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::OSDependent
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_OSDependent_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::OSDependent PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::OSDependent PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::OSDependent PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::OSDependent PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_OSDependent_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## COMPONENT glslang::GenericCodeGen #############

        set(glslang_glslang_GenericCodeGen_FRAMEWORKS_FOUND_RELWITHDEBINFO "")
        conan_find_apple_frameworks(glslang_glslang_GenericCodeGen_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glslang_glslang_GenericCodeGen_FRAMEWORKS_RELWITHDEBINFO}" "${glslang_glslang_GenericCodeGen_FRAMEWORK_DIRS_RELWITHDEBINFO}")

        set(glslang_glslang_GenericCodeGen_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET glslang_glslang_GenericCodeGen_DEPS_TARGET)
            add_library(glslang_glslang_GenericCodeGen_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET glslang_glslang_GenericCodeGen_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_SYSTEM_LIBS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_DEPENDENCIES_RELWITHDEBINFO}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'glslang_glslang_GenericCodeGen_DEPS_TARGET' to all of them
        conan_package_library_targets("${glslang_glslang_GenericCodeGen_LIBS_RELWITHDEBINFO}"
                                      "${glslang_glslang_GenericCodeGen_LIB_DIRS_RELWITHDEBINFO}"
                                      glslang_glslang_GenericCodeGen_DEPS_TARGET
                                      glslang_glslang_GenericCodeGen_LIBRARIES_TARGETS
                                      "_RELWITHDEBINFO"
                                      "glslang_glslang_GenericCodeGen")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET glslang::GenericCodeGen
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_OBJECTS_RELWITHDEBINFO}>
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_LIBRARIES_TARGETS}>
                     APPEND)

        if("${glslang_glslang_GenericCodeGen_LIBS_RELWITHDEBINFO}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET glslang::GenericCodeGen
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         glslang_glslang_GenericCodeGen_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET glslang::GenericCodeGen PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::GenericCodeGen PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::GenericCodeGen PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
        set_property(TARGET glslang::GenericCodeGen PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:RelWithDebInfo>:${glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::SPIRV APPEND)
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::glslang APPEND)
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::MachineIndependent APPEND)
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::glslang-default-resource-limits APPEND)
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::SPVRemapper APPEND)
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::HLSL APPEND)
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::OGLCompiler APPEND)
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::OSDependent APPEND)
    set_property(TARGET glslang::_glslang-do-not-use PROPERTY INTERFACE_LINK_LIBRARIES glslang::GenericCodeGen APPEND)

########## For the modules (FindXXX)
set(glslang_LIBRARIES_RELWITHDEBINFO glslang::_glslang-do-not-use)
