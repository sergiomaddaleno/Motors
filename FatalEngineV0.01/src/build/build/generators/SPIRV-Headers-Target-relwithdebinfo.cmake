# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(spirv-headers_FRAMEWORKS_FOUND_RELWITHDEBINFO "") # Will be filled later
conan_find_apple_frameworks(spirv-headers_FRAMEWORKS_FOUND_RELWITHDEBINFO "${spirv-headers_FRAMEWORKS_RELWITHDEBINFO}" "${spirv-headers_FRAMEWORK_DIRS_RELWITHDEBINFO}")

set(spirv-headers_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET spirv-headers_DEPS_TARGET)
    add_library(spirv-headers_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET spirv-headers_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:RelWithDebInfo>:${spirv-headers_FRAMEWORKS_FOUND_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:${spirv-headers_SYSTEM_LIBS_RELWITHDEBINFO}>
             $<$<CONFIG:RelWithDebInfo>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### spirv-headers_DEPS_TARGET to all of them
conan_package_library_targets("${spirv-headers_LIBS_RELWITHDEBINFO}"    # libraries
                              "${spirv-headers_LIB_DIRS_RELWITHDEBINFO}" # package_libdir
                              spirv-headers_DEPS_TARGET
                              spirv-headers_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELWITHDEBINFO"
                              "spirv-headers")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${spirv-headers_BUILD_DIRS_RELWITHDEBINFO} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES RelWithDebInfo ########################################
    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:RelWithDebInfo>:${spirv-headers_OBJECTS_RELWITHDEBINFO}>
                 $<$<CONFIG:RelWithDebInfo>:${spirv-headers_LIBRARIES_TARGETS}>
                 APPEND)

    if("${spirv-headers_LIBS_RELWITHDEBINFO}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET SPIRV-Headers::SPIRV-Headers
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     spirv-headers_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${spirv-headers_LINKER_FLAGS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:RelWithDebInfo>:${spirv-headers_INCLUDE_DIRS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:RelWithDebInfo>:${spirv-headers_COMPILE_DEFINITIONS_RELWITHDEBINFO}> APPEND)
    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:RelWithDebInfo>:${spirv-headers_COMPILE_OPTIONS_RELWITHDEBINFO}> APPEND)

########## For the modules (FindXXX)
set(spirv-headers_LIBRARIES_RELWITHDEBINFO SPIRV-Headers::SPIRV-Headers)
