extends Spatial

export var scaleNum=.03
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var aabb = $ground.get_transformed_aabb()
onready var plant = load("res://plant.tscn")
# Called when the node enters the scene tree for the first time.

func doThing(res):
	##print(res)
	## make instance of plant
	var plant_instance = plant.instance()
	plant_instance.translate(res)
	plant_instance.scale_object_local(Vector3(scaleNum,scaleNum,scaleNum))
	add_child(plant_instance)
	
var plants_number = 500


func _physics_process(delta):
	if plants_number > 0:
		plants_number -=1
		var state = get_world().direct_space_state
		var xz = Vector3(randf(),0,randf())*aabb.size + aabb.position
		var from = Vector3(xz.x,100,xz.z)
		var to = Vector3(xz.x,-100,xz.z)
		var result = state.intersect_ray(from,to)
		doThing(result.position)
	
	
