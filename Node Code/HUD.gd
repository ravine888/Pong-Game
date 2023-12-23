extends CanvasLayer

signal _start_game

func _ready():
	$"Player Score".hide()
	$"Enemy Score".hide()
	$"Mid Line".hide()
	
	$"Mid Line".position = Vector2(429, 262.5)

func _show_main_screen(): 
	$Title.show()
	$"Start Button".show()
	
	$"Player Score".hide()
	$"Enemy Score".hide()
	$"Mid Line".hide()

func _update_score(playerScore, enemyScore):
	$"Player Score".text = str(playerScore)
	$"Enemy Score".text = str(enemyScore)

func _on_Start_Button_pressed():
	$Title.hide()
	$"Start Button".hide()
	
	$"Player Score".show()
	$"Enemy Score".show()
	$"Mid Line".show()
	
	emit_signal("_start_game")
