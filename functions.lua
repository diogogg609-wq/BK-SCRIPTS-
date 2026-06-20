_G.BK_Engine = _G.BK_Engine or {}

_G.BK_Engine.ModificarVelocidade = function(valor)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = valor
        
        -- CHAMA O SOM DO OUTRO ARQUIVO! (Som de clique/ativação)
        if _G.BK_Engine.TocarSom then
            _G.BK_Engine.TocarSom("12222242") -- Um som padrão do Roblox
        end
    end
end
