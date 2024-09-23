#ifdef GL_ES
precision medium float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 res;
uniform float tiempo;
uniform vec2 mouse;



mat2 rotar2d(float angulo_){
    return mat2(cos(angulo_),-sin(angulo_),sin(angulo_),cos(angulo_));
    
}


float sdStar5(in vec2 p, in float r, in float rf)
{
    const vec2 k1 = vec2(0.809016994375, -0.587785252292);
    const vec2 k2 = vec2(-k1.x,k1.y);
    p.x = abs(p.x);
    p -= 2.0*max(dot(k1,p),0.0)*k1;
    p -= 2.0*max(dot(k2,p),0.0)*k2;
    p.x = abs(p.x);
    p.y -= r;
    vec2 ba = rf*vec2(-k1.y,k1.x) - vec2(0,1);
    float h = clamp( dot(p,ba)/dot(ba,ba), 0.0, r );
    return length(p-ba*h) * sign(p.y*ba.x-p.x*ba.y);
}


void main(){

    vec2 pos= gl_FragCoord.xy/res;
    vec2 trs = vec2(-0.5);
    pos+=trs;
    pos*=rotar2d(mouse.x*10.0);
    pos*=mouse.y*2.0 +0.1;
    vec2 o = vec2(0.0);
    
    float r = 0.2;
    float dist = distance(o,pos);
    float angulo = atan(pos.x, pos.y);
    vec3 colorFinal = vec3(0.0);
    if(dist < r+ sin(tiempo+ angulo*4.0)*0.05 + sin(-tiempo+angulo*8.0)*0.05 + sin(tiempo*0.4+angulo*12.0)*0.05 ){
        colorFinal = vec3(1.0);
    }
    
    gl_FragColor = vec4(colorFinal,1.0);
}
