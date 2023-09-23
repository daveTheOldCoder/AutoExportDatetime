extends Label


func _ready() -> void:
	# Place date/time string in label text.
	text = get_build()


# Return string containing date/time of most recent export.
func get_build() -> String:

	const DATETIME_FILE: String = "res://addons/auto_export_datetime/version.gd"

	var result: String

	if ResourceLoader.exists(DATETIME_FILE):
		var resource: Resource = ResourceLoader.load(DATETIME_FILE)
		if resource != null:
			result = resource.VERSION
		else:
			result = "Failed to load resource: %s" % DATETIME_FILE
	else:
		result = "Resource does not exist: %s" % DATETIME_FILE

	return result
