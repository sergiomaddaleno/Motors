########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(stb_COMPONENT_NAMES "")
set(stb_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(stb_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/stb/cci.20240531/_/_/package/9d3d9aac798392dbe5b8ddad56d332bc432631ac")
set(stb_BUILD_MODULES_PATHS_DEBUG )


set(stb_INCLUDE_DIRS_DEBUG "${stb_PACKAGE_FOLDER_DEBUG}/include")
set(stb_RES_DIRS_DEBUG )
set(stb_DEFINITIONS_DEBUG "-DSTB_TEXTEDIT_KEYTYPE=unsigned")
set(stb_SHARED_LINK_FLAGS_DEBUG )
set(stb_EXE_LINK_FLAGS_DEBUG )
set(stb_OBJECTS_DEBUG )
set(stb_COMPILE_DEFINITIONS_DEBUG "STB_TEXTEDIT_KEYTYPE=unsigned")
set(stb_COMPILE_OPTIONS_C_DEBUG )
set(stb_COMPILE_OPTIONS_CXX_DEBUG )
set(stb_LIB_DIRS_DEBUG )
set(stb_LIBS_DEBUG )
set(stb_SYSTEM_LIBS_DEBUG )
set(stb_FRAMEWORK_DIRS_DEBUG )
set(stb_FRAMEWORKS_DEBUG )
set(stb_BUILD_DIRS_DEBUG "${stb_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(stb_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${stb_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${stb_COMPILE_OPTIONS_C_DEBUG}>")
set(stb_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${stb_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${stb_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${stb_EXE_LINK_FLAGS_DEBUG}>")


set(stb_COMPONENTS_DEBUG )