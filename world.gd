extends Node3D

var im_a_noob := true

func _unhandled_input(event):
	if event.is_action("ui_cancel"):
		get_tree().quit()

func _process(delta):
	$Box.position = Vector3(2+cos(Time.get_ticks_msec()/1000.0)*4, 2, sin(Time.get_ticks_msec()/1000.0)*7)
	$Camera.look_at($Box.position, Vector3.UP)
	
	if ($Camera/Ray.is_colliding()):
		RenderingServer.global_shader_parameter_set('fader_position', $Camera/Ray.get_collision_point())
		if(im_a_noob):
			im_a_noob = false
			$Wall/Show.play("show")
	else:
		if(!im_a_noob):
			im_a_noob = true
			$Wall/Show.play_backwards("show")
