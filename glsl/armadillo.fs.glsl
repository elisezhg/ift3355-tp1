// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader
in vec3 interpolatedNormal;
/* HINT: YOU WILL NEED A DIFFERENT SHARED VARIABLE TO COLOR ACCORDING TO POSITION OF REMOTE */

uniform vec3 remotePosition;

in float redIntensity;
in float greenIntensity;

void main() {


  // Set final rendered color according to the surface normal
  gl_FragColor = vec4(normalize(interpolatedNormal) + vec3(redIntensity, 0, 0) + vec3(0, greenIntensity, 0), 1);
}
