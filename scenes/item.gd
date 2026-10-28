@tool
class_name Item
extends Area2D

@export var data: ItemData
var item_size := Vector2(200, 128)
@onready var sprite: Sprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = data.texture
	sprite.scale = item_size / sprite.texture.get_size()
