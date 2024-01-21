extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$PanelContainer.hide()
	$PanelContainer/StarInfoLabel.text = get_meta("StarName") + str(get_meta("IndexNum"))
	var d100 = randi_range(0,99)
	if d100 >=0 and  d100 <25:
		set_meta("Hot",true)
		$PanelContainer/StarInfoLabel.text = $PanelContainer/StarInfoLabel.text + "\nHot"
	if d100 >=25 and  d100 <50:
		set_meta("Cold",true)
		$PanelContainer/StarInfoLabel.text = $PanelContainer/StarInfoLabel.text + "\nCold"
	if d100 >=50 and  d100 <75:
		set_meta("Acid",true)
		$PanelContainer/StarInfoLabel.text = $PanelContainer/StarInfoLabel.text + "\nAcid"
	if d100 >=75 and  d100 <90:
		set_meta("Rads",true)
		$PanelContainer/StarInfoLabel.text = $PanelContainer/StarInfoLabel.text + "\nRads"
	if d100 >=90 and  d100 <92:
		set_meta("Hot",true)
		set_meta("Rads",true)
		$PanelContainer/StarInfoLabel.text = $PanelContainer/StarInfoLabel.text + "\nRads\nHot"
	if d100 >=92 and  d100 <95:
		set_meta("Hot",true)
		set_meta("Acid",true)
		$PanelContainer/StarInfoLabel.text = $PanelContainer/StarInfoLabel.text + "\nAcid\nHot"
	if d100 >=95 and  d100 <97:
		set_meta("Acid",true)
		set_meta("Cold",true)
		$PanelContainer/StarInfoLabel.text = $PanelContainer/StarInfoLabel.text + "\nAcid\nCold"
	if d100 >=97 and  d100 <100:
		set_meta("Rads",true)
		set_meta("Cold",true)
		$PanelContainer/StarInfoLabel.text = $PanelContainer/StarInfoLabel.text + "\nRads\nCold"
	
	PickImage()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#$StarArea2D/StarCollisionShape2D.get_over
	#get_overlapping_bodies()
	pass


func _on_texture_rect_mouse_entered():
	#print("test")
	#$PanelContainer.show()
	pass # Replace with function body.


func _on_texture_rect_mouse_exited():
	#$PanelContainer.hide()
	pass # Replace with function body.



func _on_area_2d_body_entered(_body):
	#print("OVERLAPPING!")
	#position = position + Vector2(randf_range(5,50),randf_range(5,50))
	pass # Replace with function body.


func _on_area_2d_body_exited(_body):
	#print("overlappgone")
	pass # Replace with function body.
	
func set_mass(Mass):
	set_meta("Mass",float(Mass))
	pass

func get_mass():
	return get_meta("Mass")

func Is_Exausted():
	return get_meta("Exausted")
	
func Remove_mass(Amount):
	if get_meta("Mass") >= Amount:
		set_mass(get_meta("Mass") - Amount)
		return Amount
	elif Is_Exausted():
		return 0
	else:
		Amount = get_mass()
		set_mass(0)
		set_meta("Exausted",true)
		return Amount
	
		



func PickImage():
	var Hot = get_meta("Hot")
	var Cold = get_meta("Cold")
	var Acid = get_meta("Acid")
	var Rad = get_meta("Rads")
	var array
	var Exausted = get_meta("Exausted")
	var node
	
	if Acid and not Hot and not Cold and not Rad:
		node = "res://Textures/Acid Node.png"
		array = ([
		"res://Textures/Planets/Acid 1.png",
		"res://Textures/Planets/Acid 2.png",
		"res://Textures/Planets/Acid 3.png"])
	elif Acid and not Hot and not Cold and Rad:
		node = "res://Textures/Acid Radiation Node.png"
		array = ([
		"res://Textures/Planets/Acid Radiation.png"])
	elif not Acid and not Hot and Cold and not Rad:
		node = "res://Textures/Cold Node.png"
		array = ([
		"res://Textures/Planets/Ice 1.png",
		"res://Textures/Planets/Ice 2.png",
		"res://Textures/Planets/Ice 3.png",
		"res://Textures/Planets/Ice 4.png",
		"res://Textures/Planets/Ice 5.png",
		"res://Textures/Planets/Ice 6.png"])
	elif Acid and not Hot and Cold and not Rad:
		node = "res://Textures/Cold Acid Node.png"
		array = ([
		"res://Textures/Planets/Ice Acid.png"])
	elif not Acid and not Hot and Cold and Rad:
		node = "res://Textures/Cold Radiation Node.png"
		array = ([
		"res://Textures/Planets/Ice Radiation.png"])
	elif not Acid and Hot and not Cold and not Rad:
		node = "res://Textures/Hot Node.png"
		array = ([
		"res://Textures/Planets/Lava 1.png",
		"res://Textures/Planets/Lava 2.png",
		"res://Textures/Planets/Lava 3.png",
		"res://Textures/Planets/Lava 4.png",
		"res://Textures/Planets/Lava 5.png",
		"res://Textures/Planets/Lava 6.png"])
	elif Acid and Hot and not Cold and not Rad:
		node = "res://Textures/Hot Acid Node.png"
		array = ([
		"res://Textures/Planets/Lava Acid.png"])
	elif not Acid and Hot and Cold and not Rad:
		node = "res://Textures/Hot Cold Node.png"
		array = ([
		"res://Textures/Planets/Lava Ice.png"])
	elif not Acid and Hot and not Cold and Rad:
		node = "res://Textures/Hot Radiation Node.png"
		array = ([
		"res://Textures/Planets/Lava Radiation.png"])
	elif not Acid and not Hot and not Cold and not Rad:
		node = "res://Textures/Node1.png"
		array = ([
		"res://Textures/Planets/Normal 1.png",
		"res://Textures/Planets/Normal 2.png",
		"res://Textures/Planets/Normal 3.png",
		"res://Textures/Planets/Normal 4.png",
		"res://Textures/Planets/Normal 5.png",
		"res://Textures/Planets/Normal 6.png",
		"res://Textures/Planets/Normal 7.png"])
	elif not Acid and not Hot and not Cold and Rad:
		node = "res://Textures/Radiation Node.png"
		array = ([
		"res://Textures/Planets/Radiation 1.png",
		"res://Textures/Planets/Radiation 2.png",
		"res://Textures/Planets/Radiation 3.png"])
		
	var picture = array[randi() % array.size()]
		
	#$Button.texture_normal = load(node)
	$TextureButton.texture_normal = load(node)
	$PanelContainer/PlanetPicRectangle.texture = load(picture)
		
	"res://Textures/Planets/Asteroid.png"
	"res://Textures/Planets/Black Hole.png"
	"res://Textures/Planets/Pulsar.png"



func _on_texture_button_pressed():
	if $PanelContainer.is_visible():
		$PanelContainer.hide()
	else:
		$PanelContainer.show()
	pass
