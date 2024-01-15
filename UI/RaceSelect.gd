extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_borg_pressed():
	print("Borg")
	get_tree().change_scene_to_file("res://Gameplay/Map.tscn")
	pass # Replace with function body.


func _on_nanites_pressed():
	print("Nanite")
	get_tree().change_scene_to_file("res://Gameplay/Map.tscn")
	pass # Replace with function body.


func _on_flood_pressed():
	print("Flood")
	get_tree().change_scene_to_file("res://Gameplay/Map.tscn")
	pass # Replace with function body.
