extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -350.0
var is_frozen = false
func _ready() -> void:
	SignalBus.connect("_player_death", die)
	pass
func set_frozen(value: bool):
	is_frozen = value
	
func die():
	#$AnimatedSprite2D.play("death")
	#$CollisionShape2D.disabled = true 
	$Animation.play("death")
	velocity.y = JUMP_VELOCITY
	
func jump():
	velocity.y = JUMP_VELOCITY
	$AnimatedSprite2D.play("roll")
	$Sounds/Jump.playing = true

func _physics_process(delta: float) -> void:
	if is_frozen:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")

	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	elif direction > 0:
		$AnimatedSprite2D.flip_h = false
	if is_on_floor():
		if direction == 0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
