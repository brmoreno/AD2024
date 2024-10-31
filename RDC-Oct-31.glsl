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
    
    vec2 trans = vec2(0.0);
    for(int i = 0; i<300; i++){
        vec4 posTex = texture2D(vC,vec2(i*0.002 + 0.001,0.5));
        vec2 posP = posTex.rg;
        float r = posTex.b * 0.3;
        float a = posTex.a * 6.28 + tiempo*0.03;
        float m = 0.1;
        float dist = distance(pos,posP);
        if(dist < r){
            float inten = (r - dist)/r;
            inten *= m;
            vec2 mov = vec2(cos(a)*inten, sin(a)*inten );
            trans += mov;
        }
    }

    vec3 color = texture2D(texture,pos+trans).rgb;
    gl_FragColor = vec4(color,1.0);
}
