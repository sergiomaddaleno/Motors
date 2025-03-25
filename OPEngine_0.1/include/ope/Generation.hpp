#ifndef GENERATION_HPP
#define GENERATION_HPP

#include <vector>
#include <glm/glm.hpp>
#include <random>
#include <algorithm>

class EntityManager;
class ComponentManager;
class TextureImage;
struct MeshData;

using Entity = std::uint32_t;

class Generation {
public:

	Generation(EntityManager& em, ComponentManager& cm, Entity entity, MeshData& asset, glm::vec3 scale, std::shared_ptr<TextureImage>& texture, glm::vec2 heightRange, int totalAssets);

private:

	std::vector<glm::vec3> selectVerticesByCount(const std::vector<glm::vec3>& vertices, int totalAssets);

	void placeAssetAtPoint(EntityManager& em, ComponentManager& cm, MeshData& asset, glm::vec3 scale, std::shared_ptr<TextureImage>& texture, const glm::vec3& point);

	int getRandomNumber(int min, int max);
};

#endif