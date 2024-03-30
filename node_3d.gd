extends Node3D

var blossoms = [] 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var proto = preload("res://blossom.tscn")
	for i in 1000: 
		var part = proto.instantiate()
		add_child(part)
		blossoms.append(part)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
