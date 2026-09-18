void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec4 termColor = texture(iChannel0, uv);

    // Creates a very faint horizontal line effect
    float scanline = sin(uv.y * iResolution.y * 0.8) * 0.02 + 0.98;
    
    // Apply the scanline uniformly
    fragColor = vec4(termColor.rgb * scanline, termColor.a);
}
