# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(minizip_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(minizip_FRAMEWORKS_FOUND_RELWITHDEBINFO "${minizip_FRAMEWORKS_RELWITHDEBINFO}" "${minizip_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(minizip_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET minizip_DEPS_TARGET)
    add_library(minizip_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET minizip_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${minizip_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${minizip_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:ZLIB::ZLIB;BZip2::BZip2>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### minizip_DEPS_TARGET to all of them
conan_package_library_targets("${minizip_LIBS_RELWITHDEBINFO}"    # libraries
                              "${minizip_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              minizip_DEPS_TARGET
                              minizip_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "minizip")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${minizip_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET minizip::minizip
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${minizip_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${minizip_LIBRARIES_TARGETS}>
                 APPEND)

    if("${minizip_LIBS_RELWITHDEBINFO}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET minizip::minizip
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     minizip_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET minizip::minizip
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${minizip_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET minizip::minizip
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${minizip_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET minizip::minizip
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${minizip_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET minizip::minizip
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${minizip_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(minizip_LIBRARIES_RELWITHDEBINFO minizip::minizip)
