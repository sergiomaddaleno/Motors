########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(kuba-zip_COMPONENT_NAMES "")
set(kuba-zip_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(kuba-zip_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/kuba-zip/0.2.6/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b")
set(kuba-zip_BUILD_MODULES_PATHS_RELEASE )


set(kuba-zip_INCLUDE_DIRS_RELEASE "${kuba-zip_PACKAGE_FOLDER_RELEASE}/include")
set(kuba-zip_RES_DIRS_RELEASE )
set(kuba-zip_DEFINITIONS_RELEASE )
set(kuba-zip_SHARED_LINK_FLAGS_RELEASE )
set(kuba-zip_EXE_LINK_FLAGS_RELEASE )
set(kuba-zip_OBJECTS_RELEASE )
set(kuba-zip_COMPILE_DEFINITIONS_RELEASE )
set(kuba-zip_COMPILE_OPTIONS_C_RELEASE )
set(kuba-zip_COMPILE_OPTIONS_CXX_RELEASE )
set(kuba-zip_LIB_DIRS_RELEASE "${kuba-zip_PACKAGE_FOLDER_RELEASE}/lib")
set(kuba-zip_LIBS_RELEASE zip)
set(kuba-zip_SYSTEM_LIBS_RELEASE )
set(kuba-zip_FRAMEWORK_DIRS_RELEASE )
set(kuba-zip_FRAMEWORKS_RELEASE )
set(kuba-zip_BUILD_DIRS_RELEASE "${kuba-zip_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(kuba-zip_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${kuba-zip_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${kuba-zip_COMPILE_OPTIONS_C_RELEASE}>")
set(kuba-zip_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${kuba-zip_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${kuba-zip_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${kuba-zip_EXE_LINK_FLAGS_RELEASE}>")


set(kuba-zip_COMPONENTS_RELEASE )