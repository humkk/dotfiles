#version 300 es
precision highp float;
in vec2 v_texcoord;
out vec4 fragColor;
uniform sampler2D tex;

const float vibrance = 0.20;      // saturação geral
const float blueBoost = 0.25;     // boost extra pra azul
const float purpleBoost = 0.20;   // boost extra pra roxo (azul+vermelho)

void main() {
    vec4 color = texture(tex, v_texcoord);
    vec3 c = color.rgb;

    // vibrance geral (baseado em luma)
    float luma = dot(c, vec3(0.2126, 0.7152, 0.0722));
    vec3 result = mix(vec3(luma), c, 1.0 + vibrance);

    // detecta o quanto de azul/roxo tem no pixel
    float blueness = result.b - max(result.r, result.g);
    float purpleness = min(result.r, result.b) - result.g;

    // aplica boost extra proporcional
    result.b += max(blueness, 0.0) * blueBoost;
    result.r += max(purpleness, 0.0) * purpleBoost * 0.5;
    result.b += max(purpleness, 0.0) * purpleBoost * 0.5;

    fragColor = vec4(clamp(result, 0.0, 1.0), color.a);
}
