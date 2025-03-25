#include "ope/Window.hpp"
#include "ope/EngineSystem.hpp"


int main() {
    std::string window_name = "Main Window -- Empty Window";
    EngineSystem system;

    auto opt_window = Window::make(800, 600, window_name, system);
    if (!opt_window) {exit(0);}
    auto window = std::move(opt_window.value());

    window.makeContext(system);

    while(window.isOpen()){
        window.clear(0.0f, 0.0f, 0.0f, 1.0f);


        window.swapBuffers();
        window.pollEvents();
    }

    return 0;
}