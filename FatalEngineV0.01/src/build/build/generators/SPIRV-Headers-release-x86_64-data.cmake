########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(spirv-headers_COMPONENT_NAMES "")
set(spirv-headers_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(spirv-headers_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/spirv-headers/1.3.261.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(spirv-headers_BUILD_MODULES_PATHS_RELEASE )


set(spirv-headers_INCLUDE_DIRS_RELEASE "${spirv-headers_PACKAGE_FOLDER_RELEASE}/include")
set(spirv-headers_RES_DIRS_RELEASE )
set(spirv-headers_DEFINITIONS_RELEASE )
set(spirv-headers_SHARED_LINK_FLAGS_RELEASE )
set(spirv-headers_EXE_LINK_FLAGS_RELEASE )
set(spirv-headers_OBJECTS_RELEASE )
set(spirv-headers_COMPILE_DEFINITIONS_RELEASE )
set(spirv-headers_COMPILE_OPTIONS_C_RELEASE )
set(spirv-headers_COMPILE_OPTIONS_CXX_RELEASE )
set(spirv-headers_LIB_DIRS_RELEASE )
set(spirv-headers_LIBS_RELEASE )
set(spirv-headers_SYSTEM_LIBS_RELEASE )
set(spirv-headers_FRAMEWORK_DIRS_RELEASE )
set(spirv-headers_FRAMEWORKS_RELEASE )
set(spirv-headers_BUILD_DIRS_RELEASE "${spirv-headers_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(spirv-headers_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-headers_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-headers_COMPILE_OPTIONS_C_RELEASE}>")
set(spirv-headers_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-headers_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-headers_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-headers_EXE_LINK_FLAGS_RELEASE}>")


set(spirv-headers_COMPONENTS_RELEASE )