-- Caminho base do seu repositório no GitHub
local url_base = "https://raw.githubusercontent.com/SeuUsuario/BK-Teste-Modular/main/"

print("BK SCRIPTS 🩸: Iniciando carregamento modular...")

-- Carrega os módulos na ordem correta
loadstring(game:HttpGet(url_base .. "sounds.lua"))()
loadstring(game:HttpGet(url_base .. "functions.lua"))()
loadstring(game:HttpGet(url_base .. "ui_main.lua"))()

print("BK SCRIPTS 🩸: Todos os módulos carregados com performance máxima!")
