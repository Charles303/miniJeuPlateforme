extends Node

export var nbvie = 3
onready var vielabel = get_node("Player/Label")
onready var player = get_node("Player")

var strnbvie = str(nbvie)

# Called when the node enters the scene tree for the first time.
func _ready():
	vielabel.set_text("vies restantes : " + strnbvie)

func _physics_process(delta):
	#Si partie perdue
	if nbvie == 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")

func _on_Area2D_body_entered(body):
	
	nbvie = nbvie - 1
	strnbvie = str(nbvie)
	#Pour le respawn
	player.position = Vector2(75, 100)
	vielabel.set_text("vies restantes : " + strnbvie)
