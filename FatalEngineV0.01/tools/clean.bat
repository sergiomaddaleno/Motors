@echo off

REM Verifies if "build" directory exists
if exist "../build" (
    del "../build/*"
    echo Build directory eliminated.
) else (
    echo Build directory doesn't exist.
)

REM Verifies if ".vs" directory exists
if exist "../.vs" (
    rmdir /s /q "../.vs"
    echo .vs directory eliminated.
) else (
    echo .vs directory doesn't exist.
)

REM Verifies if ".idea" directory exists
if exist "../.idea" (
    rmdir /s /q "../.idea"
    echo .idea directory eliminated.
) else (
    echo .idea directory doesn't exist.
)