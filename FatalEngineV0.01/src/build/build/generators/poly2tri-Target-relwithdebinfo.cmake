# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(poly2tri_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(poly2tri_FRAMEWORKS_FOUND_RELWITHDEBINFO "${poly2tri_FRAMEWORKS_RELWITHDEBINFO}" "${poly2tri_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(poly2tri_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET poly2tri_DEPS_TARGET)
    add_library(poly2tri_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET poly2tri_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${poly2tri_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${poly2tri_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### poly2tri_DEPS_TARGET to all of them
conan_package_library_targets("${poly2tri_LIBS_RELWITHDEBINFO}"    # libraries
                              "${poly2tri_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              poly2tri_DEPS_TARGET
                              poly2tri_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "poly2tri")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${poly2tri_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${poly2tri_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${poly2tri_LIBRARIES_TARGETS}>
                 APPEND)

    if("${poly2tri_LIBS_RELWITHDEBINFO}" STREQUAL "")
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
                 $<$<CONFIG:RelWithDebInfo>:${poly2tri_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${poly2tri_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${poly2tri_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET poly2tri::poly2tri
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${poly2tri_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(poly2tri_LIBRARIES_RELWITHDEBINFO poly2tri::poly2tri)
