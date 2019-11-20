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
signal dialogue_choice

#
#	Properties
#
export var story_file = "res://dialogue/main.ink.json"
var story

onready var dialogue_window = $DialogueWindow
onready var dialogue_display = $DialogueWindow/HBoxContainer/Label
onready var choices = $DialogueWindow/HBoxContainer/VBoxContainer
onready var choice1_display = $DialogueWindow/HBoxContainer/VBoxContainer/Choice1/Label
onready var choice2_display = $DialogueWindow/HBoxContainer/VBoxContainer/Choice2/Label
onready var choice1_btn = $DialogueWindow/HBoxContainer/VBoxContainer/Choice1
onready var choice2_btn = $DialogueWindow/HBoxContainer/VBoxContainer/Choice2

#
#	Lifecycle
#
func _ready():
	call_deferred("start_story")
	
	_connect_signals()
	
	hide_window()
	hide_choices()

func _exit_tree():
	call_deferred("_remove_runtime")

#
#	Public Methods
#
func start_story():
	_add_runtime()
	_load_story(story_file)

func show_window():
	_toggle_window(true)
	
func hide_window():
	_toggle_window(false)
	
func show_choices():
	_toggle_choices(true)
	
func hide_choices():
	_toggle_choices(false)
	

#	Private Methods
#
func _connect_signals():
	choice1_btn.connect("pressed", self, "_on_choice_selected", [0])
	choice2_btn.connect("pressed", self, "_on_choice_selected", [1])

func _load_story(path: String):
	var ink_story = File.new()
	ink_story.open(path, File.READ)
	var content = ink_story.get_as_text()
	ink_story.close()
	
	self.story = Story.new(content)

func _toggle_window(show: bool):
	dialogue_window.visible = show
	
func _toggle_choices(show: bool):
	choices.visible = show
	
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
	elif story.current_choices.size() > 0:
		choice1_display.text = story.current_choices[0].text
		choice2_display.text = story.current_choices[1].text
		show_choices()
		emit_signal("dialogue_choice")
	else:
		hide_window()
		emit_signal("dialogue_complete")
		
func _on_choice_selected(index: int):
	print_debug("dialogue choice %d" % index)
	story.choose_choice_index(index)
	hide_choices()
	_on_player_continue()
		