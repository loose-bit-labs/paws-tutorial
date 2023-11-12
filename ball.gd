extends RigidBody3D

func _process(_delta):
	if position.y < -2.2:
		reset()

func reset(size:float = 33.33):
	position = size * Vector3(_r(),2,_r())

func _r():
	return randf() - randf()
