extends RigidBody2D

signal mob_hit
func _on_mob_entered(area):
	print("mob oof ive been hit")
	emit_signal("mob_hit")
	if(!self.is_bad()):
		queue_free()
	
export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.

var mob_type

# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	mob_type = mob_types[randi() % mob_types.size()]
	$AnimatedSprite.animation = mob_type


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#pass


func _on_VisibilityNotifier2D_screen_exited():
	#print("im outta here")
	queue_free()

func is_bad():
	#
	return ["fly","swim","walk"].has(mob_type)
