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
    
    float rojo = sin(tiempo*0.05+ 3.0 + color.r * 6.26)*0.5 +0.5;
    float verde = color.g;
    float azul = color.b;
    for(int i = 0; i<10; i++){
        vec2 posI = vec2(i*0.1 + 0.05, 0.15);
        vec4 vCc = texture2D(vC,posI);
        rojo+= sin(tiempo*0.1*(vCc.r-0.5) + 6.28*vCc.g + color.r*20.0*vCc.b)*vCc.a ;
        posI = vec2(i*0.1 + 0.05, 0.33+0.15);
        vCc = texture2D(vC,posI);
        verde+= sin(tiempo*0.1*(vCc.r-0.5) + 6.28*vCc.g + color.r*20.0*vCc.b)*vCc.a;
        posI = vec2(i*0.1 + 0.05, 0.66+0.15);
        vCc = texture2D(vC,posI);
        verde+= sin(tiempo*0.1*(vCc.r-0.5) + 6.28*vCc.g + color.r*20.0*vCc.b)*vCc.a;
    }
    gl_FragColor = vec4(rojo,verde,azul,1.0);
}
