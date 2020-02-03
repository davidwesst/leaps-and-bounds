extends Button

func _ready():
	self.connect("button_up", self, "_on_button_click")

func _on_button_click():
	get_tree().change_scene("res://levels/podunk.tscn")
