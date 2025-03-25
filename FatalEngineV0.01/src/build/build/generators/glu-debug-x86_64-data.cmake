########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(glu_COMPONENT_NAMES "")
list(APPEND glu_FIND_DEPENDENCY_NAMES opengl_system)
list(REMOVE_DUPLICATES glu_FIND_DEPENDENCY_NAMES)
set(opengl_system_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(glu_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/glu/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(glu_BUILD_MODULES_PATHS_DEBUG )


set(glu_INCLUDE_DIRS_DEBUG )
set(glu_RES_DIRS_DEBUG )
set(glu_DEFINITIONS_DEBUG )
set(glu_SHARED_LINK_FLAGS_DEBUG )
set(glu_EXE_LINK_FLAGS_DEBUG )
set(glu_OBJECTS_DEBUG )
set(glu_COMPILE_DEFINITIONS_DEBUG )
set(glu_COMPILE_OPTIONS_C_DEBUG )
set(glu_COMPILE_OPTIONS_CXX_DEBUG )
set(glu_LIB_DIRS_DEBUG )
set(glu_LIBS_DEBUG )
set(glu_SYSTEM_LIBS_DEBUG glu32)
set(glu_FRAMEWORK_DIRS_DEBUG )
set(glu_FRAMEWORKS_DEBUG )
set(glu_BUILD_DIRS_DEBUG "${glu_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(glu_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glu_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glu_COMPILE_OPTIONS_C_DEBUG}>")
set(glu_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glu_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glu_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glu_EXE_LINK_FLAGS_DEBUG}>")


set(glu_COMPONENTS_DEBUG )