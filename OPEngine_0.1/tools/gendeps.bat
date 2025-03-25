@echo off
cd %~dp0
cd ..
rem Instalación para la configuración Release
conan install -if build/deps/Release -s build_type=Release -s compiler="Visual Studio" -s compiler.version=17 -s compiler.runtime=MD --build=* src/build/

rem Instalación para la configuración RelWithDebInfo
conan install -if build/deps/RelWithDebInfo -s build_type=RelWithDebInfo -s compiler="Visual Studio" -s compiler.version=17 -s compiler.runtime=MD --build=* src/build/

rem Instalación para la configuración Debug
conan install -if build/deps/Debug -s build_type=Debug -s compiler="Visual Studio" -s compiler.version=17 -s compiler.runtime=MDd --build=* src/build/