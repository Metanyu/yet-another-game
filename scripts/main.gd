extends Node
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("_coin_get", update_score)
	#SignalBus.connect("")
	pass # Replace with function body.
	
#when get coin
func update_score(value):
	score += value
	print(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
