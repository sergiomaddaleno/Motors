# Load the debug and release variables
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB DATA_FILES "${_DIR}/SPIRV-Tools-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${spirv-tools_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${SPIRV-Tools_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET spirv-tools::spirv-tools)
    add_library(spirv-tools::spirv-tools INTERFACE IMPORTED)
    message(${SPIRV-Tools_MESSAGE_MODE} "Conan: Target declared 'spirv-tools::spirv-tools'")
endif()
if(NOT TARGET SPIRV-Tools)
    add_library(SPIRV-Tools INTERFACE IMPORTED)
    set_property(TARGET SPIRV-Tools PROPERTY INTERFACE_LINK_LIBRARIES SPIRV-Tools-static)
else()
    message(WARNING "Target name 'SPIRV-Tools' already exists.")
endif()
# Load the debug and release library finders
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/SPIRV-Tools-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()