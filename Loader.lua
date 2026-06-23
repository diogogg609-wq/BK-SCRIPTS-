--====================================================================
-- 🩸 BK SCRIPTS - SYSTEM LOADER (V1.0.0) 🩸
-- Desenvolvido exclusivamente para BK SCRIPTS e otimizado para Delta
--====================================================================

-- CONFIGURAÇÃO DO SEU REPOSITÓRIO (Substitua pelo seu Usuário do GitHub)
local GITHUB_USERNAME = "SEU_USER_AQUI" -- 🟥 Mude para o seu nome de usuário do GitHub
local REPO_NAME = "BK-SCRIPTS"          -- Nome exato do repositório no GitHub
local BRANCH = "main"                   -- Geralmente 'main'

local BaseUrl = "https://raw.githubusercontent.com/" .. GITHUB_USERNAME .. "/" .. REPO_NAME .. "/" .. BRANCH .. "/"

print("[BK SCRIPTS] Inicializando sistema de segurança e carregamento móvel...")

-- Função Auxiliar Segura para Carregar Módulos Remotos (Anti-Crash Mobile)
local function SafeLoad(path)
    local url = BaseUrl .. path
    local success, content = pcall(function()
        return game:HttpGet(url)
    end)
    
    if not success or not content or content == "404: Not Found" then
        warn("[BK SCRIPTS ERROR] Falha ao ler arquivo do GitHub: " .. path)
        return nil
    end
    
    local func, err = loadstring(content)
    if not func then
        warn("[BK SCRIPTS ERROR] Erro de sintaxe no módulo " .. path .. " -> " .. tostring(err))
        return nil
    end
    
    return func()
end

-- Carregamento Modular Assíncrono
task.spawn(function()
    -- 1. Carrega o Módulo de Otimização e Performance
    local Optimization = SafeLoad("Modules/Optimization.lua")
    if not Optimization then return end
    
    -- 2. Carrega a Interface Gráfica e inicia a Abertura Cyber-Splash
    local UI_Library = SafeLoad("UI_UX/Library.lua")
    if not UI_Library then return end
    
    -- Inicializa a UI passando as dependências de otimização
    UI_Library:Initialize(Optimization)
end)
