extends Node

class_name Plant
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var o:Vector3
var t:Vector3
var gen
var plantList
var numBranches
var dst
var dh
var plant = load("res://plant.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func init():
	if gen > 0:
		for i in range(numBranches):
			branch()


## note that this should actually be using y where z is or we will be rotated wrong
func branch():
	var dir:Vector3 = t - o
	dir.y = 0
	var heading = atan(dir.z/dir.x)
	var randAngle = randf()*PI/4 - PI/8
	var l = randf()*dst
	var nt = Vector3(t.x + cos(heading + randAngle)*l,t.y + dh,t.z + sin(heading + randAngle)*l)
	var newPlant = plant.new()
	newPlant.gen = gen -1
	newPlant.t = nt
	newPlant.o = t
	newPlant.dst = dst
	newPlant.dh = dh
	newPlant.numBranches = numBranches
	newPlant.plantList = plantList
	plantList.append(newPlant)

	newPlant.init()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
