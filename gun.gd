extends Node2D

# class member variables go here, for example:
# var a = 2
export (PackedScene) var Bullet
export var velocity = 1000.0;
export var fireSpeed = 1.0 # second between bullet
var shootDelta = 0.0
var allreadyShoot = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass
	
func _process(delta):
	if allreadyShoot  :
		shootDelta += delta
	if shootDelta > fireSpeed:
		allreadyShoot = false
		shootDelta = 0
	if Input.is_action_pressed("ui_select"):
		if !allreadyShoot  :
			var bullet = Bullet.instance()
			bullet.set_global_pos(get_global_pos()) 
			get_tree().get_root().add_child(bullet)
			bullet.set_global_rot(get_global_rot())
			bullet.set_linear_velocity(Vector2(0, -1*velocity).rotated(bullet.get_global_rot()))
			bullet.set_gravity_scale(0)
			allreadyShoot = true
	pass
