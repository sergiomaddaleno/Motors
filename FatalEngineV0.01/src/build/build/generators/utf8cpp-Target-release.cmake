# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(utfcpp_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(utfcpp_FRAMEWORKS_FOUND_RELEASE "${utfcpp_FRAMEWORKS_RELEASE}" "${utfcpp_FRAMEWORK_DIRS_RELEASE}")

set(utfcpp_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET utfcpp_DEPS_TARGET)
    add_library(utfcpp_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET utfcpp_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${utfcpp_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${utfcpp_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### utfcpp_DEPS_TARGET to all of them
conan_package_library_targets("${utfcpp_LIBS_RELEASE}"    # libraries
                              "${utfcpp_LIB_DIRS_RELEASE}" # package_libdir
                              utfcpp_DEPS_TARGET
                              utfcpp_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "utfcpp")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${utfcpp_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${utfcpp_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${utfcpp_LIBRARIES_TARGETS}>
                 APPEND)

    if("${utfcpp_LIBS_RELEASE}" STREQUAL "")
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
                 $<$<CONFIG:Release>:${utfcpp_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${utfcpp_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${utfcpp_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET utf8cpp
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${utfcpp_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(utfcpp_LIBRARIES_RELEASE utf8cpp)
