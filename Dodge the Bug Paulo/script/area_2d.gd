extends Area2D

signal hit
const speed := 300
@onready var screen_size = get_viewport_rect().size
@onready var anim = $anim
@onready var collision = $Collision
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocidade = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if velocidade.length() > 0:
		velocidade = velocidade.normalized() * speed
	if velocidade.x != 0:
		anim.play("move")
	elif velocidade.y > 0:
		anim.play("up")
	elif velocidade.y < 0 :
		anim.play("down")
	else:
		anim.play("idle")
	
	anim.flip_h = true if velocidade.x > 0 else false
	
	position += velocidade * delta
	position = position.clamp(Vector2.ZERO, screen_size)
