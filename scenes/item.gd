@tool
class_name Item
extends Area2D

@export var data: ItemData
var item_size := Vector2(200, 128)
@onready var sprite: Sprite2D = $Sprite
@onready var panel: Panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = data.texture
	sprite.scale = item_size / sprite.texture.get_size()
	panel.visible = false


func _on_body_entered(body: Node2D) -> void:
	panel.visible = true


func _on_body_exited(body: Node2D) -> void:
	panel.visible = false
