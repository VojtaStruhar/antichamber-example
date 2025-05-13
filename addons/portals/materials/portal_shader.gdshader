shader_type spatial;
render_mode unshaded;

uniform sampler2D albedo: hint_default_black, source_color;

void fragment() {
    // The portal color is simply the screen-space color of the exit camera render target.
    // This is because the exit camera views the exit portal from the perspective of the player watching
    // the entrance portal, meaning the exit portal will occupy the same screen-space as the entrance portal.
    vec3 portal_color = texture(albedo, SCREEN_UV).rgb;

	ALBEDO = portal_color;

	// FOR DEBUG - make portals slightly red
	// ALBEDO = mix(portal_color, vec3(1, 0, 0), 0.1);
}