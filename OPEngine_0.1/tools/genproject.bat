@echo off
cd %~dp0
cd ..
tools\premake5.exe vs2022 --file=premake5.lua