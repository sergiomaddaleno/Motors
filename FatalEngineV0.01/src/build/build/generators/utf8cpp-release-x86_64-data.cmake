########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(utfcpp_COMPONENT_NAMES "")
set(utfcpp_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(utfcpp_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/utfcpp/3.2.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(utfcpp_BUILD_MODULES_PATHS_RELEASE )


set(utfcpp_INCLUDE_DIRS_RELEASE "${utfcpp_PACKAGE_FOLDER_RELEASE}/include"
			"${utfcpp_PACKAGE_FOLDER_RELEASE}/include/utf8cpp")
set(utfcpp_RES_DIRS_RELEASE )
set(utfcpp_DEFINITIONS_RELEASE )
set(utfcpp_SHARED_LINK_FLAGS_RELEASE )
set(utfcpp_EXE_LINK_FLAGS_RELEASE )
set(utfcpp_OBJECTS_RELEASE )
set(utfcpp_COMPILE_DEFINITIONS_RELEASE )
set(utfcpp_COMPILE_OPTIONS_C_RELEASE )
set(utfcpp_COMPILE_OPTIONS_CXX_RELEASE )
set(utfcpp_LIB_DIRS_RELEASE )
set(utfcpp_LIBS_RELEASE )
set(utfcpp_SYSTEM_LIBS_RELEASE )
set(utfcpp_FRAMEWORK_DIRS_RELEASE )
set(utfcpp_FRAMEWORKS_RELEASE )
set(utfcpp_BUILD_DIRS_RELEASE "${utfcpp_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(utfcpp_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${utfcpp_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${utfcpp_COMPILE_OPTIONS_C_RELEASE}>")
set(utfcpp_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${utfcpp_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${utfcpp_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${utfcpp_EXE_LINK_FLAGS_RELEASE}>")


set(utfcpp_COMPONENTS_RELEASE )