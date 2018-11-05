extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_VisibilityNotifier2D_exit_screen():
	queue_free()
	print("bullet free")
	pass # replace with function body


func _on_simpleBullet_body_enter_shape( body_id, body, body_shape, local_shape ):
	free()
	print("bullet free")
	get_node("tail").set_emitting(false);
	set_hidden(true);
	pass # replace with function body


func _on_simpleBullet_input_event( viewport, event, shape_idx ):
	ree()
	print("bullet free")
	get_node("tail").set_emitting(false);
	set_hidden(true);
	pass # replace with function body


func _on_simpleBullet_body_enter( body ):
	ree()
	print("bullet free")
	get_node("tail").set_emitting(false);
	set_hidden(true);
	pass # replace with function body
