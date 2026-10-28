extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.inventory_updated.connect(_on_inventory_updated)

func _on_inventory_updated(inventory: Array[ItemStack]) -> void:
	for i in inventory.size():
		get_child(i).stack = inventory[i]
		get_child(i).update_ui()
