extends Node2D

var celestial_bodies: Array[CelestialBody]
var total_forces: Dictionary

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta) -> void:
	update_celestial_body_positions(celestial_bodies)

func _on_child_entered_tree(node) -> void:
	if node is CelestialBody:
		celestial_bodies.append(node)

func update_celestial_body_positions(bodies: Array[CelestialBody]) -> void:
	for body in bodies:
		var net_force: Vector2 = Vector2.ZERO
		for other_body in bodies:
			# Don't calculate the body's attraction to itself
			if body.id == other_body.id:
				continue
			var attraction_force: Vector2 = body.get_attraction_force(other_body)
			net_force += attraction_force

		# Add net force to dictionary of total forces
		total_forces[body] = net_force

		# Add force to velocity
		var applied_force: Vector2 = total_forces[body]
		body.vel_x += applied_force.x / body.mass * Universe.timestep
		body.vel_y += applied_force.y / body.mass * Universe.timestep

		# Update positions using the updated velocity
		body.pos_x += body.vel_x * Universe.timestep
		body.pos_y += body.vel_y * Universe.timestep
		body.position.x = body.pos_x * Universe.SCALE
		body.position.y = body.pos_y * Universe.SCALE

		print('Body:', body.id)
		print('Velocity:', body.vel_x, body.vel_y)
		print('Position:', body.pos_x, body.pos_y)
		print('Force applied:', applied_force)
		print("======")
