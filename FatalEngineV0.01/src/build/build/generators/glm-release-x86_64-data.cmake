########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(glm_COMPONENT_NAMES "")
set(glm_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(glm_PACKAGE_FOLDER_RELEASE "C:/Users/Usuario/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(glm_BUILD_MODULES_PATHS_RELEASE )


set(glm_INCLUDE_DIRS_RELEASE "${glm_PACKAGE_FOLDER_RELEASE}/include")
set(glm_RES_DIRS_RELEASE )
set(glm_DEFINITIONS_RELEASE )
set(glm_SHARED_LINK_FLAGS_RELEASE )
set(glm_EXE_LINK_FLAGS_RELEASE )
set(glm_OBJECTS_RELEASE )
set(glm_COMPILE_DEFINITIONS_RELEASE )
set(glm_COMPILE_OPTIONS_C_RELEASE )
set(glm_COMPILE_OPTIONS_CXX_RELEASE )
set(glm_LIB_DIRS_RELEASE )
set(glm_LIBS_RELEASE )
set(glm_SYSTEM_LIBS_RELEASE )
set(glm_FRAMEWORK_DIRS_RELEASE )
set(glm_FRAMEWORKS_RELEASE )
set(glm_BUILD_DIRS_RELEASE "${glm_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(glm_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${glm_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${glm_COMPILE_OPTIONS_C_RELEASE}>")
set(glm_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glm_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glm_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glm_EXE_LINK_FLAGS_RELEASE}>")


set(glm_COMPONENTS_RELEASE )