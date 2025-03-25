# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(poly2tri_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(poly2tri_FRAMEWORKS_FOUND_RELEASE "${poly2tri_FRAMEWORKS_RELEASE}" "${poly2tri_FRAMEWORK_DIRS_RELEASE}")

set(poly2tri_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET poly2tri_DEPS_TARGET)
    add_library(poly2tri_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET poly2tri_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${poly2tri_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${poly2tri_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### poly2tri_DEPS_TARGET to all of them
conan_package_library_targets("${poly2tri_LIBS_RELEASE}"    # libraries
                              "${poly2tri_LIB_DIRS_RELEASE}" # package_libdir
                              poly2tri_DEPS_TARGET
                              poly2tri_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "poly2tri")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${poly2tri_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${poly2tri_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${poly2tri_LIBRARIES_TARGETS}>
                 APPEND)

    if("${poly2tri_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET poly2tri::poly2tri
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     poly2tri_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${poly2tri_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${poly2tri_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${poly2tri_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${poly2tri_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(poly2tri_LIBRARIES_RELEASE poly2tri::poly2tri)
