#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform sampler2D vC;
uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;



void main(){
    vec2 pos = vertTexCoord.st;
    vec3 color = texture2D(texture,pos).rgb;
    float rojo = floor(color.r*3)/2.0;
    float verde = floor(color.g*3)/2.0;
    float azul = floor(color.b*3)/2.0;
    if(rojo == 1.0 && verde == 1.0 && azul == 1.0){
        float v = fract(pos.x*30.0 +tiempo*0.1);
        float c = 1.0;
        if(v>0.5){
            c = 0.0;
        }
        color = vec3(c);
    }
    
    if(rojo == 1.0 && verde == 0.5 && azul == 0.5){
        float v = fract(pos.x*50.0 -tiempo*0.1);
        color = vec3(1.0);
        if(v>0.25){
            color = vec3(1.0,0.0,0.0);
        }
        
    }
    
    if(rojo == 0.5 && verde == 0.5 && azul == 1.0){
        float v = fract(pos.y*20.0 -tiempo*0.1);
        color = vec3(1.0,1.0,0.0);
        if(v>0.25){
            color = vec3(0.0,0.0,1.0);
        }
        
    }
    
    
    gl_FragColor = vec4(color,1.0);
}
