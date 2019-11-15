extends CanvasLayer

#
#	Imports
#
var InkRuntime = load("res://addons/inkgd/runtime.gd");
var Story = load("res://addons/inkgd/runtime/story.gd");

#
#	Properties
#
var story

#
#	Lifecycle
#
func _ready():
	call_deferred("start_story")

func _exit_tree():
	call_deferred("_remove_runtime")

#
#	Public Methods
#
func start_story():
	_add_runtime()
	_load_story("res://dialogue/main.ink.json")
	
#	Private Methods
#
func _load_story(path: String):
	var ink_story = File.new()
	ink_story.open(path, File.READ)
	var content = ink_story.get_as_text()
	ink_story.close()
	
	self.story = Story.new(content)
	
func _add_runtime():
    InkRuntime.init(get_tree().root)

func _remove_runtime():
    InkRuntime.deinit(get_tree().root)

func _on_player_action():
	if $DialogueWindow.visible == false:
		$DialogueWindow/HBoxContainer/Label.text = story.continue()
		$DialogueWindow.visible = true
	else:
		$DialogueWindow.visible = false