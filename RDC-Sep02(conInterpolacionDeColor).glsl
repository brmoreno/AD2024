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
    int cA = int(floor(v*4));
    vec3 color1= vec3(rojo[cA],verde[cA],azul[cA]);
    int sig = (cA+1)%4;
    vec3 color2= vec3(rojo[sig],verde[sig],azul[sig]);
    vec3 color = mix(color1,color2,(v-0.25*cA)/0.25);
    
    
    gl_FragColor = vec4(color,1.0);
}
