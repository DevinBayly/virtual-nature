extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func make_mesh():
	var arr = []
	arr.resize(Mesh.ARRAY_MAX)
	var vertx = PoolVector3Array()
	for i in range(20):
		vertx.append(Vector3(randf()*2,randf()*2,randf()*2))
		randomize()	
	
	arr[0 ] = vertx
	var mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINES,arr)
	var mi = MeshInstance.new()
	mi.mesh = mesh
	add_child(mi)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	make_mesh()
	pass # Replace with function body.

var i = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i += delta
	if i > 1 :
		i = 0
		make_mesh()
	pass
