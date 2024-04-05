extends Node3D

var blossoms = [] 

enum STATES {
	stRotating,
	stStatic	
}

const _UNIT_TIME = 0.100

var tick = 0.0
var tock = 0

var phi = PI 

var game_state = STATES.stStatic
var mouse_previous_position = Vector2(0.0,0.0)
var mouse_current_position

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var proto = preload("res://blossom.tscn")
	for i in 1000: 
		var part = proto.instantiate()
		add_child(part)
		blossoms.append(part)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	tick += delta
	if tick > _UNIT_TIME :
		tick = 0.0
		tock += 1
	
	#if tock% 10 == 0 :
	mouse_current_position = get_viewport().get_mouse_position()
	#	print(mouse_current_position)
	var d = mouse_current_position - mouse_previous_position
	
	match game_state:
		STATES.stStatic :
			pass
		STATES.stRotating :
			if Vector2(1.0,0.0).dot(d) < 0 :
				phi -= 0.05
			elif  Vector2(1.0,0.0).dot(d) > 0 :
				phi += 0.05
			else :
				pass
				
	$mouse2.quaternion = Quaternion(0.0,cos(phi * 0.5),0.0,sin(phi * 0.5))
	
	mouse_previous_position = mouse_current_position
	
func _input(e) :
	if e is InputEventMouseButton : 
		if e.button_index == MOUSE_BUTTON_LEFT and e.pressed :
			game_state = STATES.stRotating
		else :
			game_state = STATES.stStatic
