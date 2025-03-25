# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(rapidjson_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(rapidjson_FRAMEWORKS_FOUND_RELWITHDEBINFO "${rapidjson_FRAMEWORKS_RELWITHDEBINFO}" "${rapidjson_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(rapidjson_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET rapidjson_DEPS_TARGET)
    add_library(rapidjson_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET rapidjson_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${rapidjson_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${rapidjson_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### rapidjson_DEPS_TARGET to all of them
conan_package_library_targets("${rapidjson_LIBS_RELWITHDEBINFO}"    # libraries
                              "${rapidjson_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              rapidjson_DEPS_TARGET
                              rapidjson_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "rapidjson")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${rapidjson_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET rapidjson
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${rapidjson_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${rapidjson_LIBRARIES_TARGETS}>
                 APPEND)

    if("${rapidjson_LIBS_RELWITHDEBINFO}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET rapidjson
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     rapidjson_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET rapidjson
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${rapidjson_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET rapidjson
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${rapidjson_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET rapidjson
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${rapidjson_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET rapidjson
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${rapidjson_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(rapidjson_LIBRARIES_RELWITHDEBINFO rapidjson)
