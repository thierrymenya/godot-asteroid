extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var rotationTorque = 1000
export var trustSpeed = Vector2(0, 100)
var screenSize = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screenSize = get_viewport_rect().size
	pass

	
func _integrate_forces(state):
    find_node("frontTruster").set_emitting(false)
    find_node("rearTruster").set_emitting(false)
    find_node("leftTopTruster").set_emitting(false)
    find_node("rightBottomTruster").set_emitting(false)
    find_node("leftBottomTruster").set_emitting(false)
    find_node("rightTopTruster").set_emitting(false)
    if Input.is_action_pressed("ui_up"):
        set_applied_force(trustSpeed.rotated(get_rot()))
        find_node("frontTruster").set_emitting(true)
    elif Input.is_action_pressed("ui_down"):
        set_applied_force((-1*trustSpeed).rotated(get_rot()))
        find_node("rearTruster").set_emitting(true)
    else:
        set_applied_force(Vector2())
    var rotation_dir = 0
    if Input.is_action_pressed("ui_right"):
        rotation_dir += 1
        find_node("leftTopTruster").set_emitting(true)
        find_node("rightBottomTruster").set_emitting(true)
    if Input.is_action_pressed("ui_left"):
        rotation_dir -= 1
        find_node("leftBottomTruster").set_emitting(true)
        find_node("rightTopTruster").set_emitting(true)
    set_applied_torque(rotation_dir * rotationTorque)
    check_wrap()

func _on_Visibility_screen_exited():
	var pos = get_global_pos()
	var pos2 = get_pos()
	var height = screenSize.y
	var width = screenSize.x
	print("screenSize " + str(screenSize))
	print("before " + str(pos))
	if pos.x < 0 :
		pos.x = (-1*pos.x) + width
	elif pos.x > width :
		pos.x = (pos.x - width)*-1
		
	if pos.y < 0 :
		pos.y = (-1*pos.y) + height
	elif pos.y > height :
		pos.y = (pos.y - height)*-1
	set_pos(pos)
	print("after " + str(pos))

func check_wrap():
	
	pass

func _on_VisibilityNotifier2D_exit_viewport( viewport ):
	var pos = get_global_pos()
	var pos2 = get_pos()
	var height = screenSize.y
	var width = screenSize.x
	print("screenSize " + str(screenSize))
	print("before " + str(pos))
	if pos.x < 0 :
		pos.x = width #(-1*pos.x) + width
	elif pos.x > width :
		pos.x = 0 #(pos.x - width)*-1
		
	if pos.y < 0 :
		pos.y = height #(-1*pos.y) + height
	elif pos.y > height :
		pos.y = 0 #(pos.y - height)*-1
	set_pos(pos)
	print("after " + str(pos))
	pass # replace with function body
