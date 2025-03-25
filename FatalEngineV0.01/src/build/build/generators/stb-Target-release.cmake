# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(stb_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(stb_FRAMEWORKS_FOUND_RELEASE "${stb_FRAMEWORKS_RELEASE}" "${stb_FRAMEWORK_DIRS_RELEASE}")

set(stb_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET stb_DEPS_TARGET)
    add_library(stb_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET stb_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${stb_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${stb_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### stb_DEPS_TARGET to all of them
conan_package_library_targets("${stb_LIBS_RELEASE}"    # libraries
                              "${stb_LIB_DIRS_RELEASE}" # package_libdir
                              stb_DEPS_TARGET
                              stb_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "stb")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${stb_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${stb_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${stb_LIBRARIES_TARGETS}>
                 APPEND)

    if("${stb_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET stb::stb
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     stb_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${stb_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${stb_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${stb_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${stb_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(stb_LIBRARIES_RELEASE stb::stb)
