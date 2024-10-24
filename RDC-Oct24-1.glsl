#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform float cx;


void main(){
    vec2 pos = vertTexCoord.st;
    vec2 posb = pos*vec2(1.0, 150.0);
    posb += vec2(0.0,tiempo*0.1);
    int vy = int(floor(posb.y));
    vec2 cambioPos = vec2(0.0);
    if(vy%2 == 0){
        cambioPos = vec2(cx,0.0);
    }
    vec3 color = texture2D(texture,pos+cambioPos).rgb;
    if(vy%2 == 0){
        color*= vec3(1.5,0.8,0.5);
    }
    else{
        color*= vec3(0.5,1.0,1.3);
    }
    gl_FragColor = vec4(color,1.0);
}
