extends MeshInstance
tool

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = $"../AnimationPlayer".current_animation_position
	transform.origin = Vector3(x,0,0)
	pass
