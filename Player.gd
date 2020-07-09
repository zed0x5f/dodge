extends Area2D

signal player_hit
#i forgot to connect the event to this function
func _on_Player_body_entered(body):
	#I DONT KNOW WHAT IM DOING BUT MOB ISN'T
	# DETECTING COLLISION WITH 2D Area
	if(body.has_method("_on_mob_entered")):
		#engage elite hacks
		body._on_mob_entered(self)
		
	print("signal emitted")
	emit_signal("player_hit")

# How fast the player will move (pixels/sec).
export var speed = 400  

var screen_size  # Size of the game window.

# Declare member variables here. Examples:
# var a = 2
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	##take this out when u is done
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
	# See the note below about boolean assignment
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)



func die():
	hide()  # Player disappears after being hit.s
	$CollisionShape2D.set_deferred("disabled", true)
