extends KinematicBody2D


onready var animation = $AnimatedSprite

const speed = 100
var velocity = Vector2()
var target = Vector2()

export(NodePath) var path_rotation
var path_points
var path_point_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if path_rotation:
		path_points = get_node(path_rotation).curve.get_baked_points()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !path_rotation:
		return
	var target = path_points[path_point_index]
	if position.distance_to(target) < 1:
		path_point_index = wrapi(path_point_index + 1, 0, path_points.size())
		target = path_points[path_point_index]
	
	velocity = (target - position).normalized() * speed
	velocity = move_and_slide(velocity)
