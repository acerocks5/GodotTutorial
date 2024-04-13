extends Node2D

var test_array: Array[String] = ["Test", "Hello", "Stuff"]


func _ready():
	$Logo.rotation_degrees = 90
	
	print(test_array[0])
	
func _process(delta):
	$Logo.rotation_degrees += 10 * delta
	
	if ($Logo.rotation_degrees > 180):
		$Logo.rotation_degrees = 0
		
	if($Logo.position.x > 1000):
		print('positon exceeded')
		$Logo.pos.x = 0 
