// Create shared variable for the vertex and fragment shaders
out vec3 interpolatedNormal;
uniform int time;
uniform sampler2D fft;

void main() {
    // Set shared variable to vertex normal
    interpolatedNormal = normal;
	
	// Get components of sounds from the FFT texture
	float fft_bass = texture(fft, vec2(0.1, 0.0)).x;
	float fft_middle = texture(fft, vec2(0.25, 0.0)).x;
	float fft_treble = texture(fft, vec2(0.5, 0.0)).x;
	
	// HINT: Work with tvChannel, fft and normal here to perturb the armadillo's geometry. 
	// You can use time as a seed for pseudo-random number generators.
	// By default, we simply multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
	gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
