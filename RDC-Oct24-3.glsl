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
uniform float dx[20];
uniform float dy[20];


void main(){
    vec2 pos = vertTexCoord.st;
    vec2 posb = pos*vec2(mouse.x*200.0,mouse.y*200.0);
    int viy =  int(floor(posb.y));
    float vx = floor(posb.x)/(mouse.x*200.0);
    float vy = floor(posb.y)/(mouse.y*200.0);
    vec2 mov = vec2(0.0);
    if(viy%2 == 0){
        mov = vec2(0.0, sin(tiempo*0.2)*0.05);
    }
    vec3 color = texture2D(texture,vec2(vx,vy)+mov).rgb;;
    
    gl_FragColor = vec4(color,1.0);
}
