extends CharacterBody2D

signal shoot_laser()
signal throw_grenade()

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_just_pressed("primary action") and can_laser:
		can_laser = false
		$Timer_laser.start()
		shoot_laser.emit()
		
	#throw grenade input
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		can_grenade = false
		$Timer_grenade.start()
		throw_grenade.emit()

func _on_timer_laser_timeout():
	can_laser = true


func _on_timer_grenade_timeout():
	can_grenade = true
