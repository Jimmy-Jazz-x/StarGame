extends CharacterBody2D
var Player = preload("res://Gameplay/player_body_2d.tscn")
const PopulationLoss = 50000
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


func get_poplation():
	return get_meta("Population")
func set_poplation(Bots):
	set_meta("Population",Bots)
	$PopLabel.text = str(thousands_sep(int(Bots)))
	pass
func replicate():
	if not get_node(str("/root/Map/StarMapArea/" + get_meta("StarName"))).Is_Exausted():
		set_poplation(get_poplation() * \
		(1+$/root/Map/MasterResourceBank.ReplicationRate(get_node(str("/root/Map/StarMapArea/" + get_meta("StarName"))))))
	pass


func Spawn(Location,Pop):
	#Put the player at the spwn location
	position = Location.position
	set_meta("StarName",Location.name)
	Location.set_meta("Owned",true)
	set_poplation(Pop)
	pass
	
func Upgrade():
	#Change Player stats
	pass
	
func attempt_Spread():
	#Check all linked nodes and compute spread chance
	var links = get_node(str("/root/Map/StarMapArea/" + get_meta("StarName")))
	print(links.name)
	for k in links.get_meta("NumWarps"):
		print(str(links.get_meta("NumWarps"))+"/"+str(k))
		match k:
			0:
				print("1")
				if Spreadable(links.get_parent().get_node(str(links.get_meta("Warp1")))):
					Spread(links.get_parent().get_node(str(links.get_meta("Warp1"))))
			1:
				print("2")
				if Spreadable(links.get_parent().get_node(str(links.get_meta("Warp2")))):
					Spread(links.get_parent().get_node(str(links.get_meta("Warp2"))))
			2:
				print("3")
				if Spreadable(links.get_parent().get_node(str(links.get_meta("Warp3")))):
					Spread(links.get_parent().get_node(str(links.get_meta("Warp3"))))
		# get the starts from the warps
		#Check if Spread is Possible
		#If possible Roll for spread
		#if Spread then Call Spread
	#Next for
	pass
	
func Spread(Desitination):
	#once Spread is scessful then actually spread by making a copy of the planet
	#print("SPREADING! HYPE!")
	#spend Required Mass
	$/root/Map/MasterResourceBank.Spend_Resource(Desitination.get_meta("MassRequired"))
	Remove_Populace()
	var NewPlayer = Player.instantiate()
	get_parent().add_child(NewPlayer)
	NewPlayer.Spawn(Desitination,PopulationLoss*$/root/Map/MasterResourceBank.TravelRate())
	
	if get_parent().get_child_count() == 1:
		$/root/Map.TriggerStory(3)
	pass

func Update():
	print(name + ":Updating Now")
	attempt_Spread()
	MinePlanet()
	replicate()
	pass
	
func Spreadable(StarObject):
	var fail = false
	if StarObject == null:
		return false
	if StarObject.get_meta("Owned"):
		return false
	if StarObject.get_meta("Hot"):
		if $/root/Map/MasterResourceBank.get_techlvl("HotTechLvl") == 0:
			print("TOO HOT")
			fail = true
	if StarObject.get_meta("Cold"):
		if $/root/Map/MasterResourceBank.get_techlvl("ColdTechLvl") == 0:
			print("TOO COLD")
			fail = true
	if StarObject.get_meta("Acid"):
		if $/root/Map/MasterResourceBank.get_techlvl("AcidTechLvl") == 0:
			print("TOO STINKY")
			fail = true
	if StarObject.get_meta("Rads"):
		if $/root/Map/MasterResourceBank.get_techlvl("RadsTechLvl") == 0:
			print("TOO RADIATIONY")
			fail = true
	
	if $/root/Map/MasterResourceBank.get_Resource() <= StarObject.get_meta("MassRequired"):
		print("TOO POOR")
		fail = true
	if not Check_Population(PopulationLoss):
		fail = true
		
	if fail == true:
		return false
	
	return true


func MinePlanet():
	var Planet = get_node(str("/root/Map/StarMapArea/" + get_meta("StarName")))
	if not Planet.Is_Exausted():
		#Get amount to remove
		var Amount = $/root/Map/MasterResourceBank.MiningRate(Planet,get_poplation())
		#remove Planet Mass
		Planet.Remove_mass(Amount)
		#add Resources To Pool
		$/root/Map/MasterResourceBank.add_Resource(Amount)
	pass

func Check_Population(Amount):
	if get_meta("Population") < PopulationLoss:
		return false
	return true
	
func Remove_Populace():
	if Check_Population(PopulationLoss):
		set_poplation((get_poplation()-PopulationLoss))
	pass





func _physics_process(_delta):
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
static func thousands_sep(number, prefix=''):
	number = int(number)
	var neg = false
	if number < 0:
		number = -number
		neg = true
	var string = str(number)
	var mod = string.length() % 3
	var res = ""
	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += ","
		res += string[i]
	if neg: res = '-'+prefix+res
	else: res = prefix+res
	return res
