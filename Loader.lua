
local GITHUB_USERNAME = "diogogg609-wq" 
local REPO_NAME = "BK-SCRIPTS-"          
local BRANCH = "main"                   

local BaseUrl = "https://raw.githubusercontent.com/" .. GITHUB_USERNAME .. "/" .. REPO_NAME .. "/" .. BRANCH .. "/"

print("[BK SCRIPTS] Inicializando sistema de segurança e carregamento móvel...")


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

task.spawn(function()
        
    local Optimization = SafeLoad("Modules/Optimization.lua")
    if not Optimization then return end
    
    local UI_Library = SafeLoad("UI_UX/Library.lua")
    if not UI_Library then return end
    
    UI_Library:Initialize(Optimization)
end)
