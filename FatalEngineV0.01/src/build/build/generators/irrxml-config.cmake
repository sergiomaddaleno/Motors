########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(irrxml_FIND_QUIETLY)
    set(irrxml_MESSAGE_MODE VERBOSE)
else()
    set(irrxml_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/irrxmlTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${irrxml_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(irrxml_VERSION_STRING "1.2")
set(irrxml_INCLUDE_DIRS ${irrxml_INCLUDE_DIRS_RELEASE} )
set(irrxml_INCLUDE_DIR ${irrxml_INCLUDE_DIRS_RELEASE} )
set(irrxml_LIBRARIES ${irrxml_LIBRARIES_RELEASE} )
set(irrxml_DEFINITIONS ${irrxml_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${irrxml_BUILD_MODULES_PATHS_RELEASE} )
    message(${irrxml_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


