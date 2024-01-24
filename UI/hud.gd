extends Control
var RB


# Called when the node enters the scene tree for the first time.
func _ready():
	RB = $/root/Map/MasterResourceBank
	pass # Replace with function body.

func Update_Hud():
	
	$PanelContainer1/TechLabel.text = str(RB.get_techlvl("HotTechLvl"))
	$PanelContainer2/TechLabel.text = str(RB.get_techlvl("ColdTechLvl"))
	$PanelContainer3/TechLabel.text = str(RB.get_techlvl("AcidTechLvl"))
	$PanelContainer4/TechLabel.text = str(RB.get_techlvl("RadsTechLvl"))
	$PanelContainer5/TechLabel.text = str(RB.get_techlvl("ProdTechLvl"))
	$PanelContainer6/TechLabel.text = str(RB.get_techlvl("RepTechLvl"))
	$PanelContainer7/TechLabel.text = str(RB.get_techlvl("TravelTechLvl"))
	
	
	$GridContainer/MassLabel2.text = str(thousands_sep(RB.get_Resource()))
	
	$GridContainer/MiningLabel6.text = str(RB.MiningRate($/root/Map/StarMapArea.get_child(40),1)) + " %"
	
	

	var POPCount = 0
	var PCount = 0
	
	for players in $/root/Map/PlayerMapArea.get_children():
		POPCount += players.get_poplation()
	
	for planets in $/root/Map/StarMapArea.get_children():
		if planets.get_meta("Owned"):
			PCount += 1
	
	$GridContainer/PlanetLabel5.text = str(PCount)
	$GridContainer/PopLabel5.text = str(thousands_sep(POPCount))
	
	$GridContainer/RepLabel7.text = str(RB.ReplicationRate($/root/Map/StarMapArea.get_child(40))) + " %"
	$GridContainer/TravelLabel8.text = str(RB.TravelRate()) + " %"
	pass












# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
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

func _on_hot_button_pressed():
	RB.buy_techlvl("HotTechLvl")
	Update_Hud()
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_rad_button_pressed():
	RB.buy_techlvl("RadsTechLvl")
	Update_Hud()
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_cold_button_pressed():
	RB.buy_techlvl("ColdTechLvl")
	Update_Hud()
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_acid_button_pressed():
	RB.buy_techlvl("AcidTechLvl")
	Update_Hud()
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_prod_button_pressed():
	RB.buy_techlvl("ProdTechLvl")
	Update_Hud()
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_rep_button_pressed():
	RB.buy_techlvl("RepTechLvl")
	Update_Hud()
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_travel_button_pressed():
	RB.buy_techlvl("TravelTechLvl")
	Update_Hud()
	$AudioStreamPlayer.play()
	pass # Replace with function body.
