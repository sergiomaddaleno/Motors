########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(minizip_COMPONENT_NAMES "")
list(APPEND minizip_FIND_DEPENDENCY_NAMES ZLIB BZip2)
list(REMOVE_DUPLICATES minizip_FIND_DEPENDENCY_NAMES)
set(ZLIB_FIND_MODE "NO_MODULE")
set(BZip2_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(minizip_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/minizip/1.2.13/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c")
set(minizip_BUILD_MODULES_PATHS_RELEASE )


set(minizip_INCLUDE_DIRS_RELEASE "${minizip_PACKAGE_FOLDER_RELEASE}/include"
			"${minizip_PACKAGE_FOLDER_RELEASE}/include/minizip")
set(minizip_RES_DIRS_RELEASE )
set(minizip_DEFINITIONS_RELEASE "-DHAVE_BZIP2")
set(minizip_SHARED_LINK_FLAGS_RELEASE )
set(minizip_EXE_LINK_FLAGS_RELEASE )
set(minizip_OBJECTS_RELEASE )
set(minizip_COMPILE_DEFINITIONS_RELEASE "HAVE_BZIP2")
set(minizip_COMPILE_OPTIONS_C_RELEASE )
set(minizip_COMPILE_OPTIONS_CXX_RELEASE )
set(minizip_LIB_DIRS_RELEASE "${minizip_PACKAGE_FOLDER_RELEASE}/lib")
set(minizip_LIBS_RELEASE minizip)
set(minizip_SYSTEM_LIBS_RELEASE )
set(minizip_FRAMEWORK_DIRS_RELEASE )
set(minizip_FRAMEWORKS_RELEASE )
set(minizip_BUILD_DIRS_RELEASE "${minizip_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(minizip_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${minizip_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${minizip_COMPILE_OPTIONS_C_RELEASE}>")
set(minizip_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${minizip_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${minizip_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${minizip_EXE_LINK_FLAGS_RELEASE}>")


set(minizip_COMPONENTS_RELEASE )