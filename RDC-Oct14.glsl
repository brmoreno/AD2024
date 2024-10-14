#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform vec2 dRojo;
uniform vec2 dVerde;
uniform vec2 dAzul;
uniform float ampx;
uniform float ampy;
uniform float freqx;
uniform float freqy;
uniform int cual;


void main(){
    vec2 pos = vertTexCoord.st;
    vec3 color = vec3(0.0);
    if(cual == 0){
        float rojo = texture2D(texture,pos+dRojo).r;
        float verde = texture2D(texture,pos+dVerde).g;
        float azul = texture2D(texture,pos+dAzul).b;
        color = vec3(rojo,verde,azul);
    }
    else{
         color  = texture2D(texture,pos+vec2(ampx*sin(pos.y*freqx),ampy*sin(pos.x*freqy))).rgb;
    }
    gl_FragColor = vec4(color,1.0);
}
