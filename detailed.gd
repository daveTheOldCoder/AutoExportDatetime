extends RichTextLabel

const VERSION: String = "1.0.0"

func _ready() -> void:

	# Get date/time string.
	var build: String = get_build()
	
	# Append annotation if this is a debug build.
	if OS.is_debug_build():
		build += " (debug)"

	# Place info in RichTextLabel text.
	bbcode_enabled = true
	text =\
"""[b]Auto Export Datetime Demo[/b]  v.%s  by DaveTheCoder
Build: %s
Created using [url=http://godotengine.org/license]Godot Engine[/url] v.%s
""" % [VERSION, build, Engine.get_version_info()["string"]]

	# Enable clicking of url tag in BBCode.
	meta_clicked.connect(func(url: String): OS.shell_open(url))


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
