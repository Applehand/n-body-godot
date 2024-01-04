extends Node


const AU: float = (149.6e6 * 1000)     # Astronomical Unit - 149.6 million km, in meters. Distance from Earth to Sun.
const G: float = 6.67428e-11     # The gravitational constant G
const SCALE: float = 300 / AU

var timestep: int = 12*3600
