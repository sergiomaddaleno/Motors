########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND spirv-tools_COMPONENT_NAMES SPIRV-Tools-static SPIRV-Tools-opt SPIRV-Tools-link SPIRV-Tools-reduce SPIRV-Tools-lint SPIRV-Tools-diff)
list(REMOVE_DUPLICATES spirv-tools_COMPONENT_NAMES)
list(APPEND spirv-tools_FIND_DEPENDENCY_NAMES SPIRV-Headers SPIRV-Headers)
list(REMOVE_DUPLICATES spirv-tools_FIND_DEPENDENCY_NAMES)
set(SPIRV-Headers_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO "C:/.conan/e9362d/1")
set(spirv-tools_BUILD_MODULES_PATHS_RELWITHDEBINFO )


set(spirv-tools_INCLUDE_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(spirv-tools_RES_DIRS_RELWITHDEBINFO )
set(spirv-tools_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-tools_EXE_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-tools_OBJECTS_RELWITHDEBINFO )
set(spirv-tools_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_COMPILE_OPTIONS_C_RELWITHDEBINFO )
set(spirv-tools_COMPILE_OPTIONS_CXX_RELWITHDEBINFO )
set(spirv-tools_LIB_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(spirv-tools_LIBS_RELWITHDEBINFO SPIRV-Tools-diff SPIRV-Tools-lint SPIRV-Tools-reduce SPIRV-Tools-link SPIRV-Tools-opt SPIRV-Tools)
set(spirv-tools_SYSTEM_LIBS_RELWITHDEBINFO )
set(spirv-tools_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(spirv-tools_FRAMEWORKS_RELWITHDEBINFO )
set(spirv-tools_BUILD_DIRS_RELWITHDEBINFO )

# COMPOUND VARIABLES
set(spirv-tools_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
set(spirv-tools_LINKER_FLAGS_RELWITHDEBINFO
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SHARED_LINK_FLAGS_RELWITHDEBINFO}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SHARED_LINK_FLAGS_RELWITHDEBINFO}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_EXE_LINK_FLAGS_RELWITHDEBINFO}>")


set(spirv-tools_COMPONENTS_RELWITHDEBINFO SPIRV-Tools-static SPIRV-Tools-opt SPIRV-Tools-link SPIRV-Tools-reduce SPIRV-Tools-lint SPIRV-Tools-diff)
########### COMPONENT SPIRV-Tools-diff VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-diff_INCLUDE_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(spirv-tools_SPIRV-Tools-diff_LIB_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(spirv-tools_SPIRV-Tools-diff_RES_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-diff_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-diff_OBJECTS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-diff_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-diff_LIBS_RELWITHDEBINFO SPIRV-Tools-diff)
set(spirv-tools_SPIRV-Tools-diff_SYSTEM_LIBS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-diff_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-diff_FRAMEWORKS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-diff_DEPENDENCIES_RELWITHDEBINFO SPIRV-Tools-static SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-diff_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-diff_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-diff_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-diff_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-diff_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-diff_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT SPIRV-Tools-lint VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-lint_INCLUDE_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(spirv-tools_SPIRV-Tools-lint_LIB_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(spirv-tools_SPIRV-Tools-lint_RES_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-lint_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-lint_OBJECTS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-lint_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-lint_LIBS_RELWITHDEBINFO SPIRV-Tools-lint)
set(spirv-tools_SPIRV-Tools-lint_SYSTEM_LIBS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-lint_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-lint_FRAMEWORKS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-lint_DEPENDENCIES_RELWITHDEBINFO SPIRV-Tools-static SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-lint_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-lint_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-lint_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-lint_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-lint_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-lint_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT SPIRV-Tools-reduce VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-reduce_INCLUDE_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(spirv-tools_SPIRV-Tools-reduce_LIB_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(spirv-tools_SPIRV-Tools-reduce_RES_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-reduce_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-reduce_OBJECTS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-reduce_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-reduce_LIBS_RELWITHDEBINFO SPIRV-Tools-reduce)
set(spirv-tools_SPIRV-Tools-reduce_SYSTEM_LIBS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-reduce_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-reduce_FRAMEWORKS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-reduce_DEPENDENCIES_RELWITHDEBINFO SPIRV-Tools-static SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-reduce_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-reduce_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-reduce_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-reduce_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-reduce_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-reduce_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT SPIRV-Tools-link VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-link_INCLUDE_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(spirv-tools_SPIRV-Tools-link_LIB_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(spirv-tools_SPIRV-Tools-link_RES_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-link_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-link_OBJECTS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-link_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-link_LIBS_RELWITHDEBINFO SPIRV-Tools-link)
set(spirv-tools_SPIRV-Tools-link_SYSTEM_LIBS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-link_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-link_FRAMEWORKS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-link_DEPENDENCIES_RELWITHDEBINFO SPIRV-Tools-static SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-link_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-link_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-link_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-link_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-link_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-link_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT SPIRV-Tools-opt VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-opt_INCLUDE_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(spirv-tools_SPIRV-Tools-opt_LIB_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(spirv-tools_SPIRV-Tools-opt_RES_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-opt_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-opt_OBJECTS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-opt_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-opt_LIBS_RELWITHDEBINFO SPIRV-Tools-opt)
set(spirv-tools_SPIRV-Tools-opt_SYSTEM_LIBS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-opt_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-opt_FRAMEWORKS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-opt_DEPENDENCIES_RELWITHDEBINFO SPIRV-Tools-static SPIRV-Headers::SPIRV-Headers)
set(spirv-tools_SPIRV-Tools-opt_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-opt_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-opt_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-opt_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-opt_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-opt_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT SPIRV-Tools-static VARIABLES ############################################

set(spirv-tools_SPIRV-Tools-static_INCLUDE_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(spirv-tools_SPIRV-Tools-static_LIB_DIRS_RELWITHDEBINFO "${spirv-tools_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(spirv-tools_SPIRV-Tools-static_RES_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-static_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-static_OBJECTS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-static_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(spirv-tools_SPIRV-Tools-static_LIBS_RELWITHDEBINFO SPIRV-Tools)
set(spirv-tools_SPIRV-Tools-static_SYSTEM_LIBS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-static_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-static_FRAMEWORKS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-static_DEPENDENCIES_RELWITHDEBINFO SPIRV-Headers::SPIRV-Headers)
set(spirv-tools_SPIRV-Tools-static_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(spirv-tools_SPIRV-Tools-static_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(spirv-tools_SPIRV-Tools-static_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${spirv-tools_SPIRV-Tools-static_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${spirv-tools_SPIRV-Tools-static_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${spirv-tools_SPIRV-Tools-static_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")