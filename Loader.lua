--====================================================================
-- 🩸 BK SCRIPTS - LOADER DIRETO (SEM PASTAS) 🩸
--====================================================================

-- Links diretos para os arquivos soltos no seu repositório
local URL_OTIMIZACAO = "https://raw.githubusercontent.com/diogogg609-wq/BK-SCRIPTS-/main/Optimization.lua"
local URL_INTERFACE  = "https://raw.githubusercontent.com/diogogg609-wq/BK-SCRIPTS-/main/Library.lua"

print("[BK SCRIPTS] Carregando arquivos diretos do repositório...")

local function BaixarCodigo(url)
    local success, content = pcall(function()
        return game:HttpGet(url)
    end)
    
    if not success or not content or content == "404: Not Found" then
        warn("[BK SCRIPTS] Arquivo não encontrado: " .. url)
        return nil
    end
    
    local func, err = loadstring(content)
    if not func then
        warn("[BK SCRIPTS] Erro no código: " .. tostring(err))
        return nil
    end
    
    return func()
end

task.spawn(function()
    -- Carrega a Otimização
    local Optimization = BaixarCodigo(URL_OTIMIZACAO)
    if not Optimization then return end
    
    -- Carrega a Interface e abre o menu
    local UI_Library = BaixarCodigo(URL_INTERFACE)
    if not UI_Library then return end
    
    UI_Library:Initialize(Optimization)
end)
