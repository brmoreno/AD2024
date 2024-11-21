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
    int v = 0;
    float dist = 1.0;
    for(int i = 0; i<200;i++){
        float distancia = distance(pos,vec2(px[i],py[i]));
        if(distancia < dist){
            dist = distancia;
            v = i;
        }
    }
    vec3 color = vec3(r[v],g[v],b[v]);
    color = texture2D(gato,vec2(px[v],1.0-py[v])).rgb;
    gl_FragColor = vec4(color,1.0);
}
