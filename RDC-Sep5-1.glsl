#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform float rojo[6];
uniform float verde [6];
uniform float azul[6];
uniform float dir[3];
uniform float escala[6];


void main(){
    vec2 posicion = gl_FragCoord.xy/res;
    vec2 pos = posicion*3.0;
    int sec = int(floor(pos.y));
    pos = fract(pos+vec2(tiempo,0.0)*dir[sec]);
    float v = step(pos.y-0.5,sin(pos.x*escala[sec])*0.5);
    vec3 color1 = vec3(rojo[sec],verde[sec],azul[sec]);
    vec3 color2 = vec3(rojo[sec+3],verde[sec+3],azul[sec+3]);
    vec3 color = mix(color1,color2,v);
    gl_FragColor = vec4(color,1.0);
}
