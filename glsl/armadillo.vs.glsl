// Create shared variable for the vertex and fragment shaders
out vec3 interpolatedNormal;
uniform int time;
uniform sampler2D fft;

uniform vec3 remotePosition0;
uniform vec3 remotePosition1;
uniform vec3 remotePosition2;

out float redIntensity;
out float greenIntensity;

void main() {
    // Set shared variable to vertex normal
    interpolatedNormal = normal;

	// Get components of sounds from the FFT texture
	float fft_bass = texture(fft, vec2(0.1, 0.0)).x;
	float fft_middle = texture(fft, vec2(0.25, 0.0)).x;
	float fft_treble = texture(fft, vec2(0.5, 0.0)).x;

	// 1.c) & 1.d)
	vec3 modifiedPosition = position + normal * (fft_bass / 15.0) * remotePosition0.y;
	redIntensity = fft_middle * remotePosition1.y;
	greenIntensity = fft_treble * remotePosition2.y;

	gl_Position = projectionMatrix * modelViewMatrix * vec4(modifiedPosition, 1.0);
}
