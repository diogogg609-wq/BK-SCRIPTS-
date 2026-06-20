_G.BK_Engine = _G.BK_Engine or {}

-- Criando uma tela simples na tela do jogador
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, -75)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true -- Você pode arrastar pelo celular

-- Título
local Titulo = Instance.new("TextLabel", MainFrame)
Titulo.Size = UDim2.new(1, 0, 0, 30)
Titulo.Text = "BK SCRIPTS 🩸"
Titulo.TextColor3 = Color3.fromRGB(255, 0, 0)
Titulo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- Botão para ativar a função que está no outro arquivo!
local Botao = Instance.new("TextButton", MainFrame)
Botao.Size = UDim2.new(0.8, 0, 0, 40)
Botao.Position = UDim2.new(0.1, 0, 0.4, 0)
Botao.Text = "Super Velocidade"
Botao.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Botao.TextColor3 = Color3.fromRGB(255, 255, 255)

Botao.MouseButton1Click:Connect(function()
    -- CHAMA A FUNÇÃO QUE ESTÁ NO ARQUIVO FUNCTIONS.LUA!
    if _G.BK_Engine.ModificarVelocidade then
        _G.BK_Engine.ModificarVelocidade(100) -- Altera a velocidade para 100
        Botao.Text = "Ativado!"
        Botao.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end
end)
