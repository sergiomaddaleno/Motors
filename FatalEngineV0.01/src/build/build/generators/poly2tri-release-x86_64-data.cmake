########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(poly2tri_COMPONENT_NAMES "")
set(poly2tri_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(poly2tri_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/poly2tri/cci.20130502/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b")
set(poly2tri_BUILD_MODULES_PATHS_RELEASE )


set(poly2tri_INCLUDE_DIRS_RELEASE "${poly2tri_PACKAGE_FOLDER_RELEASE}/include")
set(poly2tri_RES_DIRS_RELEASE )
set(poly2tri_DEFINITIONS_RELEASE )
set(poly2tri_SHARED_LINK_FLAGS_RELEASE )
set(poly2tri_EXE_LINK_FLAGS_RELEASE )
set(poly2tri_OBJECTS_RELEASE )
set(poly2tri_COMPILE_DEFINITIONS_RELEASE )
set(poly2tri_COMPILE_OPTIONS_C_RELEASE )
set(poly2tri_COMPILE_OPTIONS_CXX_RELEASE )
set(poly2tri_LIB_DIRS_RELEASE "${poly2tri_PACKAGE_FOLDER_RELEASE}/lib")
set(poly2tri_LIBS_RELEASE poly2tri)
set(poly2tri_SYSTEM_LIBS_RELEASE )
set(poly2tri_FRAMEWORK_DIRS_RELEASE )
set(poly2tri_FRAMEWORKS_RELEASE )
set(poly2tri_BUILD_DIRS_RELEASE "${poly2tri_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(poly2tri_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poly2tri_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poly2tri_COMPILE_OPTIONS_C_RELEASE}>")
set(poly2tri_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poly2tri_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poly2tri_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poly2tri_EXE_LINK_FLAGS_RELEASE}>")


set(poly2tri_COMPONENTS_RELEASE )