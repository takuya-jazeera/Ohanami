extends Node3D

var axis
var t = 0.0
var w = 0.0
var h
var offset = Vector3(0.0,0.0,0.0)
var base = Vector3(0.0,0.0,0.0)
var phase = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	axis = Vector3(randf(),randf(),randf())
	axis = axis.normalized()
	base = Vector3(randf() * 5.0 - 2.5 , - 1.5,randf() * 5.0 - 2.5)
	w = randf() 
	h = randf() * 3.0
	phase = randf() * PI * 2.0
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	quaternion = Quaternion(axis.x * cos(t + phase),axis.y * cos(t + phase),
							 axis.z * cos(t + phase), sin(t + phase))

	offset = Vector3(w*sin(t + phase),h,0.0)
	position = base + offset
	h -= 0.01
	t += delta
	
	if h < 0.0 : 
		h = 3.0
		w = randf() * 1.0
		phase = randf() * PI * 2.0
	pass
