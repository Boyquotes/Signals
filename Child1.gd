extends Node


func _ready():
	pass # Replace with function body.
	yield(get_tree().create_timer(0.02), "timeout")
	print("Child1")
	doIt()


func doIt():
	pass
	var path=get_node("../Child0")
	var msg = yield(path , "Test")
	print(msg + " From Sibling[Child1] of Child0")
