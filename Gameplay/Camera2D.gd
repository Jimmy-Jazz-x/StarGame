extends Camera2D

var mouse_start_pos
var screen_start_position
var ZoomSpeed = Vector2(0.1,0.1)
var dragging = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_pressed("Left Click"):
		print("press")
		mouse_start_pos = get_global_mouse_position()
		screen_start_position = get_position()
		dragging = true
	elif Input.is_action_just_released("Left Click"):
		dragging = false
	if InputEventMouseMotion and dragging:
		print(str(get_global_mouse_position()))
		self.position= zoom * (mouse_start_pos - get_global_mouse_position()) + screen_start_position
		
	elif Input.is_action_just_released("Zoom In"):
		zoom += ZoomSpeed
	elif Input.is_action_just_released("Zoom Out"):
		zoom -= ZoomSpeed
