extends Node2D
var rng = RandomNumberGenerator.new()
var Star1 = preload("res://SingleStar.tscn")
var Star2 = preload("res://SingleStar.tscn")
var Star3 = preload("res://SingleStar.tscn")
var Warpline = preload("res://Gameplay/warp_line.tscn")
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
				var rdi = randi_range(1,3)
				for child2 in $StarMapArea.get_children():

					if child != child2:
						var tempPos = child.position.distance_squared_to(child2.position)
						print("Looking for Planets")
						print(str(tempPos))
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
				var newWarp = Warpline.instantiate()
				newWarp.position = child.position
				newWarp.set_meta("Star Link 1",closest1c.get_meta("StarName"))
				newWarp.set_meta("Star Link 2",child.get_meta("StarName"))
				child.add_child(newWarp)
				#if rdi >=1 :
					
				#if rdi >=2 :
					
				#if rdi >=3 :
					
				
				
				
			
#For each Planet on Map
	#Pick a number 1-3
	#Randomly Select X Nearby Planets
	#Check if Linked already
	#If Not Linked then Add Link Entry to Array for Both Planets
	#Draw Line starting at Planet 1 going to Planet 2
	
	


	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

