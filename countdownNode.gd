@tool
extends NumbersUI2D
class_name CountDown2D

@export var count : int = 10: ## Starting value of the countdown; resets the displayed number when changed
	set(val):
		count = val
		number = val
@export var count_length : float = 1.0 ## Duration in seconds between each decrement
@export var autostart : bool = false ## If true, the countdown starts automatically when the node enters the scene
@export var one_shot : bool = false ## If true, the countdown stops (and optionally destroys itself) when it reaches zero instead of looping
@export var destroy_on_finish : bool = false ## If true and one_shot is enabled, queue_frees the node when the countdown finishes

signal countdown_finished()

var _running : bool = false
var _elapsed : float = 0.0

func _ready() -> void:
	number = count

	if Engine.is_editor_hint():
		return

	if autostart:
		_running = true

func _process(delta: float) -> void:
	if Engine.is_editor_hint() or not _running:
		return
	_elapsed += delta
	if _elapsed >= count_length:
		_elapsed -= count_length
		count_down()

func start() -> void: ## Resets and starts the countdown from the initial count value
	number = count
	_elapsed = 0.0
	_running = true

func stop() -> void: ## Pauses the countdown without resetting the current number
	_running = false

func count_down() -> void: ## Decrements the displayed number by 1; emits countdown_finished and handles one_shot/destroy logic at zero
	var new_number = number - 1
	if new_number >= 0:
		number = new_number
	else:
		if one_shot:
			_running = false
			if destroy_on_finish:
				queue_free();
		emit_signal("countdown_finished")
