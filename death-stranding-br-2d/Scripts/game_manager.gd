extends Node

var cargo = 0
var deliveries = 0

func add_cargo():
	cargo += 1
	print(cargo)

func remove_cargo():
	cargo -= 1
	print(cargo)
	
func add_delivery():
	deliveries += 1
	print("delivery = ", deliveries)
