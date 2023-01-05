extends Node


func _ready():
	pass # Replace with function body.
	print("Parent")
	doIt()


func doIt():
	var msg = yield($Child0, "Test")
	print(msg + " From Child0")
