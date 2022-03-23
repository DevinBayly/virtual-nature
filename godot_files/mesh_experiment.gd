extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var mat = preload("res://example_point_material.tres")

var vertices = PoolVector3Array()
# Called when the node enters the scene tree for the first time.
func _ready():
	var arr = []
	arr.resize(Mesh.ARRAY_MAX)
	print(Mesh.ARRAY_MAX)

	var number_of_points = 100
	for n in range(number_of_points):
		var vertex = Vector3(randf()*5-2.5,randf()*5-2.5,randf()*5-2.5)
		vertices.append(vertex)
	arr[0] =vertices 
	var array_mesh = ArrayMesh.new()
	array_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_POINTS,arr)
	var mesh_instance = MeshInstance.new()

	mesh_instance.mesh = array_mesh
	mesh_instance.set_surface_material(0,mat)


	add_child(mesh_instance)
	
	# or we can use Mesh.ARRAY_VERTEX
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
