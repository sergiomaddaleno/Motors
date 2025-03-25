# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(assimp_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(assimp_FRAMEWORKS_FOUND_RELWITHDEBINFO "${assimp_FRAMEWORKS_RELWITHDEBINFO}" "${assimp_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(assimp_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET assimp_DEPS_TARGET)
    add_library(assimp_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET assimp_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${assimp_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${assimp_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:minizip::minizip;utf8cpp;irrxml::irrxml;zip::zip;poly2tri::poly2tri;rapidjson;ZLIB::ZLIB;clipper::clipper>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### assimp_DEPS_TARGET to all of them
conan_package_library_targets("${assimp_LIBS_RELWITHDEBINFO}"    # libraries
                              "${assimp_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              assimp_DEPS_TARGET
                              assimp_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "assimp")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${assimp_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET assimp::assimp
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${assimp_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${assimp_LIBRARIES_TARGETS}>
                 APPEND)

    if("${assimp_LIBS_RELWITHDEBINFO}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET assimp::assimp
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     assimp_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET assimp::assimp
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${assimp_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET assimp::assimp
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${assimp_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET assimp::assimp
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${assimp_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET assimp::assimp
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${assimp_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(assimp_LIBRARIES_RELWITHDEBINFO assimp::assimp)
