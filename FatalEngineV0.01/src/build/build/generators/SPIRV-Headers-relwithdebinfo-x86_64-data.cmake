########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(spirv-headers_COMPONENT_NAMES "")
set(spirv-headers_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(spirv-headers_PACKAGE_FOLDER_RELWITHDEBINFO "C:/Users/Usuario/.conan/data/spirv-headers/1.3.261.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(spirv-headers_BUILD_MODULES_PATHS_RELWITHDEBINFO )


set(spirv-headers_INCLUDE_DIRS_RELWITHDEBINFO "${spirv-headers_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(spirv-headers_RES_DIRS_RELWITHDEBINFO )
set(spirv-headers_DEFINITIONS_RELWITHDEBINFO )
set(spirv-headers_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-headers_EXE_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-headers_OBJECTS_RELWITHDEBINFO )
set(spirv-headers_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(spirv-headers_COMPILE_OPTIONS_C_RELWITHDEBINFO )
set(spirv-headers_COMPILE_OPTIONS_CXX_RELWITHDEBINFO )
set(spirv-headers_LIB_DIRS_RELWITHDEBINFO )
set(spirv-headers_LIBS_RELWITHDEBINFO )
set(spirv-headers_SYSTEM_LIBS_RELWITHDEBINFO )
set(spirv-headers_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(spirv-headers_FRAMEWORKS_RELWITHDEBINFO )
set(spirv-headers_BUILD_DIRS_RELWITHDEBINFO "${spirv-headers_PACKAGE_FOLDER_RELWITHDEBINFO}/")

# COMPOUND VARIABLES
set(spirv-headers_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-headers_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-headers_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
set(spirv-headers_LINKER_FLAGS_RELWITHDEBINFO
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-headers_SHARED_LINK_FLAGS_RELWITHDEBINFO}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-headers_SHARED_LINK_FLAGS_RELWITHDEBINFO}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-headers_EXE_LINK_FLAGS_RELWITHDEBINFO}>")


set(spirv-headers_COMPONENTS_RELWITHDEBINFO )