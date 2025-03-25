########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(irrxml_COMPONENT_NAMES "")
set(irrxml_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(irrxml_PACKAGE_FOLDER_DEBUG "C:/Users/Usuario/.conan/data/irrxml/1.2/_/_/package/164640aad040835ac89882393a96d89200694f04")
set(irrxml_BUILD_MODULES_PATHS_DEBUG )


set(irrxml_INCLUDE_DIRS_DEBUG "${irrxml_PACKAGE_FOLDER_DEBUG}/include")
set(irrxml_RES_DIRS_DEBUG )
set(irrxml_DEFINITIONS_DEBUG )
set(irrxml_SHARED_LINK_FLAGS_DEBUG )
set(irrxml_EXE_LINK_FLAGS_DEBUG )
set(irrxml_OBJECTS_DEBUG )
set(irrxml_COMPILE_DEFINITIONS_DEBUG )
set(irrxml_COMPILE_OPTIONS_C_DEBUG )
set(irrxml_COMPILE_OPTIONS_CXX_DEBUG )
set(irrxml_LIB_DIRS_DEBUG "${irrxml_PACKAGE_FOLDER_DEBUG}/lib")
set(irrxml_LIBS_DEBUG IrrXML)
set(irrxml_SYSTEM_LIBS_DEBUG )
set(irrxml_FRAMEWORK_DIRS_DEBUG )
set(irrxml_FRAMEWORKS_DEBUG )
set(irrxml_BUILD_DIRS_DEBUG "${irrxml_PACKAGE_FOLDER_DEBUG}/")

# COMPOUND VARIABLES
set(irrxml_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${irrxml_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${irrxml_COMPILE_OPTIONS_C_DEBUG}>")
set(irrxml_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${irrxml_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${irrxml_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${irrxml_EXE_LINK_FLAGS_DEBUG}>")


set(irrxml_COMPONENTS_DEBUG )