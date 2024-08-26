#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse; 
uniform float nBarras[20];
uniform float vel[20];
uniform float ancho[20]; 
uniform float rojo[20];
uniform float verde [20];
uniform float azul[20];


void main(){
    vec3 v = vec3(0.0);
    for (int i = 0; i<20; i++){
        vec2 posicion = gl_FragCoord.xy/res;
        posicion *= nBarras[i];
        posicion += tiempo*vel[i];
        float an = tiempo*vel[i];  
        vec2 pos = vec2(posicion.x*cos(an) - posicion.y*sin(an), posicion.x*sin(an)+posicion.y*cos(an));
        vec3 u = vec3(step(ancho[i],fract(pos.y)));
        vec3 color = vec3 (rojo[i],verde[i],azul[i]);
        u*= color;
        v+=u;
    }
 
    
    gl_FragColor = vec4(fract(v),1.0);
}
