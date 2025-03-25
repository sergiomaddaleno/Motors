# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(clipper_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(clipper_FRAMEWORKS_FOUND_RELEASE "${clipper_FRAMEWORKS_RELEASE}" "${clipper_FRAMEWORK_DIRS_RELEASE}")

set(clipper_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET clipper_DEPS_TARGET)
    add_library(clipper_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET clipper_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${clipper_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${clipper_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### clipper_DEPS_TARGET to all of them
conan_package_library_targets("${clipper_LIBS_RELEASE}"    # libraries
                              "${clipper_LIB_DIRS_RELEASE}" # package_libdir
                              clipper_DEPS_TARGET
                              clipper_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "clipper")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${clipper_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${clipper_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${clipper_LIBRARIES_TARGETS}>
                 APPEND)

    if("${clipper_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET clipper::clipper
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     clipper_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${clipper_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${clipper_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${clipper_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${clipper_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(clipper_LIBRARIES_RELEASE clipper::clipper)
