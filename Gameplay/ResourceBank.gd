extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func get_Resource():
	return get_meta("Mass")
	
func set_Resouce(amount):
	set_meta("Mass",amount)
	$PanelContainer/Panel/tempMass.text = str(get_Resource())
	pass
func add_Resource(amount):
	set_meta("Mass",get_Resource() + amount)
	$PanelContainer/Panel/tempMass.text = str(get_Resource())
	pass
func Spend_Resource(amount):
	if get_Resource() < amount:
		return false
	set_meta("Mass",get_Resource() - amount)
	$PanelContainer/Panel/tempMass.text = str(get_Resource())
	return true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func get_techlvl(string):
	return get_meta(string)
	
func set_techlvl(string,lvl):
	set_meta(string,lvl)
	get_node("PanelContainer/Panel/" + string).text = (str(lvl))
	pass
func buy_techlvl(metaString):
	var lvl = get_meta(metaString)
	

	var cost = (10000*(1+lvl) ** 4)
	if (metaString)==("HotTechLvl") or (metaString)==("ColdTechLvl") or (metaString)==("AcidTechLvl") or (metaString)==("RadsTechLvl"):
		cost = (5000000*(1+lvl) ** 3)
	if Spend_Resource(cost):
		set_techlvl(metaString,lvl+1)
		get_node("PanelContainer/Panel/" + metaString).text = "Level: " + str(lvl+1) + " Cost: " + str(cost)
	
	

func MiningRate(Planet,pop):
	var Rate = 1.00
	if Planet.get_meta("Hot"):
		Rate = Rate + 1.75*get_techlvl("HotTechLvl")
	if Planet.get_meta("Cold"):
		Rate = Rate + 1.75*get_techlvl("ColdTechLvl")
	if Planet.get_meta("Acid"):
		Rate = Rate + 1.75*get_techlvl("AcidTechLvl")
	if Planet.get_meta("Rads"):
		Rate = Rate + 1.75*get_techlvl("RadsTechLvl")
	Rate = Rate * (0.10 * get_techlvl("ProdTechLvl"))
	Rate = Rate * pop
	return Rate

func ReplicationRate(Planet):
	var Rate = 0.1
	if Planet.get_meta("Hot"):
		Rate = Rate + 0.1*get_techlvl("HotTechLvl")
	if Planet.get_meta("Cold"):
		Rate = Rate + 0.1*get_techlvl("ColdTechLvl")
	if Planet.get_meta("Acid"):
		Rate = Rate + 0.1*get_techlvl("AcidTechLvl")
	if Planet.get_meta("Rads"):
		Rate = Rate + 0.1*get_techlvl("RadsTechLvl")
		
	Rate = Rate * (0.2 * get_techlvl("RepTechLvl"))
	return Rate

func TravelRate():
	var Rate = 0.05
	Rate = Rate + 0.025 * get_techlvl("TravelTechLvl")
	return Rate



func _on_cold_button_2_pressed():
	buy_techlvl("ColdTechLvl")
	pass # Replace with function body.


func _on_acid_button_3_pressed():
	buy_techlvl("AcidTechLvl")
	pass # Replace with function body.


func _on_rad_button_4_pressed():
	buy_techlvl("RadsTechLvl")
	pass # Replace with function body.


func _on_hot_button_pressed():
	buy_techlvl("HotTechLvl")
	pass # Replace with function body.


func _on_prod_button_5_pressed():
	buy_techlvl("ProdTechLvl")
	pass # Replace with function body.


func _on_travel_button_6_pressed():
	buy_techlvl("TravelTechLvl")
	pass # Replace with function body.


func _on_rep_button_7_pressed():
	buy_techlvl("RepTechLvl")
	pass # Replace with function body.
