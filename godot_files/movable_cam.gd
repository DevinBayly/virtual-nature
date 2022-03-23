extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	var z_dir = $yrot/xrot/Camera.get_camera_transform().basis.z
	var x_dir = $yrot/xrot/Camera.get_camera_transform().basis.x
	if Input.is_action_pressed("ui_up"):
		translate(-z_dir)
	if Input.is_action_pressed("ui_down"):
		translate(z_dir)
	if Input.is_action_pressed("ui_left"):
		translate(-x_dir)
	if Input.is_action_pressed("ui_right"):
		translate(x_dir)
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		event.relative = -event.relative.normalized()*.1
		$yrot.rotate_y(event.relative.x)
		$yrot/xrot.rotate_x(event.relative.y)
