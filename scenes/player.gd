extends CharacterBody2D


const SPEED = 300.0

@onready var pickup_area: Area2D = $PickupArea
@onready var inventory_component: Node = $InventoryComponent


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
				inventory_component.pickup(area)


func _on_inventory_updated() -> void:
	Events.inventory_updated.emit(inventory_component.inventory)
