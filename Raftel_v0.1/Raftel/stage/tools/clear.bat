cls
@echo off
IF EXIST ..\build\.vs rmdir /s /q ..\build\.vs
IF EXIST ..\build\PR_Demo_Workspace rmdir /s /q ..\build\PR_Demo_Workspace
IF EXIST ..\bin\debug rmdir /s /q ..\bin\debug
IF EXIST ..\bin\release rmdir /s /q ..\bin\release
IF EXIST ..\bin rmdir /s /q ..\bin

IF EXIST ..\build\Motor.sln del /F ..\build\Motor.sln

