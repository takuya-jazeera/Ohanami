extends MeshInstance3D

var my_mat
var tex
var tex2
var t = 0.0
var s = 0.0
var blossoms = []

# Called when the node enters the scene tree for the first time.
func _ready():
	my_mat = preload("res://shd.tres")	
	tex = preload("res://Textures/icon.svg")
	tex2 = preload("res://Textures/cherry.jpg")
	my_mat.set_shader_parameter("tex",tex)
	my_mat.set_shader_parameter("tex2",tex2)		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
		
	material_override = my_mat
	material_override.set_shader_parameter("val",t)
