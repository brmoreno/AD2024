#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;
uniform float posx [150] ;
uniform float posy [150] ;
uniform float radio [150] ;
uniform float colorP[150];
uniform float verde[150];
uniform float azul[150];

float sdSegment( in vec2 p, in vec2 a, in vec2 b )
{
    vec2 pa = p-a, ba = b-a;
    float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length( pa - ba*h );
}


void main(){

    vec2 pos= gl_FragCoord.xy/res;
    
    vec3 colorFinal = vec3(0.0);
    for(int i = 0; i<30; i++){
        for(int j = i+1 ; j<30; j++){
            vec2 a = vec2(posx[i],posy[i]);
            vec2 b = vec2(posx[j], posy[j]);
            float distancia = distance(a,b);
            if(distancia<0.3){
                float v = sdSegment(pos,a, b);
                if(v<0.05){
                    colorFinal += vec3((0.05-v)*5.0);
                }
            }
        }
    }

    gl_FragColor = vec4(colorFinal,1.0);
}
