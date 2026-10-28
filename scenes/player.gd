extends CharacterBody2D


const SPEED = 300.0

var inventory: Array[ItemStack]

@onready var pickup_area: Area2D = $PickupArea

func _physics_process(delta: float) -> void:
		
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		for area in pickup_area.get_overlapping_areas():
			if area is Item:
				pickup(area)

func pickup(item: Item) -> void:
	for stack in inventory:
		if stack.data.name == item.data.name:
			if stack.amount < item.data.max_stack:
				stack.amount += 1
				item.queue_free()
			return
	var new_stack := ItemStack.new()
	new_stack.data = item.data
	new_stack.amount = 1
	inventory.append(new_stack)
	item.queue_free()
