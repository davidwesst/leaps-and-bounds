extends CanvasLayer

#
#	Imports
#
var InkRuntime = load("res://addons/inkgd/runtime.gd");
var Story = load("res://addons/inkgd/runtime/story.gd");

#
#	Signals
#
signal dialogue_complete

#
#	Properties
#
var story

onready var dialogue_window = $DialogueWindow
onready var dialogue_display = $DialogueWindow/HBoxContainer/Label

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

func show_window():
	_toggle_window(true)
	
func hide_window():
	_toggle_window(false)
	

#	Private Methods
#
func _load_story(path: String):
	var ink_story = File.new()
	ink_story.open(path, File.READ)
	var content = ink_story.get_as_text()
	ink_story.close()
	
	self.story = Story.new(content)

func _toggle_window(open: bool):
	dialogue_window.visible = open
	
func _add_runtime():
    InkRuntime.init(get_tree().root)

func _remove_runtime():
    InkRuntime.deinit(get_tree().root)

func _on_player_action(story_file: String, story_path: String):
	print_debug("%s %s" % [story_file, story_path])
	
	story.choose_path_string(story_path, true)
	dialogue_display.text = story.continue()
	show_window()

func _on_player_continue():
	if story.can_continue == true:
		dialogue_display.text = story.continue()
	else:
		hide_window()
		emit_signal("dialogue_complete")
		