#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform vec2 seed;
uniform float st [10];


float ran1(float x_,float v1_,float v2_){
    float val = fract(sin(x_*v1_)*v2_);
    return val;
}

float ran2(vec2 pos_,vec2 seed_,float escala_){
    float val = fract(sin(dot(pos_,seed_))*escala_);
    return val;
}


void main(){
    vec2 pos= gl_FragCoord.xy/res;
    vec3 color = vec3(ran2(pos,seed,500.823425+tiempo));
    gl_FragColor = vec4(color,1.0);
}
