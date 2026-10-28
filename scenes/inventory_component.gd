extends Node

signal inventory_updated
var inventory: Array[ItemStack]

func pickup(item: Item) -> void:
	for stack in inventory:
		if stack.data.name == item.data.name:
			if stack.amount < item.data.max_stack:
				stack.amount += 1
				item.queue_free()
				inventory_updated.emit()
			return
	var new_stack := ItemStack.new()
	new_stack.data = item.data
	new_stack.amount = 1
	inventory.append(new_stack)
	item.queue_free()
	inventory_updated.emit()
