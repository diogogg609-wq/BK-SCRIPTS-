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

-- FUNÇÃO AUXILIAR PARA SONS SATISFATÓRIOS
local function EmitirSomClique()
    local Som = Instance.new("Sound", Workspace)
    Som.SoundId = "rbxassetid://12221967" -- Som clássico e limpo de clique/interface
    Som.Volume = 0.5
    Som:Play()
    game:GetService("Debris"):AddItem(Som, 1)
end

-- 1. BOLHA FLUTUANTE ESTELAR (Efeito de Estrelas Correndo Restaurado)
local Bolha = Instance.new("Frame", UI_Main)
Bolha.Name = "BK_Bolha"
Bolha.Size = UDim2.new(0, 150, 0, 45)
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
for i = 1, 15 do
    local Estrela = Instance.new("TextLabel", EspacoEstelar)
    Estrela.Text = "."
    Estrela.Font = Enum.Font.GothamBold
    Estrela.TextSize = random:NextInteger(8, 14)
    Estrela.TextColor3 = Color3.fromRGB(255, 255, 255)
    Estrela.BackgroundTransparency = 1
    Estrela.Position = UDim2.new(random:NextNumber(0, 1), 0, random:NextNumber(0, 1), 0)
    Estrela.TextTransparency = random:NextNumber(0.4, 0.8)
end

-- ANIMAÇÃO DAS ESTRELAS CORRENDO (Loop Infinito Otimizado)
task.spawn(function()
    while task.wait(0.02) do
        if not EspacoEstelar or not EspacoEstelar.Parent then break end
        for _, estrela in pairs(EspacoEstelar:GetChildren()) do
            if estrela:IsA("TextLabel") then
                estrela.Position = UDim2.new(estrela.Position.X.Scale - 0.004, 0, estrela.Position.Y.Scale, 0)
                if estrela.Position.X.Scale < -0.05 then
                    estrela.Position = UDim2.new(1.05, 0, random:NextNumber(0, 1), 0)
                end
            end
        end
    end
end)

local TextoBolha = Instance.new("TextLabel", Bolha)
TextoBolha.Size = UDim2.new(1, 0, 1, 0)
TextoBolha.BackgroundTransparency = 1
TextoBolha.Text = "BK SCRIPTS 🩸"
TextoBolha.TextColor3 = Color3.fromRGB(255, 255, 255)
TextoBolha.Font = Enum.Font.GothamBold
TextoBolha.TextSize = 13
TextoBolha.ZIndex = 3

-- Lógica de arrastar sem bugar
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
MainFrame.Size = UDim2.new(0, 0, 0, 0) -- Começa em 0 para a animação de escala
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.ClipsDescendants = true
MainFrame.Visible = false

-- ========================================================
-- ESTRUTURA DO TOPO (Perfil + Nome do Script)
-- ========================================================
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
TopBar.BorderSizePixel = 0

-- Foto do Jogador no Topo Superior Esquerdo
local FotoJogador = Instance.new("ImageLabel", TopBar)
FotoJogador.Size = UDim2.new(0, 36, 0, 36)
FotoJogador.Position = UDim2.new(0, 10, 0, 7)
FotoJogador.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
FotoJogador.BorderSizePixel = 1
FotoJogador.BorderColor3 = Color3.fromRGB(30, 30, 32)
FotoJogador.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=150&height=150&format=png"

-- Nome do Jogador ao lado da Foto
local NomeJogador = Instance.new("TextLabel", TopBar)
NomeJogador.Size = UDim2.new(0, 150, 1, 0)
NomeJogador.Position = UDim2.new(0, 54, 0, 0)
NomeJogador.Text = LocalPlayer.Name
NomeJogador.TextColor3 = Color3.fromRGB(200, 200, 200)
NomeJogador.Font = Enum.Font.GothamBold
NomeJogador.TextSize = 12
NomeJogador.TextXAlignment = Enum.TextXAlignment.Left
NomeJogador.BackgroundTransparency = 1

-- Título BK SCRIPTS no Canto Direito
local TituloMenu = Instance.new("TextLabel", TopBar)
TituloMenu.Size = UDim2.new(0, 150, 1, 0)
TituloMenu.Position = UDim2.new(1, -160, 0, 0)
TituloMenu.Text = "BK SCRIPTS 🩸"
TituloMenu.TextColor3 = Color3.fromRGB(255, 255, 255)
TituloMenu.Font = Enum.Font.GothamBold
TituloMenu.TextSize = 14
TituloMenu.TextXAlignment = Enum.TextXAlignment.Right
TituloMenu.BackgroundTransparency = 1

-- ========================================================
-- SISTEMA DE NAVEGAÇÃO INFERIOR COM DESLIZE (ScrollingFrame)
-- ========================================================
local TabsNavbar = Instance.new("ScrollingFrame", MainFrame)
TabsNavbar.Size = UDim2.new(1, 0, 0, 35)
TabsNavbar.Position = UDim2.new(0, 0, 0, 50)
TabsNavbar.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
TabsNavbar.BorderSizePixel = 0
TabsNavbar.CanvasSize = UDim2.new(1.5, 0, 0, 0) -- Permite deslizar para o lado infinitamente
TabsNavbar.ScrollBarThickness = 0
TabsNavbar.ScrollingDirection = Enum.ScrollingDirection.Horizontal

local UIListLayout = Instance.new("UIListLayout", TabsNavbar)
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

-- CONTÊNER PARA COMPONENTES DE CONTEÚDO
local Container = Instance.new("Frame", MainFrame)
Container.Size = UDim2.new(1, -20, 1, -95)
Container.Position = UDim2.new(0, 10, 0, 95)
Container.BackgroundTransparency = 1

-- ABA 1: CONFIGURAÇÕES (Única por enquanto, limpa e funcional)
local AbaConfig = Instance.new("Frame", Container)
AbaConfig.Size = UDim2.new(1, 0, 1, 0)
AbaConfig.BackgroundTransparency = 1
AbaConfig.Visible = true

-- Elementos internos da Aba Configurações
local BtnLigarKeys = Instance.new("TextButton", AbaConfig)
BtnLigarKeys.Size = UDim2.new(1, 0, 0, 35)
BtnLigarKeys.Position = UDim2.new(0, 0, 0, 10)
BtnLigarKeys.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
BtnLigarKeys.Text = "Ligar Sistema de Keys"
BtnLigarKeys.TextColor3 = Color3.fromRGB(230, 230, 230)
BtnLigarKeys.Font = Enum.Font.GothamBold
BtnLigarKeys.TextSize = 12
BtnLigarKeys.BorderSizePixel = 0

local LabelValidade = Instance.new("TextLabel", AbaConfig)
LabelValidade.Size = UDim2.new(1, 0, 0, 35)
LabelValidade.Position = UDim2.new(0, 0, 0, 55)
LabelValidade.BackgroundColor3 = Color3.fromRGB(16, 16, 18)
LabelValidade.Text = " Validade da Key: 7 Dias Restantes"
LabelValidade.TextColor3 = Color3.fromRGB(0, 255, 100)
LabelValidade.Font = Enum.Font.Gotham
LabelValidade.TextSize = 12
LabelValidade.TextXAlignment = Enum.TextXAlignment.Left
LabelValidade.BorderSizePixel = 0

-- Lógica do Botão de Reiniciar Chaves
BtnLigarKeys.MouseButton1Click:Connect(function()
    EmitirSomClique()
    if delfile then
        delfile("bk_client_token.txt")
        BtnLigarKeys.Text = "Sistema Resetado! Relogue o Script"
        BtnLigarKeys.BackgroundColor3 = Color3.fromRGB(130, 20, 30)
    else
        BtnLigarKeys.Text = "Não suportado pelo seu Executor"
    end
end)

-- Botão de Navegação da Aba Configurações (Na barra de deslize inferior)
local TabBtnConfig = Instance.new("TextButton", TabsNavbar)
TabBtnConfig.Size = UDim2.new(0, 110, 1, 0)
TabBtnConfig.BackgroundColor3 = Color3.fromRGB(22, 22, 26) -- Marcado ativo por padrão
TabBtnConfig.Text = "Configurações"
TabBtnConfig.TextColor3 = Color3.fromRGB(255, 255, 255)
TabBtnConfig.Font = Enum.Font.GothamBold
TabBtnConfig.TextSize = 12
TabBtnConfig.BorderSizePixel = 0

TabBtnConfig.MouseButton1Click:Connect(function()
    EmitirSomClique()
    AbaConfig.Visible = true
end)

-- ========================================================
-- LÓGICA DE ABRIR/FECHAR DO PAINEL (Com Animações Fluidas)
-- ========================================================
local MenuAberto = false

Bolha.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if dragging == false then
            EmitirSomClique()
            if not MenuAberto then
                MainFrame.Visible = true
                MainFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
                TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 420, 0, 260)}):Play()
                MenuAberto = true
            else
                local fechar = TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
                fechar:Play()
                fechar.Completed:Connect(function()
                    MainFrame.Visible = false
                end)
                MenuAberto = false
            end
        end
    end
end)

print("BK SCRIPTS 🩸: Visual consolidado com topo estruturado!")
