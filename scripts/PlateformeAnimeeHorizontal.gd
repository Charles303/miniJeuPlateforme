extends Node2D


onready var anim_player = get_node("AnimationPlayer")



# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player.connect("animation_finished", self, "on_finished")
	anim_player.play("Horizontal")


func on_finished():
	print("Animation finished")
