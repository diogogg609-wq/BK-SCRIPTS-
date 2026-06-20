_G.BK_Engine = _G.BK_Engine or {}

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Destrói interfaces antigas para não duplicar no teste
if CoreGui:FindFirstChild("BK_Interface_Oficial") then
    CoreGui.BK_Interface_Oficial:Destroy()
end

local UI_Main = Instance.new("ScreenGui", CoreGui)
UI_Main.Name = "BK_Interface_Oficial"

-- 1. CRIAÇÃO DA BOLHA FLUTUANTE (Formato de Cápsula com bordas quadradas/angulares)
local Bolha = Instance.new("Frame", UI_Main)
Bolha.Name = "BK_Bolha"
Bolha.Size = UDim2.new(0, 150, 0, 45)
Bolha.Position = UDim2.new(0.1, 0, 0.2, 0) -- Posição inicial no canto da tela
-- Cor de fundo escura e profunda
Bolha.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
Bolha.BorderSizePixel = 2
Bolha.BorderColor3 = Color3.fromRGB(255, 0, 50) -- Borda vermelha marcante
Bolha.ClipsDescendants = true
Bolha.Active = true

-- 2. ESPAÇO ESTELAR (Fundo Animado)
local EspacoEstelar = Instance.new("Frame", Bolha)
EspacoEstelar.Size = UDim2.new(1, 0, 1, 0)
EspacoEstelar.BackgroundTransparency = 1

-- Gerador de Estrelas leves em posições aleatórias
local random = Random.new()
for i = 1, 15 do
    local Estrela = Instance.new("TextLabel", EspacoEstelar)
    Estrela.Text = "."
    Estrela.Font = Enum.Font.GothamBold
    Estrela.TextSize = random:NextInteger(8, 14)
    Estrela.TextColor3 = Color3.fromRGB(255, 255, 255)
    Estrela.BackgroundTransparency = 1
    Estrela.Position = UDim2.new(random:NextNumber(0, 1), 0, random:NextNumber(0, 1), 0)
    Estrela.TextTransparency = random:NextNumber(0.3, 0.8)
    
    -- Animação individual de piscar para cada estrela
    task.spawn(function()
        while task.wait(random:NextNumber(0.5, 2)) do
            if not Estrela or not Estrela.Parent then break end
            local brilho = TweenService:Create(Estrela, TweenInfo.new(0.5), {TextTransparency = random:NextNumber(0.1, 0.9)})
            brilho:Play()
        end
    end)
end

-- Movimento lento do espaço de fundo para dar efeito estelar correndo
task.spawn(function()
    while task.wait(0.05) do
        if not EspacoEstelar or not EspacoEstelar.Parent then break end
        for _, estrela in pairs(EspacoEstelar:GetChildren()) do
            if estrela:IsA("TextLabel") then
                -- Move a estrela um pouquinho para a esquerda
                estrela.Position = UDim2.new(estrela.Position.X.Scale - 0.002, 0, estrela.Position.Y.Scale, 0)
                -- Se a estrela sumir da tela à esquerda, volta ela pra direita
                if estrela.Position.X.Scale < -0.05 then
                    estrela.Position = UDim2.new(1.05, 0, random:NextNumber(0, 1), 0)
                end
            end
        end
    end
end)

-- 3. TEXTO DA BOLHA (BK SCRIPTS 🩸)
local TextoBolha = Instance.new("TextLabel", Bolha)
TextoBolha.Size = UDim2.new(1, 0, 1, 0)
TextoBolha.BackgroundTransparency = 1
TextoBolha.Text = "BK SCRIPTS 🩸"
TextoBolha.TextColor3 = Color3.fromRGB(255, 255, 255)
TextoBolha.Font = Enum.Font.GothamBold
TextoBolha.TextSize = 13
TextoBolha.ZIndex = 3 -- Garante que o texto fica por cima das estrelas

-- 4. LOGICA DE ARRASTAR A BOLHA NO CELULAR (Mobile Dragging)
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    Bolha.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Bolha.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Bolha.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Bolha.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)


-- 5. PAINEL PRINCIPAL (O MENU - Começa invisível/escondido)
local MainFrame = Instance.new("Frame", UI_Main)
MainFrame.Name = "BK_MenuPrincipal"
MainFrame.Size = UDim2.new(0, 0, 0, 0) -- Começa zerado para a animação de clique
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 50)
MainFrame.ClipsDescendants = true
MainFrame.Visible = false

-- Texto indicativo provisório dentro do menu principal
local TextoProvisorio = Instance.new("TextLabel", MainFrame)
TextoProvisorio.Size = UDim2.new(1, 0, 1, 0)
TextoProvisorio.BackgroundTransparency = 1
TextoProvisorio.Text = "BK CLIENT\n\n[Próximo passo: Criar o Painel e as Abas aqui dentro]"
TextoProvisorio.TextColor3 = Color3.fromRGB(150, 150, 150)
TextoProvisorio.Font = Enum.Font.Gotham
TextoProvisorio.TextSize = 14


-- 6. LOGICA DE CLIQUE (Abrir/Fechar o Menu ao clicar na Bolha)
local MenuAberto = false

Bolha.InputEnded:Connect(function(input)
    -- Verifica se foi um clique/toque rápido (e não um arrasto pesado)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if dragging == false then -- Se não estava arrastando, abre o menu
            if not MenuAberto then
                -- Abre o Painel com animação bonita se expandindo a partir do centro
                MainFrame.Visible = true
                MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
                TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 250)}):Play()
                MenuAberto = true
            else
                -- Fecha o Painel encolhendo ele
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

print("BK SCRIPTS 🩸: Módulo UI com fundo estelar carregado com sucesso!")
