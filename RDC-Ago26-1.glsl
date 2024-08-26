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
        vec2 o  = vec2(0.0);
        if(i%2 == 1){
            o = vec2(1.0);
        }
        float distancia = distance(o,posicion);
        distancia *= nBarras[i];
        distancia += tiempo*vel[i];
        vec3 u = vec3(step(ancho[i],fract(distancia)));
       // if( i%2 == 1){
    //      u = vec3(step(ancho[i],fract(posicion.x)));
    //    }
        vec3 color = vec3 (rojo[i],verde[i],azul[i]);
        u*= color;
        v+=u;
    }
 
    
    gl_FragColor = vec4(fract(v),1.0);
}
