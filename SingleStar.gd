extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$StarInfoLabel.hide()
	$StarInfoLabel.text = get_meta("StarName") + str(get_meta("IndexNum"))
	var d100 = randi_range(0,99)
	if d100 >=0 and  d100 <25:
		set_meta("Hot",true)
		$StarInfoLabel.text = $StarInfoLabel.text + "\nHot"
	if d100 >=25 and  d100 <50:
		set_meta("Cold",true)
		$StarInfoLabel.text = $StarInfoLabel.text + "\nCold"
	if d100 >=50 and  d100 <75:
		set_meta("Acid",true)
		$StarInfoLabel.text = $StarInfoLabel.text + "\nAcid"
	if d100 >=75 and  d100 <90:
		set_meta("Rads",true)
		$StarInfoLabel.text = $StarInfoLabel.text + "\nRads"
	if d100 >=90 and  d100 <92:
		set_meta("Hot",true)
		set_meta("Rads",true)
		$StarInfoLabel.text = $StarInfoLabel.text + "\nRads\nHot"
	if d100 >=92 and  d100 <95:
		set_meta("Hot",true)
		set_meta("Acid",true)
		$StarInfoLabel.text = $StarInfoLabel.text + "\nAcid\nHot"
	if d100 >=95 and  d100 <97:
		set_meta("Acid",true)
		set_meta("Cold",true)
		$StarInfoLabel.text = $StarInfoLabel.text + "\nAcid\nCold"
	if d100 >=97 and  d100 <100:
		set_meta("Rads",true)
		set_meta("Cold",true)
		$StarInfoLabel.text = $StarInfoLabel.text + "\nRads\nCold"
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#$StarArea2D/StarCollisionShape2D.get_over
	#get_overlapping_bodies()
	pass


func _on_texture_rect_mouse_entered():
	print("test")
	$StarInfoLabel.show()
	pass # Replace with function body.


func _on_texture_rect_mouse_exited():
	$StarInfoLabel.hide()
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
	
		
