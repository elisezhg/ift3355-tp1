uniform vec3 remotePosition;

void main() {

	gl_FragColor = vec4(0, 0, remotePosition.y / 4.0, 1); // 1.b) From black to blue
}