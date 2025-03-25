#ifndef COMPONENTS_H
#define COMPONENTS_H 1

#include <vector>
#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include <memory>

#include "Transform.hpp"
#include "Camera.hpp"
#include "Model.hpp"

namespace RMPH {

	enum LightType {
		Ambient = 0,
		Point = 1,
		SpotSoftEdge = 2,
		Directional = 3,
		SpotNoSoftEdge = 4
	};

	struct TranformComponent {
		Transform2D transform2D;
		Transform3D transform3D;
	};

	struct LightComponent {
		glm::vec3 ViewPos;
		glm::vec3 Ambient;
		glm::vec3 Diffuse;
		glm::vec3 Specular;
		glm::vec3 Direction;
		float Constant;
		float Linear;
		float Quadratic;
		float CutOff;
		float OuterCutOff;
		LightType type;
	};

	struct MatirialInfo {
		glm::vec3 Ambient;
		glm::vec3 Diffuse;
		glm::vec3 Specular;
		float Shininess;
	};

	struct RenderComponent {
		std::shared_ptr<Model> model_;
		MatirialInfo matirial_;
	};

	struct CameraComponent {
		std::shared_ptr <Camera> cam_;
	};

	

};

#endif