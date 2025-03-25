########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(glad_COMPONENT_NAMES "")
set(glad_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(glad_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/glad/0.1.36/_/_/package/12fad80963e9d74128780689a6492202a1759d4b")
set(glad_BUILD_MODULES_PATHS_RELEASE )


set(glad_INCLUDE_DIRS_RELEASE "${glad_PACKAGE_FOLDER_RELEASE}/include")
set(glad_RES_DIRS_RELEASE )
set(glad_DEFINITIONS_RELEASE )
set(glad_SHARED_LINK_FLAGS_RELEASE )
set(glad_EXE_LINK_FLAGS_RELEASE )
set(glad_OBJECTS_RELEASE )
set(glad_COMPILE_DEFINITIONS_RELEASE )
set(glad_COMPILE_OPTIONS_C_RELEASE )
set(glad_COMPILE_OPTIONS_CXX_RELEASE )
set(glad_LIB_DIRS_RELEASE "${glad_PACKAGE_FOLDER_RELEASE}/lib")
set(glad_LIBS_RELEASE glad)
set(glad_SYSTEM_LIBS_RELEASE )
set(glad_FRAMEWORK_DIRS_RELEASE )
set(glad_FRAMEWORKS_RELEASE )
set(glad_BUILD_DIRS_RELEASE "${glad_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(glad_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${glad_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${glad_COMPILE_OPTIONS_C_RELEASE}>")
set(glad_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glad_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glad_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glad_EXE_LINK_FLAGS_RELEASE}>")


set(glad_COMPONENTS_RELEASE )