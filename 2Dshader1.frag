#pragma language glsl3


precision mediump float;    

#define PI 3.14159265359


uniform float u_time;
uniform vec2 u_mouse;

vec3 colorA = vec3(0.149,0.141,0.912);
vec3 colorB = vec3(1.000,0.833,0.224);

vec3 palette( vec3 a, vec3 b, vec3 c, vec3 d, float t ){
    return a + b*cos( 6.28318*(c*t+d) );
}

float plot (vec2 st, float pct){
  return  smoothstep( pct-0.01, pct, st.y) -
          smoothstep( pct, pct+0.01, st.y);
}

float random(in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}

float circle(in vec2 _st, in float _radius){
    vec2 l = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(l,l)*4.0);
}

mat2 rotate2d(float angle){
    return mat2(cos(angle),-sin(angle),
                sin(angle),cos(angle));
}

float noise(in vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f*f*(3.0-2.0*f);

    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}

float lines(in vec2 _st, float _zoom){
    
    return smoothstep(0.0, .5+_zoom*.5, abs((abs(sin(_st.x*_zoom))+sin(_st.y*_zoom))));
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec2 st = screen_coords.xy / love_ScreenSize.xy;
    vec2 mouse_uv = u_mouse / love_ScreenSize.xy;
    vec3 output_color = vec3(0.0);
    vec2 pos = vec2(st*5.0);
    vec2 pos0 = vec2(0, 1);
    vec2 pos1 = vec2(1, 0);

    pos = rotate2d(noise(pos)) * pos;

    pos0 = rotate2d(PI/2.0) * pos0 * u_time * 0.2 ;
    pos1 = rotate2d(PI/2.0) * pos1 * u_time * 0.2 ;

    pos += pos0;
    pos += pos1;

    vec3 pal = palette(vec3(0.2,0.3,0.1),vec3(0.4,0.2,0.3),vec3(0.13),vec3(0.5),st.x+sin(u_time)*0.6-5);

    float l = lines(pos, 3.0);

    output_color = vec3(1) - (vec3(l) * pal);

    return vec4(output_color, 1.0);
}