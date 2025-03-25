########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(assimp_COMPONENT_NAMES "")
list(APPEND assimp_FIND_DEPENDENCY_NAMES minizip utf8cpp irrxml zip poly2tri RapidJSON ZLIB clipper)
list(REMOVE_DUPLICATES assimp_FIND_DEPENDENCY_NAMES)
set(minizip_FIND_MODE "NO_MODULE")
set(utf8cpp_FIND_MODE "NO_MODULE")
set(irrxml_FIND_MODE "NO_MODULE")
set(zip_FIND_MODE "NO_MODULE")
set(poly2tri_FIND_MODE "NO_MODULE")
set(RapidJSON_FIND_MODE "NO_MODULE")
set(ZLIB_FIND_MODE "NO_MODULE")
set(clipper_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(assimp_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/assimp/5.0.1/_/_/package/450a85d59ab55d81ba252e781acd4c73bff32111")
set(assimp_BUILD_MODULES_PATHS_DEBUG )


set(assimp_INCLUDE_DIRS_DEBUG "${assimp_PACKAGE_FOLDER_DEBUG}/include")
set(assimp_RES_DIRS_DEBUG )
set(assimp_DEFINITIONS_DEBUG )
set(assimp_SHARED_LINK_FLAGS_DEBUG )
set(assimp_EXE_LINK_FLAGS_DEBUG )
set(assimp_OBJECTS_DEBUG )
set(assimp_COMPILE_DEFINITIONS_DEBUG )
set(assimp_COMPILE_OPTIONS_C_DEBUG )
set(assimp_COMPILE_OPTIONS_CXX_DEBUG )
set(assimp_LIB_DIRS_DEBUG "${assimp_PACKAGE_FOLDER_DEBUG}/lib")
set(assimp_LIBS_DEBUG assimp-vc143-mtd)
set(assimp_SYSTEM_LIBS_DEBUG )
set(assimp_FRAMEWORK_DIRS_DEBUG )
set(assimp_FRAMEWORKS_DEBUG )
set(assimp_BUILD_DIRS_DEBUG "${assimp_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(assimp_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${assimp_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${assimp_COMPILE_OPTIONS_C_DEBUG}>")
set(assimp_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${assimp_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${assimp_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${assimp_EXE_LINK_FLAGS_DEBUG}>")


set(assimp_COMPONENTS_DEBUG )