#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform float posx [90] ;
uniform float posy [90] ;
uniform float vw [90] ;
uniform float vh [90] ;
uniform float rojo[90];
uniform float verde[90];
uniform float azul[90];
uniform float lim[90];
uniform float vel[90];
uniform float tam [90];

float rect (vec2 pos_, vec2 wh){
    float w = wh.x/2;
    float h = wh.y/2;
    float a = step(pos_.x,w);
    float b = step(-pos_.x,w);
    float c = step(pos_.y, h);
    float d = step(-pos_.y,h);
    return (a*b*c*d);
}


void main(){
    vec3 color = vec3(1.0);
    
    for(int i = 0; i< 90; i++){
        vec2 pos= gl_FragCoord.xy/res;
         pos -= vec2(posx[i],posy[i]);
        float miRect = rect(pos,vec2(vw[i],vh[i]));
        pos += vec2(tiempo*vel[i],tiempo*vel[i]);
        pos *=tam[i];
        float f = step(lim[i], fract(pos.x));
        if(i%2 == 0){
            f = step(lim[i], fract(pos.y));
        }
        vec3 colorRect= mix(vec3(rojo[i],verde[i],azul[i]),vec3(rojo[(i+20)%90],verde[(i+20)%90],azul[(i+20)%90]),f);
        color = mix(color,colorRect,miRect);
    }
    
    
    gl_FragColor = vec4(color,1.0);
}
