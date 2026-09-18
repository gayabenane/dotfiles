float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec4 termColor = texture(iChannel0, uv);

    // Subtle vignette (darkens edges slightly)
    float vignette = smoothstep(1.5, 0.2, length(uv - 0.5));
    vec3 color = termColor.rgb * mix(0.9, 1.0, vignette);

    // Tiny bit of static noise to break up flat backgrounds
    float noise = random(uv + iTime) * 0.03;
    
    // Only apply noise to darker areas so text stays crisp
    float luma = dot(color, vec3(0.299, 0.587, 0.114));
    if (luma < 0.2) {
        color += noise;
    }

    fragColor = vec4(color, termColor.a);
}
