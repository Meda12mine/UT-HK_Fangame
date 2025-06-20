extends NinePatchRect

var default_dimension := Vector2(162, 52)
var default_center := Vector2.ZERO
const  soul = preload("res://scenes/soul.tscn")

func change_dimension(height: float, width: float, time: float):
	var final_dimension = Vector2(width, height)
	default_center = position + pivot_offset
	var soulInt = soul.instantiate()
	if size != final_dimension:
		print("started changing dimension")

		var new_pivot = final_dimension / 2
		var new_position = default_center - new_pivot

		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(self, "size", final_dimension, 0.5)
		tween.tween_property(self, "position", new_position, 0.5)
		tween.tween_callback(Callable(self, "update_pivot"))
		await tween.finished

		$"../..".add_child(soulInt)
		soulInt.global_position = $"../spawn_point".global_position
		soulInt.scale = Vector2(.4,.4)
		$"../ColorRect".scale = final_dimension
		$"../ColorRect".global_position = global_position
	
	await get_tree().create_timer(time).timeout
	soulInt.queue_free()
	var tween_back = create_tween()
	tween_back.set_parallel(true)
	tween_back.tween_property(self, "size", default_dimension, 0.5)
	tween_back.tween_property(self, "position", default_center - (default_dimension / 2), 0.5)
	tween_back.tween_callback(Callable(self, "update_pivot"))
	await tween_back.finished
	$"../ColorRect".scale = default_dimension
	$"../ColorRect".global_position = global_position

	print("finished func")


func update_pivot():
	pivot_offset = size / 2
