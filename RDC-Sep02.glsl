#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform float nBarras[10];
uniform float vel[10];
uniform float ancho[10];
uniform float intensidad[10];
uniform float rojo[4];
uniform float verde [4];
uniform float azul[4];


void main(){
    float v = 0.0;
    for (int i = 0; i<10; i++){
        vec2 posicion = gl_FragCoord.xy/res;
        posicion *= nBarras[i];
        posicion += tiempo*vel[i];
        float an = tiempo*vel[i];
        float u = step(ancho[i],fract(posicion.y));
        if(i%2 == 0){
            u = step(ancho[i],fract(posicion.x));
        }
        
        v+= u*intensidad[i];
    }
    v = fract(v);
    vec3 color = vec3(v);


   
    int colorAsignar = int(floor(v*4));
        for(int i = 0; i< 4; i++){
        if ( colorAsignar == i){
            color= vec3(rojo[i],verde[i],azul[i]);
        }
    }

    
    
    gl_FragColor = vec4(color,1.0);
}
