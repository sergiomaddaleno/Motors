########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(SPIRV-Tools_FIND_QUIETLY)
    set(SPIRV-Tools_MESSAGE_MODE VERBOSE)
else()
    set(SPIRV-Tools_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/SPIRV-ToolsTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${spirv-tools_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(SPIRV-Tools_VERSION_STRING "1.3.261.1")
set(SPIRV-Tools_INCLUDE_DIRS ${spirv-tools_INCLUDE_DIRS_RELEASE} )
set(SPIRV-Tools_INCLUDE_DIR ${spirv-tools_INCLUDE_DIRS_RELEASE} )
set(SPIRV-Tools_LIBRARIES ${spirv-tools_LIBRARIES_RELEASE} )
set(SPIRV-Tools_DEFINITIONS ${spirv-tools_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${spirv-tools_BUILD_MODULES_PATHS_RELEASE} )
    message(${SPIRV-Tools_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


