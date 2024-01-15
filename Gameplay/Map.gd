extends Node2D
var rng = RandomNumberGenerator.new()
var Star1 = preload("res://SingleStar.tscn")
var Star2 = preload("res://SingleStar.tscn")
var Star3 = preload("res://SingleStar.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var Number_of_Stars = rng.randi_range(20,40)
	print(Number_of_Stars)

	for n in range(1,Number_of_Stars):
		var Stars = [Star1,Star2,Star3]
		var kinds = Stars[randi()% Stars.size()]
		var TheStar = kinds.instantiate()
		TheStar.position = Vector2(randf_range(-4000,4000),randf_range(-2000,2000))
		add_child(TheStar)

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

