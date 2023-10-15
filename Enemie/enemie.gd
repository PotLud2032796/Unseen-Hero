extends CharacterBody2D

const SPEED = 800

var can_laser: bool = true
var can_burst: bool = true
var wait: bool = true
@onready var animation_player = $AnimationPlayer

var conteur = 0
@export var max_balle = 0
signal player_laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Shooting	
	
	if can_laser and can_burst:
		animation_player.play("Shoot")
		var laser_markers = $LaserPos.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		# emit position
		player_laser.emit(selected_laser.global_position)
		can_laser = false
		conteur = conteur +1
		$Timer.start()
		if conteur == max_balle:
			can_burst = false
			animation_player.stop()
			$Burst.start()
			conteur = 0

func _on_timer_timeout():
	can_laser = true

func _on_burst_timeout():
	can_burst = true

func _on_tempo_anim_timeout():
	print("WAIT")


