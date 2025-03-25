# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(spirv-headers_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(spirv-headers_FRAMEWORKS_FOUND_RELEASE "${spirv-headers_FRAMEWORKS_RELEASE}" "${spirv-headers_FRAMEWORK_DIRS_RELEASE}")

set(spirv-headers_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET spirv-headers_DEPS_TARGET)
    add_library(spirv-headers_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET spirv-headers_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${spirv-headers_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${spirv-headers_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### spirv-headers_DEPS_TARGET to all of them
conan_package_library_targets("${spirv-headers_LIBS_RELEASE}"    # libraries
                              "${spirv-headers_LIB_DIRS_RELEASE}" # package_libdir
                              spirv-headers_DEPS_TARGET
                              spirv-headers_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "spirv-headers")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${spirv-headers_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${spirv-headers_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${spirv-headers_LIBRARIES_TARGETS}>
                 APPEND)

    if("${spirv-headers_LIBS_RELEASE}" STREQUAL "")
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
                 $<$<CONFIG:Release>:${spirv-headers_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${spirv-headers_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${spirv-headers_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET SPIRV-Headers::SPIRV-Headers
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${spirv-headers_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(spirv-headers_LIBRARIES_RELEASE SPIRV-Headers::SPIRV-Headers)
