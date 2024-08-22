#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse; 
uniform vec3 color1;
uniform vec3 color2;
uniform vec3 color3;
uniform vec3 color4;



void main(){
    vec2 posicion = gl_FragCoord.xy/res;
    float v = posicion.x;
    
    float r = sin(v*50.0 +tiempo); 
    float g = sin(v*30.0 -tiempo); 
    float b = sin(v*10.0 +tiempo*0.3); 
    
 
    
    gl_FragColor = vec4(r,g,b , 1.0);
}
