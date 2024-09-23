#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform float posx [150] ;
uniform float posy [150] ;
uniform float radio [150] ;
uniform float rojo[150];
uniform float verde[150];
uniform float azul[150];


float circulo1 (vec2 centro_, float radio_, vec2 pos_){
    float distancia = distance(centro_,pos_);
    float dentro = smoothstep(radio_,radio_-0.01,distancia);
    return dentro;
}

float circulo2 (vec2 centro_, float radio_, vec2 pos_){
    float distancia = distance(centro_,pos_);
    float dentro = smoothstep(radio_,0.0,distancia);
    return dentro;
}


void main(){

    vec2 pos= gl_FragCoord.xy/res;
    vec3 colorFinal = vec3(0.0);
    for(int i = 0; i<150; i++){
        float dentro = circulo2(vec2(posx[i],posy[i]),radio[i], pos);
        vec3 color = vec3(rojo[i],verde[i],azul[i]);
        color*=dentro;
        colorFinal +=color;
    }
    
    
    
    gl_FragColor = vec4(colorFinal,1.0);
}
