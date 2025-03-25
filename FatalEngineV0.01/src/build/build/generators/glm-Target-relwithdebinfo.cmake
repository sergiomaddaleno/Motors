# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(glm_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(glm_FRAMEWORKS_FOUND_RELWITHDEBINFO "${glm_FRAMEWORKS_RELWITHDEBINFO}" "${glm_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(glm_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET glm_DEPS_TARGET)
    add_library(glm_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET glm_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${glm_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${glm_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### glm_DEPS_TARGET to all of them
conan_package_library_targets("${glm_LIBS_RELWITHDEBINFO}"    # libraries
                              "${glm_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              glm_DEPS_TARGET
                              glm_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "glm")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${glm_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${glm_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${glm_LIBRARIES_TARGETS}>
                 APPEND)

    if("${glm_LIBS_RELWITHDEBINFO}" STREQUAL "")
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
                 $<$<CONFIG:RelWithDebInfo>:${glm_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${glm_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${glm_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET glm::glm
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${glm_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(glm_LIBRARIES_RELWITHDEBINFO glm::glm)
