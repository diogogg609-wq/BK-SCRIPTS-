_G.BK_Engine = _G.BK_Engine or {}

-- CONFIGURAÇÃO DA KEY (Válida por 7 dias simbólicos no código estático)
local KEY_CORRETA = "FREE-bkclient-2026"

-- Serviços do Roblox para animações e efeitos
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

-- 1. EFEITO DE DESFOQUE NO FUNDO (Blur)
local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = Lighting
TweenService:Create(Blur, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 20}):Play()

-- 2. CRIAÇÃO DA INTERFACE DA KEY
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "BK_KeySystem"

-- Painel Central com Cantos Arredondados
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 280, 0, 180)
MainFrame.Position = UDim2.new(0.5, -140, 0.4, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

local Corner = Instance.new("UICorner", MainFrame)
Corner.CornerRadius = UDim.new(0, 10)

-- Linha de detalhe vermelha (Identidade BK)
local Line = Instance.new("Frame", MainFrame)
Line.Size = UDim2.new(1, 0, 0, 3)
Line.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
Line.BorderSizePixel = 0

-- Título Principal
local Titulo = Instance.new("TextLabel", MainFrame)
Titulo.Size = UDim2.new(1, 0, 0, 35)
Titulo.Position = UDim2.new(0, 0, 0, 10)
Titulo.Text = "BK CLIENT"
Titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
Titulo.Font = Enum.Font.GothamBold
Titulo.TextSize = 18
Titulo.BackgroundTransparency = 1

-- Subtítulo
local Subtitulo = Instance.new("TextLabel", MainFrame)
Subtitulo.Size = UDim2.new(1, 0, 0, 20)
Subtitulo.Position = UDim2.new(0, 0, 0, 40)
Subtitulo.Text = "Insira sua chave de acesso"
Subtitulo.TextColor3 = Color3.fromRGB(150, 150, 150)
Subtitulo.Font = Enum.Font.Gotham
Subtitulo.TextSize = 12
Subtitulo.BackgroundTransparency = 1

-- Caixa de Texto para digitar/colar a Key
local TextBox = Instance.new("TextBox", MainFrame)
TextBox.Size = UDim2.new(0.85, 0, 0, 35)
TextBox.Position = UDim2.new(0.075, 0, 0, 75)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.Text = ""
TextBox.PlaceholderText = "Colar Key aqui..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 12

local BoxCorner = Instance.new("UICorner", TextBox)
BoxCorner.CornerRadius = UDim.new(0, 6)

-- Botão de Verificar
local BtnVerificar = Instance.new("TextButton", MainFrame)
BtnVerificar.Size = UDim2.new(0.85, 0, 0, 35)
BtnVerificar.Position = UDim2.new(0.075, 0, 0, 125)
BtnVerificar.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
BtnVerificar.Text = "Verificar Chave"
BtnVerificar.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnVerificar.Font = Enum.Font.GothamBold
BtnVerificar.TextSize = 14

local BtnCorner = Instance.new("UICorner", BtnVerificar)
BtnCorner.CornerRadius = UDim.new(0, 6)

-- ANIMAÇÃO DE ENTRADA DO PAINEL (Fade-in com subida suave)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
MainFrame.BackgroundTransparency = 1
Titulo.TextTransparency = 1
Subtitulo.TextTransparency = 1
TextBox.BackgroundTransparency = 1
TextBox.TextTransparency = 1
BtnVerificar.BackgroundTransparency = 1
BtnVerificar.TextTransparency = 1

TweenService:Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0, Position = UDim2.new(0.5, -140, 0.4, -90)}):Play()
TweenService:Create(Titulo, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
TweenService:Create(Subtitulo, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
TweenService:Create(TextBox, TweenInfo.new(0.5), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(BtnVerificar, TweenInfo.new(0.5), {BackgroundTransparency = 0, TextTransparency = 0}):Play()

-- 3. FUNÇÃO DE CARREGAMENTO DO SCRIPT (O BOOT)
local function IniciarBootSript()
    -- Limpa o design interno para rodar os comandos de carregamento
    Titulo:Destroy()
    Subtitulo:Destroy()
    TextBox:Destroy()
    BtnVerificar:Destroy()
    
    -- Altera o tamanho do quadrado para o modo "Console de Comandos"
    TweenService:Create(MainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0, 250, 0, 120)}):Play()
    
    local LogLabel = Instance.new("TextLabel", MainFrame)
    LogLabel.Size = UDim2.new(0.9, 0, 0, 80)
    LogLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
    LogLabel.BackgroundTransparency = 1
    LogLabel.TextColor3 = Color3.fromRGB(0, 255, 100) -- Letras verdes estilo hacker/dev
    LogLabel.Font = Enum.Font.Code
    LogLabel.TextSize = 12
    LogLabel.TextXAlignment = Enum.TextXAlignment.Left
    LogLabel.TextYAlignment = Enum.TextYAlignment.Top
    LogLabel.TextWrapped = true
    
    -- Simulação de linhas executando
    LogLabel.Text = "> Inicializando BK Client...\n"
    task.wait(0.6)
    LogLabel.Text = LogLabel.Text .. "> Carregando script bypass...\n"
    task.wait(0.8)
    LogLabel.Text = LogLabel.Text .. "> Injetando modulos na memoria...\n"
    task.wait(0.5)
    LogLabel.Text = LogLabel.Text .. "> Sistema Pronto!"
    task.wait(0.6)
    
    -- Desfoca e some com o painel de Key e remove o borrão do mapa
    TweenService:Create(MainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1}):Play()
    TweenService:Create(LogLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(Blur, TweenInfo.new(0.4), {Size = 0}):Play()
    task.wait(0.4)
    
    ScreenGui:Destroy()
    Blur:Destroy()
    
    -- NOTIFICAÇÃO POPUP FINAL
    local NotificationGui = Instance.new("ScreenGui", CoreGui)
    local NotifFrame = Instance.new("Frame", NotificationGui)
    NotifFrame.Size = UDim2.new(0, 180, 0, 40)
    NotifFrame.Position = UDim2.new(0.5, -90, -0.1, 0) -- Começa fora da tela (no topo)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    NotifFrame.BorderSizePixel = 0
    Instance.new("UICorner", NotifFrame).CornerRadius = UDim.new(0, 6)
    
    local NotifLine = Instance.new("Frame", NotifFrame)
    NotifLine.Size = UDim2.new(0, 4, 1, 0)
    NotifLine.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    NotifLine.BorderSizePixel = 0
    
    local NotifText = Instance.new("TextLabel", NotifFrame)
    NotifText.Size = UDim2.new(1, -10, 1, 0)
    NotifText.Position = UDim2.new(0, 10, 0, 0)
    NotifText.Text = "Sistema pronto!"
    NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifText.Font = Enum.Font.GothamBold
    NotifText.TextSize = 13
    NotifText.BackgroundTransparency = 1
    NotifText.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Animação do popup descendo e sumindo
    TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -90, 0.05, 0)}):Play()
    task.wait(2.5)
    TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -90, -0.1, 0)}):Play()
    task.wait(0.4)
    NotificationGui:Destroy()

    -- CHAMADA COMPORTAMENTAL: CHAMA O SEU PAINEL COM A BOLHA FLUTUANTE
    -- Como seu ui_main.lua antigo criava a tela na hora, vamos puxar os módulos agora.
    local url_base = "https://raw.githubusercontent.com/diogogg609-wq/BK-SCRIPTS-/main/"
    loadstring(game:HttpGet(url_base .. "sounds.lua"))()
    loadstring(game:HttpGet(url_base .. "functions.lua"))()
    loadstring(game:HttpGet(url_base .. "ui_main.lua"))()
end

-- 4. LOGICA DO BOTÃO VERIFICAR
BtnVerificar.MouseButton1Click:Connect(function()
    if TextBox.Text == KEY_CORRETA then
        -- ANIMAÇÃO VERDE DE SUCESSO
        BtnVerificar.Text = "Key Autorizada!"
        TweenService:Create(BtnVerificar, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 180, 80)}):Play()
        TweenService:Create(Line, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 180, 80)}):Play()
        task.wait(1.2)
        
        -- Inicia o processo de Boot e esconde a tela de Key
        IniciarBootSript()
    else
        -- ANIMAÇÃO VERMELHA DE ERRO (Pisca)
        local CorOriginal = BtnVerificar.BackgroundColor3
        BtnVerificar.Text = "Chave Incorreta!"
        BtnVerificar.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        task.wait(1.5)
        BtnVerificar.Text = "Verificar Chave"
        BtnVerificar.BackgroundColor3 = CorOriginal
    end
end)
