extends Node2D

var celestial_bodies: Array[CelestialBody]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_celestial_body_positions(celestial_bodies)

func _on_child_entered_tree(node):
	if node is CelestialBody:
		celestial_bodies.append(node)

func update_celestial_body_positions(celestial_bodies: Array):
	var final_force: Dictionary = {}
	for body in celestial_bodies:
		var total_force: Vector2
		for other in celestial_bodies:
			# Don't calculate the body's attraction to itself
			if body.id == other.id:
				continue
			var attraction_force: Vector2 = body.get_attraction_force(other)
			total_force += attraction_force
		final_force[body] = total_force

		var applied_force = final_force[body]
		body.vel_x += applied_force.x / body.mass * Universe.timestep
		body.vel_y += applied_force.y / body.mass * Universe.timestep

		# Update positions
		body.pos_x += body.vel_x * Universe.timestep
		body.pos_y += body.vel_y * Universe.timestep
		body.position.x = body.pos_x * Universe.SCALE
		body.position.y = body.pos_y * Universe.SCALE

		print("Body:", body.id)
		print("VelocityX:", body.vel_x)
		print("VelocityY:", body.vel_y)
		print("PositionX:", body.pos_x)
		print("PositionY:", body.pos_y)
		print("---")
