#ifndef SCRPTING_H
#define SCRPTING_H

namespace RMPH
{
    class LuaScript {
    public:
        LuaScript() : state_{ luaL_newstate(), &lua_close }, s{ state_.get() } {
            luaL_openlibs(s);
        };

        void check(int error) {
            if (error != LUA_OK) {
                std::string err = lua_tostring(s, lua_gettop(s));
                lua_pop(s, lua_gettop(s));
                throw std::runtime_error("Lua error: " + err);
            }
        }

        void run(const std::string& str) {
            check(luaL_loadstring(s, str.c_str()));
            check(lua_pcall(s, 0, 0, 0));
            lua_pop(s, lua_gettop(s));
        }

        void add_global(const std::string& name, int(*function)(lua_State*)) {
            lua_pushcfunction(s, function);
            lua_setglobal(s, name.c_str());
        }

    private:
        std::unique_ptr<lua_State, decltype(&lua_close)> state_;
        lua_State* s;
    };
}
#endif