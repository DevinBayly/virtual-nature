extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var allPoints = []
export var startingHeight = 50
export var deltaHeight =20 
export var generations = 3
export var branches = 4
export var dst = 30

var matl = preload("res://matlines.tres")
var matp = preload("res://matpt.tres")
var plant = load("res://plant.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(branches):
		var p = plant.new()
		p.o = Vector3(0,startingHeight,0)
		var angle = randf()*2*PI
		p.t  = Vector3(cos(angle)*dst,deltaHeight,sin(angle)*dst) + p.o
		p.gen = generations
		p.numBranches = branches
		p.dh = deltaHeight
		p.plantList = allPoints
		p.dst = dst
		p.init()
		allPoints.append(p)

	## now get all of their points and make a point cloud from them
	var vertices = PoolVector3Array()
	for p in allPoints:
		vertices.append(p.o)
		vertices.append(p.t)
		
	## things we need
	# a mesh instance, mesharray, a 7 length array 
	var arr = []
	arr.resize(Mesh.ARRAY_MAX)
	arr[0] = vertices
	var am = ArrayMesh.new()
	am.add_surface_from_arrays(Mesh.PRIMITIVE_POINTS,arr)
	var mi = MeshInstance.new()
	mi.mesh = am
	mi.set_surface_material(0,matp)
	
	add_child(mi)
	var am2 = ArrayMesh.new()
	am2.add_surface_from_arrays(Mesh.PRIMITIVE_LINES,arr)
	var mi2 = MeshInstance.new()
	mi2.mesh = am2
	mi2.set_surface_material(0,matl)
	ResourceSaver.save("res://plant_lines.tres",am2)
	ResourceSaver.save("res://plant_points.tres",am)
	add_child(mi2)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
