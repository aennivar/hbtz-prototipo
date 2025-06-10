extends Control

var level: int=1

func _ready() -> void:
	$CenterContainer/BotoesPrin/jogar.grab_focus()
	$CenterContainer/MenuConfig/telaCheia.button_pressed = true if DisplayServer.window_get_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN) else false
	$CenterContainer/MenuConfig/sliderVolMaster.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$CenterContainer/MenuConfig/sliderVolMusica.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("MUSIC")))
	$CenterContainer/MenuConfig/sliderVolRuido.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))

func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://addons/dialogic/Editor/CharacterEditor/character_editor.tscn")
# Esse caminho "Res" Tem que ser para a primeira cena, ou a variavel global da primeira cena


func _on_config_pressed() -> void:
	$CenterContainer/BotoesPrin.visible = false
	$CenterContainer/MenuConfig.visible = true


func _on_creditos_pressed() -> void:
	$CenterContainer/BotoesPrin.visible = false
	$CenterContainer/MenuCreditos.visible = true




func _on_voltar_pressed() -> void:
	$CenterContainer/BotoesPrin.visible = true
	if  $CenterContainer/MenuConfig.visible:
		$CenterContainer/MenuConfig.visible = false 
		$CenterContainer/BotoesPrin/config.grab_focus()
	
	if  $CenterContainer/MenuCreditos.visible: 
		$CenterContainer/MenuCreditos.visible= false
		$CenterContainer/BotoesPrin/creditos.grab_focus()


func _on_tela_cheia_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)


func _on_slider_vol_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"),value)


func _on_slider_vol_musica_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("MUSIC"),value)


func _on_slider_vol_ruido_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"),value)
#OBSSS Não tem faixa de aúdio ainda, voltar no vídeo minuto 11 para configurar um detalhe que depende do arquivo aúdio
