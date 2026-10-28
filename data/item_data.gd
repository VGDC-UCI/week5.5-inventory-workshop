class_name ItemData
extends Resource


@export var name: String
@export_multiline var description: String
@export var texture: Texture2D
@export_range(0, 100, 1, "prefer_slider") var max_stack: int = 1
