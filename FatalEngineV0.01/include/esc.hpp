#ifndef ECS_H
#define ECS_H

#include <vector>
#include <optional>
#include <unordered_map>
#include <memory>
#include <typeinfo>
#include <iostream> // Si quieres debuggear fácilmente

namespace RMPH {

    // Interfaz base para las listas de componentes
    struct ComponentListBase {
        virtual ~ComponentListBase() = 0;
        virtual void Resize(int size) = 0;
    };

    // Implementación derivada para un tipo específico de componente
    template<typename T>
    struct ComponentListDerived : ComponentListBase {
        std::vector<std::optional<T>> component_list_;

        ~ComponentListDerived() override = default;

        void Resize(int size) override {
            component_list_.resize(size);
        }
    };

    // Manager de la ECS
    class ECSManager {
    public:
        ECSManager();

        size_t create_entity();

        template<typename T>
        void add_component_type();

        template<typename T>
        std::vector<std::optional<T>>& get_component_list();

        template<typename T>
        std::optional<T>& get_component(size_t entity);

    private:
        using map_type = std::unordered_map<size_t, std::unique_ptr<ComponentListBase>>;
        map_type component_list_map_;

        int entityAmaount = 0;
    };

    // Definición inline del destructor puro virtual
    inline ComponentListBase::~ComponentListBase() {}

    // Implementación de templates (necesario en header)
    template<typename T>
    void ECSManager::add_component_type() {
        size_t key = typeid(T).hash_code();

        auto value = std::make_unique<ComponentListDerived<T>>();
        value->component_list_.resize(entityAmaount);
        component_list_map_.emplace(key, std::move(value));
    }

    template<typename T>
    std::vector<std::optional<T>>& ECSManager::get_component_list() {
        size_t hash = typeid(T).hash_code();
        auto it = component_list_map_.find(hash);
        if (it == component_list_map_.end()) {
            throw std::runtime_error("Component type not found");
        }
        auto* cld = static_cast<ComponentListDerived<T>*>(it->second.get());
        return cld->component_list_;
    }

    template<typename T>
    std::optional<T>& ECSManager::get_component(size_t entity) {
        auto& list = get_component_list<T>();
        if (entity >= list.size()) {
            throw std::out_of_range("Entity index out of range");
        }
        return list[entity];
    }

} // namespace RMPH

#endif // ECS_H
