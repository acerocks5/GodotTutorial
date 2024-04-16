extends CharacterBody2D

signal shoot_laser(pos, direction)
signal throw_grenade(pos, direction)

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	#laser shooting input
	if Input.is_action_just_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		
		can_laser = false
		$Timer_laser.start()
		shoot_laser.emit(selected_laser.global_position, player_direction)
		
	#throw grenade input
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		var grenade_markers = $LaserStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		#alternative to get position from the middle point: var pos = $LaserStartPositions.getChildren()[0].global_position, in emit put pos
		can_grenade = false
		$Timer_grenade.start()
		
		throw_grenade.emit(selected_grenade.global_position, player_direction)

func _on_timer_laser_timeout():
	can_laser = true


func _on_timer_grenade_timeout():
	can_grenade = true
