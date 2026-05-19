@tool
extends NumbersUI2D
class_name CountDown2D

@export var count : int = 10:
	set(val):
		count = val
		number = val
@export var count_length : float = 1.0
@export var autostart : bool = false
@export var one_shot : bool = false
@export var destroy_on_finish : bool = false;

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

func start() -> void:
	number = count
	_elapsed = 0.0
	_running = true

func stop() -> void:
	_running = false

func count_down() -> void:
	var new_number = number - 1
	if new_number >= 0:
		number = new_number
	else:
		if one_shot:
			_running = false
			if destroy_on_finish:
				queue_free();
		emit_signal("countdown_finished")
