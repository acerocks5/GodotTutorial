extends Node2D



func _on_gate_player_entered_gate(body):
	print("Player has entered gate")
	print(body)



func _on_player_shoot_laser():
	print("laser from level")


func _on_player_throw_grenade():
	print("grenade from level")
