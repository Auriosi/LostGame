extends Node

const save_location = "user://SaveFile.tres"

var SaveFileData1: SaveDataResource = SaveDataResource.new()
var SaveFileData2: SaveDataResource = SaveDataResource.new()
var SaveFileData3: SaveDataResource = SaveDataResource.new()
var SaveFileData4: SaveDataResource = SaveDataResource.new()

func _save1():
	ResourceSaver.save(SaveFileData1, save_location)

func _save2():
	ResourceSaver.save(SaveFileData2, save_location)

func _save3():
	ResourceSaver.save(SaveFileData3, save_location)

func _save4():
	ResourceSaver.save(SaveFileData4, save_location)

func _load1():
	if FileAccess.file_exists(save_location):
		SaveFileData1 = ResourceLoader.load(save_location).duplicate(true)

func _load2():
	if FileAccess.file_exists(save_location):
		SaveFileData2 = ResourceLoader.load(save_location).duplicate(true)

func _load3():
	if FileAccess.file_exists(save_location):
		SaveFileData3 = ResourceLoader.load(save_location).duplicate(true)

func _load4():
	if FileAccess.file_exists(save_location):
		SaveFileData4 = ResourceLoader.load(save_location).duplicate(true)
