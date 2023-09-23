extends Label


func _ready() -> void:
	text = get_build()


func get_build() -> String:

	const VERSION_SCRIPT_PATH: String = "res://addons/auto_export_datetime/version.gd"

	var export_date_time: String

	if ResourceLoader.exists(VERSION_SCRIPT_PATH):
		var resource: Resource = ResourceLoader.load(VERSION_SCRIPT_PATH)
		if resource != null:
			export_date_time = resource.VERSION
		else:
			export_date_time = "Failed to load resource: %s" % VERSION_SCRIPT_PATH
	else:
		export_date_time = "Resource does not exist: %s" % VERSION_SCRIPT_PATH

	return export_date_time
