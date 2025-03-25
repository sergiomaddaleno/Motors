#!lua
conan_build_type = "Release"
conan_arch = "x86_64"

conan_includedirs = {"C:/Users/Sergio/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/include",
"C:/Users/Sergio/.conan/data/glew/2.2.0/_/_/package/876ec6183b0dda30dcb41826d66ad276a23d1ade/include",
"C:/Users/Sergio/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include",
"C:/Users/Sergio/.conan/data/lua/5.4.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/.conan/5e4b43/1/include",
"C:/Users/Sergio/.conan/data/vorbis/1.3.7/_/_/package/9a5bb2174b42283df121ed80c80d5239b58be31f/include",
"C:/Users/Sergio/.conan/data/openal/1.22.2/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/openal/1.22.2/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include/AL",
"C:/Users/Sergio/.conan/data/imgui/1.89.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/stb/cci.20230920/_/_/package/9d3d9aac798392dbe5b8ddad56d332bc432631ac/include",
"C:/Users/Sergio/.conan/data/minizip/1.2.13/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/include",
"C:/Users/Sergio/.conan/data/minizip/1.2.13/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/include/minizip",
"C:/Users/Sergio/.conan/data/pugixml/1.14/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/utfcpp/4.0.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include",
"C:/Users/Sergio/.conan/data/utfcpp/4.0.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/utf8cpp",
"C:/Users/Sergio/.conan/data/kuba-zip/0.3.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/poly2tri/cci.20130502/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/rapidjson/cci.20230929/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include",
"C:/.conan/e34a46/1/include",
"C:/Users/Sergio/.conan/data/clipper/4.10.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/openddl-parser/0.5.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/ogg/1.3.5/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/zlib/1.3.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/include"}
conan_libdirs = {"C:/Users/Sergio/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/lib",
"C:/Users/Sergio/.conan/data/glew/2.2.0/_/_/package/876ec6183b0dda30dcb41826d66ad276a23d1ade/lib",
"C:/Users/Sergio/.conan/data/lua/5.4.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/.conan/5e4b43/1/lib",
"C:/Users/Sergio/.conan/data/vorbis/1.3.7/_/_/package/9a5bb2174b42283df121ed80c80d5239b58be31f/lib",
"C:/Users/Sergio/.conan/data/openal/1.22.2/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/Users/Sergio/.conan/data/imgui/1.89.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/Users/Sergio/.conan/data/minizip/1.2.13/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/lib",
"C:/Users/Sergio/.conan/data/pugixml/1.14/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/Users/Sergio/.conan/data/kuba-zip/0.3.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/Users/Sergio/.conan/data/poly2tri/cci.20130502/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/.conan/e34a46/1/lib",
"C:/Users/Sergio/.conan/data/clipper/4.10.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/Users/Sergio/.conan/data/openddl-parser/0.5.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/Users/Sergio/.conan/data/ogg/1.3.5/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/Users/Sergio/.conan/data/zlib/1.3.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib",
"C:/Users/Sergio/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/lib"}
conan_bindirs = {"C:/Users/Sergio/.conan/data/imgui/1.89.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/bin",
"C:/.conan/e34a46/1/bin",
"C:/Users/Sergio/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/bin"}
conan_libs = {"glfw3", "libglew32", "lua", "assimp-vc143-mt", "vorbisenc", "vorbisfile", "vorbis", "OpenAL32", "imgui", "minizip", "pugixml", "zip", "poly2tri", "draco", "polyclipping", "openddlparser", "ogg", "zlib", "bz2"}
conan_system_libs = {"gdi32", "winmm", "ole32", "shell32", "user32", "imm32", "glu32", "opengl32"}
conan_defines = {"OPENDDL_STATIC_LIBARY", "HAVE_BZIP2", "STB_TEXTEDIT_KEYTYPE=unsigned", "AL_LIBTYPE_STATIC", "GLEW_STATIC"}
conan_cxxflags = {}
conan_cflags = {}
conan_sharedlinkflags = {}
conan_exelinkflags = {}
conan_frameworks = {}

conan_includedirs_glfw = {"C:/Users/Sergio/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/include"}
conan_libdirs_glfw = {"C:/Users/Sergio/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61/lib"}
conan_bindirs_glfw = {}
conan_libs_glfw = {"glfw3"}
conan_system_libs_glfw = {"gdi32"}
conan_defines_glfw = {}
conan_cxxflags_glfw = {}
conan_cflags_glfw = {}
conan_sharedlinkflags_glfw = {}
conan_exelinkflags_glfw = {}
conan_frameworks_glfw = {}
conan_rootpath_glfw = "C:/Users/Sergio/.conan/data/glfw/3.3.8/_/_/package/d2bbd56c1f653d6cd1a2bcf499dd79bd0a930b61"

conan_includedirs_glew = {"C:/Users/Sergio/.conan/data/glew/2.2.0/_/_/package/876ec6183b0dda30dcb41826d66ad276a23d1ade/include"}
conan_libdirs_glew = {"C:/Users/Sergio/.conan/data/glew/2.2.0/_/_/package/876ec6183b0dda30dcb41826d66ad276a23d1ade/lib"}
conan_bindirs_glew = {}
conan_libs_glew = {"libglew32"}
conan_system_libs_glew = {}
conan_defines_glew = {"GLEW_STATIC"}
conan_cxxflags_glew = {}
conan_cflags_glew = {}
conan_sharedlinkflags_glew = {}
conan_exelinkflags_glew = {}
conan_frameworks_glew = {}
conan_rootpath_glew = "C:/Users/Sergio/.conan/data/glew/2.2.0/_/_/package/876ec6183b0dda30dcb41826d66ad276a23d1ade"

conan_includedirs_glm = {"C:/Users/Sergio/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"}
conan_libdirs_glm = {}
conan_bindirs_glm = {}
conan_libs_glm = {}
conan_system_libs_glm = {}
conan_defines_glm = {}
conan_cxxflags_glm = {}
conan_cflags_glm = {}
conan_sharedlinkflags_glm = {}
conan_exelinkflags_glm = {}
conan_frameworks_glm = {}
conan_rootpath_glm = "C:/Users/Sergio/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9"

conan_includedirs_lua = {"C:/Users/Sergio/.conan/data/lua/5.4.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_lua = {"C:/Users/Sergio/.conan/data/lua/5.4.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_lua = {}
conan_libs_lua = {"lua"}
conan_system_libs_lua = {}
conan_defines_lua = {}
conan_cxxflags_lua = {}
conan_cflags_lua = {}
conan_sharedlinkflags_lua = {}
conan_exelinkflags_lua = {}
conan_frameworks_lua = {}
conan_rootpath_lua = "C:/Users/Sergio/.conan/data/lua/5.4.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_assimp = {"C:/.conan/5e4b43/1/include"}
conan_libdirs_assimp = {"C:/.conan/5e4b43/1/lib"}
conan_bindirs_assimp = {}
conan_libs_assimp = {"assimp-vc143-mt"}
conan_system_libs_assimp = {}
conan_defines_assimp = {}
conan_cxxflags_assimp = {}
conan_cflags_assimp = {}
conan_sharedlinkflags_assimp = {}
conan_exelinkflags_assimp = {}
conan_frameworks_assimp = {}
conan_rootpath_assimp = "C:/.conan/5e4b43/1"

conan_includedirs_vorbis = {"C:/Users/Sergio/.conan/data/vorbis/1.3.7/_/_/package/9a5bb2174b42283df121ed80c80d5239b58be31f/include"}
conan_libdirs_vorbis = {"C:/Users/Sergio/.conan/data/vorbis/1.3.7/_/_/package/9a5bb2174b42283df121ed80c80d5239b58be31f/lib"}
conan_bindirs_vorbis = {}
conan_libs_vorbis = {"vorbisenc", "vorbisfile", "vorbis"}
conan_system_libs_vorbis = {}
conan_defines_vorbis = {}
conan_cxxflags_vorbis = {}
conan_cflags_vorbis = {}
conan_sharedlinkflags_vorbis = {}
conan_exelinkflags_vorbis = {}
conan_frameworks_vorbis = {}
conan_rootpath_vorbis = "C:/Users/Sergio/.conan/data/vorbis/1.3.7/_/_/package/9a5bb2174b42283df121ed80c80d5239b58be31f"

conan_includedirs_openal = {"C:/Users/Sergio/.conan/data/openal/1.22.2/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include",
"C:/Users/Sergio/.conan/data/openal/1.22.2/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include/AL"}
conan_libdirs_openal = {"C:/Users/Sergio/.conan/data/openal/1.22.2/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_openal = {}
conan_libs_openal = {"OpenAL32"}
conan_system_libs_openal = {"winmm", "ole32", "shell32", "user32"}
conan_defines_openal = {"AL_LIBTYPE_STATIC"}
conan_cxxflags_openal = {}
conan_cflags_openal = {}
conan_sharedlinkflags_openal = {}
conan_exelinkflags_openal = {}
conan_frameworks_openal = {}
conan_rootpath_openal = "C:/Users/Sergio/.conan/data/openal/1.22.2/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_imgui = {"C:/Users/Sergio/.conan/data/imgui/1.89.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_imgui = {"C:/Users/Sergio/.conan/data/imgui/1.89.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_imgui = {"C:/Users/Sergio/.conan/data/imgui/1.89.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/bin"}
conan_libs_imgui = {"imgui"}
conan_system_libs_imgui = {"imm32"}
conan_defines_imgui = {}
conan_cxxflags_imgui = {}
conan_cflags_imgui = {}
conan_sharedlinkflags_imgui = {}
conan_exelinkflags_imgui = {}
conan_frameworks_imgui = {}
conan_rootpath_imgui = "C:/Users/Sergio/.conan/data/imgui/1.89.7/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_glu = {}
conan_libdirs_glu = {}
conan_bindirs_glu = {}
conan_libs_glu = {}
conan_system_libs_glu = {"glu32"}
conan_defines_glu = {}
conan_cxxflags_glu = {}
conan_cflags_glu = {}
conan_sharedlinkflags_glu = {}
conan_exelinkflags_glu = {}
conan_frameworks_glu = {}
conan_rootpath_glu = "C:/Users/Sergio/.conan/data/glu/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9"

conan_includedirs_stb = {"C:/Users/Sergio/.conan/data/stb/cci.20230920/_/_/package/9d3d9aac798392dbe5b8ddad56d332bc432631ac/include"}
conan_libdirs_stb = {}
conan_bindirs_stb = {}
conan_libs_stb = {}
conan_system_libs_stb = {}
conan_defines_stb = {"STB_TEXTEDIT_KEYTYPE=unsigned"}
conan_cxxflags_stb = {}
conan_cflags_stb = {}
conan_sharedlinkflags_stb = {}
conan_exelinkflags_stb = {}
conan_frameworks_stb = {}
conan_rootpath_stb = "C:/Users/Sergio/.conan/data/stb/cci.20230920/_/_/package/9d3d9aac798392dbe5b8ddad56d332bc432631ac"

conan_includedirs_minizip = {"C:/Users/Sergio/.conan/data/minizip/1.2.13/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/include",
"C:/Users/Sergio/.conan/data/minizip/1.2.13/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/include/minizip"}
conan_libdirs_minizip = {"C:/Users/Sergio/.conan/data/minizip/1.2.13/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c/lib"}
conan_bindirs_minizip = {}
conan_libs_minizip = {"minizip"}
conan_system_libs_minizip = {}
conan_defines_minizip = {"HAVE_BZIP2"}
conan_cxxflags_minizip = {}
conan_cflags_minizip = {}
conan_sharedlinkflags_minizip = {}
conan_exelinkflags_minizip = {}
conan_frameworks_minizip = {}
conan_rootpath_minizip = "C:/Users/Sergio/.conan/data/minizip/1.2.13/_/_/package/4835c5fd5db705679d749d756c4af2beb7d8773c"

conan_includedirs_pugixml = {"C:/Users/Sergio/.conan/data/pugixml/1.14/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_pugixml = {"C:/Users/Sergio/.conan/data/pugixml/1.14/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_pugixml = {}
conan_libs_pugixml = {"pugixml"}
conan_system_libs_pugixml = {}
conan_defines_pugixml = {}
conan_cxxflags_pugixml = {}
conan_cflags_pugixml = {}
conan_sharedlinkflags_pugixml = {}
conan_exelinkflags_pugixml = {}
conan_frameworks_pugixml = {}
conan_rootpath_pugixml = "C:/Users/Sergio/.conan/data/pugixml/1.14/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_utfcpp = {"C:/Users/Sergio/.conan/data/utfcpp/4.0.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include",
"C:/Users/Sergio/.conan/data/utfcpp/4.0.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/utf8cpp"}
conan_libdirs_utfcpp = {}
conan_bindirs_utfcpp = {}
conan_libs_utfcpp = {}
conan_system_libs_utfcpp = {}
conan_defines_utfcpp = {}
conan_cxxflags_utfcpp = {}
conan_cflags_utfcpp = {}
conan_sharedlinkflags_utfcpp = {}
conan_exelinkflags_utfcpp = {}
conan_frameworks_utfcpp = {}
conan_rootpath_utfcpp = "C:/Users/Sergio/.conan/data/utfcpp/4.0.1/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9"

conan_includedirs_kuba_zip = {"C:/Users/Sergio/.conan/data/kuba-zip/0.3.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_kuba_zip = {"C:/Users/Sergio/.conan/data/kuba-zip/0.3.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_kuba_zip = {}
conan_libs_kuba_zip = {"zip"}
conan_system_libs_kuba_zip = {}
conan_defines_kuba_zip = {}
conan_cxxflags_kuba_zip = {}
conan_cflags_kuba_zip = {}
conan_sharedlinkflags_kuba_zip = {}
conan_exelinkflags_kuba_zip = {}
conan_frameworks_kuba_zip = {}
conan_rootpath_kuba_zip = "C:/Users/Sergio/.conan/data/kuba-zip/0.3.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_poly2tri = {"C:/Users/Sergio/.conan/data/poly2tri/cci.20130502/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_poly2tri = {"C:/Users/Sergio/.conan/data/poly2tri/cci.20130502/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_poly2tri = {}
conan_libs_poly2tri = {"poly2tri"}
conan_system_libs_poly2tri = {}
conan_defines_poly2tri = {}
conan_cxxflags_poly2tri = {}
conan_cflags_poly2tri = {}
conan_sharedlinkflags_poly2tri = {}
conan_exelinkflags_poly2tri = {}
conan_frameworks_poly2tri = {}
conan_rootpath_poly2tri = "C:/Users/Sergio/.conan/data/poly2tri/cci.20130502/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_rapidjson = {"C:/Users/Sergio/.conan/data/rapidjson/cci.20230929/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"}
conan_libdirs_rapidjson = {}
conan_bindirs_rapidjson = {}
conan_libs_rapidjson = {}
conan_system_libs_rapidjson = {}
conan_defines_rapidjson = {}
conan_cxxflags_rapidjson = {}
conan_cflags_rapidjson = {}
conan_sharedlinkflags_rapidjson = {}
conan_exelinkflags_rapidjson = {}
conan_frameworks_rapidjson = {}
conan_rootpath_rapidjson = "C:/Users/Sergio/.conan/data/rapidjson/cci.20230929/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9"

conan_includedirs_draco = {"C:/.conan/e34a46/1/include"}
conan_libdirs_draco = {"C:/.conan/e34a46/1/lib"}
conan_bindirs_draco = {"C:/.conan/e34a46/1/bin"}
conan_libs_draco = {"draco"}
conan_system_libs_draco = {}
conan_defines_draco = {}
conan_cxxflags_draco = {}
conan_cflags_draco = {}
conan_sharedlinkflags_draco = {}
conan_exelinkflags_draco = {}
conan_frameworks_draco = {}
conan_rootpath_draco = "C:/.conan/e34a46/1"

conan_includedirs_clipper = {"C:/Users/Sergio/.conan/data/clipper/4.10.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_clipper = {"C:/Users/Sergio/.conan/data/clipper/4.10.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_clipper = {}
conan_libs_clipper = {"polyclipping"}
conan_system_libs_clipper = {}
conan_defines_clipper = {}
conan_cxxflags_clipper = {}
conan_cflags_clipper = {}
conan_sharedlinkflags_clipper = {}
conan_exelinkflags_clipper = {}
conan_frameworks_clipper = {}
conan_rootpath_clipper = "C:/Users/Sergio/.conan/data/clipper/4.10.0/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_openddl_parser = {"C:/Users/Sergio/.conan/data/openddl-parser/0.5.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_openddl_parser = {"C:/Users/Sergio/.conan/data/openddl-parser/0.5.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_openddl_parser = {}
conan_libs_openddl_parser = {"openddlparser"}
conan_system_libs_openddl_parser = {}
conan_defines_openddl_parser = {"OPENDDL_STATIC_LIBARY"}
conan_cxxflags_openddl_parser = {}
conan_cflags_openddl_parser = {}
conan_sharedlinkflags_openddl_parser = {}
conan_exelinkflags_openddl_parser = {}
conan_frameworks_openddl_parser = {}
conan_rootpath_openddl_parser = "C:/Users/Sergio/.conan/data/openddl-parser/0.5.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_ogg = {"C:/Users/Sergio/.conan/data/ogg/1.3.5/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_ogg = {"C:/Users/Sergio/.conan/data/ogg/1.3.5/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_ogg = {}
conan_libs_ogg = {"ogg"}
conan_system_libs_ogg = {}
conan_defines_ogg = {}
conan_cxxflags_ogg = {}
conan_cflags_ogg = {}
conan_sharedlinkflags_ogg = {}
conan_exelinkflags_ogg = {}
conan_frameworks_ogg = {}
conan_rootpath_ogg = "C:/Users/Sergio/.conan/data/ogg/1.3.5/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_opengl = {}
conan_libdirs_opengl = {}
conan_bindirs_opengl = {}
conan_libs_opengl = {}
conan_system_libs_opengl = {"opengl32"}
conan_defines_opengl = {}
conan_cxxflags_opengl = {}
conan_cflags_opengl = {}
conan_sharedlinkflags_opengl = {}
conan_exelinkflags_opengl = {}
conan_frameworks_opengl = {}
conan_rootpath_opengl = "C:/Users/Sergio/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9"

conan_includedirs_zlib = {"C:/Users/Sergio/.conan/data/zlib/1.3.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/include"}
conan_libdirs_zlib = {"C:/Users/Sergio/.conan/data/zlib/1.3.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b/lib"}
conan_bindirs_zlib = {}
conan_libs_zlib = {"zlib"}
conan_system_libs_zlib = {}
conan_defines_zlib = {}
conan_cxxflags_zlib = {}
conan_cflags_zlib = {}
conan_sharedlinkflags_zlib = {}
conan_exelinkflags_zlib = {}
conan_frameworks_zlib = {}
conan_rootpath_zlib = "C:/Users/Sergio/.conan/data/zlib/1.3.1/_/_/package/5a61a86bb3e07ce4262c80e1510f9c05e9b6d48b"

conan_includedirs_bzip2 = {"C:/Users/Sergio/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/include"}
conan_libdirs_bzip2 = {"C:/Users/Sergio/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/lib"}
conan_bindirs_bzip2 = {"C:/Users/Sergio/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201/bin"}
conan_libs_bzip2 = {"bz2"}
conan_system_libs_bzip2 = {}
conan_defines_bzip2 = {}
conan_cxxflags_bzip2 = {}
conan_cflags_bzip2 = {}
conan_sharedlinkflags_bzip2 = {}
conan_exelinkflags_bzip2 = {}
conan_frameworks_bzip2 = {}
conan_rootpath_bzip2 = "C:/Users/Sergio/.conan/data/bzip2/1.0.8/_/_/package/53b5fd22ba061620078deefdae9a437c5f693201"

function conan_basic_setup()
    configurations{conan_build_type}
    architecture(conan_arch)
    includedirs{conan_includedirs}
    libdirs{conan_libdirs}
    links{conan_libs}
    links{conan_system_libs}
    links{conan_frameworks}
    defines{conan_defines}
    bindirs{conan_bindirs}
end
