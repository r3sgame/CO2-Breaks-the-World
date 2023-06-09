RSRC                     VisualShader            ��������                                            �      resource_local_to_scene    resource_name    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    script    width    height    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise    output_port_for_preview    default_input_values    expanded_output_ports    source    texture    texture_type    input_name    op_type 	   function 	   operator    size    expression    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    nodes/vertex/0/position    nodes/vertex/2/node    nodes/vertex/2/position    nodes/vertex/3/node    nodes/vertex/3/position    nodes/vertex/4/node    nodes/vertex/4/position    nodes/vertex/5/node    nodes/vertex/5/position    nodes/vertex/6/node    nodes/vertex/6/position    nodes/vertex/7/node    nodes/vertex/7/position    nodes/vertex/8/node    nodes/vertex/8/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/27/node    nodes/fragment/27/position    nodes/fragment/28/node    nodes/fragment/28/position    nodes/fragment/29/node    nodes/fragment/29/position    nodes/fragment/30/node    nodes/fragment/30/position    nodes/fragment/31/node    nodes/fragment/31/position    nodes/fragment/32/node    nodes/fragment/32/position    nodes/fragment/33/node    nodes/fragment/33/position    nodes/fragment/33/size    nodes/fragment/33/input_ports    nodes/fragment/33/output_ports    nodes/fragment/33/expression    nodes/fragment/34/node    nodes/fragment/34/position    nodes/fragment/35/node    nodes/fragment/35/position    nodes/fragment/36/node    nodes/fragment/36/position    nodes/fragment/37/node    nodes/fragment/37/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections           local://FastNoiseLite_8bl68 �         local://NoiseTexture2D_ct8rc ?      &   local://VisualShaderNodeTexture_6lio0 z      $   local://VisualShaderNodeInput_lnmuq �      $   local://VisualShaderNodeInput_evx2r �      *   local://VisualShaderNodeMultiplyAdd_q6uli $      %   local://VisualShaderNodeUVFunc_v8yr1 �      $   local://VisualShaderNodeInput_svr1e       '   local://VisualShaderNodeVectorOp_qxf5e B      $   local://VisualShaderNodeInput_npua0 �      &   local://VisualShaderNodeTexture_ivnpu �      $   local://VisualShaderNodeInput_db0sl #      .   local://VisualShaderNodeVectorDecompose_kmh8c c      ,   local://VisualShaderNodeVectorCompose_dhmk6 �      $   local://VisualShaderNodeInput_bfsni �      )   local://VisualShaderNodeExpression_vkqtw 	      $   local://VisualShaderNodeInput_ijfxs �      .   local://VisualShaderNodeVectorDecompose_0ht76 �      &   local://VisualShaderNodeFloatOp_0irkr       $   local://VisualShaderNodeClamp_dsg48 6         local://VisualShader_i122w \         FastNoiseLite                                        �?         NoiseTexture2D             #                      VisualShaderNodeTexture    (                     VisualShaderNodeInput    *         vertex          VisualShaderNodeInput    *         normal          VisualShaderNodeMultiplyAdd    %                                          �?  �?  �?                     +                  VisualShaderNodeUVFunc    %               
   ���=���=      
                    VisualShaderNodeInput    *         time          VisualShaderNodeVectorOp    %                                        ��L>��L>��L>-                  VisualShaderNodeInput    *      
   screen_uv          VisualShaderNodeTexture    '                  VisualShaderNodeInput    *         depth_texture           VisualShaderNodeVectorDecompose             VisualShaderNodeVectorCompose             VisualShaderNodeInput    *         inv_projection_matrix          VisualShaderNodeExpression    .   
   ��DH�D/      U   vec4 view = inv_proj_matrix * vec4(ndc, 1.0);
view.xyz /= view.w;
output0 = -view.z;          VisualShaderNodeInput    *         vertex           VisualShaderNodeVectorDecompose             VisualShaderNodeFloatOp             VisualShaderNodeClamp             VisualShader .   0        shader_type spatial;
uniform sampler2D tex_vtx_2;



void vertex() {
// Input:7
	float n_out7p0 = TIME;


// UVFunc:6
	vec2 n_in6p1 = vec2(0.10000, 0.10000);
	vec2 n_out6p0 = vec2(n_out7p0) * n_in6p1 + UV;


// Texture2D:2
	vec4 n_out2p0 = texture(tex_vtx_2, n_out6p0);


// Input:4
	vec3 n_out4p0 = NORMAL;


// VectorOp:8
	vec3 n_in8p1 = vec3(0.20000, 0.20000, 0.20000);
	vec3 n_out8p0 = n_out4p0 * n_in8p1;


// Input:3
	vec3 n_out3p0 = VERTEX;


// MultiplyAdd:5
	vec3 n_out5p0 = fma(vec3(n_out2p0.xyz), n_out8p0, n_out3p0);


// Output:0
	VERTEX = n_out5p0;


}

void fragment() {
// Input:32
	mat4 n_out32p0 = INV_PROJECTION_MATRIX;


// Input:27
	vec2 n_out27p0 = SCREEN_UV;


// Input:29
	float n_out29p0 = 0.0;


	vec4 n_out28p0;
// Texture2D:28
	n_out28p0 = vec4(0.0);


// VectorDecompose:30
	float n_out30p0 = vec3(n_out28p0.xyz).x;
	float n_out30p1 = vec3(n_out28p0.xyz).y;
	float n_out30p2 = vec3(n_out28p0.xyz).z;


// VectorCompose:31
	vec3 n_out31p0 = vec3(n_out27p0.x, n_out27p0.x, n_out30p0);


	float n_out33p0;
// Expression:33
	n_out33p0 = 0.0;
	{
		vec4 view =  * vec4(vec2(n_out31p0.xy), 1.0);
		view.xyz /= view.w;
		n_out33p0 = -view.z;
	}


// Input:34
	vec3 n_out34p0 = VERTEX;


// VectorDecompose:35
	float n_out35p0 = n_out34p0.x;
	float n_out35p1 = n_out34p0.y;
	float n_out35p2 = n_out34p0.z;


// FloatOp:36
	float n_out36p0 = n_out33p0 + n_out35p2;


// Clamp:37
	float n_in37p1 = 0.00000;
	float n_in37p2 = 1.00000;
	float n_out37p0 = clamp(n_out36p0, n_in37p1, n_in37p2);


// Output:0
	ALBEDO = vec3(n_out37p0);


}
 1   
   �f����H            I   
     ��  ��J            K   
     C�  DL            M   
     ��  HCN            O   
     p�   CP            Q   
     ��  ��R            S   
    ���  ��T            U   
     ��  HCV                                                                                                          W   
     D  ��X         	   Y   
     ��  ��Z         
   [   
     ��  �A\            ]   
     ��   B^            _   
    @{�  �B`            a   
    @]�  4�b            c   
    �i�  ��d            e   
    @?�  ��f   
   ��DH�Dg         0,6,inv_proj_matrix;1,3,ndc; h         0,0,output0; i      U   vec4 view = inv_proj_matrix * vec4(ndc, 1.0);
view.xyz /= view.w;
output0 = -view.z; j            k   
    ��  �Cl            m   
     ��  �Cn            o   
     R�  ��p            q   
     ��    r       4                                                                                            !              !      "       #       !       $       #      $      $       %       %                     RSRC