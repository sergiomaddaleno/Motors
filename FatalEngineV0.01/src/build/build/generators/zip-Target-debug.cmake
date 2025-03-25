# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(kuba-zip_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(kuba-zip_FRAMEWORKS_FOUND_DEBUG "${kuba-zip_FRAMEWORKS_DEBUG}" "${kuba-zip_FRAMEWORK_DIRS_DEBUG}")

set(kuba-zip_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET kuba-zip_DEPS_TARGET)
    add_library(kuba-zip_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET kuba-zip_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${kuba-zip_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${kuba-zip_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### kuba-zip_DEPS_TARGET to all of them
conan_package_library_targets("${kuba-zip_LIBS_DEBUG}"    # libraries
                              "${kuba-zip_LIB_DIRS_DEBUG}" # package_libdir
                              kuba-zip_DEPS_TARGET
                              kuba-zip_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "kuba-zip")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${kuba-zip_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${kuba-zip_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${kuba-zip_LIBRARIES_TARGETS}>
                 APPEND)

    if("${kuba-zip_LIBS_DEBUG}" STREQUAL "")
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
                 $<$<CONFIG:Debug>:${kuba-zip_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${kuba-zip_INCLUDE_DIRS_DEBUG}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${kuba-zip_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${kuba-zip_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(kuba-zip_LIBRARIES_DEBUG zip::zip)
