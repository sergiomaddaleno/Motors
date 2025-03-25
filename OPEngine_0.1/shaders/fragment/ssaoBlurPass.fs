#version 330 core
out float FragColor;

in vec2 TexCoords;

uniform sampler2D ssaoInput; // Textura SSAO sin blur

void main() 
{
    vec2 texelSize = 1.0 / vec2(textureSize(ssaoInput, 0));
    float result = 0.0;

    // Pesos para un kernel 3x3 (almacenados en un array 1D)
    float weights[9] = float[](
        0.075, 0.125, 0.075,
        0.125, 0.200, 0.125,
        0.075, 0.125, 0.075
    );

    // Aplicar el kernel 3x3
    for (int x = -1; x <= 1; ++x) 
    {
        for (int y = -1; y <= 1; ++y) 
        {
            // Calcular el índice en el array 1D
            int index = (x + 1) * 3 + (y + 1);
            
            vec2 offset = vec2(float(x), float(y)) * texelSize;
            float sampleAO = texture(ssaoInput, TexCoords + offset).r;
            result += sampleAO * weights[index];
        }
    }

    FragColor = result;
}