########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(kuba-zip_COMPONENT_NAMES "")
set(kuba-zip_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(kuba-zip_PACKAGE_FOLDER_RELWITHDEBINFO "C:/Users/Usuario/.conan/data/kuba-zip/0.2.6/_/_/package/270dc4a2f77a5fc63ad24b950295fddb3a32f993")
set(kuba-zip_BUILD_MODULES_PATHS_RELWITHDEBINFO )


set(kuba-zip_INCLUDE_DIRS_RELWITHDEBINFO "${kuba-zip_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(kuba-zip_RES_DIRS_RELWITHDEBINFO )
set(kuba-zip_DEFINITIONS_RELWITHDEBINFO )
set(kuba-zip_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(kuba-zip_EXE_LINK_FLAGS_RELWITHDEBINFO )
set(kuba-zip_OBJECTS_RELWITHDEBINFO )
set(kuba-zip_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(kuba-zip_COMPILE_OPTIONS_C_RELWITHDEBINFO )
set(kuba-zip_COMPILE_OPTIONS_CXX_RELWITHDEBINFO )
set(kuba-zip_LIB_DIRS_RELWITHDEBINFO "${kuba-zip_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(kuba-zip_LIBS_RELWITHDEBINFO zip)
set(kuba-zip_SYSTEM_LIBS_RELWITHDEBINFO )
set(kuba-zip_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(kuba-zip_FRAMEWORKS_RELWITHDEBINFO )
set(kuba-zip_BUILD_DIRS_RELWITHDEBINFO "${kuba-zip_PACKAGE_FOLDER_RELWITHDEBINFO}/")

# COMPOUND VARIABLES
set(kuba-zip_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${kuba-zip_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${kuba-zip_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
set(kuba-zip_LINKER_FLAGS_RELWITHDEBINFO
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${kuba-zip_SHARED_LINK_FLAGS_RELWITHDEBINFO}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${kuba-zip_SHARED_LINK_FLAGS_RELWITHDEBINFO}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${kuba-zip_EXE_LINK_FLAGS_RELWITHDEBINFO}>")


set(kuba-zip_COMPONENTS_RELWITHDEBINFO )