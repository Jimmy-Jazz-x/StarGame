extends Camera2D

var mouse_start_pos
var screen_start_position
var ZoomSpeed = Vector2(0.04,0.04)
var MoveSpeed = 20
var mouse_starting_position
var starting_position
var is_dragging = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):


	if Input.is_action_just_released("Zoom In"):
		zoom += ZoomSpeed
		#self.position = get_global_mouse_position()
	elif Input.is_action_just_released("Zoom Out"):
		zoom -= ZoomSpeed
		#self.position = get_global_mouse_position()
		
		
	if Input.is_action_pressed("CamUp"):
		self.position += Vector2(0,-20)
	if Input.is_action_pressed("CamDown"):
		self.position += Vector2(0,20)
	if Input.is_action_pressed("CamLeft"):
		self.position += Vector2(-20,-0)
	if Input.is_action_pressed("CamRight"):
		self.position += Vector2(20,0)
		
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			starting_position = position
			mouse_starting_position = event.position
			is_dragging = true
		else: 
			is_dragging = false
	if event is InputEventMouseMotion and is_dragging:
		print(str(zoom))
		position = starting_position - zoom * (event.position - mouse_starting_position)
