GDPC                                                                                          T   res://.godot/exported/133200997/export-15e58aafcf75f2c514d23eadb80bd3ac-2d_in_3d.scn      �&      j�:v�8����հ�s    X   res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res P)      �	      *4�1�\- ^��@ڲ�F    ,   res://.godot/global_script_class_cache.cfg  �X             ��Р�8���8~$}P�    D   res://.godot/imported/ball.png-9a4ca347acb7532f6ae347744a6b04f7.ctex(      b       �v��6��OR�6-��    H   res://.godot/imported/icon.webp-e94f9a68b0f625a567a797079e4d325f.ctex    3            io6䨟��zL�p�    L   res://.godot/imported/left_pallete.png-bc33611074a0f886142e37c77bd2545a.ctex�K      f       Z��pd��S�97�
�"    P   res://.godot/imported/right_pallete.png-fc6e4a6a7c8197834656482b94708e47.ctex   `U      f       �y���iQ���3U�    L   res://.godot/imported/separator.png-f981c8489b9148e2e1dc63398273da74.ctex   �V      j       Hy���1�l�.��n�       res://.godot/uid_cache.bin  �q      �       �N�9��\���4ٮc       res://2d_in_3d.gd                 ���wi^�=N(J��+       res://2d_in_3d.tscn.remap   �W      e       X2|m�`J�	S��N�       res://ball.png.import   �(      �       C���M����{�O�Y       res://default_env.tres.remapPX      h       cXv�S��P�O�Tq�o       res://icon.webp �X      �      Ɩ��n�5bG9��E��       res://icon.webp.import   K      �       L�K��W����Yl	��        res://left_pallete.png.import   `L      �       Q�6)�=4%��-�       res://pong.gd   0M      #      �Է�݃=c��6�       res://project.binary`r      l
      ������̪�����        res://right_pallete.png.import  �U      �       i�bwf �A��?�u       res://separator.png.import  W      �       ��y �C�`�{`Ol�            extends Node3D

func _ready():
	# Clear the viewport.
	var viewport = $SubViewport
	$SubViewport.set_clear_mode(SubViewport.CLEAR_MODE_ONCE)

	# Retrieve the texture and set it to the viewport quad.
	$ViewportQuad.material_override.albedo_texture = viewport.get_texture()
RSRC                    PackedScene            ��������                                            �      ..    resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    size    subdivide_width    subdivide_depth    center_offset    orientation    subdivide_height    sky_top_color    sky_horizon_color 
   sky_curve    sky_energy_multiplier 
   sky_cover    sky_cover_modulate    ground_bottom_color    ground_horizon_color    ground_curve    ground_energy_multiplier    sun_angle_max 
   sun_curve    use_debanding    sky_material    process_mode    radiance_size    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction 	   _bundled       Script    res://2d_in_3d.gd ��������   Script    res://pong.gd ��������
   Texture2D    res://ball.png ��A���d
   Texture2D    res://left_pallete.png ��#	��c
   Texture2D    res://right_pallete.png p�=1��#
   Texture2D    res://separator.png �}�H֭   
   local://6 V      
   local://1 �      
   local://2 �      
   local://3 �      !   local://StandardMaterial3D_trcb6 �      !   local://StandardMaterial3D_bqwig A      !   local://StandardMaterial3D_elot5 �      !   local://StandardMaterial3D_phrtn �      !   local://StandardMaterial3D_omrd7       !   local://StandardMaterial3D_dvcyb ]      
   local://5 �      
   local://4 �      $   local://ProceduralSkyMaterial_cvh5i          local://Sky_7gemw m         local://Environment_fvsgw �         local://PackedScene_l53s5 �         StandardMaterial3D              o      
   PlaneMesh    o         StandardMaterial3D          333?o         BoxMesh    v         @   @   @o         StandardMaterial3D          �� ?��@?��@?  �?          o         StandardMaterial3D          �� ?��@?��@?  �?          o         StandardMaterial3D          �� ?��@?��@?  �?          o         StandardMaterial3D          ��@?�� ?��@?  �?          o         StandardMaterial3D          ��@?�� ?��@?  �?          o         StandardMaterial3D          ��@?�� ?��@?  �?          o         BoxMesh    v      �̌?��L?���=o         StandardMaterial3D          ���>���>���>  �?          o         ProceduralSkyMaterial    }      �p%?;�'?F�+?  �?�      �p%?;�'?F�+?  �?o         Sky    �            o         Environment    �         �            �         �         @o         PackedScene    �      	         names "   0      2Din3D    script    Node3D 	   Camera3D 
   transform    fov    near    ViewportQuad    material_override    mesh    MeshInstance3D    SubViewport    size    render_target_update_mode    Pong    Node2D    Background    offset_right    offset_bottom    Panel    Ball 	   position    texture 	   Sprite2D    LeftPaddle    RightPaddle 
   Separator    Environment    Floor 	   skeleton    surface_material_override/0    Pillar1    PillarBottom 
   PillarTop    PillarMiddle    Pillar2    PillarBack    WorldEnvironment    environment    DirectionalLight3D    light_energy    shadow_enabled    shadow_bias    shadow_blur    directional_shadow_mode     directional_shadow_blend_splits    directional_shadow_fade_start     directional_shadow_max_distance    	   variants    /                  �?              �?              �?    �̬?��?     xB   ���=      @                ����      �?        ���?  ��                   -   X  �                      D     �C
     �C  HC         
     �A  HC         
     D  HC         
     �C  HC              �@              �@              �@      ��   �                          ��?            ��?            ��?  @���L�  ��     �?              �?              �?       �                           �?              �?              �?      �@                333?               @            333?       @                ��?            ��?            ��?  @@��L�  ��                        	        �@              �@              �@    ���?  ��      
                        �}?K�;��>���>�?�D?�6�D�Ǿ�"?       A       ��>         ���<     �?            �?      A      node_count             nodes       ��������       ����                            ����                                 
      ����               	                        ����                                ����      	                    ����      
                          ����                                ����                                ����                                ����                                 ����        
       
      ����         	                      
             ����                    
       ����         	                       
   !   ����         	                       
   "   ����         	                
          #   ����                    
       ����         	                        
   !   ����         	         !              
   "   ����         	         "       
       
   $   ����      #   	   $            %       
       %   %   ����   &   &       
       '   '   ����	      '   (   (   )   )   *   *   +   +   ,   ,   -   )   .   -   /   .             conn_count              conns               node_paths              editable_instances              version       o      RSRC         GST2            ����                        *   RIFF"   WEBPVP8L   /�0��?���8�D��               [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dbuw5tlmsx6ss"
path="res://.godot/imported/ball.png-9a4ca347acb7532f6ae347744a6b04f7.ctex"
metadata={
"vram_texture": false
}
                RSRC                    Environment            ��������                                            d      resource_local_to_scene    resource_name    sky_material    process_mode    radiance_size    script    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction        
   local://1 Q	         local://Environment_fhdqa e	         Sky             Environment                                RSRC               GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /� ͐Iې��/y"��X!��J#DC�C,��O9����$�$��N�$m�"I��|jAY��̽����0�Y�Qf���33333cvfd���'b�Sus�>�۶U۶d+�>����	�8�dɢ����Lc�L4��lÚ�WO�m��$I�\�"&��JV��Y�ze���f-�	Pf&����$͝�dԼ���� P !@
�H��$2%!r$I"9B��H�8s,��X,�$�  ��tV3���U�κun�[��[��J1]��S�X������Z ��D��	H�D2�8���	���Q�$	9��R9�M��bn�S��)�N�n��:s3W�v�f��j�J3���b0�9�(�MN���Iɭ8n��n�BZ�G&L��ʦt�u6_qu:5W�l�UcD�#1�$f��9���˨$�I$�$��Y�,$)gQZ*	��C�VAB+�X5�Vu��\�鵎�l�t���j4�0-�z��<Kb�4"H�8K�F�G+$$��-���],�[��~W��V���ٴ`$1����R �_DT��0�c�$8R�T�J�r	��Ơ�:��F���1�2j��j�H 0���'H�V���$�u����I�MO��"ab��h�M�v��[,�tL��lL��L�-l}Ĉ���Q=mז#���@n��h�$�.[�L��0SPl]�m�ݧS`*���b2�3�$;��}�C�2�NT"�p��h���4�fP:�vm�6ZӘM�� �f	;�Ж�C����@P�1�������to�� lz��q�2�%s����+F���+���awku96����M�ڊ1�4~B��I�4��4���#�Ǩ"Ȇ=� �6��mGA�fn�)�Wc6H�y���eg�X�x�XZ��M�F�"�)A��:#�"��b����e��e
6�\� `�hD�b4�Z�� �I���Fp�)�4Ţ�_6�U3�� ��c�Y�j����,�Mg�X���l���"��9�)��2
�I�,Up�F@BŔFLIFS��q�di�,����`���t�[�X���P��t$����@:���ڸ�����*H��F��T-�@���\G�Գ��L+�
���j`�b�L�\���Y!��2uv����J�D��x�̶��q�V��}����SW�I�¡����EmQ�T�U����D�ie��VV�X�&�1�ڢ��YH���S[VmQϲnd�T��S˩]Ym�W�i�jR�2�8M�f����{���������_��vlu��9�V�݇�`�a쩽�S��aۮ�lbh�#�-)��	�N�����c�>����4G��b��x����߽����1f�I[����0">����9����|��?߼P�Lh%5��UF�6:��4F`��c�C����1��a�����׷��P DZ�G��y��l��I�� �	O�/�@]�o~�-h��]��ث܄1��z�)�umዧ�~�:b$�B��e(���\�#c;�ݶ`'0G����n�`� #;�NL1�P2����&[+Ә�S���!GzF*d�������(�#��H�ǦF1=e� (�
j%����m{|��d���0 ɇ/�����>��uK![��4!�n*�F7=
�,�8�A�Ɋ�޵���Y[�e�,�I���R��(�^o����X��搻k]�{�;��^׺R��������_K' |��?�ÿ��^���vc�:��'�(F[���`�8�T%�ʪ�2����w��z�Sm��P��MJh��6����� U�K�tl
�U�oח籮V�Tɺ}��]W������ޟ�鋏_.�tü@b�����~��r�k�Ujo,6b����> �ah!tK��*Z`��X`@x������rn˹u(@:A`��}Co���c2������/������I��T 4w�kg��f��V�Z;X��Z(�9�#A��o��o��)��}&`���O��_���d�08���MO%�V��i3����ݧ�������6\��������#NN�>�%�$�	;O�� H:_~�����o{J�|7bn���y{u}����M` �T��갰K�� ż��������>�Ef�=_^�w_��R0'�Z7�����ƈ������,C �q3����Lؼ�A��/�6���b�9�" ��&Ekd�$���6����}j�R8q�Җ�:��ڤ>�LXu�/+�N=MN  �&��dŰ��-،�s~��L^�A�% �*�`��e���N�DJ	hB��c�[�l姷)����2���dG;��֛̈́)i'�B�[`;T�զ|~ Z�g�wN� "'�X�.K�V���"��+�&g�U	{��ڮ Y�ɷ�͂)��N�YW����J)�ǐ��Ѕ�J u�k=��V (aL�Ǒ!K����.h��B�1X�M�Q���y��N��4�Y%��#c�K
�D#�`-X�A�R*���w
�9QFK����"!�[?̚���!�d�V�V�-l�3(�}�" �ֲIE0�h�t��Y����j �wd�XW���f���hL�h��u,��OL"��ڦ�&��.�V�nE���3�
.Im`!�D����3������0�)4�>��腒	�6�ATZ�䑷���5"�,P�>�f��y����X�7nAȖ1������������m���o��ku��!� N �k��	�a!���R��=���EA$H���I7l��~r�j�s0-FiW%%J)	eky��L����o��a��n��|�3�ui��,�$�J崴��f5((e����?���|���N>�Yk�EK��r��H[�.��&���{�W������	�}����#j���8^o��ћ�W�~�}��>ޞ뇜�N�1�$��9���˹"�(%�'Lv�<�(]��q��V�/Ǜ��G���o�O���7���~�?�?���G����>��M3>�n���������|Y_�ސ1w�#@U��AdP���8�����'���s����_��~�7�����|������-�[���r�W{���w~ϟ�����?���O�KA���-cW�v�l�<��(Γ�,G�a�o�~|�s����_����~��������Zh�ں�l���o�����%�-�ְ�+��E/�s=5xi?�Ő6)�yHsZn��Ox������߿yݮ����z�fM�[�>y�����z���ҭ�@����1S���y~ǧ]�Г� 6A�e+�U8��t�(�ԛ�^����%w��:�[Y�N�-Nߺ<_��xq3]�̓��:����/�k�'���Z1���i���^�䛟|��||햞+�\�u��WWȗ�W���_��ƴO��\�K�l���zyOĚ;���=ػ|g0�ֽ<~8�����>��Y̍���N�*����\��������~��zr����P�]��貫��<����r��DN���������//o������g��t�tX�y�����������ŗ��i�T�b����0"Zo;?B���5�1��=����-t�������~�����a����8Y�=~x�����d(p��֧�-u�&sm���~����^}�~����U]X*���.{���P�E [ɶl�{ȉa�H�������⾨�W�UV�&ى�NtceZ_�sv�N<,T��v�yp�9�0&!N&�@��,B�A<ޫ[dù'0Q�����Z²Hfg�ŀ��~�,�Fp�U�Uk��t2v���c��֏�W��H�9���,-+-]���ƹ��h�Q�`VO����tht�5vn��jʻ�|o4��bi�[֘l%0!�,ߢAl��q�*�T ���|&6�
s���v��:��l) |Y����v 0H�
p�! �l��[����Ҭl�Rj���AZ�v '��}׊m� ���g�l�d3ok��:= ``@��2��t�-J���h$�|�PQ�`�ko�G������.��% �Э�c���0r�#-	��L�\j���n�DTe���2��c ��Ltޣ��!�h$��AuzC�pի*� XS����i��XN�gP茉�-V}��ɘZ�=�@��������Xʲ)�mm��I>{�����s�w��$Eb`j�@�g�>�R@�F0����l&�������³{�2�� �<�v�w^�2@��3Oӫŉ��k��zf��l9cY��]I�p�?=��v�T��]=�^[����k1��8�;�%��% ���g��Ճ�T0#�|X "������������=�����z�~���>� Frf�1 V��z�|��m�o_?�'��kF�Dbv�[��|y�Ǉ�9^�r�{�9�2@�e�������� �����>\udt�{W��_x��w���9�פBcN=�񆧦����������na��y4�Hwd�ȌwL.��_����W��t��plͳ*�1+��>_ܗ�� ����cO� ��IN��0h��f��y�ʻ����_��<�=�54 �J��,��n?x>�{���p���M;���cf�~�����w}K�o�!ê���n��s5��s�����V�|a0�����������#�zk���}���b��0�{����#�tLIb��lS����ь�[,;
	���s_w}�;�Phn��M��j7�	����[�--î�����{y�#�{���?�q�c%j%O^��k�o��*�`C*�rί��﻾����},�t
�Bbs8�t¦���$+2�h�����y��egn�K��
b$�2=�}
���7�V8��Ht=�]��u9����iS��a0M�##f�#��9蟭eZf=�����}�_��D 4
-��0r�T��'i�~(l<�9����fZ�H��о~�������`������x5 �{N�Y� �|������� �6ܖI��
��3����HL����;"�l�=� ��g:_{~����.������ �p��hk�rS���>���}�PĨaP���<7S?&|��l�3*�*S �cIj��~�_�םP����X�ݏ;���g�mț�{�`z06b�d���Ֆ��z��{�H�����}�����֖U[�}�?�P
��$���3�0�5et�J�P�$I�$��4������󛻿=���s�[�u==κ,n�*�r�.ێRIF��#�����"�;x��w20:�!�%O�� Z��� ʴ��8��~�����*������r'p���	���I �@�u�b��ڹ�ONo��u{���\X�a?�o����gն�� ��9�j��9_=C̉eeܫY(��r�t��sۆc��9�qNЎ����֎�ɴBC� �4f�0�v�dh�򤀹��#}����n��/[[[TК��lʮ�s^� ����(Ѿ�aR��vf̤RG_����jvw��0O��y
u�pĊ]Z�����x��	��̎��`{�=�1�S|��i^R6���1�X$�p�Z͞b���V8����^�����h2�3� ���Lف����b7���A��.\�&�THg�+k��tJ*I�vdQں�I-�vnT��9�j��\�\�b��(�JM�ĉ�me�K��z�8�j%��I+kCPTZ����J�Fp�����N��8�,�:޴ꡪWԹڵbK^�������ѹ�Z��p9֝k[�K���G�/���h�^�s���K���W�j�y�^�:u{���.��[�u��<�7�/��x����R_�5�<���e]y�.��Wݻ>�x�Zl�W�ө=V���N��?��y^[�Ź�~�!@Z��j��V�B�J0�t�jR��R�6�Вj��$)!�f�6[�08z2��>���O}����wdd|�E,Bk+� ��c
`��h�dFh1#/mt� m�������
����|�������]�u�Ȇ���x�'$T��=��)TE�������}�.�������j������_[�              [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://brwp8bimc75uu"
path="res://.godot/imported/icon.webp-e94f9a68b0f625a567a797079e4d325f.ctex"
metadata={
"vram_texture": false
}
               GST2             ����                         .   RIFF&   WEBPVP8L   /�0�1��#Ă�����3���          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://gtbg1ogxcsl7"
path="res://.godot/imported/left_pallete.png-bc33611074a0f886142e37c77bd2545a.ctex"
metadata={
"vram_texture": false
}
         extends Node2D

const PAD_SPEED = 150
const INITIAL_BALL_SPEED = 80

var ball_speed = INITIAL_BALL_SPEED
var screen_size = Vector2(640, 400)

# Default ball direction.
var direction = Vector2.LEFT
var pad_size = Vector2(8, 32)

@onready var ball = $Ball
@onready var left_paddle = $LeftPaddle
@onready var right_paddle = $RightPaddle

func _ready():
	screen_size = get_viewport_rect().size # Get actual size.
	pad_size = left_paddle.get_texture().get_size()


func _process(delta):
	# Get ball position and pad rectangles.
	var ball_pos = ball.get_position()
	var left_rect = Rect2(left_paddle.get_position() - pad_size * 0.5, pad_size)
	var right_rect = Rect2(right_paddle.get_position() - pad_size * 0.5, pad_size)

	# Integrate new ball postion.
	ball_pos += direction * ball_speed * delta

	# Flip when touching roof or floor.
	if (ball_pos.y < 0 and direction.y < 0) or (ball_pos.y > screen_size.y and direction.y > 0):
		direction.y = -direction.y

	# Flip, change direction and increase speed when touching pads.
	if (left_rect.has_point(ball_pos) and direction.x < 0) or (right_rect.has_point(ball_pos) and direction.x > 0):
		direction.x = -direction.x
		ball_speed *= 1.1
		direction.y = randf() * 2.0 - 1
		direction = direction.normalized()

	# Check gameover.
	if ball_pos.x < 0 or ball_pos.x > screen_size.x:
		ball_pos = screen_size * 0.5
		ball_speed = INITIAL_BALL_SPEED
		direction = Vector2(-1, 0)

	ball.set_position(ball_pos)

	# Move left pad.
	var left_pos = left_paddle.get_position()

	if left_pos.y > 0 and Input.is_action_pressed(&"left_move_up"):
		left_pos.y += -PAD_SPEED * delta
	if left_pos.y < screen_size.y and Input.is_action_pressed(&"left_move_down"):
		left_pos.y += PAD_SPEED * delta

	left_paddle.set_position(left_pos)

	# Move right pad.
	var right_pos = right_paddle.get_position()
	if right_pos.y > 0 and Input.is_action_pressed(&"right_move_up"):
		right_pos.y += -PAD_SPEED * delta
	if right_pos.y < screen_size.y and Input.is_action_pressed(&"right_move_down"):
		right_pos.y += PAD_SPEED * delta

	right_paddle.set_position(right_pos)
             GST2             ����                         .   RIFF&   WEBPVP8L   /��?��#Ă�����3���          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bc2vi0nh1j1hs"
path="res://.godot/imported/right_pallete.png-fc6e4a6a7c8197834656482b94708e47.ctex"
metadata={
"vram_texture": false
}
       GST2      �     ����                �       2   RIFF*   WEBPVP8L   /�c0��?��� ��i;���E���}a       [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://wiyhsl0rfkrs"
path="res://.godot/imported/separator.png-f981c8489b9148e2e1dc63398273da74.ctex"
metadata={
"vram_texture": false
}
            [remap]

path="res://.godot/exported/133200997/export-15e58aafcf75f2c514d23eadb80bd3ac-2d_in_3d.scn"
           [remap]

path="res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res"
        list=Array[Dictionary]([])
     RIFF�  WEBPVP8L�  /� ���ԙ�L�t��1�"�?X�.] �fT��%	�{s�$���<��%a_J���	 h;V2�¬��,����X0��1�b5w3�t�fF�H�fN-r5�H�b�
��U\��7�7�J��9��q���1�����i 9�$G��΁2�Ơ� �����{�z�$pI��$�g�54��x�pIr�yfS��EQ�����j�L��� TYA ��f�Q��2NcF��VM0�$I�I H000�@���tF��;tr�pM���¨	I�R��� �vOʽ ��ӊ*�ޘP��sA{���6��CU�T�2��/�� �g��I�'ZX����sJ��8�}�0���k���.���v�=�A����h� ��`dD�g�P�Ԉ�p׃N��	�((5��u�I�4=��*��# !J�������
e�bV���Ҡf�%��=��3ph;��0a�sb��HH{���H����9+: �P����$��$H�#���޿G g3ۂA���kG)g'��N�uo�ؾ�ҭ��v<n7�cM_������������x�!r��<\w����m���/�A���^��k6?fz�O���9?�/�Ց"�����ntwTt�5GE;�:��,ݡtR�@y,�u��zy,�ͮ�fW�FT*)��9}׶-K�$Is�6H8^����0���	��x���/; �"I�$I-��0��Y��.7�$�V���/�b��~��vL��H��6�:�}�ǂ �8$m\���ؑl۵�h���h����%h��h M����Z��z�{�^���ϑm��mۖ�2`3��[ܭS������[�$K�$�BR�_��K����y�3�	��0  d@K�����1���o���)9u8u<��2d#�������ަ1�6�~�i��l̶���a6�a�c��� �[@��	H�$)�R�1��!Q(<�1��C(�0��b@��P � 'i�P r`p)�
��"RR1@��GyĦ����XN�0�bI(�5T" P	�@ ���� (� "!��C�Ģ#G8��1�P���Z�)Sv�UA��@@
gD	���a���%R$(0� ��10F1b�̰�#� -B � � �����x�o�@ "��n!� 
�e�,`���a0�F 0D@�	�  
�p �� ^ ��@EDH)�)� a�\! 60����p!�@��J� \�� 0 ��H�@��PX��@A
 ��1���0�&S12�$� B8`�� H 0b�(0B(��AX��w�	0�8>�6s@�@��A*8��jn
���׃A "R  �;�#^�0f��W,P���
�s51@�r��M�B@&���q����aܝk0�x�R8� ��@`�{����@�@����b�`��0fg"��t�J���p�Ħ�1K�bĈQF���"AM	� L� �1x�H����  � F�1�2bt��#6 #FL��#��bS�bS�ʔH@
	@� 3�Y3˶���CMcȄ	��0ab#F6�)#�E� �y���F@
i�)���Д�R	�HI��J ��6�l\�+��\PU���AF�b�5$��p F�fF�a��d$f�#��%�V	�"�J�*%����5`���I�k�H�.q*����"n�5%+ �%@���N����8�>N�f���߱��]�Ŧ�Ŧ�Ŧ��Yn�x��^#6e��U�֬���4Ҍl�h�0(��)3�,6]��y$q�<�fT����TFl��TƃA,�ȍխk����������Ķ���l �@`0��8� b��mb�FL���!�Ĉ� FS��1�1b0&0` ��M����o?��5��%��s�rĈ��|Z��hܳ=�����ZP&F ��@ 0�����;Foܙ�`b 1 @��W}����J $ R@tw�d2q71���W{�p�  D�.������#�84Fq�_����K
������~��a�pK 0�!�mr����l[��A1�
�b#Čl��r���2@r �N(�ʛ0L�Ye� #���+��d2�ȧ�meFL���������&@�,E�`����k:A�����,Qa�
�(0K�6*ؖ*�P�6* ��Rʖ;KS�Z�v�&�Pf�l�`C�̨��%�\�f����>y�|1�����g� �����N@5#V��a�4��(F���Q��b���#M���v��k�.Oxd`z��MF����(FF�l
�����l0����ｓȤ���� ��#R�6Hl0bĈ#F�>H`$��
����� 6b� �`�*`N�QI�e�a�3`���b�P@FF�1�@ �� b@�o|<朞�e1	 �� b 1�@b `�Vt�Yø#��6��p��\hNr�v+���~ܗPcl ��3ɐ ˓
�;��lE�0�;� PP�q�r �E�T���	Ψw"�]VX��@N�A���ȅ#	��PqK�) 8�� �D�LF�+A�-��`�i HCc8u W3  F���_�\�63��0���^�f� ��$�.i&L �� ;��F���_*v�3��#	���t�@Kr) ���� �@�~��Hx<L��+�O � �*?�8��e��fp�J0X�jѶJ v�A
��n/w9�	�v#�`��@g �R�#���ٌ�=� ���1b��b;�����"���"02�_`A@бj u�g�
  (a &;6e@���.�2��lBD`�97� �r�9� @�J�t� ���9�0
�(c�����؏�/ ��[%s����D ����xꞄ�G�xU� �0(���T�+sC tC �{Q� ��l��. �N�H "� "@���n�! �"!` �9Ĉ ܭe��`` @ ]0b/ (��'@ ��� �
J �`�(��Z@ �gvg F� P �X�����@�-�"K~�5�: �c>C���Fp�j 01'��Z��\C%�\ �	1�1pU\9 F @0���E#D̀ Ƙw�~���L=��G:��b1�(e L��b ��� 0Nt@ l��{�- �B��Ҡ��D�j ��C�`a{��`b� �26'=(��S�ִ6��`O���` #����%"�@FNp ������o�騾kx�����M���&^�R��.�
�\�fnũؕ����K6��]������.���s{�L�Gy~X^��ao���+0�[.`�O:X�q㟁Naٵdx��_����{=��k����?�G��S�����O��'~��Շ�����f{��8 41�1I&�n������O�[�;��_>���6a �x�m��>]/���]�����r�6�'�U���a�:'�u�~_�3��
/�K�s=ك�^y��~���l"&�F��|��_���F��hpzb ?��V����g��N��>������:#[i}릗�kYٛ>[��{ �Ls�G�z=��ioX<5�� ��A� ,Nѯ3���o����l��6�'o�����K���f��y�6�֝�#�2�$O`� �M �� v���o_���f�x�gp���e� ���~�ׇ�����>iS�(���0�&�(� q�v�/������������x��L��v��m���}�Ƿǯ/k�.���۔@r�ز 8��3�������������s?�؀�VW�����x��' ����� ���>� s�<���>��?��� ���W�UN��h�lIa�~�	 9V㽖o�=)�@Vh���NR'F �o�ͅ�1� d�2yfq���5I���r9i4���>�@F��P�
sp� 0�� ��x��� ![ӡn�h����b�<�~�"��ym� ��V A�r ��� ���֍@`��2b�XQo7�p#��7l.��B &tn�R��$p� hBF�ڔ�� D�5fA��� �[@�F ,� �5V �(����������h��@1 fS)���r�+9n�9���` 36 ����=�� �1Ba20 �<ٹ*�B��6���\`�F���H�5G� (�7�`�,�$4�!  Ga �D��� �,\ �X��! � ":FC���A� �d꘡�ED �%���>0 B����0#F��_k@	D?��+$``��c$�q��� C�$���	�X���#�iĈ0��@���f��	��1��i�it��#6.����ؽŨ�#��C�W]� hj�� "G��l6Q#F��@XiC� �7ЅK5`�1�����m��)@�A`��V�(�	1�; `ȶ&a ���@���@��`i�@cVϼl60s�@`�	`�"��D��\�` @XZv��  ���z6�x� ���p�h]�_a�" ���Fl�Ni �  �ǹ7o�\.���5���EY�>��1���*e @ �#�``Ĉ#Fp �m�``<�2�H�p?n!����e4 ڈ��*��@  @ \�63
���݄ �� H���$
 ��q�QA�0�= f0�aP2 6eC����a[���1bĈLFl#F�I���f!�q,�2��� �x\�[0 ��ǿ���g�I��@&��M12b� `6D@	�z�՚�gMQ@�b��@`0��ǈ �2]UU?צ6 #��1�i��+ӗ��0�	�Ō F # !�"s�lvN/���0̰0�b�F̈#����@&#F #fl�yZs�>��3��b16�L�ۙL&ߌ� A"�� ?O�  32<�w�]〵��ײ� � �9�1K *c�w�6���xM`r5�31bĈ#F��L�FP>d2��L&#F��L`����u��9)� 2�-#��&0�ک5�0b4cP�C.���r�\.��ň#��\.F�9�1���\.#P#f &I'�M����ч0���`0�	L #0&�������ؔ�l�����6{��t�'�on^��9������~��,��P>�YL1�3\��mF å��YebF��M��~�R{��{j�<s�6߶�k���	�j��4��F���\fIlKKlb�#F��p{a�����,���1bĈY��@���.������ڧ���8luw=��82;] ����, ,��wƺ��3��S[�Ϡ� ����qO81F�K�1b�d2wb2�LƇ�)a\�;.���º�猪���G�� b�W` 0|r �4�Qf02 ����H�w2����� bĈ� b 1bĈ��'\\d���-�� �Lx� Fx� b�7�@ ���� ��`��W�2bĈ�U ��b 1x[�@� F\��]H# ���*��#��sG�01bC FpG�0�[�0�!`C � a@ ��)\�0#�K$ ��H�0 �! a�$%�� b�0�E�Rb�C �R>( a C  � ��9���}k�����T�*�SL:vL&XFa)H-��,��ٍ�� FglSm�m�#�Y������Z�����i�^}tL+RK��Ш��X�$����@������d��g�t<�D[�����Ҫ]��=�Ӣ3�sd0�gv7�b��\`;A����A�e��Kq.�'�<mY�0'�ZۦaC�h[r�j��,2�\mp���15f:�����s�^�����f�|�-ke�G���������?3�A ����� ����ĈSd�ǈe�Mm9��D8옡���=�~��1ClS KLL 6.� 0 È9 fF���Z#. �u�~?c�G$2��XHdx1�@ 0f}W�\���E�x)y�?����>��O        6�EUnn`   res://2d_in_3d.tscn��A���d   res://ball.pngT��jT3R2   res://icon.webp��#	��c   res://left_pallete.pngp�=1��#   res://right_pallete.png�}�H֭   res://separator.png    ECFG      application/config/name         2D in 3D   application/config/descriptionT      K   A demo showing how a 2D scene can be shown within a 3D one using viewports.    application/config/tagsD   "         2d     3d     demo    	   official    
   rendering      application/run/main_scene         res://2d_in_3d.tscn    application/config/features   "         4.2    application/config/icon         res://icon.webp    input/left_move_up�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode           echo          script         input/left_move_down�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode           echo          script         input/right_move_up�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script         input/right_move_down�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script      #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility4   rendering/textures/vram_compression/import_etc2_astc         J   rendering/lights_and_shadows/directional_shadow/soft_shadow_filter_quality         '   rendering/anti_aliasing/quality/msaa_3d             