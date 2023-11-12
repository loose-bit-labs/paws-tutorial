extends CharacterBody3D

@export var SPEED = 5.5
@export var JUMP_VELOCITY = 4.4
@export var sprint = 2.2

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var clicked = null

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var input_dir = Input.get_vector("back", "fore", "left", "right")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		var f = sprint if Input.is_key_pressed(KEY_SHIFT) else 1.
		velocity.x = direction.x * SPEED * f
		velocity.z = direction.z * SPEED * f
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton:
		clicked = event.pressed
	if clicked and event is InputEventMouseMotion:
		rotation.y -= event.relative.x * .01
		rotation.z -= event.relative.y * .001
		rotation.y += event.relative.y * .001
