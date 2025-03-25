########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND spirv-tools_COMPONENT_NAMES SPIRV-Tools-static SPIRV-Tools-opt SPIRV-Tools-link SPIRV-Tools-reduce SPIRV-Tools-lint SPIRV-Tools-diff)
list(REMOVE_DUPLICATES spirv-tools_COMPONENT_NAMES)
list(APPEND spirv-tools_FIND_DEPENDENCY_NAMES SPIRV-Headers SPIRV-Headers)
list(REMOVE_DUPLICATES spirv-tools_FIND_DEPENDENCY_NAMES)
set(SPIRV-Headers_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(spirv-tools_PACKAGE_FOLDER_RELEASE "C:/.conan/ea55c6/1")
set(spirv-tools_BUILD_MODULES_PATHS_RELEASE )


set(spirv-tools_INCLUDE_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/include")
set(spirv-tools_RES_DIRS_RELEASE )
set(spirv-tools_DEFINITIONS_RELEASE )
set(spirv-tools_SHARED_LINK_FLAGS_RELEASE )
set(spirv-tools_EXE_LINK_FLAGS_RELEASE )
set(spirv-tools_OBJECTS_RELEASE )
set(spirv-tools_COMPILE_DEFINITIONS_RELEASE )
set(spirv-tools_COMPILE_OPTIONS_C_RELEASE )
set(spirv-tools_COMPILE_OPTIONS_CXX_RELEASE )
set(spirv-tools_LIB_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/lib")
set(spirv-tools_LIBS_RELEASE SPIRV-Tools-diff SPIRV-Tools-lint SPIRV-Tools-reduce SPIRV-Tools-link SPIRV-Tools-opt SPIRV-Tools)
set(spirv-tools_SYSTEM_LIBS_RELEASE )
set(spirv-tools_FRAMEWORK_DIRS_RELEASE )
set(spirv-tools_FRAMEWORKS_RELEASE )
set(spirv-tools_BUILD_DIRS_RELEASE )

# COMPOUND VARIABLES
set(spirv-tools_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_COMPILE_OPTIONS_C_RELEASE}>")
set(spirv-tools_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_EXE_LINK_FLAGS_RELEASE}>")


set(spirv-tools_COMPONENTS_RELEASE SPIRV-Tools-static SPIRV-Tools-opt SPIRV-Tools-link SPIRV-Tools-reduce SPIRV-Tools-lint SPIRV-Tools-diff)
########### COMPONENT SPIRV-Tools-diff VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-diff_INCLUDE_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/include")
set(spirv-tools_SPIRV-Tools-diff_LIB_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/lib")
set(spirv-tools_SPIRV-Tools-diff_RES_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-diff_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-diff_OBJECTS_RELEASE )
set(spirv-tools_SPIRV-Tools-diff_COMPILE_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_C_RELEASE "")
set(spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_CXX_RELEASE "")
set(spirv-tools_SPIRV-Tools-diff_LIBS_RELEASE SPIRV-Tools-diff)
set(spirv-tools_SPIRV-Tools-diff_SYSTEM_LIBS_RELEASE )
set(spirv-tools_SPIRV-Tools-diff_FRAMEWORK_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-diff_FRAMEWORKS_RELEASE )
set(spirv-tools_SPIRV-Tools-diff_DEPENDENCIES_RELEASE SPIRV-Tools-static SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-diff_SHARED_LINK_FLAGS_RELEASE )
set(spirv-tools_SPIRV-Tools-diff_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-diff_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-diff_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-diff_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-diff_EXE_LINK_FLAGS_RELEASE}>
)
set(spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT SPIRV-Tools-lint VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-lint_INCLUDE_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/include")
set(spirv-tools_SPIRV-Tools-lint_LIB_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/lib")
set(spirv-tools_SPIRV-Tools-lint_RES_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-lint_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-lint_OBJECTS_RELEASE )
set(spirv-tools_SPIRV-Tools-lint_COMPILE_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_C_RELEASE "")
set(spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_CXX_RELEASE "")
set(spirv-tools_SPIRV-Tools-lint_LIBS_RELEASE SPIRV-Tools-lint)
set(spirv-tools_SPIRV-Tools-lint_SYSTEM_LIBS_RELEASE )
set(spirv-tools_SPIRV-Tools-lint_FRAMEWORK_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-lint_FRAMEWORKS_RELEASE )
set(spirv-tools_SPIRV-Tools-lint_DEPENDENCIES_RELEASE SPIRV-Tools-static SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-lint_SHARED_LINK_FLAGS_RELEASE )
set(spirv-tools_SPIRV-Tools-lint_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-lint_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-lint_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-lint_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-lint_EXE_LINK_FLAGS_RELEASE}>
)
set(spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT SPIRV-Tools-reduce VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-reduce_INCLUDE_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/include")
set(spirv-tools_SPIRV-Tools-reduce_LIB_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/lib")
set(spirv-tools_SPIRV-Tools-reduce_RES_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-reduce_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-reduce_OBJECTS_RELEASE )
set(spirv-tools_SPIRV-Tools-reduce_COMPILE_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_C_RELEASE "")
set(spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_CXX_RELEASE "")
set(spirv-tools_SPIRV-Tools-reduce_LIBS_RELEASE SPIRV-Tools-reduce)
set(spirv-tools_SPIRV-Tools-reduce_SYSTEM_LIBS_RELEASE )
set(spirv-tools_SPIRV-Tools-reduce_FRAMEWORK_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-reduce_FRAMEWORKS_RELEASE )
set(spirv-tools_SPIRV-Tools-reduce_DEPENDENCIES_RELEASE SPIRV-Tools-static SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-reduce_SHARED_LINK_FLAGS_RELEASE )
set(spirv-tools_SPIRV-Tools-reduce_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-reduce_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-reduce_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-reduce_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-reduce_EXE_LINK_FLAGS_RELEASE}>
)
set(spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT SPIRV-Tools-link VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-link_INCLUDE_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/include")
set(spirv-tools_SPIRV-Tools-link_LIB_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/lib")
set(spirv-tools_SPIRV-Tools-link_RES_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-link_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-link_OBJECTS_RELEASE )
set(spirv-tools_SPIRV-Tools-link_COMPILE_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_C_RELEASE "")
set(spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_CXX_RELEASE "")
set(spirv-tools_SPIRV-Tools-link_LIBS_RELEASE SPIRV-Tools-link)
set(spirv-tools_SPIRV-Tools-link_SYSTEM_LIBS_RELEASE )
set(spirv-tools_SPIRV-Tools-link_FRAMEWORK_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-link_FRAMEWORKS_RELEASE )
set(spirv-tools_SPIRV-Tools-link_DEPENDENCIES_RELEASE SPIRV-Tools-static SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-link_SHARED_LINK_FLAGS_RELEASE )
set(spirv-tools_SPIRV-Tools-link_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-link_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-link_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-link_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-link_EXE_LINK_FLAGS_RELEASE}>
)
set(spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT SPIRV-Tools-opt VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-opt_INCLUDE_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/include")
set(spirv-tools_SPIRV-Tools-opt_LIB_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/lib")
set(spirv-tools_SPIRV-Tools-opt_RES_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-opt_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-opt_OBJECTS_RELEASE )
set(spirv-tools_SPIRV-Tools-opt_COMPILE_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_C_RELEASE "")
set(spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_CXX_RELEASE "")
set(spirv-tools_SPIRV-Tools-opt_LIBS_RELEASE SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-opt_SYSTEM_LIBS_RELEASE )
set(spirv-tools_SPIRV-Tools-opt_FRAMEWORK_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-opt_FRAMEWORKS_RELEASE )
set(spirv-tools_SPIRV-Tools-opt_DEPENDENCIES_RELEASE SPIRV-Tools-static SPIRV-Headers::SPIRV-Headers)
set(spirv-tools_SPIRV-Tools-opt_SHARED_LINK_FLAGS_RELEASE )
set(spirv-tools_SPIRV-Tools-opt_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-opt_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-opt_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-opt_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-opt_EXE_LINK_FLAGS_RELEASE}>
)
set(spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT SPIRV-Tools-static VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-static_INCLUDE_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/include")
set(spirv-tools_SPIRV-Tools-static_LIB_DIRS_RELEASE "${spirv-tools_PACKAGE_FOLDER_RELEASE}/lib")
set(spirv-tools_SPIRV-Tools-static_RES_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-static_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-static_OBJECTS_RELEASE )
set(spirv-tools_SPIRV-Tools-static_COMPILE_DEFINITIONS_RELEASE )
set(spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_C_RELEASE "")
set(spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_CXX_RELEASE "")
set(spirv-tools_SPIRV-Tools-static_LIBS_RELEASE SPIRV-Tools)
set(spirv-tools_SPIRV-Tools-static_SYSTEM_LIBS_RELEASE )
set(spirv-tools_SPIRV-Tools-static_FRAMEWORK_DIRS_RELEASE )
set(spirv-tools_SPIRV-Tools-static_FRAMEWORKS_RELEASE )
set(spirv-tools_SPIRV-Tools-static_DEPENDENCIES_RELEASE SPIRV-Headers::SPIRV-Headers)
set(spirv-tools_SPIRV-Tools-static_SHARED_LINK_FLAGS_RELEASE )
set(spirv-tools_SPIRV-Tools-static_EXE_LINK_FLAGS_RELEASE )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-static_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-static_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-static_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-static_EXE_LINK_FLAGS_RELEASE}>
)
set(spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_C_RELEASE}>")