#ifndef LUASCRIPT_H
#define LUASCRIPT_H

#include <lua.hpp>
#include <iostream>
#include <memory>
#include <string>
#include <stdexcept>

class ScriptComponent {
public:
    explicit ScriptComponent(std::string& script);
    ~ScriptComponent() = default;

    // Deshabilitar copia
    ScriptComponent(const ScriptComponent&) = delete;
    ScriptComponent& operator=(const ScriptComponent&) = delete;

    // Permitir movimiento
    ScriptComponent(ScriptComponent&& other) noexcept;
    ScriptComponent& operator=(ScriptComponent&& other) noexcept;

    void loadScript(const std::string& script);
    void loadFile(const std::string& filePath);
    void run();

    template <typename T>
    T getGlobal(const std::string& name) {
        lua_getglobal(s, name.c_str());
        if constexpr (std::is_same_v<T, int>) {
            if (!lua_isnumber(s, -1)) {
                lua_pop(s, 1);
                throw std::runtime_error("Lua global variable '" + name + "' is not a number.");
            }
            T value = static_cast<T>(lua_tonumber(s, -1));
            lua_pop(s, 1);
            return value;
        }

        lua_pop(s, 1);
        throw std::runtime_error("Unsupported Lua global variable type.");
    }

private:
    void check(int error);

    std::unique_ptr<lua_State, decltype(&lua_close)> state_;
    lua_State* s;
    std::string scriptCode;
};

class ComponentManager;

class ScriptingSystem {
public:
    ScriptingSystem();
    ~ScriptingSystem();

    void run(ComponentManager& componentManager);
};


#endif
