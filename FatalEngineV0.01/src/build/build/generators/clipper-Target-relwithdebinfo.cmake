# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(clipper_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(clipper_FRAMEWORKS_FOUND_RELWITHDEBINFO "${clipper_FRAMEWORKS_RELWITHDEBINFO}" "${clipper_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(clipper_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET clipper_DEPS_TARGET)
    add_library(clipper_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET clipper_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${clipper_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${clipper_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### clipper_DEPS_TARGET to all of them
conan_package_library_targets("${clipper_LIBS_RELWITHDEBINFO}"    # libraries
                              "${clipper_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              clipper_DEPS_TARGET
                              clipper_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "clipper")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${clipper_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${clipper_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${clipper_LIBRARIES_TARGETS}>
                 APPEND)

    if("${clipper_LIBS_RELWITHDEBINFO}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET clipper::clipper
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     clipper_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${clipper_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${clipper_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${clipper_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET clipper::clipper
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${clipper_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(clipper_LIBRARIES_RELWITHDEBINFO clipper::clipper)
