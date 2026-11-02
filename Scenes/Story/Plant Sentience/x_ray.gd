extends Node2D

var timer = 0

var Health_Points = 0
var Mean_Divided_Value = 10

var Nit_Points = 0
var Pho_Points = 0
var Pot_Points = 0
var Cal_Points = 0
var Mag_Points = 0
var Sul_Points = 0
var Chi_Points = 0
var Hyd_Points = 0
var Ins_Points = 0
var Hem_Points = 0

var Nit = 0 # What it looks like
var Nit_Base = 0 # Base
var Nit_add = 0 # The amount that makes it look like it changes
var Nit_bool = false # A boolian that changes if Nit_add increases or decreases
var Nit_var = randi_range(50,100) + 1 # The random variation that the code can increase and decrease to
var Pho = 0
var Pho_Base = 0
var Pho_add = 0
var Pho_bool = false
var Pho_var = randi_range(50,100) + 1
var Pot = 0
var Pot_Base = 0
var Pot_add = 0
var Pot_bool = false
var Pot_var = randi_range(50,100) + 1
var Cal = 0
var Cal_Base = 0
var Cal_add = 0
var Cal_bool = false
var Cal_var = randi_range(50,100) + 1
var Mag = 0
var Mag_Base = 0
var Mag_add = 0
var Mag_bool = false
var Mag_var = randi_range(50,100) + 1
var Sul = 0
var Sul_Base = 0
var Sul_add = 0
var Sul_bool = false
var Sul_var = randi_range(50,100) + 1
var Chi = 0
var Chi_Base = 0
var Chi_add = 0
var Chi_bool = false
var Chi_var = randi_range(50,100) + 1
var Hyd = 0
var Hyd_Base = 0
var Hyd_add = 0
var Hyd_bool = false
var Hyd_var = randi_range(50,100) + 1
var Ins = 0
var Ins_Base = 0
var Ins_add = 0
var Ins_bool = false
var Ins_var = randi_range(50,100) + 1
var Hem = 0
var Hem_Base = 0
var Hem_add = 0
var Hem_bool = false
var Hem_var = randi_range(50,100) + 1

var Material_Percentage = [0,0,0,0,0,0,0,0,0,0]

@onready var Nit_Text = $Nitrogen # The Text box for Nitrogen
@onready var Pho_Text = $Phosphorus 
@onready var Pot_Text = $Potassium
@onready var Cal_Text = $Calcium
@onready var Mag_Text = $Magnesium
@onready var Sul_Text = $Sulfur
@onready var Chi_Text = $Chitin
@onready var Hyd_Text = $Hydroxyapatite
@onready var Ins_Text = $Insulin
@onready var Hem_Text = $Hemoglobin

@onready var Nit_Ans = $"Mat Answers Table/Nit_Ans" # The Answer box for Nitrogen
@onready var Nit_Close = $"Mat Answers Table/Nit_Approx" # The Approximatation Notifier for Nitrogen
@onready var Pho_Ans = $"Mat Answers Table/Pho_Ans"
@onready var Pho_Close = $"Mat Answers Table/Pho_Approx"
@onready var Pot_Ans = $"Mat Answers Table/Pot_Ans"
@onready var Pot_Close = $"Mat Answers Table/Pot_Approx"
@onready var Cal_Ans = $"Mat Answers Table/Cal_Ans"
@onready var Cal_Close = $"Mat Answers Table/Cal_Approx"
@onready var Mag_Ans = $"Mat Answers Table/Mag_Ans"
@onready var Mag_Close = $"Mat Answers Table/Mag_Approx"
@onready var Sul_Ans = $"Mat Answers Table/Sul_Ans"
@onready var Sul_Close = $"Mat Answers Table/Sul_Approx"
@onready var Chi_Ans = $"Mat Answers Table/Chi_Ans"
@onready var Chi_Close = $"Mat Answers Table/Chi_Approx"
@onready var Hyd_Ans = $"Mat Answers Table/Hyd_Ans"
@onready var Hyd_Close = $"Mat Answers Table/Hyd_Approx"
@onready var Ins_Ans = $"Mat Answers Table/Ins_Ans"
@onready var Ins_Close = $"Mat Answers Table/Ins_Approx"
@onready var Hem_Ans = $"Mat Answers Table/Hem_Ans"
@onready var Hem_Close = $"Mat Answers Table/Hem_Approx"

@onready var Plant_Pot = $"../Pot"
@onready var Week_4_Plant_Root = $"../../Week 4 Flower/Root"
@onready var Week_5_Plant_Root = $"../../Week 5 Flower/Root"
@onready var Week_6_Plant_Root = $"../../Week 6 Flower/Root"
@onready var Week_8_Plant_Root = $"../../Week 8 Flower/Root"
@onready var Week_9_Plant_Root = $"../../Week 9 Flower/Root"
@onready var Week_10_Plant_Root = $"../../Week 10 Flower/Root"

func _process(delta):
	if visible == true:
		Health_Points = float(Nit_Points + Pho_Points + Pot_Points + Cal_Points + Mag_Points + Sul_Points + Chi_Points + Hyd_Points + Ins_Points + Hem_Points) / Mean_Divided_Value
		Mat_Per_Label()
		Mat_Ans()
		Plant_Pot.visible = false
		Week_4_Plant_Root.visible = true
		Week_5_Plant_Root.visible = true
		Week_6_Plant_Root.visible = true
		Week_8_Plant_Root.visible = true
		Week_9_Plant_Root.visible = true
		Week_10_Plant_Root.visible = true
		timer += 1 * delta
		if timer > 2:
			timer = 0
		if timer < 1:
			$Escape.visible = true
		else:
			$Escape.visible = false
		if Input.is_action_just_pressed("Open Menu"):
			visible = false
	else:
		visible = false
		Plant_Pot.visible = true
		Week_4_Plant_Root.visible = false
		Week_5_Plant_Root.visible = false
		Week_6_Plant_Root.visible = false
		Week_8_Plant_Root.visible = false
		Week_9_Plant_Root.visible = false
		Week_10_Plant_Root.visible = false
# This function plays a part in **randomizing** the maximum and minimum value of each statistic.
func Mat_Per_Math_Start(): 
	Nit_add = randf_range(float(Material_Percentage[0]) / Nit_var, -(float(Material_Percentage[0]) / Nit_var))
	Pho_add = randf_range(float(Material_Percentage[1]) / Pho_var, -(float(Material_Percentage[1]) / Pho_var))
	Pot_add = randf_range(float(Material_Percentage[2]) / Pot_var, -(float(Material_Percentage[2]) / Pot_var))
	Cal_add = randf_range(float(Material_Percentage[3]) / Cal_var, -(float(Material_Percentage[3]) / Cal_var))
	Mag_add = randf_range(float(Material_Percentage[4]) / Mag_var, -(float(Material_Percentage[4]) / Mag_var))
	Sul_add = randf_range(float(Material_Percentage[5]) / Sul_var, -(float(Material_Percentage[5]) / Sul_var))
	Chi_add = randf_range(float(Material_Percentage[6]) / Chi_var, -(float(Material_Percentage[6]) / Chi_var))
	Hyd_add = randf_range(float(Material_Percentage[7]) / Hyd_var, -(float(Material_Percentage[7]) / Hyd_var))
	Ins_add = randf_range(float(Material_Percentage[8]) / Ins_var, -(float(Material_Percentage[8]) / Ins_var))
	Hem_add = randf_range(float(Material_Percentage[9]) / Hem_var, -(float(Material_Percentage[9]) / Hem_var))
# This function plays a part in the **math behind**  each statistic.
func Mat_Per_Math(delta):
	Nit_Base = Material_Percentage[0]
	Nit = Nit_Base + Nit_add
	if Nit_bool == false:
		
		Nit_add += ((float(Nit_var) / 100 - .01)+ (Nit_Base / 1000) ) * delta 
		if Nit_add > float(Nit_Base) / Nit_var:
			Nit_bool = true
	else:
		Nit_add -= ((float(Nit_var) / 100 - .01)+ (Nit_Base / 1000) ) * delta 
		if Nit_add < -(float(Nit_Base) / Nit_var):
			Nit_bool = false

	Pho_Base = Material_Percentage[1]
	Pho = Pho_Base + Pho_add
	
	if Nit_bool == false:
		Pho_add += ((float(Pho_var) / 100 - .01)+ (Pho_Base / 1000) ) * delta 
		if Pho_add > float(Pho_Base) / Pho_var:
			Pho_bool = true
	else:
		Pho_add -= ((float(Pho_var) / 100 - .01)+ (Pho_Base / 1000) ) * delta 
		if Pho_add < -(float(Pho_Base) / Pho_var):
			Pho_bool = false

	Pot_Base = Material_Percentage[2]
	Pot = Pot_Base + Pot_add
	
	if Pot_bool == false:
		Pot_add += ((float(Pot_var) / 100 - .01)+ (Pot_Base / 1000) ) * delta 
		if Pot_add > float(Pot_Base) / Pot_var:
			Pot_bool = true
	else:
		Pot_add -= ((float(Pot_var) / 100 - .01)+ (Pot_Base / 1000) ) * delta 
		if Nit_add < -(float(Pot_Base) / Pot_var):
			Pot_bool = false

	Cal_Base = Material_Percentage[3]
	Cal = Cal_Base + Cal_add
	
	if Cal_bool == false:
		Cal_add += ((float(Cal_var) / 100 - .01)+ (Cal_Base / 1000) ) * delta 
		if Cal_add > float(Cal_Base) / Cal_var:
			Cal_bool = true
	else:
		Cal_add -= ((float(Cal_var) / 100 - .01)+ (Cal_Base / 1000) ) * delta 
		if Cal_add < -(float(Cal_Base) / Cal_var):
			Cal_bool = false

	Mag_Base = Material_Percentage[4]
	Mag = Mag_Base + Mag_add
	
	if Mag_bool == false:
		Mag_add += ((float(Mag_var) / 100 - .01)+ (Mag_Base / 1000) ) * delta 
		if Mag_add > float(Mag_Base) / Mag_var:
			Mag_bool = true
	else:
		Mag_add -= ((float(Mag_var) / 100 - .01)+ (Mag_Base / 1000) ) * delta 
		if Mag_add < -(float(Mag_Base) / Mag_var):
			Mag_bool = false

	Sul_Base = Material_Percentage[5]
	Sul = Sul_Base + Sul_add
	
	if Sul_bool == false:
		Sul_add += ((float(Sul_var) / 100 - .01)+ (Sul_Base / 1000) ) * delta 
		if Sul_add > float(Sul_Base) / Sul_var:
			Sul_bool = true
	else:
		Sul_add -= ((float(Sul_var) / 100 - .01)+ (Sul_Base / 1000) ) * delta 
		if Sul_add < -(float(Sul_Base) / Sul_var):
			Sul_bool = false

	Chi_Base = Material_Percentage[6]
	Chi = Chi_Base + Chi_add
	
	if Chi_bool == false:
		Chi_add += ((float(Chi_var) / 100 - .01)+ (Chi_Base / 1000) ) * delta 
		if Chi_add > float(Chi_Base) / Chi_var:
			Chi_bool = true
	else:
		Chi_add -= ((float(Chi_var) / 100 - .01)+ (Chi_Base / 1000) ) * delta 
		if Chi_add < -(float(Chi_Base) / Chi_var):
			Chi_bool = false

	Hyd_Base = Material_Percentage[7]
	Hyd = Hyd_Base + Hyd_add
	
	if Hyd_bool == false:
		Hyd_add += ((float(Hyd_var) / 100 - .01)+ (Hyd_Base / 1000) ) * delta 
		if Hyd_add > float(Hyd_Base) / Hyd_var:
			Hyd_bool = true
	else:
		Hyd_add -= ((float(Hyd_var) / 100 - .01)+ (Hyd_Base / 1000) ) * delta 
		if Hyd_add < -(float(Hyd_Base) / Hyd_var):
			Hyd_bool = false

	Ins_Base = Material_Percentage[8]
	Ins = Ins_Base + Ins_add
	
	if Ins_bool == false:
		Ins_add += ((float(Ins_var) / 100 - .01)+ (Ins_Base / 1000) ) * delta 
		if Ins_add > float(Ins_Base) / Ins_var:
			Ins_bool = true
	else:
		Ins_add -= ((float(Ins_var) / 100 - .01)+ (Ins_Base / 1000) ) * delta 
		if Ins_add < -(float(Ins_Base) / Ins_var):
			Ins_bool = false

	Hem_Base = Material_Percentage[9]
	Hem = Hem_Base + Hem_add
	
	if Hem_bool == false:
		Hem_add += ((float(Hem_var) / 100 - .01)+ (Hem_Base / 1000) ) * delta 
		if Hem_add > float(Hem_Base) / Hem_var:
			Hem_bool = true
	else:
		Hem_add -= ((float(Hem_var) / 100 - .01)+ (Hem_Base / 1000) ) * delta 
		if Hem_add < -(float(Hem_Base) / Hem_var):
			Hem_bool = false
# This function plays a part in the **display** of each statistic.
func Mat_Per_Label():
	if Nit > 1000:
		# Convert to int to get rid of unnecessary decimals,
		# Multiply by 1000
		# Convert to float to get decimals to the third place.
		Nit_Text.text = ( str(float(int(Nit / (1000) * 1000) ) / 1000))  + " G of Nitrogen"
	else:
		Nit_Text.text = str(int(Nit)) + " Mg of Nitrogen"
	if Pho > 1000:
		Pho_Text.text = ( str(float(int(Pho / (1000) * 1000) ) / 1000))  + " G of Phosphorus"
	else:
		Pho_Text.text = str(int(Pho)) + " Mg of Phosphorus"
	if Pot > 1000:
		Pot_Text.text = ( str(float(int(Pot / (1000) * 1000) ) / 1000))  + " G of Potassium"
	else:
		Pot_Text.text = str(int(Pot)) + " Mg of Potassium"
	if Cal > 1000:
		Cal_Text.text = ( str(float(int(Cal / (1000) * 1000) ) / 1000))  + " G of Calcium"
	else:
		Cal_Text.text = str(int(Cal)) + " Mg of Calcium"
	if Mag > 1000:
		Mag_Text.text = ( str(float(int(Mag / (1000) * 1000) ) / 1000))  + " G of Magnesium"
	else:
		Mag_Text.text = str(int(Mag)) + " Mg of Magnesium"
	if Sul > 1000:
		Sul_Text.text = ( str(float(int(Sul / (1000) * 1000) ) / 1000))  + " G of Sulfur"
	else:
		Sul_Text.text = str(int(Sul)) + " Mg of Sulfur"
	if Chi > 1000:
		Chi_Text.text = ( str(float(int(Chi / (1000) * 1000) ) / 1000))  + " G of Chitin"
	else:
		Chi_Text.text = str(int(Chi)) + " Mg of Chitin"
	if Hyd > 1000:
		Hyd_Text.text = ( str(float(int(Hyd / (1000) * 1000) ) / 1000))  + " G of Hydroxyapatite"
	else:
		Hyd_Text.text = str(int(Hyd)) + " Mg of Hydroxyapatite"
	if Ins > 1000:
		Ins_Text.text = ( str(float(int(Ins / (1000) * 1000) ) / 1000))  + " G of Insulin"
	else:
		Ins_Text.text = str(int(Ins)) + " Mg of Insulin"
	if Hem > 1000:
		Hem_Text.text = ( str(float(int(Hem / (1000) * 1000) ) / 1000))  + " G of Hemoglobin"
	else:
		Hem_Text.text = str(int(Hem)) + " Mg of Hemoglobin"
# This function plays a part in the **displaying and calculating how close the player is to he right answer.**
func Mat_Ans():
	if float(Nit_Ans.text) == Nit_Base:
		Nit_Close.text = str("Perfect")
		Nit_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Nit_Points = 15
	elif float(Nit_Ans.text) > Nit_Base:
		if float(Nit_Ans.text) < Nit_Base + 3:
			Nit_Close.text = str("Nigh-Perfect")
			Nit_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Nit_Points = 12
		elif float(Nit_Ans.text) < Nit_Base + 6:
			Nit_Close.text = str("Close")
			Nit_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Nit_Points = 9
		elif float(Nit_Ans.text) < Nit_Base + 10:
			Nit_Close.text = str("Approximate")
			Nit_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Nit_Points = 6
		elif float(Nit_Ans.text) < Nit_Base + 15:
			Nit_Close.text = str("Unfocused")
			Nit_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Nit_Points = 3
		else:
			Nit_Close.text = str("Unclear")
			Nit_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Nit_Ans.text) < Nit_Base:
		if float(Nit_Ans.text) > Nit_Base - 3:
			Nit_Close.text = str("Nigh-Perfect")
			Nit_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Nit_Points = 12
		elif float(Nit_Ans.text) > Nit_Base - 6:
			Nit_Close.text = str("Close")
			Nit_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Nit_Points = 9
		elif float(Nit_Ans.text) > Nit_Base - 10:
			Nit_Close.text = str("Approximate")
			Nit_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Nit_Points = 6
		elif float(Nit_Ans.text) > Nit_Base - 15:
			Nit_Close.text = str("Unfocused")
			Nit_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Nit_Points = 3
		else:
			Nit_Close.text = str("Unclear")
			Nit_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Pho_Ans.text) == Pho_Base:
		Pho_Close.text = str("Perfect")
		Pho_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Pho_Points = 15
	elif float(Pho_Ans.text) > Pho_Base:
		if float(Pho_Ans.text) < Pho_Base + 3:
			Pho_Close.text = str("Nigh-Perfect")
			Pho_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Pho_Points = 12
		elif float(Pho_Ans.text) < Pho_Base + 6:
			Pho_Close.text = str("Close")
			Pho_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Pho_Points = 9
		elif float(Pho_Ans.text) < Pho_Base + 10:
			Pho_Close.text = str("Approximate")
			Pho_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Pho_Points = 6
		elif float(Pho_Ans.text) < Pho_Base + 15:
			Pho_Close.text = str("Unfocused")
			Pho_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Pho_Points = 3
		else:
			Pho_Close.text = str("Unclear")
			Pho_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Pho_Ans.text) < Pho_Base:
		if float(Pho_Ans.text) > Pho_Base - 3:
			Pho_Close.text = str("Nigh-Perfect")
			Pho_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Pho_Points = 12
		elif float(Pho_Ans.text) > Pho_Base - 6:
			Pho_Close.text = str("Close")
			Pho_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Pho_Points = 9
		elif float(Pho_Ans.text) > Pho_Base - 10:
			Pho_Close.text = str("Approximate")
			Pho_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Pho_Points = 6
		elif float(Pho_Ans.text) > Pho_Base - 15:
			Pho_Close.text = str("Unfocused")
			Pho_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Pho_Points = 3
		else:
			Pho_Close.text = str("Unclear")
			Pho_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Pot_Ans.text) == Pot_Base:
		Pot_Close.text = str("Perfect")
		Pot_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Pot_Points = 15
	elif float(Pot_Ans.text) > Pot_Base:
		if float(Pot_Ans.text) < Pot_Base + 3:
			Pot_Close.text = str("Nigh-Perfect")
			Pot_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Pot_Points = 12
		elif float(Pot_Ans.text) < Pot_Base + 6:
			Pot_Close.text = str("Close")
			Pot_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Pot_Points = 9
		elif float(Pot_Ans.text) < Pot_Base + 10:
			Pot_Close.text = str("Approximate")
			Pot_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Pot_Points = 6
		elif float(Pot_Ans.text) < Pot_Base + 15:
			Pot_Close.text = str("Unfocused")
			Pot_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Pot_Points = 3
		else:
			Pot_Close.text = str("Unclear")
			Pot_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Pot_Ans.text) < Pot_Base:
		if float(Pot_Ans.text) > Pot_Base - 3:
			Pot_Close.text = str("Nigh-Perfect")
			Pot_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Pot_Points = 12
		elif float(Pot_Ans.text) > Pot_Base - 6:
			Pot_Close.text = str("Close")
			Pot_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Pot_Points = 9
		elif float(Pot_Ans.text) > Pot_Base - 10:
			Pot_Close.text = str("Approximate")
			Pot_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Pot_Points = 6
		elif float(Pot_Ans.text) > Pot_Base - 15:
			Pot_Close.text = str("Unfocused")
			Pot_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Pot_Points = 3
		else:
			Pot_Close.text = str("Unclear")
			Pot_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Cal_Ans.text) == Cal_Base:
		Cal_Close.text = str("Perfect")
		Cal_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Cal_Points = 15
	elif float(Cal_Ans.text) > Cal_Base:
		if float(Cal_Ans.text) < Cal_Base + 3:
			Cal_Close.text = str("Nigh-Perfect")
			Cal_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Cal_Points = 12
		elif float(Cal_Ans.text) < Cal_Base + 6:
			Cal_Close.text = str("Close")
			Cal_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Cal_Points = 9
		elif float(Cal_Ans.text) < Cal_Base + 10:
			Cal_Close.text = str("Approximate")
			Cal_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Cal_Points = 6
		elif float(Cal_Ans.text) < Cal_Base + 15:
			Cal_Close.text = str("Unfocused")
			Cal_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Cal_Points = 3
		else:
			Cal_Close.text = str("Unclear")
			Cal_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Cal_Ans.text) < Cal_Base:
		if float(Cal_Ans.text) > Cal_Base - 3:
			Cal_Close.text = str("Nigh-Perfect")
			Cal_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Cal_Points = 12
		elif float(Cal_Ans.text) > Cal_Base - 6:
			Cal_Close.text = str("Close")
			Cal_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Cal_Points = 9
		elif float(Cal_Ans.text) > Cal_Base - 10:
			Cal_Close.text = str("Approximate")
			Cal_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Cal_Points = 6
		elif float(Cal_Ans.text) > Cal_Base - 15:
			Cal_Close.text = str("Unfocused")
			Cal_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Cal_Points = 3
		else:
			Cal_Close.text = str("Unclear")
			Cal_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Mag_Ans.text) == Mag_Base:
		Mag_Close.text = str("Perfect")
		Mag_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Mag_Points = 15
	elif float(Mag_Ans.text) > Mag_Base:
		if float(Mag_Ans.text) < Mag_Base + 3:
			Mag_Close.text = str("Nigh-Perfect")
			Mag_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Mag_Points = 12
		elif float(Mag_Ans.text) < Mag_Base + 6:
			Mag_Close.text = str("Close")
			Mag_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Mag_Points = 9
		elif float(Mag_Ans.text) < Mag_Base + 10:
			Mag_Close.text = str("Approximate")
			Mag_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Mag_Points = 6
		elif float(Mag_Ans.text) < Mag_Base + 15:
			Mag_Close.text = str("Unfocused")
			Mag_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Mag_Points = 3
		else:
			Mag_Close.text = str("Unclear")
			Mag_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Mag_Ans.text) < Mag_Base:
		if float(Mag_Ans.text) > Mag_Base - 3:
			Mag_Close.text = str("Nigh-Perfect")
			Mag_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Mag_Points = 12
		elif float(Mag_Ans.text) > Mag_Base - 6:
			Mag_Close.text = str("Close")
			Mag_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Mag_Points = 9
		elif float(Mag_Ans.text) > Mag_Base - 10:
			Mag_Close.text = str("Approximate")
			Mag_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Mag_Points = 6
		elif float(Mag_Ans.text) > Mag_Base - 15:
			Mag_Close.text = str("Unfocused")
			Mag_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Mag_Points = 3
		else:
			Mag_Close.text = str("Unclear")
			Mag_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Sul_Ans.text) == Sul_Base:
		Sul_Close.text = str("Perfect")
		Sul_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Sul_Points = 15
	elif float(Sul_Ans.text) > Sul_Base:
		if float(Sul_Ans.text) < Sul_Base + 3:
			Sul_Close.text = str("Nigh-Perfect")
			Sul_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Sul_Points = 12
		elif float(Sul_Ans.text) < Sul_Base + 6:
			Sul_Close.text = str("Close")
			Sul_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Sul_Points = 9
		elif float(Sul_Ans.text) < Sul_Base + 10:
			Sul_Close.text = str("Approximate")
			Sul_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Sul_Points = 6
		elif float(Sul_Ans.text) < Sul_Base + 15:
			Sul_Close.text = str("Unfocused")
			Sul_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Sul_Points = 3
		else:
			Sul_Close.text = str("Unclear")
			Sul_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Sul_Ans.text) < Sul_Base:
		if float(Sul_Ans.text) > Sul_Base - 3:
			Sul_Close.text = str("Nigh-Perfect")
			Sul_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Sul_Points = 12
		elif float(Sul_Ans.text) > Sul_Base - 6:
			Sul_Close.text = str("Close")
			Sul_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Sul_Points = 9
		elif float(Sul_Ans.text) > Sul_Base - 10:
			Sul_Close.text = str("Approximate")
			Sul_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Sul_Points = 6
		elif float(Sul_Ans.text) > Sul_Base - 15:
			Sul_Close.text = str("Unfocused")
			Sul_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Sul_Points = 3
		else:
			Sul_Close.text = str("Unclear")
			Sul_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Chi_Ans.text) == Chi_Base:
		Chi_Close.text = str("Perfect")
		Chi_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Chi_Points = 15
	elif float(Chi_Ans.text) > Chi_Base:
		if float(Chi_Ans.text) < Chi_Base + 3:
			Chi_Close.text = str("Nigh-Perfect")
			Chi_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Chi_Points = 12
		elif float(Chi_Ans.text) < Chi_Base + 6:
			Chi_Close.text = str("Close")
			Chi_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Chi_Points = 9
		elif float(Chi_Ans.text) < Chi_Base + 10:
			Chi_Close.text = str("Approximate")
			Chi_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Chi_Points = 6
		elif float(Chi_Ans.text) < Chi_Base + 15:
			Chi_Close.text = str("Unfocused")
			Chi_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Chi_Points = 3
		else:
			Chi_Close.text = str("Unclear")
			Chi_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Chi_Ans.text) < Chi_Base:
		if float(Chi_Ans.text) > Chi_Base - 3:
			Chi_Close.text = str("Nigh-Perfect")
			Chi_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Chi_Points = 12
		elif float(Chi_Ans.text) > Chi_Base - 6:
			Chi_Close.text = str("Close")
			Chi_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Chi_Points = 9
		elif float(Chi_Ans.text) > Chi_Base - 10:
			Chi_Close.text = str("Approximate")
			Chi_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Chi_Points = 6
		elif float(Chi_Ans.text) > Chi_Base - 15:
			Chi_Close.text = str("Unfocused")
			Chi_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Chi_Points = 3
		else:
			Chi_Close.text = str("Unclear")
			Chi_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Hyd_Ans.text) == Hyd_Base:
		Hyd_Close.text = str("Perfect")
		Hyd_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Hyd_Points = 15
	elif float(Hyd_Ans.text) > Hyd_Base:
		if float(Hyd_Ans.text) < Hyd_Base + 3:
			Hyd_Close.text = str("Nigh-Perfect")
			Hyd_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Hyd_Points = 12
		elif float(Hyd_Ans.text) < Hyd_Base + 6:
			Hyd_Close.text = str("Close")
			Hyd_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Hyd_Points = 9
		elif float(Hyd_Ans.text) < Hyd_Base + 10:
			Hyd_Close.text = str("Approximate")
			Hyd_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Hyd_Points = 6
		elif float(Hyd_Ans.text) < Hyd_Base + 15:
			Hyd_Close.text = str("Unfocused")
			Hyd_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Hyd_Points = 3
		else:
			Hyd_Close.text = str("Unclear")
			Hyd_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Hyd_Ans.text) < Hyd_Base:
		if float(Hyd_Ans.text) > Hyd_Base - 3:
			Hyd_Close.text = str("Nigh-Perfect")
			Hyd_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Hyd_Points = 12
		elif float(Hyd_Ans.text) > Hyd_Base - 6:
			Hyd_Close.text = str("Close")
			Hyd_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Hyd_Points = 9
		elif float(Hyd_Ans.text) > Hyd_Base - 10:
			Hyd_Close.text = str("Approximate")
			Hyd_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Hyd_Points = 6
		elif float(Hyd_Ans.text) > Hyd_Base - 15:
			Hyd_Close.text = str("Unfocused")
			Hyd_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Hyd_Points = 3
		else:
			Hyd_Close.text = str("Unclear")
			Hyd_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Ins_Ans.text) == Ins_Base:
		Ins_Close.text = str("Perfect")
		Ins_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Ins_Points = 15
	elif float(Ins_Ans.text) > Ins_Base:
		if float(Ins_Ans.text) < Ins_Base + 3:
			Ins_Close.text = str("Nigh-Perfect")
			Ins_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Ins_Points = 12
		elif float(Ins_Ans.text) < Ins_Base + 6:
			Ins_Close.text = str("Close")
			Ins_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Ins_Points = 9
		elif float(Ins_Ans.text) < Ins_Base + 10:
			Ins_Close.text = str("Approximate")
			Ins_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Ins_Points = 6
		elif float(Ins_Ans.text) < Ins_Base + 15:
			Ins_Close.text = str("Unfocused")
			Ins_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Ins_Points = 3
		else:
			Ins_Close.text = str("Unclear")
			Ins_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Ins_Ans.text) < Ins_Base:
		if float(Ins_Ans.text) > Ins_Base - 3:
			Ins_Close.text = str("Nigh-Perfect")
			Ins_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Ins_Points = 12
		elif float(Ins_Ans.text) > Ins_Base - 6:
			Ins_Close.text = str("Close")
			Ins_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Ins_Points = 9
		elif float(Ins_Ans.text) > Ins_Base - 10:
			Ins_Close.text = str("Approximate")
			Ins_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Ins_Points = 6
		elif float(Ins_Ans.text) > Ins_Base - 15:
			Ins_Close.text = str("Unfocused")
			Ins_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Ins_Points = 3
		else:
			Ins_Close.text = str("Unclear")
			Ins_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if float(Hem_Ans.text) == Hem_Base:
		Hem_Close.text = str("Perfect")
		Hem_Close.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Hem_Points = 15
	elif float(Hem_Ans.text) > Hem_Base:
		if float(Hem_Ans.text) < Hem_Base + 3:
			Hem_Close.text = str("Nigh-Perfect")
			Hem_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Hem_Points = 12
		elif float(Hem_Ans.text) < Hem_Base + 6:
			Hem_Close.text = str("Close")
			Hem_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Hem_Points = 9
		elif float(Hem_Ans.text) < Hem_Base + 10:
			Hem_Close.text = str("Approximate")
			Hem_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Hem_Points = 6
		elif float(Hem_Ans.text) < Hem_Base + 15:
			Hem_Close.text = str("Unfocused")
			Hem_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Hem_Points = 3
		else:
			Hem_Close.text = str("Unclear")
			Hem_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 
	elif float(Hem_Ans.text) < Hem_Base:
		if float(Hem_Ans.text) > Hem_Base - 3:
			Hem_Close.text = str("Nigh-Perfect")
			Hem_Close.add_theme_color_override("font_color",Color(0.0, 0.678, 0.0, 1.0)) 
			Hem_Points = 12
		elif float(Hem_Ans.text) > Hem_Base - 6:
			Hem_Close.text = str("Close")
			Hem_Close.add_theme_color_override("font_color",Color(0.267, 0.482, 0.259, 1.0)) 
			Hem_Points = 9
		elif float(Hem_Ans.text) > Hem_Base - 10:
			Hem_Close.text = str("Approximate")
			Hem_Close.add_theme_color_override("font_color",Color(0.039, 0.408, 0.259, 1.0)) 
			Hem_Points = 6
		elif float(Hem_Ans.text) > Hem_Base - 15:
			Hem_Close.text = str("Unfocused")
			Hem_Close.add_theme_color_override("font_color",Color(0.259, 0.318, 0.247, 1.0)) 
			Hem_Points = 3
		else:
			Hem_Close.text = str("Unclear")
			Hem_Close.add_theme_color_override("font_color",Color(0.451, 0.451, 0.451, 1.0)) 

	if Material_Percentage[6] == 0:
		Chi_Text.visible = false 
	else:
		Chi_Text.visible = true
	if Material_Percentage[7] == 0:
		Hyd_Text.visible = false
	else:
		Hyd_Text.visible = true
	if Material_Percentage[8] == 0:
		Ins_Text.visible = false
	else:
		Ins_Text.visible = true
	if Material_Percentage[9] == 0:
		Hem_Text.visible = false
	else:
		Hem_Text.visible = true
	if (Material_Percentage[6] == 0) && (Material_Percentage[7] == 0) && (Material_Percentage[8] == 0) && (Material_Percentage[9] == 0):
		Mean_Divided_Value = 6
	elif (Material_Percentage[6] == 0) && (Material_Percentage[7] == 0) && (Material_Percentage[8] == 0):
		Mean_Divided_Value = 7
	elif (Material_Percentage[6] == 0) && (Material_Percentage[7] == 0):
		Mean_Divided_Value = 8
	elif (Material_Percentage[6] == 0):
		Mean_Divided_Value = 9
	else:
		Mean_Divided_Value = 10
