extends Node

var score: float = 0.00
var high_score: float = 0
var current_score: float
var previous_score: float
var enemyamt: int = 0
var neuronsamt: int = 0
var neuronscollect: int = 0
var asteriodamt: int = 0
var restart: bool = false
var transition_in: bool = false
var transition_out: bool = false
var playerscale: float = 1.00
var millisecond: float = 0.00
var died: bool 
var survivie: bool
var dash_boost: int = 1.0
var endenemyamt: int = 0.0

# Called when the node enters the scene tree for the first time.
