# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(kuba-zip_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(kuba-zip_FRAMEWORKS_FOUND_RELEASE "${kuba-zip_FRAMEWORKS_RELEASE}" "${kuba-zip_FRAMEWORK_DIRS_RELEASE}")

set(kuba-zip_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET kuba-zip_DEPS_TARGET)
    add_library(kuba-zip_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET kuba-zip_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${kuba-zip_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${kuba-zip_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### kuba-zip_DEPS_TARGET to all of them
conan_package_library_targets("${kuba-zip_LIBS_RELEASE}"    # libraries
                              "${kuba-zip_LIB_DIRS_RELEASE}" # package_libdir
                              kuba-zip_DEPS_TARGET
                              kuba-zip_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "kuba-zip")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${kuba-zip_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${kuba-zip_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${kuba-zip_LIBRARIES_TARGETS}>
                 APPEND)

    if("${kuba-zip_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET zip::zip
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     kuba-zip_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${kuba-zip_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${kuba-zip_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${kuba-zip_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${kuba-zip_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(kuba-zip_LIBRARIES_RELEASE zip::zip)
