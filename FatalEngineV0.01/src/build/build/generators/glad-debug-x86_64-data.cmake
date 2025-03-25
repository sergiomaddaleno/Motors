########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(glad_COMPONENT_NAMES "")
set(glad_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(glad_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/glad/0.1.36/_/_/package/ddbd0650ac2f2d0259758fa39134856e7a5bd959")
set(glad_BUILD_MODULES_PATHS_DEBUG )


set(glad_INCLUDE_DIRS_DEBUG "${glad_PACKAGE_FOLDER_DEBUG}/include")
set(glad_RES_DIRS_DEBUG )
set(glad_DEFINITIONS_DEBUG )
set(glad_SHARED_LINK_FLAGS_DEBUG )
set(glad_EXE_LINK_FLAGS_DEBUG )
set(glad_OBJECTS_DEBUG )
set(glad_COMPILE_DEFINITIONS_DEBUG )
set(glad_COMPILE_OPTIONS_C_DEBUG )
set(glad_COMPILE_OPTIONS_CXX_DEBUG )
set(glad_LIB_DIRS_DEBUG "${glad_PACKAGE_FOLDER_DEBUG}/lib")
set(glad_LIBS_DEBUG glad)
set(glad_SYSTEM_LIBS_DEBUG )
set(glad_FRAMEWORK_DIRS_DEBUG )
set(glad_FRAMEWORKS_DEBUG )
set(glad_BUILD_DIRS_DEBUG "${glad_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(glad_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glad_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glad_COMPILE_OPTIONS_C_DEBUG}>")
set(glad_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glad_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glad_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glad_EXE_LINK_FLAGS_DEBUG}>")


set(glad_COMPONENTS_DEBUG )