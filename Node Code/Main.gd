extends Node

var screenSize = OS.get_window_size()
var screenWidthMid = screenSize.x / 2
var screenHeightMid = screenSize.y / 2

const buffer = 10
var playerAxis = 2 * buffer
var enemyAxis = screenSize.x - 2 * buffer

var playerInitPos = Vector2(playerAxis, screenHeightMid)
var enemyInitPos = Vector2(enemyAxis, screenHeightMid)
var ballInitPos = Vector2(screenWidthMid, screenHeightMid)

var playerScore = 0
var enemyScore = 0

func _ready():
	get_tree().call_group("Ball Group", "_stop")
	get_tree().call_group("Player Group", "_freeze")
	
	_hide_game()

func _process(_delta):
	if $Player.position.x != playerAxis: 
		$Player.position.x = playerAxis
	if $Enemy.position.x != enemyAxis: 
		$Enemy.position.x = enemyAxis

func _start_game(): 
	$HUD._update_score(playerScore, enemyScore)
	
	$Player.position = playerInitPos
	$Enemy.position = enemyInitPos
	$Ball.position = ballInitPos
	
	get_tree().call_group("Player Group", "_unfreeze")
	$"Reset Timer".start()
	
	_show_game()

func _end_game():
	get_tree().call_group("Ball Group", "_stop")
	get_tree().call_group("Player Group", "_freeze")
	
	_hide_game()
	
	$HUD._show_main_screen()

func _show_game(): 
	$Player.show()
	$Enemy.show()
	$Ball.show()

func _hide_game(): 
	$Player.hide()
	$Enemy.hide()
	$Ball.hide()

func _reset(): 
	get_tree().call_group("Ball Group", "_stop")
	$Ball.position = Vector2(429, 262.5)
	$Ball._increase_speed()
	$"Reset Timer".start()

func _on_Player_Goal_body_entered(_body):
	enemyScore += 1
	$HUD._update_score(playerScore, enemyScore)
	_reset()

func _on_Enemy_Goal_body_entered(_body):
	playerScore += 1
	$HUD._update_score(playerScore, enemyScore)
	_reset()

func _on_Reset_Timer_timeout():
	$"Reset Timer".stop()
	get_tree().call_group("Ball Group", "_reset")

func _on_HUD__start_game():
	_start_game()
