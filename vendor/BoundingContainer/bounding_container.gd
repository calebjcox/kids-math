class_name BoundingContainer
extends Container
# A `Container` that will scale the contents once it hits a max size
#
# Godot's built in container classes grow with the contents. This works well for
# a lot of cases but not when you want to be able to limit the size the of the
# container (e.g. when you want to keep the entire contents on the screen).
#
# This scales down the content instead of resizing it because the built in 
# resize code won't shrink content.
#
# https://github.com/cjc89/godot-bounding-container


enum BoundingMode {
	NONE,
	SCREEN,
	SPECIFIED,
	SCREEN_AND_SPECIFIED,
}

export(BoundingMode) var width_bounding_mode = BoundingMode.SCREEN_AND_SPECIFIED setget _set_bounding_x
export(BoundingMode) var height_bounding_mode = BoundingMode.SCREEN_AND_SPECIFIED setget _set_bounding_y
export(int) var max_width = 0 setget _set_max_width
export(int) var max_height = 0 setget _set_max_height


func _ready():
	get_viewport().connect("size_changed", self, "queue_sort")


func _notification(what):
	match what:
		NOTIFICATION_SORT_CHILDREN, NOTIFICATION_RESIZED:
			scale()


func scale() -> void:
	var rect: Rect2
	var scaleX: float = 1
	var scaleY: float = 1
	var scale: float
	
	rect = getBoundedRect()
	scaleX = getScaleX(rect)
	scaleY = getScaleY(rect)
	
	scale = min(scaleX, scaleY)
	rect_scale = Vector2(scale, scale)


func getScaleX(rect: Rect2) -> float:
	return _scaleFactor(width_bounding_mode, rect.size.x, max_width, get_viewport().size.x)


func getScaleY(rect: Rect2) -> float:
	return _scaleFactor(height_bounding_mode, rect.size.y, max_height, get_viewport().size.y)


# Generates the appropriate rectangle to use for calculating the scale factor.
# Depending on what the child elements are, `get_rect()` may return [0, 0, 0, 0]
# even if the children have a size. This will loop through all of the children
# and make sure the `Rect2` used for calculating the scale includes the child
func getBoundedRect() -> Rect2:
	var rect: Rect2 = get_rect()
	for child in get_children():
		rect = rect.merge(child.get_rect())
	return rect


# Calculates the scale factor for one dimension
func _scaleFactor(mode: int, size, max_size, screen_size) -> float:
	var scale: float = 1
	
	if size == 0:
		return scale
	
	match mode:
		BoundingMode.SCREEN:
			if screen_size > 0:
				scale = screen_size / size
			
		BoundingMode.SPECIFIED:
			if max_size > 0:
				scale = max_size / size
			
		BoundingMode.SCREEN_AND_SPECIFIED:
			scale = _scaleFactor(BoundingMode.SCREEN, size, max_size, screen_size)
			scale = min(scale, _scaleFactor(BoundingMode.SPECIFIED, size, max_size, screen_size))
	

	return min(scale, float(1))


func _set_bounding_x(mode):
	if mode == width_bounding_mode:
		return
	width_bounding_mode = mode
	queue_sort()


func _set_bounding_y(mode):
	if mode == height_bounding_mode:
		return
	height_bounding_mode = mode
	queue_sort()


func _set_max_width(width):
	if width == max_width:
		return
	max_width = width
	if width_bounding_mode == BoundingMode.SPECIFIED or width_bounding_mode == BoundingMode.SCREEN_AND_SPECIFIED:
		queue_sort()


func _set_max_height(height):
	if height == max_height:
		return
	max_height = height
	if height_bounding_mode == BoundingMode.SPECIFIED or height_bounding_mode == BoundingMode.SCREEN_AND_SPECIFIED:
		queue_sort()
