extends Node3D

var ball_scene = preload("res://ball.tscn")
@onready var dawg = $Dawg

var ball = null
var count = 0
var max_balls = 100
var too_long = .25
var so_far = 8.8

func _process(delta):
	if count < max_balls:
		_ballin(delta)
	if dawg.position.y < -22.22:
		dawg.position = _rand()

func _ballin(delta):
	so_far = so_far + delta
	if so_far > too_long:
		so_far = 0
		ball = ball_scene.instantiate()
		ball.reset(33.33)
		add_child(ball)

func _rand():
	return Vector3(randf(),1,randf()) * 2 - Vector3(-1, 0, -1)
