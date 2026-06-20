_G.BK_Engine = _G.BK_Engine or {}

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("BK_Interface_Oficial") then
    CoreGui.BK_Interface_Oficial:Destroy()
end

local UI_Main = Instance.new("ScreenGui", CoreGui)
UI_Main.Name = "BK_Interface_Oficial"

-- 1. BOLHA FLUTUANTE ESTELAR CLEAN
local Bolha = Instance.new("Frame", UI_Main)
Bolha.Name = "BK_Bolha"
Bolha.Size = UDim2.new(0, 140, 0, 40)
Bolha.Position = UDim2.new(0.1, 0, 0.2, 0)
Bolha.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
Bolha.BorderSizePixel = 1
Bolha.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bolha.ClipsDescendants = true
Bolha.Active = true

local EspacoEstelar = Instance.new("Frame", Bolha)
EspacoEstelar.Size = UDim2.new(1, 0, 1, 0)
EspacoEstelar.BackgroundTransparency = 1

local random = Random.new()
for i = 1, 10 do
    local Estrela = Instance.new("TextLabel", EspacoEstelar)
    Estrela.Text = "."
    Estrela.Font = Enum.Font.GothamBold
    Estrela.TextSize = random:NextInteger(8, 12)
    Estrela.TextColor3 = Color3.fromRGB(255, 255, 255)
    Estrela.BackgroundTransparency = 1
    Estrela.Position = UDim2.new(random:NextNumber(0, 1), 0, random:NextNumber(0, 1), 0)
    Estrela.TextTransparency = random:NextNumber(0.4, 0.8)
end

local TextoBolha = Instance.new("TextLabel", Bolha)
TextoBolha.Size = UDim2.new(1, 0, 1, 0)
TextoBolha.BackgroundTransparency = 1
TextoBolha.Text = "BK SCRIPTS 🩸"
TextoBolha.TextColor3 = Color3.fromRGB(255, 255, 255)
TextoBolha.Font = Enum.Font.GothamBold
TextoBolha.TextSize = 12
TextoBolha.ZIndex = 3

-- Arrastar Bolha
local dragging, dragInput, dragStart, startPos
Bolha.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true dragStart = input.Position startPos = Bolha.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
Bolha.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)
UserInputService.InputChanged:Connect(function(input) if input == dragInput and dragging then local delta = input.Position - dragStart Bolha.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) end end)

-- 2. PAINEL PRINCIPAL QUADRADO CLEAN
local MainFrame = Instance.new("Frame", UI_Main)
MainFrame.Name = "BK_MenuPrincipal"
MainFrame.Size = UDim2.new(0, 420, 0, 260)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Visible = false

-- BARRA LATERAL (Menu de Abas)
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0, 110, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
Sidebar.BorderSizePixel = 0

local BtnPerfilAb = Instance.new("TextButton", Sidebar)
BtnPerfilAb.Size = UDim2.new(1, 0, 0, 40)
BtnPerfilAb.Position = UDim2.new(0, 0, 0, 10)
BtnPerfilAb.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
BtnPerfilAb.Text = "👤 Perfil"
BtnPerfilAb.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnPerfilAb.Font = Enum.Font.GothamBold
BtnPerfilAb.TextSize = 12

local BtnConfigAb = Instance.new("TextButton", Sidebar)
BtnConfigAb.Size = UDim2.new(1, 0, 0, 40)
BtnConfigAb.Position = UDim2.new(0, 0, 0, 55)
BtnConfigAb.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
BtnConfigAb.Text = "⚙️ Configs"
BtnConfigAb.TextColor3 = Color3.fromRGB(180, 180, 180)
BtnConfigAb.Font = Enum.Font.GothamBold
BtnConfigAb.TextSize = 12

-- CONTEÚDO DAS ABAS (Lado Direito)
local Container = Instance.new("Frame", MainFrame)
Container.Size = UDim2.new(1, -120, 1, -20)
Container.Position = UDim2.new(0, 120, 0, 10)
Container.BackgroundTransparency = 1

-- ABA PERFIL
local AbaPerfil = Instance.new("Frame", Container)
AbaPerfil.Size = UDim2.new(1, 0, 1, 0)
AbaPerfil.BackgroundTransparency = 1
AbaPerfil.Visible = true

-- Foto Real do Usuário do Roblox
local FotoJogador = Instance.new("ImageLabel", AbaPerfil)
FotoJogador.Size = UDim2.new(0, 80, 0, 80)
FotoJogador.Position = UDim2.new(0, 10, 0, 20)
FotoJogador.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FotoJogador.BorderSizePixel = 1
FotoJogador.BorderColor3 = Color3.fromRGB(40, 40, 40)
-- Puxa o Avatar Thumbnail oficial do jogador logado
FotoJogador.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=150&height=150&format=png"

-- Nome do Jogador
local NomeJogador = Instance.new("TextLabel", AbaPerfil)
NomeJogador.Size = UDim2.new(1, -110, 0, 30)
NomeJogador.Position = UDim2.new(0, 105, 0, 30)
NomeJogador.Text = "Nome: " .. LocalPlayer.Name
NomeJogador.TextColor3 = Color3.fromRGB(255, 255, 255)
NomeJogador.Font = Enum.Font.GothamBold
NomeJogador.TextSize = 14
NomeJogador.TextXAlignment = Enum.TextXAlignment.Left
NomeJogador.BackgroundTransparency = 1

local CargoJogador = Instance.new("TextLabel", AbaPerfil)
CargoJogador.Size = UDim2.new(1, -110, 0, 20)
CargoJogador.Position = UDim2.new(0, 105, 0, 55)
CargoJogador.Text = "Status: BK Client User"
CargoJogador.TextColor3 = Color3.fromRGB(255, 0, 50)
CargoJogador.Font = Enum.Font.Gotham
CargoJogador.TextSize = 12
CargoJogador.TextXAlignment = Enum.TextXAlignment.Left
CargoJogador.BackgroundTransparency = 1

-- ABA CONFIGURAÇÕES
local AbaConfig = Instance.new("Frame", Container)
AbaConfig.Size = UDim2.new(1, 0, 1, 0)
AbaConfig.BackgroundTransparency = 1
AbaConfig.Visible = false

-- Botão Reativar Chaves
local BtnLigarKeys = Instance.new("TextButton", AbaConfig)
BtnLigarKeys.Size = UDim2.new(0.9, 0, 0, 35)
BtnLigarKeys.Position = UDim2.new(0, 10, 0, 20)
BtnLigarKeys.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
BtnLigarKeys.Text = "Ligar Sistema de Keys"
BtnLigarKeys.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnLigarKeys.Font = Enum.Font.GothamBold
BtnLigarKeys.TextSize = 12
BtnLigarKeys.BorderSizePixel = 0

-- Validade da Chave
local LabelValidade = Instance.new("TextLabel", AbaConfig)
LabelValidade.Size = UDim2.new(0.9, 0, 0, 35)
LabelValidade.Position = UDim2.new(0, 10, 0, 70)
LabelValidade.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
LabelValidade.Text = " Validade da Key: 7 Dias Restantes"
LabelValidade.TextColor3 = Color3.fromRGB(0, 255, 100)
LabelValidade.Font = Enum.Font.Gotham
LabelValidade.TextSize = 12
LabelValidade.TextXAlignment = Enum.TextXAlignment.Left
LabelValidade.BorderSizePixel = 0

-- Lógica do botão de ligar as chaves novamente (Deleta o arquivo salvo)
BtnLigarKeys.MouseButton1Click:Connect(function()
    if delfile then
        delfile("bk_client_token.txt")
        BtnLigarKeys.Text = "Sistema Resetado! Relogue o Script"
        BtnLigarKeys.BackgroundColor3 = Color3.fromRGB(150, 0, 30)
    else
        BtnLigarKeys.Text = "Incompatível com seu Executor"
    end
end)

-- TROCA DE ABAS
BtnPerfilAb.MouseButton1Click:Connect(function()
    AbaPerfil.Visible = true AbaConfig.Visible = false
    BtnPerfilAb.BackgroundColor3 = Color3.fromRGB(20, 20, 25) BtnConfigAb.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
end)

BtnConfigAb.MouseButton1Click:Connect(function()
    AbaPerfil.Visible = false AbaConfig.Visible = true
    BtnPerfilAb.BackgroundColor3 = Color3.fromRGB(15, 15, 15) BtnConfigAb.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
end)

-- LÓGICA DE ABRIR/FECHAR
local MenuAberto = false
Bolha.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if dragging == false then
            MenuAberto = not MenuAberto
            MainFrame.Visible = MenuAberto
        end
    end
end)
