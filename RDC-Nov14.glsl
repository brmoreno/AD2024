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
uniform float f [200];



void main(){
    vec2 pos= gl_FragCoord.xy/res;
    float v = 0;
    for(int i = 0; i<200;i++){
        float distancia = distance(pos,vec2(px[i],py[i]));
        if(distancia < r[i]){
            float inten = (r[i]-distancia)/r[i];
            inten*=f[i];
            v+= inten;
        }
    }
    v = abs(v);
    v*= 20;
    int v2 = int(round(v));
    vec3 color = vec3(1.0,0.0,0.0);
    if(v2%2== 0){
        color = vec3(0.0,0.0,1.0);
    }
    gl_FragColor = vec4(color,1.0);
}
