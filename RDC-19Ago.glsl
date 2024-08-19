#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform int tiempo;
uniform vec2 mouse; 
uniform vec3 color1;
uniform vec3 color2;
uniform vec3 color3;
uniform vec3 color4;

void main(){
    vec2 posicion = gl_FragCoord.xy/res;
    vec3 colorH = mix(color1,color2,posicion.x);
    vec3 colorV = mix(color3,color4,posicion.x);
    vec3 colorfinal = mix(colorH,colorV,posicion.y);
    gl_FragColor = vec4(colorfinal,1.0);
}
