# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(spirv-tools_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(spirv-tools_FRAMEWORKS_FOUND_DEBUG "${spirv-tools_FRAMEWORKS_DEBUG}" "${spirv-tools_FRAMEWORK_DIRS_DEBUG}")

set(spirv-tools_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET spirv-tools_DEPS_TARGET)
    add_library(spirv-tools_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET spirv-tools_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${spirv-tools_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${spirv-tools_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:SPIRV-Headers::SPIRV-Headers;SPIRV-Headers::SPIRV-Headers;SPIRV-Tools-static;SPIRV-Tools-static;SPIRV-Tools-opt;SPIRV-Tools-static;SPIRV-Tools-opt;SPIRV-Tools-static;SPIRV-Tools-opt;SPIRV-Tools-static;SPIRV-Tools-opt>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### spirv-tools_DEPS_TARGET to all of them
conan_package_library_targets("${spirv-tools_LIBS_DEBUG}"    # libraries
                              "${spirv-tools_LIB_DIRS_DEBUG}" # package_libdir
                              spirv-tools_DEPS_TARGET
                              spirv-tools_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "spirv-tools")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${spirv-tools_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT SPIRV-Tools-diff #############

        set(spirv-tools_SPIRV-Tools-diff_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(spirv-tools_SPIRV-Tools-diff_FRAMEWORKS_FOUND_DEBUG "${spirv-tools_SPIRV-Tools-diff_FRAMEWORKS_DEBUG}" "${spirv-tools_SPIRV-Tools-diff_FRAMEWORK_DIRS_DEBUG}")

        set(spirv-tools_SPIRV-Tools-diff_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET spirv-tools_SPIRV-Tools-diff_DEPS_TARGET)
            add_library(spirv-tools_SPIRV-Tools-diff_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET spirv-tools_SPIRV-Tools-diff_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'spirv-tools_SPIRV-Tools-diff_DEPS_TARGET' to all of them
        conan_package_library_targets("${spirv-tools_SPIRV-Tools-diff_LIBS_DEBUG}"
                                      "${spirv-tools_SPIRV-Tools-diff_LIB_DIRS_DEBUG}"
                                      spirv-tools_SPIRV-Tools-diff_DEPS_TARGET
                                      spirv-tools_SPIRV-Tools-diff_LIBRARIES_TARGETS
                                      "_DEBUG"
                                      "spirv-tools_SPIRV-Tools-diff")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SPIRV-Tools-diff
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_LIBRARIES_TARGETS}>
                     APPEND)

        if("${spirv-tools_SPIRV-Tools-diff_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SPIRV-Tools-diff
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         spirv-tools_SPIRV-Tools-diff_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET SPIRV-Tools-diff PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-diff PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-diff PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-diff PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-diff_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## COMPONENT SPIRV-Tools-lint #############

        set(spirv-tools_SPIRV-Tools-lint_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(spirv-tools_SPIRV-Tools-lint_FRAMEWORKS_FOUND_DEBUG "${spirv-tools_SPIRV-Tools-lint_FRAMEWORKS_DEBUG}" "${spirv-tools_SPIRV-Tools-lint_FRAMEWORK_DIRS_DEBUG}")

        set(spirv-tools_SPIRV-Tools-lint_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET spirv-tools_SPIRV-Tools-lint_DEPS_TARGET)
            add_library(spirv-tools_SPIRV-Tools-lint_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET spirv-tools_SPIRV-Tools-lint_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'spirv-tools_SPIRV-Tools-lint_DEPS_TARGET' to all of them
        conan_package_library_targets("${spirv-tools_SPIRV-Tools-lint_LIBS_DEBUG}"
                                      "${spirv-tools_SPIRV-Tools-lint_LIB_DIRS_DEBUG}"
                                      spirv-tools_SPIRV-Tools-lint_DEPS_TARGET
                                      spirv-tools_SPIRV-Tools-lint_LIBRARIES_TARGETS
                                      "_DEBUG"
                                      "spirv-tools_SPIRV-Tools-lint")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SPIRV-Tools-lint
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_LIBRARIES_TARGETS}>
                     APPEND)

        if("${spirv-tools_SPIRV-Tools-lint_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SPIRV-Tools-lint
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         spirv-tools_SPIRV-Tools-lint_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET SPIRV-Tools-lint PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-lint PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-lint PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-lint PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-lint_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## COMPONENT SPIRV-Tools-reduce #############

        set(spirv-tools_SPIRV-Tools-reduce_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(spirv-tools_SPIRV-Tools-reduce_FRAMEWORKS_FOUND_DEBUG "${spirv-tools_SPIRV-Tools-reduce_FRAMEWORKS_DEBUG}" "${spirv-tools_SPIRV-Tools-reduce_FRAMEWORK_DIRS_DEBUG}")

        set(spirv-tools_SPIRV-Tools-reduce_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET spirv-tools_SPIRV-Tools-reduce_DEPS_TARGET)
            add_library(spirv-tools_SPIRV-Tools-reduce_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET spirv-tools_SPIRV-Tools-reduce_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'spirv-tools_SPIRV-Tools-reduce_DEPS_TARGET' to all of them
        conan_package_library_targets("${spirv-tools_SPIRV-Tools-reduce_LIBS_DEBUG}"
                                      "${spirv-tools_SPIRV-Tools-reduce_LIB_DIRS_DEBUG}"
                                      spirv-tools_SPIRV-Tools-reduce_DEPS_TARGET
                                      spirv-tools_SPIRV-Tools-reduce_LIBRARIES_TARGETS
                                      "_DEBUG"
                                      "spirv-tools_SPIRV-Tools-reduce")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SPIRV-Tools-reduce
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_LIBRARIES_TARGETS}>
                     APPEND)

        if("${spirv-tools_SPIRV-Tools-reduce_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SPIRV-Tools-reduce
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         spirv-tools_SPIRV-Tools-reduce_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET SPIRV-Tools-reduce PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-reduce PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-reduce PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-reduce PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-reduce_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## COMPONENT SPIRV-Tools-link #############

        set(spirv-tools_SPIRV-Tools-link_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(spirv-tools_SPIRV-Tools-link_FRAMEWORKS_FOUND_DEBUG "${spirv-tools_SPIRV-Tools-link_FRAMEWORKS_DEBUG}" "${spirv-tools_SPIRV-Tools-link_FRAMEWORK_DIRS_DEBUG}")

        set(spirv-tools_SPIRV-Tools-link_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET spirv-tools_SPIRV-Tools-link_DEPS_TARGET)
            add_library(spirv-tools_SPIRV-Tools-link_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET spirv-tools_SPIRV-Tools-link_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'spirv-tools_SPIRV-Tools-link_DEPS_TARGET' to all of them
        conan_package_library_targets("${spirv-tools_SPIRV-Tools-link_LIBS_DEBUG}"
                                      "${spirv-tools_SPIRV-Tools-link_LIB_DIRS_DEBUG}"
                                      spirv-tools_SPIRV-Tools-link_DEPS_TARGET
                                      spirv-tools_SPIRV-Tools-link_LIBRARIES_TARGETS
                                      "_DEBUG"
                                      "spirv-tools_SPIRV-Tools-link")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SPIRV-Tools-link
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_LIBRARIES_TARGETS}>
                     APPEND)

        if("${spirv-tools_SPIRV-Tools-link_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SPIRV-Tools-link
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         spirv-tools_SPIRV-Tools-link_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET SPIRV-Tools-link PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-link PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-link PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-link PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-link_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## COMPONENT SPIRV-Tools-opt #############

        set(spirv-tools_SPIRV-Tools-opt_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(spirv-tools_SPIRV-Tools-opt_FRAMEWORKS_FOUND_DEBUG "${spirv-tools_SPIRV-Tools-opt_FRAMEWORKS_DEBUG}" "${spirv-tools_SPIRV-Tools-opt_FRAMEWORK_DIRS_DEBUG}")

        set(spirv-tools_SPIRV-Tools-opt_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET spirv-tools_SPIRV-Tools-opt_DEPS_TARGET)
            add_library(spirv-tools_SPIRV-Tools-opt_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET spirv-tools_SPIRV-Tools-opt_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'spirv-tools_SPIRV-Tools-opt_DEPS_TARGET' to all of them
        conan_package_library_targets("${spirv-tools_SPIRV-Tools-opt_LIBS_DEBUG}"
                                      "${spirv-tools_SPIRV-Tools-opt_LIB_DIRS_DEBUG}"
                                      spirv-tools_SPIRV-Tools-opt_DEPS_TARGET
                                      spirv-tools_SPIRV-Tools-opt_LIBRARIES_TARGETS
                                      "_DEBUG"
                                      "spirv-tools_SPIRV-Tools-opt")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SPIRV-Tools-opt
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_LIBRARIES_TARGETS}>
                     APPEND)

        if("${spirv-tools_SPIRV-Tools-opt_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SPIRV-Tools-opt
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         spirv-tools_SPIRV-Tools-opt_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET SPIRV-Tools-opt PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-opt PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-opt PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-opt PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-opt_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## COMPONENT SPIRV-Tools-static #############

        set(spirv-tools_SPIRV-Tools-static_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(spirv-tools_SPIRV-Tools-static_FRAMEWORKS_FOUND_DEBUG "${spirv-tools_SPIRV-Tools-static_FRAMEWORKS_DEBUG}" "${spirv-tools_SPIRV-Tools-static_FRAMEWORK_DIRS_DEBUG}")

        set(spirv-tools_SPIRV-Tools-static_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET spirv-tools_SPIRV-Tools-static_DEPS_TARGET)
            add_library(spirv-tools_SPIRV-Tools-static_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET spirv-tools_SPIRV-Tools-static_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'spirv-tools_SPIRV-Tools-static_DEPS_TARGET' to all of them
        conan_package_library_targets("${spirv-tools_SPIRV-Tools-static_LIBS_DEBUG}"
                                      "${spirv-tools_SPIRV-Tools-static_LIB_DIRS_DEBUG}"
                                      spirv-tools_SPIRV-Tools-static_DEPS_TARGET
                                      spirv-tools_SPIRV-Tools-static_LIBRARIES_TARGETS
                                      "_DEBUG"
                                      "spirv-tools_SPIRV-Tools-static")

        ########## TARGET PROPERTIES #####################################
        set_property(TARGET SPIRV-Tools-static
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_LIBRARIES_TARGETS}>
                     APPEND)

        if("${spirv-tools_SPIRV-Tools-static_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET SPIRV-Tools-static
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         spirv-tools_SPIRV-Tools-static_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET SPIRV-Tools-static PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-static PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-static PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET SPIRV-Tools-static PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${spirv-tools_SPIRV-Tools-static_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET spirv-tools::spirv-tools PROPERTY INTERFACE_LINK_LIBRARIES SPIRV-Tools-diff APPEND)
    set_property(TARGET spirv-tools::spirv-tools PROPERTY INTERFACE_LINK_LIBRARIES SPIRV-Tools-lint APPEND)
    set_property(TARGET spirv-tools::spirv-tools PROPERTY INTERFACE_LINK_LIBRARIES SPIRV-Tools-reduce APPEND)
    set_property(TARGET spirv-tools::spirv-tools PROPERTY INTERFACE_LINK_LIBRARIES SPIRV-Tools-link APPEND)
    set_property(TARGET spirv-tools::spirv-tools PROPERTY INTERFACE_LINK_LIBRARIES SPIRV-Tools-opt APPEND)
    set_property(TARGET spirv-tools::spirv-tools PROPERTY INTERFACE_LINK_LIBRARIES SPIRV-Tools-static APPEND)

########## For the modules (FindXXX)
set(spirv-tools_LIBRARIES_DEBUG spirv-tools::spirv-tools)
