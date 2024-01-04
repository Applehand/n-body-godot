extends Node2D
class_name CelestialBody


var id: String = ""
var mass: float = 0.0
var vel_x: float = 0.0
var vel_y: float = 0.0
var pos_x: float = 0.0
var pos_y: float = 0.0


func get_attraction_force(other_body: CelestialBody) -> Vector2:
	if self.id == other_body.id:
		return Vector2.ZERO

	# Compute the distance to the other body.
	var distance_x: float = (other_body.pos_x - self.pos_x)
	var distance_y: float = (other_body.pos_y - self.pos_y)
	var distance: float  = sqrt(distance_x**2 + distance_y**2)

	# Making sure not to divide by zero
	if distance == 0.0:
		distance = 1.0

	# Compute the force of attraction
	var force: float = Universe.G * self.mass * other_body.mass / (distance**2)

	# Compute the direction of the force.
	var theta: float = atan2(distance_y, distance_x)
	var force_x: float = cos(theta) * force
	var force_y: float = sin(theta) * force
	var attraction_force := Vector2(force_x, force_y)

	return attraction_force
