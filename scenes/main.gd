extends Node2D

const BANANA_BREAD = preload("uid://di7krerlp6ks")
const SAUL = preload("uid://ekovj0a5dmlb")

const ITEM_DATA: Array[ItemData] = [
	BANANA_BREAD,
	SAUL,
]

const ITEM = preload("uid://c2av4i51uc2f2")

@onready var items: Node2D = $Items

func _on_item_timer_timeout() -> void:
	var item := ITEM.instantiate() as Item
	item.data = ITEM_DATA.pick_random()
	
	var max_size := get_viewport().get_visible_rect().size
	item.position = Vector2(
		randf_range(0, max_size.x), randf_range(0, max_size.y)
	)
	items.add_child(item)
