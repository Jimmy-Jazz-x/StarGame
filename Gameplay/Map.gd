extends Node2D
var rng = RandomNumberGenerator.new()
var Star1 = preload("res://SingleStar.tscn")
var Star2 = preload("res://SingleStar.tscn")
var Star3 = preload("res://SingleStar.tscn")
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
			add_child(TheStar)
			i = i + 1




	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

