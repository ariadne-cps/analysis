find_library(ARIADNE_REASONING_LIBRARY NAMES ariadne-reasoning)
find_path(ARIADNE_REASONING_INCLUDE_DIR ariadne-reasoning.hpp PATH_SUFFIXES ariadne-reasoning)
find_package(Threads REQUIRED)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(AriadneReasoning DEFAULT_MSG
    ARIADNE_REASONING_LIBRARY ARIADNE_REASONING_INCLUDE_DIR)
if(AriadneReasoning_FOUND)
    get_filename_component(ARIADNE_REASONING_INCLUDE_PARENT_DIR "${ARIADNE_REASONING_INCLUDE_DIR}" DIRECTORY)
    if(NOT TARGET AriadneReasoning::ariadne-reasoning)
        add_library(AriadneReasoning::ariadne-reasoning UNKNOWN IMPORTED)
        set_target_properties(AriadneReasoning::ariadne-reasoning PROPERTIES
            IMPORTED_LOCATION "${ARIADNE_REASONING_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES "${ARIADNE_REASONING_INCLUDE_PARENT_DIR};${ARIADNE_REASONING_INCLUDE_DIR}"
            INTERFACE_LINK_LIBRARIES "Threads::Threads")
    endif()
endif()
