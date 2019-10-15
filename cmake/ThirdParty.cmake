##########################################################################################
# Copyright (c) 2019 Logan Barnes - All Rights Reserved
##########################################################################################
include(FetchContent)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

### Zug ###
FetchContent_Declare(
        zug_dl
        GIT_REPOSITORY https://github.com/arximboldi/zug.git
        GIT_TAG 913fed55a158f7da70ccf4b7f359d056b77c7f7c
)

FetchContent_GetProperties(zug_dl)
if (NOT zug_dl_POPULATED)
    FetchContent_Populate(zug_dl)

    set(zug_BUILD_TESTS OFF CACHE BOOL "" FORCE)
    set(zug_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
    set(zug_BUILD_DOCS OFF CACHE BOOL "" FORCE)

    # compile with current project
    add_subdirectory(${zug_dl_SOURCE_DIR} ${zug_dl_BINARY_DIR} EXCLUDE_FROM_ALL)
    target_include_directories(zug SYSTEM INTERFACE $<BUILD_INTERFACE:${zug_dl_SOURCE_DIR}>)
endif (NOT zug_dl_POPULATED)
