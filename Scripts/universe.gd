extends Node

const AU: float = (149.6e6 * 1000)     # Astronomical Unit - 149.6 million km, in meters. Distance from Earth to Sun.
const G: float = 6.67428e-11     # The gravitational constant G
const SCALE: float = 250 / AU

var timestep: int = 24*3600  # One day
