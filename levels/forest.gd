extends Node

onready var player = get_node("Player")
onready var hud = get_node("HUD")

func _ready():
	_init_signals()
	
func _init_signals():
	player.connect("player_action", hud, "_on_player_action")