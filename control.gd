extends Control

@onready var mensagem = $VBoxContainer/Mensagem
# Called when the node enters the scene tree for the first time.

@onready var botao_direito = $VBoxContainer/Correto
var palpite
var min_palpite = 0
var max_palpite = 1000
var acabou = false

func _ready():
	palpite = (min_palpite + max_palpite) /2
	
	mensagem.text = "Seu número é " + str(palpite) + "?"

func _tenta_palpite(type):
	if type == "Maior":
		min_palpite = palpite
	else:
		max_palpite = palpite
	
	palpite = (min_palpite + max_palpite) /2
	
	mensagem.text = "Seu número é " + str(palpite) + "?"
	

func _on_maior_pressed() -> void:
	_tenta_palpite("Maior")


func _on_menor_pressed() -> void:
	_tenta_palpite("Menor")
func _on_correto_pressed() -> void:
	if acabou:
		_restart_game()
	else:
		_end_game()


func _end_game():
	acabou = true
	mensagem.text = "Sim! Eu Sabia! Que seu número era: " +str(palpite) + "!"
	botao_direito.text + "Recomeçar"
	
	
func _restart_game():
	get_tree().reload_current_scene()
	
