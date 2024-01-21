extends Node2D
var rng = RandomNumberGenerator.new()
var Star1 = preload("res://SingleStar.tscn")
var Star2 = preload("res://SingleStar.tscn")
var Star3 = preload("res://SingleStar.tscn")
var Warpline = preload("res://Gameplay/warp_line.tscn")
var Player = preload("res://Gameplay/player_body_2d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var Number_of_Stars = rng.randi_range(45,80)
	print(Number_of_Stars)

	#for n in range(1,Number_of_Stars):
	#	var Stars = [Star1,Star2,Star3]
	#	var kinds = Stars[randi()% Stars.size()]
	#	var TheStar = kinds.instantiate()
	#	TheStar.position = Vector2(randf_range(-4000,4000),randf_range(-2000,2000))
	#	add_child(TheStar)

	var a = 2;
	var offset = 10;
	var numArms =2;
	var i = 0
	for arm in numArms:
		for p in (Number_of_Stars/numArms):
			var pX = a * p * cos(p+(PI*arm))+(randf()*offset)
			var pY = a * p * sin(p+(PI*arm))+(randf()*offset)
			pX=pX*50
			pY=pY*50
			print(str(pX) + " | " + str(pY))
			var Stars = [Star1,Star2,Star3]
			var kinds = Stars[randi()% Stars.size()]
			var TheStar = kinds.instantiate()
			TheStar.position = Vector2(pX,pY-250)
			TheStar.set_meta("IndexNum",i)
			TheStar.set_meta("StarName",str(randi()))
			TheStar.set_mass(10000000.00)
			$StarMapArea.add_child(TheStar)
			i = i + 1

#Map Generation Create Warp Links
	for child in $StarMapArea.get_children():
		if child is Sprite2D:
			var closest1c
			var closest2c
			var closest3c
			var closest1 = 1000000000000000.0
			var closest2 = 1000000000000000.0
			var closest3 = 1000000000000000.0			
			print(child.get_meta("StarName") +"|" )
			
			if child.get_child_count() < 80:
				var rdi = randi_range(3,3)
				for child2 in $StarMapArea.get_children():

					if child != child2:
						var tempPos = child.position.distance_squared_to(child2.position)
						#print("Looking for Planets")
						#print(str(tempPos))
						if tempPos < closest1:
							closest1 = tempPos
							closest1c = child2
							print("Set1")
						elif tempPos < closest2:
							closest2 = tempPos
							closest2c = child2
							print("Set2")
						elif  tempPos < closest3:
							closest3 = tempPos
							closest3c = child2
							print("Set3")
					#end of Inner For
				print("Ready for Links")
				print(closest1c.get_meta("StarName"))
				print(closest2c.get_meta("StarName"))
				print(closest3c.get_meta("StarName"))
				#child.add_child(newWarp)
				#newWarp.position = child.position
				#draw_line(child.position,closest1c.position,Color.WHITE,80)
				if rdi >=1 and not (child.get_meta("Warp1")) and closest1c.get_meta("NumWarps")!=3:
					var newWarp = Warpline.instantiate()
					newWarp.set_meta("StarLink1",closest1c.name)
					newWarp.set_meta("StarLink2",child.name)
					newWarp.set_meta("StarVector1",closest1c.position)
					newWarp.set_meta("StarVector2",child.position)
					child.add_child(newWarp)
					child.set_meta("Warp1",closest1c.name)
					child.set_meta("NumWarps",1)
					match closest1c.get_meta("NumWarps"):
						0:
							closest1c.set_meta("Warp1",child.name)
							closest1c.set_meta("NumWarps",1)
						1:
							closest1c.set_meta("Warp2",child.name)
							closest1c.set_meta("NumWarps",2)
						2:
							closest1c.set_meta("Warp3",child.name)
							closest1c.set_meta("NumWarps",3)
						
					newWarp.draw
				if rdi >=2 and not (child.get_meta("Warp2")) and closest2c.get_meta("NumWarps")!=3:
					var newWarp = Warpline.instantiate()
					newWarp.set_meta("StarLink1",closest2c.name)
					newWarp.set_meta("StarLink2",child.name)
					newWarp.set_meta("StarVector1",closest2c.position)
					newWarp.set_meta("StarVector2",child.position)
					child.add_child(newWarp)
					child.set_meta("Warp2",closest2c.name)
					child.set_meta("NumWarps",2)
					match closest2c.get_meta("NumWarps"):
						0:
							closest2c.set_meta("Warp1",child.name)
							closest2c.set_meta("NumWarps",1)
						1:
							closest2c.set_meta("Warp2",child.name)
							closest2c.set_meta("NumWarps",2)
						2:
							closest2c.set_meta("Warp3",child.name)
							closest2c.set_meta("NumWarps",3)
						
					newWarp.draw
				if rdi >=3 and not(child.get_meta("Warp3")) and closest3c.get_meta("NumWarps")!=3:
					var newWarp = Warpline.instantiate()
					newWarp.set_meta("StarLink1",closest3c.name)
					newWarp.set_meta("StarLink2",child.name)
					newWarp.set_meta("StarVector1",closest3c.position)
					newWarp.set_meta("StarVector2",child.position)
					child.add_child(newWarp)
					child.set_meta("Warp3",closest3c.name)
					child.set_meta("NumWarps",3)
					match closest3c.get_meta("NumWarps"):
						0:
							closest3c.set_meta("Warp1",child.name)
							closest3c.set_meta("NumWarps",1)
						1:
							closest3c.set_meta("Warp2",child.name)
							closest3c.set_meta("NumWarps",2)
						2:
							closest3c.set_meta("Warp3",child.name)
							closest3c.set_meta("NumWarps",3)
						
					newWarp.draw
					
				
				
				
			
#For each Planet on Map
	#Pick a number 1-3
	#Randomly Select X Nearby Planets
	#Check if Linked already
	#If Not Linked then Add Link Entry to Array for Both Planets
	#Draw Line starting at Planet 1 going to Planet 2
	
	
	Spawn_Player()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _draw() -> void:
	pass

func Spawn_Player():
	var NewPlayer = Player.instantiate()
	$PlayerMapArea.add_child(NewPlayer)
	NewPlayer.Spawn($StarMapArea.get_child(40),10000000)
	$StarMapArea.get_child(40).set_meta("Hot",false)
	$StarMapArea.get_child(40).set_meta("Cold",false)
	$StarMapArea.get_child(40).set_meta("Acid",false)
	$StarMapArea.get_child(40).set_meta("Rads",false)
	pass

	
	
	


func _on_tick_timeout():
	
	print("Tick")
	for Players in $PlayerMapArea.get_children():
		Players.Update()
	if has_won():
		$Tick.stop()
		get_tree().change_scene_to_file("res://UI/win_screen.tscn")
	pass # Replace with function body.


func has_won():
	#check if every planet is exausted
	var won = true
	for child2 in $StarMapArea.get_children():
		if not child2.get_meta("Exausted"):
			won = false
	return won
	
