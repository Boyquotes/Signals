extends Node2D


func _ready():
	OS.window_size = Vector2(320, 240)
	print("Root")
	doIt()


func doIt():
	var msg = yield($Parent/Child0, "Test")
	print(msg + " From Parent")
