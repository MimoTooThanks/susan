extends Node3D


func _unhandled_input(event):
  if event.is_action("ui_cancel"):
    get_tree().quit()


func _process(delta):
  $Box.position = Vector3(0, 1, sin(Time.get_ticks_msec()/500.0)*2.5)
  $Camera.look_at($Box.position, Vector3.UP)
  RenderingServer.global_shader_parameter_set('fader_position', $Box.position)
