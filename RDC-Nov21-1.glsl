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
uniform float vmax;
uniform float vmin;



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
    float distMaxMin = vmax - vmin;
    float distMinVal = v - vmin;
    
    vec3 color = vec3(distMinVal/distMaxMin);
    
    
    gl_FragColor = vec4(color,1.0);
}
