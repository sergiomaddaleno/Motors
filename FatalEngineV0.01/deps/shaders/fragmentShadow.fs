#version 330 core
out vec4 FragColor;

in vec2 TexCoords;
in vec3 Normal;
in vec3 FragPos;    
in vec4 FragPosLightSpace;;

struct Light{
    int type;
    vec3 lightPos;  
    vec3 viewPos;
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    vec3 direction;
    float constant;
    float linear;
    float quadratic;
    float cutOff;
    float outerCutOff;
};

struct Matirial{
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    float shininess;
};

uniform sampler2D texture_diffuse1;
uniform sampler2D shadowMap;

uniform Light light_use;
uniform Matirial matirial_use;

float ShadowCalculation(vec4 fragPosLightSpace, vec3 lightDir)
{

    // perform perspective divide
    vec3 projCoords = fragPosLightSpace.xyz / fragPosLightSpace.w;
    // transform to [0,1] range
    projCoords = projCoords * 0.5 + 0.5;
    // get closest depth value from light's perspective (using [0,1] range fragPosLight as coords)
    float closestDepth = texture(shadowMap, projCoords.xy).r; 
    // get depth of current fragment from light's perspective
    float currentDepth = projCoords.z;
    // calculate bias (based on depth map resolution and slope)
    vec3 normal = normalize(Normal);
    float bias = max(0.05 * (1.0 - dot(normal, lightDir)), 0.005);
    // check whether current frag pos is in shadow
    // float shadow = currentDepth - bias > closestDepth  ? 1.0 : 0.0;
    // PCF
    float shadow = 0.0;
    vec2 texelSize = 1.0 / textureSize(shadowMap, 0);
    for(int x = -1; x <= 1; ++x)
    {
        for(int y = -1; y <= 1; ++y)
        {
            float pcfDepth = texture(shadowMap, projCoords.xy + vec2(x, y) * texelSize).r; 
            shadow += currentDepth - bias > pcfDepth  ? 1.0 : 0.0;        
        }    
    }
    shadow /= 9.0;
    
    // keep the shadow at 0.0 when outside the far_plane region of the light's frustum.
    if(projCoords.z > 1.0)
        shadow = 0.0;
        
    return shadow;
}

void main()
{     
    vec3 color = texture(texture_diffuse1, TexCoords).rgb;
    vec3 normal = normalize(Normal);

    if(light_use.type==0){
        // ambient
        vec3 ambient = light_use.ambient * matirial_use.ambient;

        FragColor += vec4(ambient*color, 1.0);
    }else if(light_use.type==1){
        
        // diffuse 
        vec3 norm = normalize(Normal);
        vec3 lightDir = normalize(light_use.lightPos - FragPos);
        float diff = max(dot(norm, lightDir), 0.0);
        vec3 diffuse = light_use.diffuse * (diff * matirial_use.diffuse);
        
        // specular
        vec3 viewDir = normalize(light_use.viewPos - FragPos);
        vec3 reflectDir = reflect(-lightDir, norm);  
        float spec = pow(max(dot(viewDir, reflectDir), 0.0), matirial_use.shininess);
        vec3 specular = light_use.specular * (spec * matirial_use.specular);  
            
        // attenuation
        float distance    = length(light_use.lightPos - FragPos);
        float attenuation = 1.0 / (light_use.constant + light_use.linear * distance + light_use.quadratic * (distance * distance));    
  
        diffuse   *= attenuation;
        specular *= attenuation;  
         
        vec3 lighting = (diffuse + specular);
        lighting *= color;
        FragColor += vec4(lighting, 1.0);
    }else if(light_use.type==2){
        
        // diffuse 
        vec3 norm = normalize(Normal);
        vec3 lightDir = normalize(light_use.lightPos - FragPos);
        float diff = max(dot(norm, lightDir), 0.0);
        vec3 diffuse = light_use.diffuse * (diff * matirial_use.diffuse);
        
        // specular
        vec3 viewDir = normalize(light_use.viewPos - FragPos);
        vec3 reflectDir = reflect(-lightDir, norm);  
        float spec = pow(max(dot(viewDir, reflectDir), 0.0), matirial_use.shininess);
        vec3 specular = light_use.specular * (spec * matirial_use.specular);  

        // spotlight (soft edges)
        float theta = dot(lightDir, normalize(-light_use.direction)); 
        float epsilon = (light_use.cutOff - light_use.outerCutOff);
        float intensity = clamp((theta - light_use.outerCutOff) / epsilon, 0.0, 1.0);
        diffuse  *= intensity;
        specular *= intensity;
        
        // attenuation
        float distance    = length(light_use.lightPos - FragPos);
        float attenuation = 1.0 / (light_use.constant + light_use.linear * distance + light_use.quadratic * (distance * distance));

        diffuse   *= attenuation;
        specular *= attenuation;  
            
        vec3 lighting = (diffuse + specular);
        lighting *= color;
        FragColor += vec4(lighting, 1.0);

    }else if(light_use.type==3){
        
        // diffuse 
        vec3 norm = normalize(Normal);
        vec3 lightDir = normalize(light_use.direction);
        float diff = max(dot(norm, lightDir), 0.0);
        vec3 diffuse = light_use.diffuse * (diff * matirial_use.diffuse);
            
        // specular
        vec3 viewDir = normalize(light_use.viewPos - FragPos);
        vec3 reflectDir = reflect(-lightDir, norm);  
        float spec = pow(max(dot(viewDir, reflectDir), 0.0), matirial_use.shininess);
        vec3 specular = light_use.specular * (spec * matirial_use.specular);  
        // calculate shadow
        float shadow = ShadowCalculation(FragPosLightSpace,lightDir);  
            
        vec3 lighting = (diffuse + specular) * (1.0 - shadow);
        lighting *= color;
        FragColor += vec4(lighting, 1.0);
    }else if(light_use.type==4){
        vec3 lightDir = normalize(light_use.lightPos - FragPos);
    
        float theta = dot(lightDir, normalize(-light_use.direction)); 
        
        if(theta > light_use.cutOff)
        {    
        
            // diffuse 
            vec3 norm = normalize(Normal);
            vec3 lightDir = normalize(light_use.lightPos - FragPos);
            float diff = max(dot(norm, lightDir), 0.0);
            vec3 diffuse = light_use.diffuse * (diff * matirial_use.diffuse);
            
            // specular
            vec3 viewDir = normalize(light_use.viewPos - FragPos);
            vec3 reflectDir = reflect(-lightDir, norm);  
            float spec = pow(max(dot(viewDir, reflectDir), 0.0), matirial_use.shininess);
            vec3 specular = light_use.specular * (spec * matirial_use.specular);  
            
            // attenuation
            float distance = length(light_use.lightPos - FragPos);
            float attenuation = 1.0 / (light_use.constant + light_use.linear * distance + light_use.quadratic * (distance * distance));

            diffuse   *= attenuation;
            specular *= attenuation; 
            
            vec3 lighting = (diffuse + specular);
            lighting *= color;
            FragColor += vec4(lighting, 1.0);
        }

    }

}
    