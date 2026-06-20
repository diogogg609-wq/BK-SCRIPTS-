_G.BK_Engine = _G.BK_Engine or {}

_G.BK_Engine.TocarSom = function(id)
    local som = Instance.new("Sound", game.Workspace)
    som.SoundId = "rbxassetid://" .. id
    som.Volume = 1
    som:Play()
    game:GetService("Debris"):AddItem(som, 3) -- Deleta o som após 3 segundos
    print("BK SCRIPTS 🩸: Som tocado com sucesso!")
end
