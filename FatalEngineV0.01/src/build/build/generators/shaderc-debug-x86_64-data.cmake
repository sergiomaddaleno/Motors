########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(shaderc_COMPONENT_NAMES "")
list(APPEND shaderc_FIND_DEPENDENCY_NAMES glslang SPIRV-Tools SPIRV-Tools SPIRV-Headers)
list(REMOVE_DUPLICATES shaderc_FIND_DEPENDENCY_NAMES)
set(glslang_FIND_MODE "NO_MODULE")
set(SPIRV-Tools_FIND_MODE "NO_MODULE")
set(SPIRV-Headers_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(shaderc_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/shaderc/2024.1/_/_/package/22f7fecd6902a48a81dae8e2ae73ddb3d20d4488")
set(shaderc_BUILD_MODULES_PATHS_DEBUG )


set(shaderc_INCLUDE_DIRS_DEBUG "${shaderc_PACKAGE_FOLDER_DEBUG}/include")
set(shaderc_RES_DIRS_DEBUG )
set(shaderc_DEFINITIONS_DEBUG )
set(shaderc_SHARED_LINK_FLAGS_DEBUG )
set(shaderc_EXE_LINK_FLAGS_DEBUG )
set(shaderc_OBJECTS_DEBUG )
set(shaderc_COMPILE_DEFINITIONS_DEBUG )
set(shaderc_COMPILE_OPTIONS_C_DEBUG )
set(shaderc_COMPILE_OPTIONS_CXX_DEBUG )
set(shaderc_LIB_DIRS_DEBUG "${shaderc_PACKAGE_FOLDER_DEBUG}/lib")
set(shaderc_LIBS_DEBUG shaderc shaderc_util)
set(shaderc_SYSTEM_LIBS_DEBUG )
set(shaderc_FRAMEWORK_DIRS_DEBUG )
set(shaderc_FRAMEWORKS_DEBUG )
set(shaderc_BUILD_DIRS_DEBUG "${shaderc_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(shaderc_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${shaderc_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${shaderc_COMPILE_OPTIONS_C_DEBUG}>")
set(shaderc_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${shaderc_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${shaderc_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${shaderc_EXE_LINK_FLAGS_DEBUG}>")


set(shaderc_COMPONENTS_DEBUG )