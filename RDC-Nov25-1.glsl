#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform float px [200];
uniform float py [200];
uniform float r [200];
uniform float g [200];
uniform float b [200];
uniform sampler2D gato;



void main(){
    vec2 pos= gl_FragCoord.xy/res;
    vec3 color = texture2D(gato,vec2(pos.x, 1-pos.y)).rgb;
    
    float rojo = round(color.r*1.0)/1.0;
    float verde = round(color.g*1.0)/1.0;
    float azul= round(color.b*1.0)/1.0;
    //color = vec3(rojo,verde,azul);
    
    if(rojo == 1 && verde == 0 && azul == 0){
        color = texture2D(gato,vec2(pos.x, 1-pos.y)+mouse).rgb;
        
    }
    
    if(rojo == 1 && verde == 1 && azul == 0){
        color = texture2D(gato,vec2(pos.x, 1-pos.y)-mouse).rgb;
        
    }
    
    if(rojo == 0 && verde == 0 && azul == 0){
        color = texture2D(gato,vec2(pos.x, 1-pos.y) +vec2(0.0,mouse.x)).rgb;
        
    }
    

    gl_FragColor = vec4(color,1.0);
    
    
    
}
