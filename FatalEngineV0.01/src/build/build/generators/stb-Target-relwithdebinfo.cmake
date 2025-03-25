# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(stb_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(stb_FRAMEWORKS_FOUND_RELWITHDEBINFO "${stb_FRAMEWORKS_RELWITHDEBINFO}" "${stb_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(stb_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET stb_DEPS_TARGET)
    add_library(stb_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET stb_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${stb_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${stb_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### stb_DEPS_TARGET to all of them
conan_package_library_targets("${stb_LIBS_RELWITHDEBINFO}"    # libraries
                              "${stb_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              stb_DEPS_TARGET
                              stb_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "stb")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${stb_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${stb_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${stb_LIBRARIES_TARGETS}>
                 APPEND)

    if("${stb_LIBS_RELWITHDEBINFO}" STREQUAL "")
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
                 $<$<CONFIG:RelWithDebInfo>:${stb_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${stb_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${stb_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET stb::stb
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${stb_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(stb_LIBRARIES_RELWITHDEBINFO stb::stb)
