extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$StarInfoLabel.hide()
	$StarInfoLabel.text = get_meta("StarName") + str(get_meta("IndexNum"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#$StarArea2D/StarCollisionShape2D.get_over
	#get_overlapping_bodies()
	pass


func _on_texture_rect_mouse_entered():
	print("test")
	$StarInfoLabel.show()
	pass # Replace with function body.


func _on_texture_rect_mouse_exited():
	$StarInfoLabel.hide()
	pass # Replace with function body.



func _on_area_2d_body_entered(body):
	print("OVERLAPPING!")
	#position = position + Vector2(randf_range(5,50),randf_range(5,50))
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	print("overlappgone")
	pass # Replace with function body.
	
func set_mass(Mass):
	set_meta("Mass",float(Mass))
	pass

func get_mass():
	return get_meta("Mass")
