extends Camera2D

var mouse_start_pos
var screen_start_position
var ZoomSpeed = Vector2(0.1,0.1)
var MoveSpeed = 20
var dragging = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if Input.is_action_pressed("Left Click"):
		print("press")
		mouse_start_pos = get_global_mouse_position()
		screen_start_position = get_position()
		dragging = true
	elif Input.is_action_just_released("Left Click"):
		dragging = false
	if InputEventMouseMotion and dragging:
		print(str(get_global_mouse_position()))
		self.position = (mouse_start_pos - get_global_mouse_position()) + screen_start_position
		
	elif Input.is_action_just_released("Zoom In"):
		zoom += ZoomSpeed
		self.position = get_global_mouse_position()
	elif Input.is_action_just_released("Zoom Out"):
		zoom -= ZoomSpeed
		self.position = get_global_mouse_position()
		
		
	if Input.is_action_pressed("CamUp"):
		self.position += Vector2(0,-20)
	if Input.is_action_pressed("CamDown"):
		self.position += Vector2(0,20)
	if Input.is_action_pressed("CamLeft"):
		self.position += Vector2(-20,-0)
	if Input.is_action_pressed("CamRight"):
		self.position += Vector2(20,0)
