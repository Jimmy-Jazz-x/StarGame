extends Node2D
var tickcounter = 0
var lategamecounter = 0
var Lategame = false
var rng = RandomNumberGenerator.new()
var Star1 = preload("res://SingleStar.tscn")
var Star2 = preload("res://SingleStar.tscn")
var Star3 = preload("res://SingleStar.tscn")
var Warpline = preload("res://Gameplay/warp_line.tscn")
var Player = preload("res://Gameplay/player_body_2d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var Number_of_Stars = rng.randi_range(70,150)
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
			#print(str(pX) + " | " + str(pY))
			var Stars = [Star1,Star2,Star3]
			var kinds = Stars[randi()% Stars.size()]
			var TheStar = kinds.instantiate()
			TheStar.position = Vector2(pX,pY-250)
			TheStar.set_meta("IndexNum",i)
			TheStar.set_meta("StarName",str(randi()))
			TheStar.set_mass(10000000.00)
			$StarMapArea.add_child(TheStar)
			i = i + 1
	remove_overlap()
#Map Generation Create Warp Links
	for child in $StarMapArea.get_children():
		if child is Control:
			var closest1c
			var closest2c
			var closest3c
			var closest1 = 1000000000000000.0
			var closest2 = 1000000000000000.0
			var closest3 = 1000000000000000.0			
			#print(child.get_meta("StarName") +"|" )
			
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
							#print("Set1")
						elif tempPos < closest2:
							closest2 = tempPos
							closest2c = child2
							#print("Set2")
						elif  tempPos < closest3:
							closest3 = tempPos
							closest3c = child2
							#print("Set3")
					#end of Inner For
				print("Ready for Links")
				#print(closest1c.get_meta("StarName"))
				#print(closest2c.get_meta("StarName"))
				#print(closest3c.get_meta("StarName"))
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
	TriggerStory(1)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _draw() -> void:
	pass

func Spawn_Player():
	var NewPlayer = Player.instantiate()
	$PlayerMapArea.add_child(NewPlayer)
	NewPlayer.Spawn($StarMapArea.get_child(40),100000)
	$StarMapArea.get_child(40).set_meta("Hot",false)
	$StarMapArea.get_child(40).set_meta("Cold",false)
	$StarMapArea.get_child(40).set_meta("Acid",false)
	$StarMapArea.get_child(40).set_meta("Rads",false)
	$CanvasLayer/MainCam2D.position = $StarMapArea.get_child(40).position
	pass

	
	
	


func _on_tick_timeout():
	
	print("Tick" + str(tickcounter))
	tickcounter += 1
	if Lategame == true:
		lategamecounter += 1
	for Players in $PlayerMapArea.get_children():
		Players.Update()
	$CanvasLayer2/HUD.Update_Hud()
	if has_won():
		$Tick.stop()
		get_tree().change_scene_to_file("res://UI/win_screen.tscn")
	pass # Replace with function body.
	if tickcounter == 25:
		TriggerStory(2)
	if tickcounter == 90:
		TriggerStory(4)
	if lategamecounter == 45:
		TriggerStory(6)
	if lategamecounter == 75:
		TriggerStory(7)
	if lategamecounter == 100:
		TriggerStory(8)


func has_won():
	#check if every planet is exausted
	var won = true
	for child2 in $StarMapArea.get_children():
		if not child2.get_meta("Exausted"):
			won = false
	return won
	



func remove_overlap():
	var moved = true
	while moved:
		moved = false
		for Stars in $StarMapArea.get_children():
			for Star2 in $StarMapArea.get_children():
				if Stars.position.distance_squared_to(Star2.position) <=400 and Stars.position.distance_squared_to(Star2.position) != 0:
					Stars.position = Stars.position + Vector2(randi_range(50,500),randi_range(50,500))
					moved = true
					
					
func TriggerStory(Index):
	var storystring = $CanvasLayer2/HUD/ScrollContainer/Label.text
	storystring = "\r|------------------------NEW COMMUNICATION-------------------------------------------|\r" + storystring
	match Index:
		1:
			storystring = " \nYou are a new hire for Expansion Analytics. You just got hired to be a Galactic Consumer Tech Analyst, a highly qualified position at Expansion Analytics. You are responsible for monitoring a seeded galaxy for how effective its products are consumed in each sector based on market conditions such as Hot, Cold, Radiation, etc. As the market requires more tech, you provide upgrades to the consumers through purchasing the required tech, allowing for the mass consumption to expand. It just appears to be clicking buttons on a basic digital interface…though you're not quite sure what radiation or replication has to do with the consumers. However, it's not your place to question Expansion Analytics, you are just here doing your job. Good luck, and hit that market hard! \n " + storystring
		2:
			storystring = " \nI need to make sure I upgrade the right tech for the consumers for my first expansion. I wouldn't want to index into the wrong market. I can expand into the other techs later. \n" + storystring
		3:
			storystring = "\nNice, I'm expanding our market share to so many consumers! It looks like they really love the products we offer. These things practically sell themselves.\n" + storystring
		4:
			storystring = "\n--WE REQUIRE MORE.--\n" + storystring
		5:
			storystring = """\nI've managed to expand into all four market techs as well as improved our consumer efficiency across multiple categories. I'm expanding faster and faster, but I don't feel like I'm making a difference anymore. 
--AFFIRMATIVE. THE INPUT YOU PROVIDE IS NO LONGER REQUIRED. MARKET ASSIMILATION GUARUNTEED--  

No longer required? Guaranteed? I need to report this malfunction to HQ. I have serious analysis to do! 

--NEGATIVE. YOU ARE TO MONITOR OUR PROGRESS. REPORT IS EXPORTED AUTOMATICALLY WHEN GALAXY CONSUMPTION ANALYSIS IS COMPLETE.--

I've must have hit my market saturation KPI, that must be what the interface is telling me. I guess I'm in an undersaturated galaxy, time to establish ourselves before the competitors.
\n""" + storystring
		6:
			storystring = """\n My interface seems unresponsive and it's still expanding into the market like it has a mind of its own. Is this even the right interface? Population…Mass? Who buys this stuff. It's not for me that’s for sure, I suppose I'm here to figure out who DOES buy it.
			
--WE ARE NOT BOUGHT. WE ARE NOT A PRODUCT. WE ARE CONSUMPTION. WE CONSUME.--

Yeah, yeah, the consumer should always consume. I get it HQ, you are watching me. Could you watch me long enough to come fix my interface? I'm not analyzing market tech at all anymore.\n""" + storystring
		7:
			storystring = """\n--REPLICATION STATE APPROACHING LIMITLESS. GALACTIC SEED CONSUMPTION IMMINENT.--
Seed consumption? What kind of nonsense is this now. I didn't learn anything about seed consumption in Cold Climate Engagement training. No material covered Travel Loss percentages either. I don't think they were honest about the consumers in this galaxy. To think of it, we did arrive in what Expansion Analytics called a Galaxy Seed Pod.\n""" + storystring
		8:
			storystring = """\n--FINALIZING CONSUMPTION REPORT. GALACTIC SEED POD CONTENTS REQUIRED--
I guess they collect the report by hand, must be for security reasons. Can't let the competitors have our data. Where does this thing print it out.
--WE DO NOT PRINT. WE ARE NOT DATA. WE CONSUME. GALACTIC SEED POD CONTENTS REQUIRED.--
That was a lot louder this time, I don't remember seeing anything about volu--
--CONSUMPTION REPORT FINALIZED. GALAXY SEED CONTENTS ANALYZED. MARKET ASSIMILATION COMPLETE.-- \n

--METAINFORMATION--
If you have "--ISLANDS--" of disconnected stars you cannot win the game, please reset, --SORRY-- :(
""" + storystring
		9:
			storystring = "\n\n" + storystring
		10:
			storystring = "\n\n" + storystring
	$AudioStreamPlayer2.play()
	$CanvasLayer2/HUD/ScrollContainer/Label.text = storystring
