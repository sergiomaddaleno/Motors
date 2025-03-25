########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(utfcpp_COMPONENT_NAMES "")
set(utfcpp_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(utfcpp_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/utfcpp/3.2.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(utfcpp_BUILD_MODULES_PATHS_DEBUG )


set(utfcpp_INCLUDE_DIRS_DEBUG "${utfcpp_PACKAGE_FOLDER_DEBUG}/include"
			"${utfcpp_PACKAGE_FOLDER_DEBUG}/include/utf8cpp")
set(utfcpp_RES_DIRS_DEBUG )
set(utfcpp_DEFINITIONS_DEBUG )
set(utfcpp_SHARED_LINK_FLAGS_DEBUG )
set(utfcpp_EXE_LINK_FLAGS_DEBUG )
set(utfcpp_OBJECTS_DEBUG )
set(utfcpp_COMPILE_DEFINITIONS_DEBUG )
set(utfcpp_COMPILE_OPTIONS_C_DEBUG )
set(utfcpp_COMPILE_OPTIONS_CXX_DEBUG )
set(utfcpp_LIB_DIRS_DEBUG )
set(utfcpp_LIBS_DEBUG )
set(utfcpp_SYSTEM_LIBS_DEBUG )
set(utfcpp_FRAMEWORK_DIRS_DEBUG )
set(utfcpp_FRAMEWORKS_DEBUG )
set(utfcpp_BUILD_DIRS_DEBUG "${utfcpp_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(utfcpp_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${utfcpp_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${utfcpp_COMPILE_OPTIONS_C_DEBUG}>")
set(utfcpp_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${utfcpp_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${utfcpp_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${utfcpp_EXE_LINK_FLAGS_DEBUG}>")


set(utfcpp_COMPONENTS_DEBUG )