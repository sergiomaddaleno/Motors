# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(glm_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(glm_FRAMEWORKS_FOUND_DEBUG "${glm_FRAMEWORKS_DEBUG}" "${glm_FRAMEWORK_DIRS_DEBUG}")

set(glm_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET glm_DEPS_TARGET)
    add_library(glm_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET glm_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${glm_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${glm_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### glm_DEPS_TARGET to all of them
conan_package_library_targets("${glm_LIBS_DEBUG}"    # libraries
                              "${glm_LIB_DIRS_DEBUG}" # package_libdir
                              glm_DEPS_TARGET
                              glm_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "glm")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${glm_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${glm_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${glm_LIBRARIES_TARGETS}>
                 APPEND)

    if("${glm_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET glm::glm
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     glm_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${glm_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${glm_INCLUDE_DIRS_DEBUG}> APPEND)
    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${glm_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${glm_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(glm_LIBRARIES_DEBUG glm::glm)
