extends Node2D

func _ready():
	var rng = RandomNumberGenerator.new();
	var thing = rng.randf_range(0.00, 10.00);
	print(thing);
	if thing >= 5:
		$AltTrack.play();
	else:
		$MainTrack.play();
