extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _draw():
	draw_line(Vector2(0,0),(get_meta("StarVector1") - get_meta("StarVector2")),Color.WHITE_SMOKE,4)
	pass

func get_link1():
	return get_meta("StarLink1")


func get_link2():
	return get_meta("StarLink2")
