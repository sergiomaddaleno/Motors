########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(zlib_COMPONENT_NAMES "")
set(zlib_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(zlib_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/zlib/1.3.1/_/_/package/164640aad040835ac89882393a96d89200694f04")
set(zlib_BUILD_MODULES_PATHS_DEBUG )


set(zlib_INCLUDE_DIRS_DEBUG "${zlib_PACKAGE_FOLDER_DEBUG}/include")
set(zlib_RES_DIRS_DEBUG )
set(zlib_DEFINITIONS_DEBUG )
set(zlib_SHARED_LINK_FLAGS_DEBUG )
set(zlib_EXE_LINK_FLAGS_DEBUG )
set(zlib_OBJECTS_DEBUG )
set(zlib_COMPILE_DEFINITIONS_DEBUG )
set(zlib_COMPILE_OPTIONS_C_DEBUG )
set(zlib_COMPILE_OPTIONS_CXX_DEBUG )
set(zlib_LIB_DIRS_DEBUG "${zlib_PACKAGE_FOLDER_DEBUG}/lib")
set(zlib_LIBS_DEBUG zlib)
set(zlib_SYSTEM_LIBS_DEBUG )
set(zlib_FRAMEWORK_DIRS_DEBUG )
set(zlib_FRAMEWORKS_DEBUG )
set(zlib_BUILD_DIRS_DEBUG "${zlib_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(zlib_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${zlib_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${zlib_COMPILE_OPTIONS_C_DEBUG}>")
set(zlib_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${zlib_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${zlib_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${zlib_EXE_LINK_FLAGS_DEBUG}>")


set(zlib_COMPONENTS_DEBUG )