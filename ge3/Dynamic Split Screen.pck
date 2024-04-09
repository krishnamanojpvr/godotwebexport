GDPC                �                                                                         X   res://.godot/exported/133200997/export-6f14ea8b2d534ddfbd765f93b763f5ad-split_screen.scn�A      �V      6�:>�u�T���:�    X   res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res �      ]      �/�FyD�������	    ,   res://.godot/global_script_class_cache.cfg  �             ��Р�8���8~$}P�    H   res://.godot/imported/icon.webp-e94f9a68b0f625a567a797079e4d325f.ctex   �      8      �6R�p[��SO�       res://.godot/uid_cache.bin  ��      d       �_}7���H���x       res://camera_controller.gd          �      �Nͺ;���ą掝$�       res://default_env.tres.remap0�      h       cXv�S��P�O�Tq�o       res://icon.webp 0�      x      ��ɷhD�P'03$�N       res://icon.webp.import  05      �       L�K��W����Yl	��       res://player.gd  6      �      K���*����p�0)�;       res://project.binary �      �       ���j:ͷ�p+Xw6��       res://split_screen.gdshader  8      �	      �������&���E�!        res://split_screen.tscn.remap   ��      i       2D�uޝ0f:��|��O       res://wall_coloring.gd  ��      d      <7Z���i�����        extends Node3D

# Handle the motion of both player cameras as well as communication with the
# SplitScreen shader to achieve the dynamic split screen effet
#
# Cameras are place on the segment joining the two players, either in the middle
# if players are close enough or at a fixed distance if they are not.
# In the first case, both cameras being at the same location, only the view of
# the first one is used for the entire screen thus allowing the players to play
# on a unsplit screen.
# In the second case, the screen is split in two with a line perpendicular to the
# segement joining the two players.
#
# The points of customization are:
#   max_separation: the distance between players at which the view starts to split
#   split_line_thickness: the thickness of the split line in pixels
#   split_line_color: color of the split line
#   adaptive_split_line_thickness: if true, the split line thickness will vary
#       depending on the distance between players. If false, the thickness will
#       be constant and equal to split_line_thickness

@export var max_separation: float = 20.0
@export var split_line_thickness: float = 3.0
@export var split_line_color: Color = Color.BLACK
@export var adaptive_split_line_thickness: bool = true

@onready var player1 = $"../Player1"
@onready var player2 = $"../Player2"
@onready var view = $View
@onready var viewport1 = $Viewport1
@onready var viewport2 = $Viewport2
@onready var camera1 = viewport1.get_node(^"Camera1")
@onready var camera2 = viewport2.get_node(^"Camera2")

var viewport_base_height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready():
	_on_size_changed()
	_update_splitscreen()

	get_viewport().size_changed.connect(_on_size_changed)

	view.material.set_shader_parameter("viewport1", viewport1.get_texture())
	view.material.set_shader_parameter("viewport2", viewport2.get_texture())


func _process(_delta):
	_move_cameras()
	_update_splitscreen()


func _move_cameras():
	var position_difference = _compute_position_difference_in_world()

	var distance = clamp(_compute_horizontal_length(position_difference), 0, max_separation)

	position_difference = position_difference.normalized() * distance

	camera1.position.x = player1.position.x + position_difference.x / 2.0
	camera1.position.z = player1.position.z + position_difference.z / 2.0

	camera2.position.x = player2.position.x - position_difference.x / 2.0
	camera2.position.z = player2.position.z - position_difference.z / 2.0


func _update_splitscreen():
	var screen_size = get_viewport().get_visible_rect().size
	var player1_position = camera1.unproject_position(player1.position) / screen_size
	var player2_position = camera2.unproject_position(player2.position) / screen_size

	var thickness
	if adaptive_split_line_thickness:
		var position_difference = _compute_position_difference_in_world()
		var distance = _compute_horizontal_length(position_difference)
		thickness = lerpf(0, split_line_thickness, (distance - max_separation) / max_separation)
		thickness = clampf(thickness, 0, split_line_thickness)
	else:
		thickness = split_line_thickness

	view.material.set_shader_parameter("split_active", _get_split_state())
	view.material.set_shader_parameter("player1_position", player1_position)
	view.material.set_shader_parameter("player2_position", player2_position)
	view.material.set_shader_parameter("split_line_thickness", thickness)
	view.material.set_shader_parameter("split_line_color", split_line_color)


# Split screen is active if players are too far apart from each other.
# Only the horizontal components (x, z) are used for distance computation
func _get_split_state():
	var position_difference = _compute_position_difference_in_world()
	var separation_distance = _compute_horizontal_length(position_difference)
	return separation_distance > max_separation


func _on_size_changed():
	var screen_size = get_viewport().get_visible_rect().size

	$Viewport1.size = screen_size
	$Viewport2.size = screen_size

	view.material.set_shader_parameter("viewport_size", screen_size)


func _compute_position_difference_in_world():
	return player2.position - player1.position


func _compute_horizontal_length(vec):
	return Vector2(vec.x, vec.z).length()
           RSRC                    Environment            ��������                                            q      resource_local_to_scene    resource_name    sky_top_color    sky_horizon_color 
   sky_curve    sky_energy_multiplier 
   sky_cover    sky_cover_modulate    ground_bottom_color    ground_horizon_color    ground_curve    ground_energy_multiplier    sun_angle_max 
   sun_curve    use_debanding    script    sky_material    process_mode    radiance_size    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction        $   local://ProceduralSkyMaterial_16la2 �
         local://Sky_i64ko �
         local://Environment_u83v6 	         ProceduralSkyMaterial          �p%?;�'?F�+?  �?	      �p%?;�'?F�+?  �?         Sky                          Environment                         !         C               RSRC   GST2   �   �      ����               � �           RIFF�  WEBPVP8L�  /� ͘iۦ���?え�s��i�Ŀ�m�m��Ao��Щi��x|rC�������y�^ض��m߶�ו��(�T�g�m۶m۶m۶1�g��
]�\׹/Ku��:S�ߗmmk$Ͷ5����1��3�缚m�b��J3K��<g2�sx��nf����s۶j�ZZs�-���}�� ��!r�� 1�K�;DND�������k��Á�H��ڙ���=��H��j+D(Bl �nX����`qm5�s�}�o�Ȇ͓{<|��� ��Q7"ie�  �M��E����j���N�����`�v (��@S�D&!�����'���v�_�[u�
* iQ*K v)vv Ae�D�IL D@� S�I�T,K�F �	1�(�`����p �Hb� �)�[�`a�I��G��T���Y*�@�f��O����P  @@�L��*L�
E��t�@�U,ll�'[!8�?@y��"�+�UE ((Bee[@�G�S$� �����2n���`�1��T՛�~��$�;���V� �m\e�nf��kAX���Fm(`���~�ۖ�j�> +[m,BX�N����_��5�TA讥߮��4�Q�s'�ɓ�	�?e���4D�mV`!�?\~��*���ac<H�!е��??�����4v\�LS �V������b��$�kc�,�+������
��ꀄ�"�݈�|�?�����e#���h�P@���k��������+�w\x��P�@�"]������_f��T���{r�#)2Ю�O���{[�ȧ��{֧���w>���`� ��<���m{����z�_	�+������G�R��dI/���\�N��A$��;�w?�w�C`�k)��yv����	����f��HPq���^��%��a��l������t�,��wN\��rx�
 �Y����p�;�;w�{�����������G�(����9�))��r���[_���?����p�ƛ �$�M5o_�c-�t	-�Je�5���-N�eR���N�{nZ?8�w�y�so�[����̼Dv�@�MYx|���j��Ǫ��o����|M����J���Wf>���g���[hIH�K�Ǫ՛o�������p�[V���PB�r�����k�L���@0��Q@`6�ӊBV���P'[�h+[`�ܖvê�=��T����U�{��l�V�$Q:�����UJ��}����/���^Yr���������ԥz(�0(VЮE��RD���`LC������+��B�4��{���g~�����������[+�У����Һ�S��'����)�)��(w��;���Y2�<��K���Tb@a{%Z2��)'����뛮�
�z
��?xӖ/������$�	 � �����=9���]� Ͳ��1-DJ�j����޽���2KV#++�P�Sȼ{�����  [(���G��{�����X	,9��@T0����Ȭ��^��ߛ��Gm��ܳ�Y������:-��d.�B  [�-��M��S�1�ʒ�o=}M�  b������N��^�H.�ӱ�{\�\U�!�>��^x��z��� ����0�j�[���ܣZ
z��@������iw��_�N���/�%���i�H��+MK����GGw=��%  6���OUI�칞<�sh\�P�ƥ�|��W��h$���c�ҩא*�%�8�-j�ҳݱ�7nr������9�v�7�����c�#�I���ކv��<�s�R�X��X�F��4"���E��m�"�Mg�YO�[��|�K��,78?`X�5�[��j����\B�\�Cj��-۟���y�͞�����!�!�4�C��uo��l�j�<rt{���#.���``2�ɦjB�^Մ�kEsimץ���>���V��_��K����ለ"K�Ƶ޶4&I���!������T�<<���|�����q��
�Ϡkw3�>��f�����Nu���3r���h�W���xAhC���e5�0��4�6SI���ޞ�m��U�sκ�n��v��� �2�:@��h���p�V���2��6D�q��}szXN=�T6cÕg�,�4�h��I`��o�b�c�Ye���h,@�X@�l
��w�;�<r�Z��/	SI�!�S�6�-�"�� n���8�e˖���@��+����K��M�i�&�Y � ��2�D�� �
����N�W�0�~fV��٭���%� ʴ�@�TB G�$ЙlL��r+��<���@sQ�o�� 
 1	! �����X�+>���K_X�R,�DPb	 �DB6������-}��V�C��ϧ�2� F  !!I�b��ܖH :��Ç��{�����,r*H� "&*M�Rh� :��ʷ���,ږ�	����% ,-�T�m����Y�
�+z�|���2�Q�M`>QM@$I؁  �
7�N�V�u��k����Y��  ��I����!�J�9y���<M�Z���D�R  ���L5XJ �Ȍ\�2����,��q܁���:]���ͬ6@�*U0��Bn�
�����@�e��a�t���[n~~�c���G��	� �Z�VՖ���}5- ��d�"� ��W�Z_�7~��}�|LI��R�M��#�r��CҀe��Ż�����ԭ�����G����k2�T-�U˚�2��SU~�9��	K�k#���&\�LeZr[�
XV���>��iP/��f ��e{TԓZj�@ �,�U���ۼ�ڣ*�:*���̽�Z����џ���^,�����y�����動���7N���٨�����������z۠c��,�vU�Q��vA>D�}嵮w�m���ۗ��o<��G�r��]��ڒ�"��G��v;��f�û/>��ǟ�0����j�����T}.�mAdfxtǥ�Λϸ�vZ��F \ђ����������5[�[*��&����B�e4��Eb�T�R!H����C�� �7�'�����{���nQJ�A��k��sn�|��W�gRGbky7zHP��V�T��!X�A���p��w��U�&5�Ib -A���!��{�y�}w�j�S�jUI��V��%
Q`���G �>+��̇�O���t\���o�S�T�Tb�Vq�yk��[�y�]_� Kȭ���7�3T���L�ۿ�����K�D%2H1H�XjQo�y_����u��W3�����>|-���xnx=��~P�%������}����k��G���d`{�.��������q0�9�����?������w�eti�6������ٖ��̔�j��xy�����[�a�%�ÜG�5p�Y9;�1	t������]���M�V�oK.x+��~���c�PU�2�5{Ң@��Gm�w��U�tz+^T�����Ǉ|:��6�a�*���1wƱԎ��I����>�v��W���"��͜[!h �N�����O[Q#�rRFcqf|N$�Zr����;���$5�m����*E�@RF@��[#�l���.�4�H%������{��f�4�|���N��RI��i *�NKK��.�����b�4) "� 9�g���w��k�i�k�����^��ZE�$J ������lG�v�����''�� �N���� i��ڻ=ԏ�<�2�Y7��	͑�ؿ��d��ݝ�KX'H�>�̧��,�u�@�� ����P�.�=���[.��e�����vy�����dv�_�k�El;����|�������oO��3����I�fL�@ ���N�ώ��J�>֪=�����3a�z��G#�b܂F*�S/!��Dϰj ɘ�����X����]�PU:C9)Us~t��X_Wܼ ɔ����5޿�m��U>��/���O�<�ޙDN����˄%P#hJPen;���:@+�F;6ھ�ka���B�Ϧ��N�-�f�S#��J1�CW��f��Ɲ����>]��/6~���4��<��(�>�`b�C9Ux8=�-���B���a���Tj��������ޭ�D%���'�5u�v�w9��u�'�ЊU����~��~�����9={[���v�e��� ��g��!<$<�؅ ��QL]^��\*��������]�b�P���>�4u�.���|n��C��U��3�b��7惿t�w[,��޻�tG@A`�H�x��ꗣ�b����/���j'��r�w�iv��L�)	Xn���o�������z76Ffr�2�5�Ax���l��?}s:�1�6��
��`(�l�d����������p����h@(����式.�$a��  �4�f^�.��́�uM�=��9pvo�Y����+��Ik��6ϩ��qު���������άP".��g�x1��s�'���O�ġ�`�{�-ZU�A	� P��RH�3��O���]G���\�v^+�e�0
�����2�۸���.�Kr���>��n�jRa�x^�������)����3_��ٹm��Z�r��/��9> R���bp��_�.}`4V- +�#�~t���t �O����9�d{.},�������]�q:��8�ȗ��ܽ������4b�nU��l�vxw��_{��KG	  ���j��[��铹5����Tbi�����W� � pV�G=o5׳0k�_����~�{�7���~֯��zp�����Mk8�*4$�n�V#w�V�8  X!��HAJ\���;>�>��MK  Pjv���8�-_  �v�3�7j�� ��Z۵[={D՞�g��$Q�����Ʈp�����b��5�0����p��/�?�q=�+ D�P$e��z��m�M���K��>)�6�%�E�����
K���+��T������~�	2� Bb�C�r�����W?t��bEa~	(Yo���Ӎ<�9]�D�iɣ17mU�AB� �"K������.�R�5W���Gh)Mn���ŏ���Wϟߠ����
F���q�r��z�.�i����|�X�#��P
b���; f�ؕ8MrUcD�&�D�(��C��������W�!К�������7��6pF��x5|�e����զ͝��ZB P�V  ���+V6Q��Y���(�Pc��x������̆�+�D[9�M����ih3����������Ll[���  #�m��	1��?zz�'NǾ4k�n���؏���qB;�+�F&���ݙOL�L�sq�H�D F�H��d�`�Mp�����Vm��q�x?�K{ն1@�I[�g�@`�c� �̶S���h���zKQH�2qt7Z�6�Q^%�m޳��  �)����N����, $�T$e����l	��v��95����[SPe������  ������WƵ&T���5�����qE6dE�v_�gSB	 a� DTXst3�Ή4���T�����L�Z=
�2:FC�<`h�̉��" hp�j�=�Y��D�K�YU���h];�����#�$��:�5��,Jcϰ�Y��3�Lr��~,���ysq��'����R Ҭͧ�#��	���1�:��`�mQ��f�F%Y�) �%n@Oc`ȡ�r���f`X�@�A ((�0�
T@� �E���+!�z�O���N4�T!Ṗ�$0� � ���ࠥ���� ��Zա�tG��1�  øp~�y
Fz� i�y�l���k���T�;o�*�� !���Zgجa2���txC����| ����2	PI��i�:D��!0��p:
A�	�O�`���xI��}�׌@
0�`�� �V�Ӌ,�( ��Bk�.��������I@`,|9�0�N���U��0��Cît��e��P��U��0��� ��@ ��um�Sp��$��7;� V���lru��E�H�À�(��';> 
�%�鰫��*����2	�V @�R @,;> 7YR���ᴙ�L	
"�-vA  ����  ��4wo�$)$A �T"Q� �"�	=:��X�t�U�$ K"�"	H#��e ���=$�B�1[1�N�J���D(0)����h�.�x
H��D_���jש�;�E��Ⱦ]�����P �UH�L�O���ų���ًg	����\�zTk�a������H�Jc� @ze�mF�(          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://brwp8bimc75uu"
path="res://.godot/imported/icon.webp-e94f9a68b0f625a567a797079e4d325f.ctex"
metadata={
"vram_texture": false
}
               extends CharacterBody3D

# Moves the player

@export_range(1, 2) var player_id: int = 1
@export var walk_speed: float = 2


func _physics_process(_delta):
	var move_direction = Input.get_vector(
			"move_left_player" + str(player_id),
			"move_right_player" + str(player_id),
			"move_up_player" + str(player_id),
			"move_down_player" + str(player_id),
	)
	velocity.x += move_direction.x * walk_speed
	velocity.z += move_direction.y * walk_speed

	# Apply friction.
	velocity *= 0.9

	move_and_slide()
         shader_type canvas_item;
render_mode unshaded;

uniform vec2 viewport_size;          // size in pixels of the viewport
uniform sampler2D viewport1 : source_color;
uniform sampler2D viewport2 : source_color;
uniform bool split_active;           // true: split screen, false: use view1
uniform vec2 player1_position;       // position of player 1 un UV coordinates
uniform vec2 player2_position;       // position of player 2 un UV coordinates
uniform float split_line_thickness : hint_range(0, 10, 0.1);  // width of the split boder
uniform vec3 split_line_color : source_color;       // color of the split border

// from https://stackoverflow.com/questions/15276454/is-it-possible-to-draw-line-thickness-in-a-fragment-shader
float distance_to_line(vec2 p1, vec2 p2, vec2 point) {
	float a = p1.y - p2.y;
	float b = p2.x - p1.x;
	return abs(a * point.x + b * point.y + p1.x * p2.y - p2.x * p1.y) / sqrt(a * a + b * b);
}

void fragment() {
	vec3 view1 = texture(viewport1, UV).rgb;
	vec3 view2 = texture(viewport2, UV).rgb;

	float width = viewport_size.x;
	float height = viewport_size.y;

	if (split_active) {
		vec2 dx = player2_position - player1_position;

		float split_slope;
		if (dx.y != 0.0) {
			split_slope = dx.x / dx.y;
		} else {
			split_slope = 100000.0; // High value (vertical split) if dx.y = 0
		}

		vec2 split_origin = vec2(0.5, 0.5);
		vec2 split_line_start = vec2(0.0, height * ((split_origin.x - 0.0) * split_slope + split_origin.y));
		vec2 split_line_end = vec2(width, height * ((split_origin.x - 1.0) * split_slope + split_origin.y));

		float split_current_y = (split_origin.x - UV.x) * split_slope + split_origin.y;
		float split_player1_position_y = (split_origin.x - player1_position.x) * split_slope + split_origin.y;

		// Check on which side of the split UV is and select the proper view.
		if (UV.y > split_current_y) {
			if (player1_position.y > split_player1_position_y) {
				COLOR = vec4(view1, 1.0);
			} else {
				COLOR = vec4(view2, 1.0);
			}
		} else {
			if (player1_position.y < split_player1_position_y) {
				COLOR = vec4(view1, 1.0);
			} else {
				COLOR = vec4(view2, 1.0);
			}
		}

		float distance_to_split_line = distance_to_line(split_line_start, split_line_end, vec2(UV.x * width, UV.y * height));
		if (distance_to_split_line < split_line_thickness) {
			// Draw antialiased split line.
			COLOR.rgb = mix(split_line_color, COLOR.rgb, distance_to_split_line / split_line_thickness);
		}
	} else {
		COLOR = vec4(view1, 1.0);
	}
}
    RSRC                    PackedScene            ��������                                            �      ..    Player1    resource_local_to_scene    resource_name    sky_top_color    sky_horizon_color 
   sky_curve    sky_energy_multiplier 
   sky_cover    sky_cover_modulate    ground_bottom_color    ground_horizon_color    ground_curve    ground_energy_multiplier    sun_angle_max 
   sun_curve    use_debanding    script    sky_material    process_mode    radiance_size    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction    shader    shader_parameter/viewport_size    shader_parameter/split_active "   shader_parameter/player1_position "   shader_parameter/player2_position &   shader_parameter/split_line_thickness "   shader_parameter/split_line_color    shader_parameter/viewport1    shader_parameter/viewport2    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radius    height    radial_segments    rings    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    custom_solver_bias    margin    inner_radius    outer_radius    ring_segments    size    subdivide_width    subdivide_depth    center_offset    orientation    subdivide_height 	   _bundled       Script    res://camera_controller.gd ��������   Shader    res://split_screen.gdshader ��������
   Texture2D    res://icon.webp T��jT3R2   Script    res://player.gd ��������;   $   local://ProceduralSkyMaterial_16la2 S         local://Sky_i64ko �         local://Environment_vdrvu �      
   local://1 Y      
   local://2 �      
   local://3       
   local://4 K         local://TorusMesh_abtrc �      !   local://StandardMaterial3D_63nwq �      
   local://5       !   local://StandardMaterial3D_wi7e2 Z      
   local://6 �      
   local://7 �      
   local://8        
   local://9 1          local://10 L          local://11 �          local://12 �          local://13 �          local://14 !         local://15 P!         local://16 �!         local://17 �!         local://18 "         local://19 <"         local://20 w"         local://21 �"         local://22 �"         local://23 (#         local://24 c#         local://25 �#         local://26 �#         local://27 $         local://28 O$         local://29 �$         local://30 �$         local://31  %         local://32 ;%         local://33 v%         local://34 �%         local://35 �%         local://36 '&         local://37 b&         local://38 �&         local://39 �&         local://40 '         local://41 N'         local://42 �'         local://43 �'         local://44 �'         local://45 :(         local://46 u(         local://47 �(         local://48 �(         local://49 &)         local://50 a)         local://51 �)         local://52 �)         local://PackedScene_uoc3x *         ProceduralSkyMaterial          �p%?;�'?F�+?  �?      �p%?;�'?F�+?  �?         Sky                          Environment 	                                       q=J?ף`?  �?  �?           !      ���>#         E                  ShaderMaterial 
   s            t      u          v      w      x         Ay      z      {               CapsuleMesh    �        �>�        �?�                  StandardMaterial3D    �      ��n?���=���=  �?         CapsuleShape3D    �        �>�        �?      
   TorusMesh    �      ���>�      ��?�                  StandardMaterial3D    �         ?   ?   ?  �?�         �        �?          �?         StandardMaterial3D    �      ���=���>��n?  �?         StandardMaterial3D    �         ?   ?   ?  �?�         �      s� >�� ?  �?  �?         StandardMaterial3D          
   PlaneMesh    }            �   
     HC  HC         BoxShape3D             BoxShape3D             StandardMaterial3D    �      x{|?n�l?�\?  �?         BoxMesh             StandardMaterial3D    �      �Ѐ<Q?z�'?  �?         StandardMaterial3D    �      �|C?
Q?n�Q?  �?         StandardMaterial3D    �      ��V?�f>��H?  �?         StandardMaterial3D    �      � �>Q�J>T�3>  �?         StandardMaterial3D    �      �T=K��>C�>  �?         StandardMaterial3D    �      p]Q?w�/??5�>  �?         StandardMaterial3D    �      w%?L�-?�^?  �?         StandardMaterial3D    �      �a`?�k?�?  �?         StandardMaterial3D    �      R�>�_?a�c=  �?         StandardMaterial3D    �      ��$?��T?-ZX?  �?         StandardMaterial3D    �      �۵>N�S?��;?  �?         StandardMaterial3D    �      �!?��7>D�l>  �?         StandardMaterial3D    �      E�Y?�0?��?  �?         StandardMaterial3D    �      Y5$?Bϖ>���=  �?         StandardMaterial3D    �      �i?e?���<  �?         StandardMaterial3D    �      ��?���>C �>  �?         StandardMaterial3D    �      ��>vT�>�wA?  �?         StandardMaterial3D    �      ʩ�>��>�T?  �?         StandardMaterial3D    �      w�
?��>$�6?  �?         StandardMaterial3D    �      |��>a�M?6�V>  �?         StandardMaterial3D    �      uX>!�5?>��<  �?         StandardMaterial3D    �      s��>���>�e!>  �?         StandardMaterial3D    �      [_�>~7q?�|Y?  �?         StandardMaterial3D    �      ��>��?��f>  �?         StandardMaterial3D    �      �7g>k��>�_�>  �?         StandardMaterial3D    �      >�W?�gd?�9=  �?         StandardMaterial3D    �      �ul?�/>�G�>  �?         StandardMaterial3D    �      �&�>,g'?�2�>  �?         StandardMaterial3D    �      4�?ڒ�>z7?  �?         StandardMaterial3D    �      ؃m? | ?�U>  �?         StandardMaterial3D    �      �X?d�>p�>  �?         StandardMaterial3D    �      ��=Ee3?PǓ>  �?         StandardMaterial3D    �      >�]?Mg�>��.?  �?         StandardMaterial3D    �      ��>:`?U�>  �?         StandardMaterial3D    �      �2�>l�s?T��>  �?         StandardMaterial3D    �      y>k�Y=�u�>  �?         StandardMaterial3D    �      �ȹ>cD?w��>  �?         StandardMaterial3D    �      3��=NԂ>��s?  �?         StandardMaterial3D    �      �d3=��>?�w?>  �?         StandardMaterial3D    �      �HE?�>[C=?  �?         StandardMaterial3D    �      6�J?�7r?���>  �?         PackedScene    �      	         names "   E      World3D    Node3D    DirectionalLight3D 
   transform    light_energy    shadow_enabled    shadow_bias    shadow_blur    directional_shadow_mode    directional_shadow_split_3     directional_shadow_blend_splits    directional_shadow_fade_start     directional_shadow_max_distance    WorldEnvironment    environment    Cameras    script    max_separation    View 	   material    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    texture    TextureRect 
   Viewport1    msaa_3d    size    render_target_update_mode    SubViewport    Camera1    current 	   Camera3D 
   Viewport2    Camera2    Player1    CharacterBody3D    Mesh    mesh    surface_material_override/0    MeshInstance3D    CollisionShape3D    shape    OmniLight3D    light_color    Player2 
   player_id    MeshInstance3D2 	   skeleton    Ground    StaticBody3D    Walls    Group1    Wall1    material_override    walls    Wall2    Wall3    Wall4    Wall5    Wall6    Group2    Group3    Group4    Group5    Group6    Group7    	   variants    �      г]��ݾ  �>       ?г]?   �  @?�ݾ               ��L=         ���<      @            �>     �?     @A                         A                              -   d   d              �?            1�;�  �?      ��1�;�       A         �?              �?              �?      `?                                             �?              �?              �?    ���                           �?          �?     �?              �?              �?T�@  `?L7A@      	        �?              �?              �?    333�                           
      s� >�� ?  �?  �?     �A              �?              �A                          HC              �?              HC      ��                  �?              �?              �?Ѯ�   ?��<�                                �?              �?              �?e�@   ?����              �?              �?              �?�ڏ�   ?E���              �?              �?              �?��   ?�@              �?              �?              �?-&@   ?Ɏ��              �?              �?              �?��_�   ?�b?              �?              �?              �?  @�       �   ��|?    f��      �?    f�>    ��|?ߦ[�   ?>y4�            ��|?    f��      �?    f�>    ��|?��@   ?�=            ��|?    f��      �?    f�>    ��|?-�-�   ?XV��            ��|?    f��      �?    f�>    ��|?q�5�   ?<�@            ��|?    f��      �?    f�>    ��|?Έ\@   ?q�            ��|?    f��      �?    f�>    ��|?�8�   ? ??              �?              �?              �?  ��      A   _�g?    ���>      �?    ��پ    _�g?�2_�   ?���            _�g?    ���>      �?    ��پ    _�g?��@   ?�v~�            _�g?    ���>      �?    ��پ    _�g?���   ?���            _�g?    ���>      �?    ��پ    _�g?��M=   ?��@            _�g?    ���>      �?    ��پ    _�g?![�   ?���             _�g?    ���>      �?    ��پ    _�g?EK�   ?�A
@      !        �?              �?              �?  �@      �@   Xp>    ��|�      �?    ��|?    Xp>Ve'@   ?.��      "      Xp>    ��|�      �?    ��|?    Xp>�@   ?�Y�@      #      Xp>    ��|�      �?    ��|?    Xp>�r�@   ?���      $      Xp>    ��|�      �?    ��|?    Xp>��   ?���      %      Xp>    ��|�      �?    ��|?    Xp>6��@   ?�ݳ?      &      Xp>    ��|�      �?    ��|?    Xp>�2��   ?�O�      '        �?              �?              �?          `A   q�?    ��<      �?    ���    q�?���   ?y�B�      (      q�?    ��<      �?    ���    q�?���@   ?Q�׿      )      q�?    ��<      �?    ���    q�?�+��   ?sh��      *      q�?    ��<      �?    ���    q�?(�o�   ?a�@      +      q�?    ��<      �?    ���    q�?�]@   ?�t��      ,      q�?    ��<      �?    ���    q�?4�M�   ?υU?      -        �?              �?              �?   A      ��   �?    S<J�      �?    S<J?    �?.��?   ?��b�      .      �?    S<J�      �?    S<J?    �?���@   ?�t|@      /      �?    S<J�      �?    S<J?    �?�(H@   ?J��      0      �?    S<J�      �?    S<J?    �?����   ?0�I?      1      �?    S<J�      �?    S<J?    �?D��@   ?�Σ�      2      �?    S<J�      �?    S<J?    �?C��   ?w��      3        �?              �?              �?  ��      ��   ��    ��      �?    �=    �����?   ?uY@      4      ��    ��      �?    �=    �����   ?��?      5      ��    ��      �?    �=    ���,�@   ?£�@      6      ��    ��      �?    �=    ��;�T=   ?�H'�      7      ��    ��      �?    �=    ���'�   ?�@      8      ��    ��      �?    �=    ��}�B@   ?�Ǵ�      9         node_count    �         nodes     6  ��������       ����                      ����
                                        	      
                                    ����      	                     ����      
                          ����                                                              ����                                "       ����         !                    #   ����                                "   $   ����         !                  &   %   ����                   	       *   '   ����   (      )          	       +   +   ����   ,          	       *   *   ����         (      )          	       -   -   ����   .                  &   /   ����               0                 *   '   ����   (      )                 +   +   ����   ,                 *   1   ����         (      2      )                  -   -   ����   .   !               4   3   ����               *   '   ����      "   (   #              +   +   ����      $   ,   %                  5   ����                  6   ����               4   7   ����      &              +   +   ����   ,   '              *   *   ����   8   (   (   )      9          4   :   ����      *              +   +   ����   ,   '              *   *   ����   8   +   (   )      9          4   ;   ����      ,              +   +   ����   ,   '              *   *   ����   8   -   (   )      9          4   <   ����      .       !       +   +   ����   ,   '       !       *   *   ����   8   /   (   )      9          4   =   ����      0       $       +   +   ����   ,   '       $       *   *   ����   8   1   (   )      9          4   >   ����      2       '       +   +   ����   ,   '       '       *   *   ����   8   3   (   )      9             ?   ����      4       *       4   7   ����      5       +       +   +   ����   ,   '       +       *   *   ����   8   6   (   )      9   *       4   :   ����      7       .       +   +   ����   ,   '       .       *   *   ����   8   8   (   )      9   *       4   ;   ����      9       1       +   +   ����   ,   '       1       *   *   ����   8   :   (   )      9   *       4   <   ����      ;       4       +   +   ����   ,   '       4       *   *   ����   8   <   (   )      9   *       4   =   ����      =       7       +   +   ����   ,   '       7       *   *   ����   8   >   (   )      9   *       4   >   ����      ?       :       +   +   ����   ,   '       :       *   *   ����   8   @   (   )      9             @   ����      A       =       4   7   ����      B       >       +   +   ����   ,   '       >       *   *   ����   8   C   (   )      9   =       4   :   ����      D       A       +   +   ����   ,   '       A       *   *   ����   8   E   (   )      9   =       4   ;   ����      F       D       +   +   ����   ,   '       D       *   *   ����   8   G   (   )      9   =       4   <   ����      H       G       +   +   ����   ,   '       G       *   *   ����   8   I   (   )      9   =       4   =   ����      J       J       +   +   ����   ,   '       J       *   *   ����   8   K   (   )      9   =       4   >   ����      L       M       +   +   ����   ,   '       M       *   *   ����   8   M   (   )      9             A   ����      N       P       4   7   ����      O       Q       +   +   ����   ,   '       Q       *   *   ����   8   P   (   )      9   P       4   :   ����      Q       T       +   +   ����   ,   '       T       *   *   ����   8   R   (   )      9   P       4   ;   ����      S       W       +   +   ����   ,   '       W       *   *   ����   8   T   (   )      9   P       4   <   ����      U       Z       +   +   ����   ,   '       Z       *   *   ����   8   V   (   )      9   P       4   =   ����      W       ]       +   +   ����   ,   '       ]       *   *   ����   8   X   (   )      9   P       4   >   ����      Y       `       +   +   ����   ,   '       `       *   *   ����   8   Z   (   )      9             B   ����      [       c       4   7   ����      \       d       +   +   ����   ,   '       d       *   *   ����   8   ]   (   )      9   c       4   :   ����      ^       g       +   +   ����   ,   '       g       *   *   ����   8   _   (   )      9   c       4   ;   ����      `       j       +   +   ����   ,   '       j       *   *   ����   8   a   (   )      9   c       4   <   ����      b       m       +   +   ����   ,   '       m       *   *   ����   8   c   (   )      9   c       4   =   ����      d       p       +   +   ����   ,   '       p       *   *   ����   8   e   (   )      9   c       4   >   ����      f       s       +   +   ����   ,   '       s       *   *   ����   8   g   (   )      9             C   ����      h       v       4   7   ����      i       w       +   +   ����   ,   '       w       *   *   ����   8   j   (   )      9   v       4   :   ����      k       z       +   +   ����   ,   '       z       *   *   ����   8   l   (   )      9   v       4   ;   ����      m       }       +   +   ����   ,   '       }       *   *   ����   8   n   (   )      9   v       4   <   ����      o       �       +   +   ����   ,   '       �       *   *   ����   8   p   (   )      9   v       4   =   ����      q       �       +   +   ����   ,   '       �       *   *   ����   8   r   (   )      9   v       4   >   ����      s       �       +   +   ����   ,   '       �       *   *   ����   8   t   (   )      9             D   ����      u       �       4   7   ����      v       �       +   +   ����   ,   '       �       *   *   ����   8   w   (   )      9   �       4   :   ����      x       �       +   +   ����   ,   '       �       *   *   ����   8   y   (   )      9   �       4   ;   ����      z       �       +   +   ����   ,   '       �       *   *   ����   8   {   (   )      9   �       4   <   ����      |       �       +   +   ����   ,   '       �       *   *   ����   8   }   (   )      9   �       4   =   ����      ~       �       +   +   ����   ,   '       �       *   *   ����   8      (   )      9   �       4   >   ����      �       �       +   +   ����   ,   '       �       *   *   ����   8   �   (   )      9         conn_count              conns               node_paths              editable_instances              version             RSRC   @tool
extends Node3D

# Set a random color to all objects in the "walls" group.
# To use, attach this script to the "Walls" node.

func _ready():
	var walls = get_tree().get_nodes_in_group("walls")
	for wall in walls:
		var material = StandardMaterial3D.new()
		material.albedo_color = Color(randf(), randf(), randf())

		wall.material_override = material
            [remap]

path="res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res"
        [remap]

path="res://.godot/exported/133200997/export-6f14ea8b2d534ddfbd765f93b763f5ad-split_screen.scn"
       list=Array[Dictionary]([])
     RIFFp  WEBPVP8Ld  /� 8l�F�F���,���'��AD�'��^�����L����n��������	��j�w�U�d�}Gӎ,�"���&�8Idl�ҥ�B��ʾ�8���V��7���|	l �xA���hMAR���� @��0K�%!*���"��Ŀ5i�0pa��	}�]Y������.$�&~�pe\*i)p!4�e�7��*ē�I�9rp"� ����sVֶ��uU�� �l۪����݃�(������m�N�{qO�*j*��2��ݸ�Ó�O rg���@�����Y9�F�͠5Ǥ��٤3�G]�[g%����߆���J�ڇAW�Db����u �V^I���)�v$��/�^ @��D����{4犊�T���g����a��e�<����F˼�vf�B/���6�W=��i��� BPf�vF��� �ha� φ��"�Y{�i���#>w�l"������s���ƂDۘ[���Y<�	OB:v��d�[�Z�F�B ���u���Nf��C�KFa�>��9�ߘ��Sԣ�s�E�.�
 f� �yV!��	�:Lä�ݺ؄�@�^3  ҍ@~�;�N^A�e�Fd�_yft˭�Ĭ�1��̴R&�tF�z�#&y�)����	��@�Q♁r�F�$*��g��w���پ����J���}�ؽ��VCXi����.hI�������A1��n���i1�gt6�{S
^tӱ`���a�a�����J4��H�Ɏg��:��C�@�8ylo;A���! �H�]�J������w�8{�oI�,I�lI,�ҷ����_��E��#�8&��m�#m۶l�~$�r���m۶m��˾N۶��m۶�V1�T��8��G�UI�N��Ѷm�$۶����"̃������܇�qtaH$VS�P�:4fff(�Jp�7��{�H��ڶm[�Km��1q-�5�� 1�`K����-�H�����233�b��[�%&@ Q������O��*`<}��?����k�:��Vrט��:�Yf��{_}�8b6` ,,	���1*u�T�Z�n�d%�G��e�q��I�T@ q�20]�.�$�F��@�`%��`o���X�)�����,r �)�R�L @ �"�{�P62�Ҭ�P�
 ���y���nC۶�{<>�zwk�y#k bD�ȐW2�a������x��Hd2*��Dd��T$�C����qC�x>q�( S�hږ�@W���b���^0��GXw�jF ��� t�ɀ8�Z
 s)vw���K�,��9��/��&SAt��9RO7��y~�n^��M�;�2sf�X��ۉ�/�]0UC]���V=Q�\���x��n��Zsr7E (�]�H���1-7�A*�C (݈���^�3�ˈ*RCD�.��迼y�e��k},ZK�Xa(�.4M_��8�����C�������T���������9Z+���G�V����7@&	��O������	'
�<6,KL,<���u�a9��g��'�@Ds*�F��G�@`o4����mT�w?���tI�\�Bj��*�-���%~\����rǡ��e��y�|��\��|�u���W揼���~�@?A�ᱛ�+��EVrf��'z늯`��B���N>����W�y �UYQ_T�M�m�)��{��i%���jǤ][��.Ӄ�>f>��g#��꟬����$�2͒��ҵ�h_ru��\\/ȕ��߲�Y�A��\Qk2��uNe�
=����?��j+�KV��h�|�1�}��|�|�`�Л��C�"Sg�,��KSz�\.��$�J30�G���	�+�HҌK'��/��)[P�nz����FL�g�������W�Y����ڭ���Lcr�7�H	Ԛ ��Wh��9GF3̧vB��3��ȝ�ʏ��ћ�O����ܶ�1]g6��*����W�%�X	B6����<���e$
�
�#�g����� ������(w����s�,F�=�K+����Ǫ��A��,ǫ&�����h��R��&!v=z�X&�;.�x˓�J��[�I/Q ��$�jw��
��X�) �C�f6]�64�YY�Ĝ�'��'?���YIϕؓ����>�j\÷�S��ղ� �տ�k�]��c��Y$?|�ݱ���dP,ž��4�qP���R�Y��zZ����Ds�o+ x�jk۽�U{ܼ��BݘHn����s;9k����la!��E>�/}s�h캺��Vug�~��� n��������a�q0R=�B���l<���ә�mah�K��c���'��J��i�0RXy9 �2N �r#i%���t��ɩ��q��b�M����H�VA�7^��??��9�M��겆�\B��6
�d[����+-�l�S���G�����8̅ږ��I�Pm"��6k�f/�` �Iα�~<6�En�ډ�Ģ�"P8�5Ū֢y>]"$tѧ<�8ʴ���C��ڳ��F+qS���>��o�[�̬�$�h;w'mo��u�0�C�[�=n�?<4���)���6�)D��Td�K���T��h��{^��1�� O�O�(�!��w�!-��1���y�]����U�U�,F)[=���[�:n������*_������^�5�i ��/7��D����EqD-�t������q�k}��ʰy� �TRE�Q9V��b��g�-�Y9J�в��m��*��˘랹��\�/,��8��Ȋ�s3� ,CVF
7�[��+�Ɯ�� �2Q4Z�-��� ��O9�V�������. ���J \�6��� ��J�T V@�"k�Ij���i=��&ʘ�0��n�ŀp7�/�QYY�(s�-
��$��rBJN�ފ�:̨9� F+*
g
7{��j37���X����U -EbE� ��f�N ���m�Fx������@*�`EAٟL�EҚ��� 2�j��T��ViQ�f�i��s罨=
��mU&]�~�!��R�3g7O������5�3\��������"���z�֟�b�3� �F9@ⱨ����)���7�KOY�C�O �,���v���u�h�oY�4H!��q�j�:��%`I�Xt�	r���PA��s?��opp�H�݀�¬�:gF�N:zIhMo�5����$�X�0J�W�f�Zdr�������|az����P2	�V_<u|i�lj~�s��u��O�)�Y?pZ���|�j>MQ�63x�ʠ/B[�<����RV�TN��Z�O�����pX���J@�ZÁ�<��p'�5�W��Vd=j�(�A�]�FjS�4��ی����O&����En<@PG�b��i
����+�JίBN��I��@%�h�t�8�����R�D*$d��O�XIPъC���Xv��J�I9�O�+_o��!�b5k�ϼ�<�_�}H�-B-����r�S5�$�oƝ���>?<����;��V�Wu�=������v�ͯ/�����Y�4WV�ӊ 3��7�+�<����0��Z��p��\<~h�W����]�����!�=��7��|�m��σ#����J5>8���1Ւ`�� ��"�|���qXz�ՠ�����;6�����n���umi��Y�b���ab)R�L���D0����g�[���+/�%yx0%��6����]����6AX�l���>B �-Q� %�$#.[z�֟��5]>��C�Ť�����í��]3�g����k�v,���M�HuD���[s���w�i� �����??t�@��N�y쪽��T�,2���]w�jm�>d��nك6a���	/��g~ ���ڎ�Zéh����Tu��t����� �"Е���֟#��򕳜Ҟ;u��rݏ]Ө�NԠ���O�,����p�[Nϥ����(;��z,I� sDCB���Б P_��_{|o��0^���&-�Y4��)�6�:�zV��my�����z���!�� �����$ ^�Y���t�w�}�8+�c:�X&�
r>��<	,��b�/�z�)�<r]9��Ej�ʒF���k�{�~@�9#c,���W������~��-�aE2J6�58�xhc
Fj��[Wn�)K��j:]#�yF��4w�|��g{�*O$��9��6>Rx�-cٛ=���!���oU�sx���]����&���klF��r1��[�N�=���oL��7����/��&���b6��Z�&�0�M�����?k1͚>!V*�
Hk����H3N�q�N/��.8u�bA[��A���HS�g�c���io14>�v��w5"؇�K_^Vՙ(#��t?{~^��T&�6:�Z�R�V�mcTQ+D r�}+�m`:�T������L�nW�F�m�����zZڶ7_��P����q�v�����������1�$��eәs�A: Z8�M�kn��>*���^y��h��a�m�s�y4�m:���2KJ��P9d�P���[6n�)�r � E�"�Hel1s�Ej��=sk��2J���֝�5AH��X�v5-�e�>}z����b��O�sSO��_�l/?=Z�Rki�� �D� AZ�����/���o&@��R
K�S��
Ga�����+�p�W���{_6���;,������|q)�1�Ѷ��t�4S�A
� �*^H0gT�Po:U���|9�T���Z�Q��۳��uT_y�6�:y��������O��}���-/	�Ɖ��4wnP���2�3�;,c��]����휈0 ������nU�м-�  8�Y,��T���\��4�QA�y�r18.\��+=����%D�A�,s=���0리���x!��BR!w�Z;�y\z�Rdlq0�3�ގ��/Z�՗JX,IB
H���l ܪ�&�^}����A/f�5��G���m�ק�(���Y����B,IW?Jz{�x���s��9ݽr���$7t�*�Z����鴱��s���)�F9�z^����n������>����eh�c. �B��c�E2�U�2=�!�TKP�h��ϴ�~�����x�{�$P��������i�> <��Z�|��g3qZa�� T����D̊�Ln��4��ci8,�s�_���4}��r��>�[���9lc3�ʰ����;ĕ�B��m��Ăԩ��c�`�DmH�قqf1�j_{[-y|~T#�G�Pq�z�Z(+��҂�$%b	4j�e�*ȖF��@YZCQW>e�Q�mt�$�r�Iˋ+C��P�  P�z���z���{bʔ�9�����f>*@��br���¡
��܇��Z��[`Z	�c���Y �����;NĘT\=��L)���E,�(R���\�����������*��	�[�Ŵ�Z �\��B2@<@� ��;��	��p��-:j�ӹ���~�b4�����oT�(t����!�s�L�B24 N�r�\�)/c*3hh@��ryW��p�b+AZ&�	�� �b��ֻ��d��7	*��x�����O>���ռ�+W����bE�QD����e�f���{�����������H��X.�@$
>��/�x�8��b0��s��zD�!
�o�]N@ `���	��"%
p￈7@0b 1�/�l
KE�q c�#��y� � �5zS�o}_�����* G�	\�" �P*�T���41V�SP����b �Q�vV]�IΫ�2a�&�����x[/�#����� �-H�ԝd�p!�=�Gk�  ��h��;��EВ(���W��y ���e�d?�1��,�#�*�(8q%
��\�$z4�#	*˶�U�uT`y4�Ų�@� ���6.�2(G���ZbΫ�=�Lu�ƥ	@@��D�Q���f����W��E/RE           ��JÌ��T   res://default_env.tresT��jT3R2   res://icon.webp��`��m   res://split_screen.tscn            ECFG      application/config/name         Dynamic Split Screen   application/config/description�      �   This sample project showcases an implementation of dynamic
split screen, also called Voronoi split screen, using the Godot shader language.    application/config/tags,   "         3d     demo    	   official       application/run/main_scene          res://split_screen.tscn    application/config/features   "         4.2    application/config/icon         res://icon.webp    input/move_up_player1h              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       ��   script         input/move_down_player1h              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       �?   script         input/move_left_player1h              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis       
   axis_value       ��   script         input/move_right_player1h              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis       
   axis_value       �?   script         input/move_up_player2�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   I   	   key_label             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       ��   script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device           axis      
   axis_value       ��   script         input/move_down_player2�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   K   	   key_label             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       �?   script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device           axis      
   axis_value       �?   script         input/move_left_player2�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   J   	   key_label             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       ��   script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device           axis       
   axis_value       ��   script         input/move_right_player2�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   L   	   key_label             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       �?   script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device           axis       
   axis_value       �?   script      '   physics/common/physics_ticks_per_second      x   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility4   rendering/textures/vram_compression/import_etc2_astc         J   rendering/lights_and_shadows/directional_shadow/soft_shadow_filter_quality         2   rendering/environment/defaults/default_clear_color        �?  �?  �?  �?'   rendering/anti_aliasing/quality/msaa_3d                        