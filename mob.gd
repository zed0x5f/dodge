extends RigidBody2D


export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.



# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_mob_mouse_entered():
	print("oof i've been hit by a moose")
	


func _on_VisibilityNotifier2D_screen_exited():
	#print("im outta here")
	queue_free()
	pass # Replace with function body.
