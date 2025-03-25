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
set(assimp_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/assimp/5.0.1/_/_/package/dbc341285caca8b7e7a0775e2cfdd41f45d84932")
set(assimp_BUILD_MODULES_PATHS_RELEASE )


set(assimp_INCLUDE_DIRS_RELEASE "${assimp_PACKAGE_FOLDER_RELEASE}/include")
set(assimp_RES_DIRS_RELEASE )
set(assimp_DEFINITIONS_RELEASE )
set(assimp_SHARED_LINK_FLAGS_RELEASE )
set(assimp_EXE_LINK_FLAGS_RELEASE )
set(assimp_OBJECTS_RELEASE )
set(assimp_COMPILE_DEFINITIONS_RELEASE )
set(assimp_COMPILE_OPTIONS_C_RELEASE )
set(assimp_COMPILE_OPTIONS_CXX_RELEASE )
set(assimp_LIB_DIRS_RELEASE "${assimp_PACKAGE_FOLDER_RELEASE}/lib")
set(assimp_LIBS_RELEASE assimp-vc143-mt)
set(assimp_SYSTEM_LIBS_RELEASE )
set(assimp_FRAMEWORK_DIRS_RELEASE )
set(assimp_FRAMEWORKS_RELEASE )
set(assimp_BUILD_DIRS_RELEASE "${assimp_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(assimp_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${assimp_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${assimp_COMPILE_OPTIONS_C_RELEASE}>")
set(assimp_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${assimp_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${assimp_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${assimp_EXE_LINK_FLAGS_RELEASE}>")


set(assimp_COMPONENTS_RELEASE )