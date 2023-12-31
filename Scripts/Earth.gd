extends CelestialBody


# Called when the node enters the scene tree for the first time.
func _ready():
	id = 'Earth'
	mass = 5.9742 * 10**24
	pos_x = -1 * Universe.AU
	vel_y = 29.783 * 1000
