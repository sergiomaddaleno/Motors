# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(kuba-zip_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(kuba-zip_FRAMEWORKS_FOUND_RELWITHDEBINFO "${kuba-zip_FRAMEWORKS_RELWITHDEBINFO}" "${kuba-zip_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(kuba-zip_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET kuba-zip_DEPS_TARGET)
    add_library(kuba-zip_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET kuba-zip_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${kuba-zip_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${kuba-zip_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### kuba-zip_DEPS_TARGET to all of them
conan_package_library_targets("${kuba-zip_LIBS_RELWITHDEBINFO}"    # libraries
                              "${kuba-zip_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              kuba-zip_DEPS_TARGET
                              kuba-zip_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "kuba-zip")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${kuba-zip_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${kuba-zip_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${kuba-zip_LIBRARIES_TARGETS}>
                 APPEND)

    if("${kuba-zip_LIBS_RELWITHDEBINFO}" STREQUAL "")
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
                 $<$<CONFIG:RelWithDebInfo>:${kuba-zip_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${kuba-zip_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${kuba-zip_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET zip::zip
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${kuba-zip_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(kuba-zip_LIBRARIES_RELWITHDEBINFO zip::zip)
