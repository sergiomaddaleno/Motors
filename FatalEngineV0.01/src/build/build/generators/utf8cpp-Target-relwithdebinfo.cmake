# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(utfcpp_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(utfcpp_FRAMEWORKS_FOUND_RELWITHDEBINFO "${utfcpp_FRAMEWORKS_RELWITHDEBINFO}" "${utfcpp_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(utfcpp_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET utfcpp_DEPS_TARGET)
    add_library(utfcpp_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET utfcpp_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${utfcpp_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${utfcpp_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### utfcpp_DEPS_TARGET to all of them
conan_package_library_targets("${utfcpp_LIBS_RELWITHDEBINFO}"    # libraries
                              "${utfcpp_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              utfcpp_DEPS_TARGET
                              utfcpp_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "utfcpp")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${utfcpp_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${utfcpp_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${utfcpp_LIBRARIES_TARGETS}>
                 APPEND)

    if("${utfcpp_LIBS_RELWITHDEBINFO}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET utf8cpp
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     utfcpp_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${utfcpp_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${utfcpp_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${utfcpp_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${utfcpp_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(utfcpp_LIBRARIES_RELWITHDEBINFO utf8cpp)
