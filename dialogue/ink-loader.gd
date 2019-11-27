extends CanvasLayer

#
#	Constants
#
const MAX_CHOICES: int = 5

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
onready var choice3_display = $DialogueWindow/HBoxContainer/VBoxContainer/Choice3/Label
onready var choice4_display = $DialogueWindow/HBoxContainer/VBoxContainer/Choice4/Label
onready var choice5_display = $DialogueWindow/HBoxContainer/VBoxContainer/Choice5/Label
onready var choice1_btn = $DialogueWindow/HBoxContainer/VBoxContainer/Choice1
onready var choice2_btn = $DialogueWindow/HBoxContainer/VBoxContainer/Choice2
onready var choice3_btn = $DialogueWindow/HBoxContainer/VBoxContainer/Choice3
onready var choice4_btn = $DialogueWindow/HBoxContainer/VBoxContainer/Choice4
onready var choice5_btn = $DialogueWindow/HBoxContainer/VBoxContainer/Choice5

onready var choice_buttons = [
	choice1_btn, 
	choice2_btn, 
	choice3_btn, 
	choice4_btn, 
	choice5_btn
]

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
	
func set_choice_text(textArr: Array):
	var i = 0
	var end = textArr.size()
	
	while i < end:
		choice_buttons[i].set_text(textArr[i])
		i += 1
		
func show_choices(count: int):
	var i = 0
	while i <= count-1:
		if i <= count-1:
			choice_buttons[i].visible = true
		i += 1
		
	_toggle_choices(true)
	
func hide_choices():
	_toggle_choices(false)
	for btn in choice_buttons:
		btn.visible = false
	

#	Private Methods
#
func _connect_signals():
	choice1_btn.connect("pressed", self, "_on_choice_selected", [0])
	choice2_btn.connect("pressed", self, "_on_choice_selected", [1])
	choice3_btn.connect("pressed", self, "_on_choice_selected", [2])
	choice4_btn.connect("pressed", self, "_on_choice_selected", [3])
	choice5_btn.connect("pressed", self, "_on_choice_selected", [4])

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
		var choiceText = []
		for choice in story.current_choices:
			choiceText.append(choice.text)
		set_choice_text(choiceText)
		
		show_choices(story.current_choices.size())
		
		emit_signal("dialogue_choice")
	else:
		hide_window()
		emit_signal("dialogue_complete")
		
func _on_choice_selected(index: int):
	print_debug("dialogue choice %d" % index)
	story.choose_choice_index(index)
	hide_choices()
	_on_player_continue()
		