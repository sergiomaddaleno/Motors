########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(irrxml_COMPONENT_NAMES "")
set(irrxml_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(irrxml_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/irrxml/1.2/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b")
set(irrxml_BUILD_MODULES_PATHS_RELEASE )


set(irrxml_INCLUDE_DIRS_RELEASE "${irrxml_PACKAGE_FOLDER_RELEASE}/include")
set(irrxml_RES_DIRS_RELEASE )
set(irrxml_DEFINITIONS_RELEASE )
set(irrxml_SHARED_LINK_FLAGS_RELEASE )
set(irrxml_EXE_LINK_FLAGS_RELEASE )
set(irrxml_OBJECTS_RELEASE )
set(irrxml_COMPILE_DEFINITIONS_RELEASE )
set(irrxml_COMPILE_OPTIONS_C_RELEASE )
set(irrxml_COMPILE_OPTIONS_CXX_RELEASE )
set(irrxml_LIB_DIRS_RELEASE "${irrxml_PACKAGE_FOLDER_RELEASE}/lib")
set(irrxml_LIBS_RELEASE IrrXML)
set(irrxml_SYSTEM_LIBS_RELEASE )
set(irrxml_FRAMEWORK_DIRS_RELEASE )
set(irrxml_FRAMEWORKS_RELEASE )
set(irrxml_BUILD_DIRS_RELEASE "${irrxml_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(irrxml_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${irrxml_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${irrxml_COMPILE_OPTIONS_C_RELEASE}>")
set(irrxml_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${irrxml_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${irrxml_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${irrxml_EXE_LINK_FLAGS_RELEASE}>")


set(irrxml_COMPONENTS_RELEASE )