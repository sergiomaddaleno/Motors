########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND glslang_COMPONENT_NAMES glslang::GenericCodeGen glslang::OSDependent glslang::OGLCompiler glslang::HLSL glslang::SPVRemapper glslang::glslang-default-resource-limits glslang::MachineIndependent glslang::glslang glslang::SPIRV)
list(REMOVE_DUPLICATES glslang_COMPONENT_NAMES)
list(APPEND glslang_FIND_DEPENDENCY_NAMES SPIRV-Tools)
list(REMOVE_DUPLICATES glslang_FIND_DEPENDENCY_NAMES)
set(SPIRV-Tools_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(glslang_PACKAGE_FOLDER_DEBUG "C:/.conan/770b3b/1")
set(glslang_BUILD_MODULES_PATHS_DEBUG )


set(glslang_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_RES_DIRS_DEBUG )
set(glslang_DEFINITIONS_DEBUG "-DENABLE_OPT"
			"-DENABLE_HLSL")
set(glslang_SHARED_LINK_FLAGS_DEBUG )
set(glslang_EXE_LINK_FLAGS_DEBUG )
set(glslang_OBJECTS_DEBUG )
set(glslang_COMPILE_DEFINITIONS_DEBUG "ENABLE_OPT"
			"ENABLE_HLSL")
set(glslang_COMPILE_OPTIONS_C_DEBUG )
set(glslang_COMPILE_OPTIONS_CXX_DEBUG )
set(glslang_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_LIBS_DEBUG SPIRVd glslangd MachineIndependentd glslang-default-resource-limitsd SPVRemapperd HLSLd OGLCompilerd OSDependentd GenericCodeGend)
set(glslang_SYSTEM_LIBS_DEBUG )
set(glslang_FRAMEWORK_DIRS_DEBUG )
set(glslang_FRAMEWORKS_DEBUG )
set(glslang_BUILD_DIRS_DEBUG )

# COMPOUND VARIABLES
set(glslang_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_COMPILE_OPTIONS_C_DEBUG}>")
set(glslang_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_EXE_LINK_FLAGS_DEBUG}>")


set(glslang_COMPONENTS_DEBUG glslang::GenericCodeGen glslang::OSDependent glslang::OGLCompiler glslang::HLSL glslang::SPVRemapper glslang::glslang-default-resource-limits glslang::MachineIndependent glslang::glslang glslang::SPIRV)
########### COMPONENT glslang::SPIRV VARIABLES ############################################

set(glslang_glslang_SPIRV_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_glslang_SPIRV_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_SPIRV_RES_DIRS_DEBUG )
set(glslang_glslang_SPIRV_DEFINITIONS_DEBUG "-DENABLE_OPT")
set(glslang_glslang_SPIRV_OBJECTS_DEBUG )
set(glslang_glslang_SPIRV_COMPILE_DEFINITIONS_DEBUG "ENABLE_OPT")
set(glslang_glslang_SPIRV_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_SPIRV_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_SPIRV_LIBS_DEBUG SPIRVd)
set(glslang_glslang_SPIRV_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_SPIRV_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_SPIRV_FRAMEWORKS_DEBUG )
set(glslang_glslang_SPIRV_DEPENDENCIES_DEBUG glslang::glslang SPIRV-Tools-opt)
set(glslang_glslang_SPIRV_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_SPIRV_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_SPIRV_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_SPIRV_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_SPIRV_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_SPIRV_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_SPIRV_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_SPIRV_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_SPIRV_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT glslang::glslang VARIABLES ############################################

set(glslang_glslang_glslang_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include"
			"${glslang_PACKAGE_FOLDER_DEBUG}/include/glslang")
set(glslang_glslang_glslang_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_glslang_RES_DIRS_DEBUG )
set(glslang_glslang_glslang_DEFINITIONS_DEBUG "-DENABLE_HLSL")
set(glslang_glslang_glslang_OBJECTS_DEBUG )
set(glslang_glslang_glslang_COMPILE_DEFINITIONS_DEBUG "ENABLE_HLSL")
set(glslang_glslang_glslang_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_glslang_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_glslang_LIBS_DEBUG glslangd)
set(glslang_glslang_glslang_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_glslang_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_glslang_FRAMEWORKS_DEBUG )
set(glslang_glslang_glslang_DEPENDENCIES_DEBUG glslang::MachineIndependent glslang::GenericCodeGen glslang::OSDependent glslang::OGLCompiler glslang::HLSL)
set(glslang_glslang_glslang_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_glslang_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_glslang_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_glslang_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_glslang_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_glslang_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_glslang_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_glslang_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_glslang_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT glslang::MachineIndependent VARIABLES ############################################

set(glslang_glslang_MachineIndependent_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_glslang_MachineIndependent_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_MachineIndependent_RES_DIRS_DEBUG )
set(glslang_glslang_MachineIndependent_DEFINITIONS_DEBUG )
set(glslang_glslang_MachineIndependent_OBJECTS_DEBUG )
set(glslang_glslang_MachineIndependent_COMPILE_DEFINITIONS_DEBUG )
set(glslang_glslang_MachineIndependent_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_MachineIndependent_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_MachineIndependent_LIBS_DEBUG MachineIndependentd)
set(glslang_glslang_MachineIndependent_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_MachineIndependent_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_MachineIndependent_FRAMEWORKS_DEBUG )
set(glslang_glslang_MachineIndependent_DEPENDENCIES_DEBUG glslang::GenericCodeGen glslang::OSDependent glslang::OGLCompiler)
set(glslang_glslang_MachineIndependent_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_MachineIndependent_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_MachineIndependent_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_MachineIndependent_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_MachineIndependent_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_MachineIndependent_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_MachineIndependent_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_MachineIndependent_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_MachineIndependent_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT glslang::glslang-default-resource-limits VARIABLES ############################################

set(glslang_glslang_glslang-default-resource-limits_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_glslang_glslang-default-resource-limits_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_glslang-default-resource-limits_RES_DIRS_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_DEFINITIONS_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_OBJECTS_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_COMPILE_DEFINITIONS_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_glslang-default-resource-limits_LIBS_DEBUG glslang-default-resource-limitsd)
set(glslang_glslang_glslang-default-resource-limits_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_FRAMEWORKS_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_DEPENDENCIES_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_glslang-default-resource-limits_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_glslang-default-resource-limits_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_glslang-default-resource-limits_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_glslang-default-resource-limits_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_glslang-default-resource-limits_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_glslang-default-resource-limits_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT glslang::SPVRemapper VARIABLES ############################################

set(glslang_glslang_SPVRemapper_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_glslang_SPVRemapper_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_SPVRemapper_RES_DIRS_DEBUG )
set(glslang_glslang_SPVRemapper_DEFINITIONS_DEBUG )
set(glslang_glslang_SPVRemapper_OBJECTS_DEBUG )
set(glslang_glslang_SPVRemapper_COMPILE_DEFINITIONS_DEBUG )
set(glslang_glslang_SPVRemapper_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_SPVRemapper_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_SPVRemapper_LIBS_DEBUG SPVRemapperd)
set(glslang_glslang_SPVRemapper_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_SPVRemapper_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_SPVRemapper_FRAMEWORKS_DEBUG )
set(glslang_glslang_SPVRemapper_DEPENDENCIES_DEBUG )
set(glslang_glslang_SPVRemapper_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_SPVRemapper_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_SPVRemapper_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_SPVRemapper_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_SPVRemapper_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_SPVRemapper_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_SPVRemapper_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_SPVRemapper_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_SPVRemapper_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT glslang::HLSL VARIABLES ############################################

set(glslang_glslang_HLSL_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_glslang_HLSL_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_HLSL_RES_DIRS_DEBUG )
set(glslang_glslang_HLSL_DEFINITIONS_DEBUG )
set(glslang_glslang_HLSL_OBJECTS_DEBUG )
set(glslang_glslang_HLSL_COMPILE_DEFINITIONS_DEBUG )
set(glslang_glslang_HLSL_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_HLSL_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_HLSL_LIBS_DEBUG HLSLd)
set(glslang_glslang_HLSL_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_HLSL_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_HLSL_FRAMEWORKS_DEBUG )
set(glslang_glslang_HLSL_DEPENDENCIES_DEBUG )
set(glslang_glslang_HLSL_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_HLSL_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_HLSL_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_HLSL_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_HLSL_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_HLSL_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_HLSL_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_HLSL_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_HLSL_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT glslang::OGLCompiler VARIABLES ############################################

set(glslang_glslang_OGLCompiler_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_glslang_OGLCompiler_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_OGLCompiler_RES_DIRS_DEBUG )
set(glslang_glslang_OGLCompiler_DEFINITIONS_DEBUG )
set(glslang_glslang_OGLCompiler_OBJECTS_DEBUG )
set(glslang_glslang_OGLCompiler_COMPILE_DEFINITIONS_DEBUG )
set(glslang_glslang_OGLCompiler_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_OGLCompiler_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_OGLCompiler_LIBS_DEBUG OGLCompilerd)
set(glslang_glslang_OGLCompiler_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_OGLCompiler_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_OGLCompiler_FRAMEWORKS_DEBUG )
set(glslang_glslang_OGLCompiler_DEPENDENCIES_DEBUG )
set(glslang_glslang_OGLCompiler_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_OGLCompiler_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_OGLCompiler_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_OGLCompiler_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_OGLCompiler_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_OGLCompiler_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_OGLCompiler_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_OGLCompiler_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_OGLCompiler_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT glslang::OSDependent VARIABLES ############################################

set(glslang_glslang_OSDependent_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_glslang_OSDependent_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_OSDependent_RES_DIRS_DEBUG )
set(glslang_glslang_OSDependent_DEFINITIONS_DEBUG )
set(glslang_glslang_OSDependent_OBJECTS_DEBUG )
set(glslang_glslang_OSDependent_COMPILE_DEFINITIONS_DEBUG )
set(glslang_glslang_OSDependent_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_OSDependent_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_OSDependent_LIBS_DEBUG OSDependentd)
set(glslang_glslang_OSDependent_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_OSDependent_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_OSDependent_FRAMEWORKS_DEBUG )
set(glslang_glslang_OSDependent_DEPENDENCIES_DEBUG )
set(glslang_glslang_OSDependent_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_OSDependent_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_OSDependent_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_OSDependent_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_OSDependent_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_OSDependent_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_OSDependent_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_OSDependent_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_OSDependent_COMPILE_OPTIONS_C_DEBUG}>")
########### COMPONENT glslang::GenericCodeGen VARIABLES ############################################

set(glslang_glslang_GenericCodeGen_INCLUDE_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/include")
set(glslang_glslang_GenericCodeGen_LIB_DIRS_DEBUG "${glslang_PACKAGE_FOLDER_DEBUG}/lib")
set(glslang_glslang_GenericCodeGen_RES_DIRS_DEBUG )
set(glslang_glslang_GenericCodeGen_DEFINITIONS_DEBUG )
set(glslang_glslang_GenericCodeGen_OBJECTS_DEBUG )
set(glslang_glslang_GenericCodeGen_COMPILE_DEFINITIONS_DEBUG )
set(glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_C_DEBUG "")
set(glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_CXX_DEBUG "")
set(glslang_glslang_GenericCodeGen_LIBS_DEBUG GenericCodeGend)
set(glslang_glslang_GenericCodeGen_SYSTEM_LIBS_DEBUG )
set(glslang_glslang_GenericCodeGen_FRAMEWORK_DIRS_DEBUG )
set(glslang_glslang_GenericCodeGen_FRAMEWORKS_DEBUG )
set(glslang_glslang_GenericCodeGen_DEPENDENCIES_DEBUG )
set(glslang_glslang_GenericCodeGen_SHARED_LINK_FLAGS_DEBUG )
set(glslang_glslang_GenericCodeGen_EXE_LINK_FLAGS_DEBUG )
# COMPOUND VARIABLES
set(glslang_glslang_GenericCodeGen_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${glslang_glslang_GenericCodeGen_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${glslang_glslang_GenericCodeGen_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${glslang_glslang_GenericCodeGen_EXE_LINK_FLAGS_DEBUG}>
)
set(glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${glslang_glslang_GenericCodeGen_COMPILE_OPTIONS_C_DEBUG}>")