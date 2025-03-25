#version 330 core
out vec4 FragColor;

in vec2 TexCoords;
in vec3 Normal;
in vec3 FragPos;    


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
uniform Light light_use;
uniform Matirial matirial_use;

void main()
{   
    if(light_use.type==0){
        // ambient
        vec3 ambient = light_use.ambient * matirial_use.ambient;

        FragColor += vec4(ambient, 1.0);
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
         
        vec3 result = diffuse + specular;
        FragColor += vec4(result, 1.0);
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

        vec3 result = diffuse + specular;
        FragColor += vec4(result, 1.0);

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
            
        vec3 result = diffuse + specular;
        FragColor += vec4(result, 1.0);
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
        float distance    = length(light_use.lightPos - FragPos);
        float attenuation = 1.0 / (light_use.constant + light_use.linear * distance + light_use.quadratic * (distance * distance));

        diffuse   *= attenuation;
        specular *= attenuation; 

        vec3 result = diffuse + specular;
        FragColor += vec4(result, 1.0);

        }

    }else{
        
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
            
        vec3 result = diffuse + specular;
        FragColor += vec4(result, 1.0);
    }

    FragColor *= texture(texture_diffuse1,TexCoords);
}