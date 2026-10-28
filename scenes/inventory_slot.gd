extends Control

var stack: ItemStack

@onready var sprite: TextureRect = $MarginContainer/Sprite
@onready var stack_amount: Label = $MarginContainer2/StackAmount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_ui()

func update_ui() -> void:
	if stack:
		sprite.texture = stack.data.texture
		stack_amount.text = "x%d" % stack.amount
		sprite.visible = true
		stack_amount.visible = true
	else:
		sprite.visible = false
		stack_amount.visible = false
