extends RichTextLabel

const VERSION: String = "1.0.0"

func _ready() -> void:

	var build: String = get_build()
	
	if OS.is_debug_build():
		build += " (debug)"

	bbcode_enabled = true
	
	text =\
"""[b]Auto Export Datetime Demo[/b]  v.%s  by DaveTheCoder
Build: %s
Created using [url=http://godotengine.org/license]Godot Engine[/url] v.%s
""" % [VERSION, build, Engine.get_version_info()["string"]]

	meta_clicked.connect(func(url: String): OS.shell_open(url))


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
