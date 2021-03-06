#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.1415926
#define TwoPI (2.0 * PI)

uniform sampler2D envmap;

varying vec3 wcNormal;

vec2 envMapEquirect(vec3 wcNormal, float flipEnvMap) {
  float phi = acos(wcNormal.z);
  float theta = atan(flipEnvMap * wcNormal.x, wcNormal.y) + PI;
  return vec2(theta / TwoPI, phi / PI);
}

void kore() {

  vec3 N = normalize(wcNormal);
    gl_FragColor = texture2D(envmap, envMapEquirect(N, -1.0));
}
