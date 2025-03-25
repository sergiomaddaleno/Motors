########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND glslang_COMPONENT_NAMES glslang::GenericCodeGen glslang::OSDependent glslang::OGLCompiler glslang::HLSL glslang::SPVRemapper glslang::glslang-default-resource-limits glslang::MachineIndependent glslang::glslang glslang::SPIRV)
list(REMOVE_DUPLICATES glslang_COMPONENT_NAMES)
list(APPEND glslang_FIND_DEPENDENCY_NAMES SPIRV-Tools)
list(REMOVE_DUPLICATES glslang_FIND_DEPENDENCY_NAMES)
set(SPIRV-Tools_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(glslang_PACKAGE_FOLDER_RELWITHDEBINFO "C:/.conan/501fd0/1")
set(glslang_BUILD_MODULES_PATHS_RELWITHDEBINFO )


set(glslang_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_RES_DIRS_RELWITHDEBINFO )
set(glslang_DEFINITIONS_RELWITHDEBINFO "-DENABLE_OPT"
			"-DENABLE_HLSL")
set(glslang_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_EXE_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_OBJECTS_RELWITHDEBINFO )
set(glslang_COMPILE_DEFINITIONS_RELWITHDEBINFO "ENABLE_OPT"
			"ENABLE_HLSL")
set(glslang_COMPILE_OPTIONS_C_RELWITHDEBINFO )
set(glslang_COMPILE_OPTIONS_CXX_RELWITHDEBINFO )
set(glslang_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_LIBS_RELWITHDEBINFO SPIRV glslang MachineIndependent glslang-default-resource-limits SPVRemapper HLSL OGLCompiler OSDependent GenericCodeGen)
set(glslang_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_BUILD_DIRS_RELWITHDEBINFO )

# COMPOUND VARIABLES
set(glslang_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
set(glslang_LINKER_FLAGS_RELWITHDEBINFO
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_SHARED_LINK_FLAGS_RELWITHDEBINFO}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_SHARED_LINK_FLAGS_RELWITHDEBINFO}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_EXE_LINK_FLAGS_RELWITHDEBINFO}>")


set(glslang_COMPONENTS_RELWITHDEBINFO glslang::GenericCodeGen glslang::OSDependent glslang::OGLCompiler glslang::HLSL glslang::SPVRemapper glslang::glslang-default-resource-limits glslang::MachineIndependent glslang::glslang glslang::SPIRV)
########### COMPONENT glslang::SPIRV VARIABLES ############################################

set(glslang_glslang_SPIRV_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_glslang_SPIRV_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_SPIRV_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_SPIRV_DEFINITIONS_RELWITHDEBINFO "-DENABLE_OPT")
set(glslang_glslang_SPIRV_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_SPIRV_COMPILE_DEFINITIONS_RELWITHDEBINFO "ENABLE_OPT")
set(glslang_glslang_SPIRV_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_SPIRV_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_SPIRV_LIBS_RELWITHDEBINFO SPIRV)
set(glslang_glslang_SPIRV_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_SPIRV_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_SPIRV_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_SPIRV_DEPENDENCIES_RELWITHDEBINFO glslang::glslang SPIRV-Tools-opt)
set(glslang_glslang_SPIRV_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_SPIRV_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_SPIRV_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_SPIRV_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_SPIRV_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_SPIRV_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_SPIRV_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_SPIRV_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_SPIRV_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT glslang::glslang VARIABLES ############################################

set(glslang_glslang_glslang_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include"
			"${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include/glslang")
set(glslang_glslang_glslang_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_glslang_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_glslang_DEFINITIONS_RELWITHDEBINFO "-DENABLE_HLSL")
set(glslang_glslang_glslang_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_glslang_COMPILE_DEFINITIONS_RELWITHDEBINFO "ENABLE_HLSL")
set(glslang_glslang_glslang_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_glslang_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_glslang_LIBS_RELWITHDEBINFO glslang)
set(glslang_glslang_glslang_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_glslang_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_glslang_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_glslang_DEPENDENCIES_RELWITHDEBINFO glslang::MachineIndependent glslang::GenericCodeGen glslang::OSDependent glslang::OGLCompiler glslang::HLSL)
set(glslang_glslang_glslang_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_glslang_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_glslang_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_glslang_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_glslang_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_glslang_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_glslang_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_glslang_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_glslang_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT glslang::MachineIndependent VARIABLES ############################################

set(glslang_glslang_MachineIndependent_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_glslang_MachineIndependent_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_MachineIndependent_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_MachineIndependent_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_MachineIndependent_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_MachineIndependent_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_MachineIndependent_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_MachineIndependent_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_MachineIndependent_LIBS_RELWITHDEBINFO MachineIndependent)
set(glslang_glslang_MachineIndependent_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_MachineIndependent_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_MachineIndependent_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_MachineIndependent_DEPENDENCIES_RELWITHDEBINFO glslang::GenericCodeGen glslang::OSDependent glslang::OGLCompiler)
set(glslang_glslang_MachineIndependent_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_MachineIndependent_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_MachineIndependent_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_MachineIndependent_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_MachineIndependent_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_MachineIndependent_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_MachineIndependent_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_MachineIndependent_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_MachineIndependent_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT glslang::glslang-default-resource-limits VARIABLES ############################################

set(glslang_glslang_glslang-default-resource-limits_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_glslang_glslang-default-resource-limits_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_glslang-default-resource-limits_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_glslang-default-resource-limits_LIBS_RELWITHDEBINFO glslang-default-resource-limits)
set(glslang_glslang_glslang-default-resource-limits_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_DEPENDENCIES_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_glslang-default-resource-limits_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_glslang-default-resource-limits_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_glslang-default-resource-limits_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_glslang-default-resource-limits_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_glslang-default-resource-limits_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT glslang::SPVRemapper VARIABLES ############################################

set(glslang_glslang_SPVRemapper_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_glslang_SPVRemapper_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_SPVRemapper_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_SPVRemapper_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_SPVRemapper_LIBS_RELWITHDEBINFO SPVRemapper)
set(glslang_glslang_SPVRemapper_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_DEPENDENCIES_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_SPVRemapper_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_SPVRemapper_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_SPVRemapper_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_SPVRemapper_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_SPVRemapper_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_SPVRemapper_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_SPVRemapper_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_SPVRemapper_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT glslang::HLSL VARIABLES ############################################

set(glslang_glslang_HLSL_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_glslang_HLSL_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_HLSL_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_HLSL_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_HLSL_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_HLSL_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_HLSL_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_HLSL_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_HLSL_LIBS_RELWITHDEBINFO HLSL)
set(glslang_glslang_HLSL_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_HLSL_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_HLSL_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_HLSL_DEPENDENCIES_RELWITHDEBINFO )
set(glslang_glslang_HLSL_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_HLSL_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_HLSL_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_HLSL_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_HLSL_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_HLSL_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_HLSL_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_HLSL_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_HLSL_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT glslang::OGLCompiler VARIABLES ############################################

set(glslang_glslang_OGLCompiler_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_glslang_OGLCompiler_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_OGLCompiler_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_OGLCompiler_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_OGLCompiler_LIBS_RELWITHDEBINFO OGLCompiler)
set(glslang_glslang_OGLCompiler_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_DEPENDENCIES_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_OGLCompiler_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_OGLCompiler_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_OGLCompiler_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_OGLCompiler_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_OGLCompiler_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_OGLCompiler_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_OGLCompiler_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_OGLCompiler_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT glslang::OSDependent VARIABLES ############################################

set(glslang_glslang_OSDependent_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_glslang_OSDependent_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_OSDependent_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_OSDependent_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_OSDependent_LIBS_RELWITHDEBINFO OSDependent)
set(glslang_glslang_OSDependent_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_DEPENDENCIES_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_OSDependent_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_OSDependent_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_OSDependent_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_OSDependent_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_OSDependent_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_OSDependent_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_OSDependent_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_OSDependent_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")
########### COMPONENT glslang::GenericCodeGen VARIABLES ############################################

set(glslang_glslang_GenericCodeGen_INCLUDE_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/include")
set(glslang_glslang_GenericCodeGen_LIB_DIRS_RELWITHDEBINFO "${glslang_PACKAGE_FOLDER_RELWITHDEBINFO}/lib")
set(glslang_glslang_GenericCodeGen_RES_DIRS_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_OBJECTS_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_COMPILE_DEFINITIONS_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_C_RELWITHDEBINFO "")
set(glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_CXX_RELWITHDEBINFO "")
set(glslang_glslang_GenericCodeGen_LIBS_RELWITHDEBINFO GenericCodeGen)
set(glslang_glslang_GenericCodeGen_SYSTEM_LIBS_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_FRAMEWORK_DIRS_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_FRAMEWORKS_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_DEPENDENCIES_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_SHARED_LINK_FLAGS_RELWITHDEBINFO )
set(glslang_glslang_GenericCodeGen_EXE_LINK_FLAGS_RELWITHDEBINFO )
# COMPOUND VARIABLES
set(glslang_glslang_GenericCodeGen_LINKER_FLAGS_RELWITHDEBINFO
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_GenericCodeGen_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_GenericCodeGen_SHARED_LINK_FLAGS_RELWITHDEBINFO}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_GenericCodeGen_EXE_LINK_FLAGS_RELWITHDEBINFO}>
)
set(glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_RELWITHDEBINFO
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_CXX_RELWITHDEBINFO}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_C_RELWITHDEBINFO}>")