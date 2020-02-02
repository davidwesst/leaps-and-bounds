extends Node

onready var player = get_node("Player")
onready var hud = get_node("HUD")

func _ready():
	_init_signals()
	
func _init_signals():
	player.connect("player_action", hud, "_on_player_action")
	player.connect("player_continue", hud, "_on_player_continue")
	
	hud.connect("dialogue_complete", player, "_on_dialogue_complete")
