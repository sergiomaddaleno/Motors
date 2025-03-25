########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(clipper_COMPONENT_NAMES "")
set(clipper_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(clipper_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/clipper/4.10.0/_/_/package/164640aad040835ac89882393a96d89200694f04")
set(clipper_BUILD_MODULES_PATHS_DEBUG )


set(clipper_INCLUDE_DIRS_DEBUG "${clipper_PACKAGE_FOLDER_DEBUG}/include")
set(clipper_RES_DIRS_DEBUG )
set(clipper_DEFINITIONS_DEBUG )
set(clipper_SHARED_LINK_FLAGS_DEBUG )
set(clipper_EXE_LINK_FLAGS_DEBUG )
set(clipper_OBJECTS_DEBUG )
set(clipper_COMPILE_DEFINITIONS_DEBUG )
set(clipper_COMPILE_OPTIONS_C_DEBUG )
set(clipper_COMPILE_OPTIONS_CXX_DEBUG )
set(clipper_LIB_DIRS_DEBUG "${clipper_PACKAGE_FOLDER_DEBUG}/lib")
set(clipper_LIBS_DEBUG polyclipping)
set(clipper_SYSTEM_LIBS_DEBUG )
set(clipper_FRAMEWORK_DIRS_DEBUG )
set(clipper_FRAMEWORKS_DEBUG )
set(clipper_BUILD_DIRS_DEBUG "${clipper_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(clipper_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${clipper_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${clipper_COMPILE_OPTIONS_C_DEBUG}>")
set(clipper_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${clipper_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${clipper_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${clipper_EXE_LINK_FLAGS_DEBUG}>")


set(clipper_COMPONENTS_DEBUG )