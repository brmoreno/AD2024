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
    float alfa = 0.0;
    for(int i = 0; i<500; i++){
        vec2 posI = vec2(0.005*i +0.0025, 0.5);
        vec3 vCc = texture2D(vC,posI).rgb;
        vec2 posP = vec2(vCc.r,vCc.g);
        float r = vCc.b *0.1;
        float distancia = distance(posP,pos);
        if(distancia<r){
            alfa = 1.0;
        }
    }
    
    gl_FragColor = vec4(color,alfa);
}
