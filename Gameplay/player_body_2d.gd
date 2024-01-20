extends CharacterBody2D


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func Spawn(Location):
	#Put the player at the spwn location
	position = Location.position
	set_meta("StarName",Location.name)
	pass
	
func Upgrade():
	#Change Player stats
	pass
	
func attempt_Spread():
	#Check all linked nodes and compute spread chance
	for links in get_node(get_meta("StarName")).get_children():
		print(links.name)
		#for each child in star
		#get only the warps
		# get the starts from the warps
		#Check if Spread is Possible
		#If possible Roll for spread
		#if Spread then Call Spread
	#Next for
	pass
	
func Spread(Desitination):
	#once Spread is scessful then actually spread by making a copy of the planet
	pass

func Update():
	print(name + ":Updating Now")
	
	pass
	















func _physics_process(delta):
	pass
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
