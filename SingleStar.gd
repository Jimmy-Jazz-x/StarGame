extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$StarInfoLabel.hide()
	$StarInfoLabel.text = get_meta("StarName") + str(get_meta("IndexNum"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_texture_rect_mouse_entered():
	print("test")
	$StarInfoLabel.show()
	pass # Replace with function body.


func _on_texture_rect_mouse_exited():
	$StarInfoLabel.hide()
	pass # Replace with function body.

