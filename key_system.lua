_G.BK_Engine = _G.BK_Engine or {}

local KEY_CORRETA = "FREE-bkclient-2026"
local NOME_ARQUIVO = "bk_client_token.txt"

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

-- FUNÇÃO PARA VERIFICAR SE O DISPOSITIVO JÁ FOI LEMBRADO
if isfile and isfile(NOME_ARQUIVO) then
    local dados = readfile(NOME_ARQUIVO)
    if dados == "KEY_SALVA_BK_2026" then
        -- Pula direto para a bolha flutuante!
        local versao_nova = "?t=" .. tostring(os.time())
        loadstring(game:HttpGet("https://raw.githubusercontent.com/diogogg609-wq/BK-SCRIPTS-/main/ui_main.lua" .. versao_nova))()
        return -- Para o código da key aqui
    end
end

-- 1. EFEITO DE DESFOQUE NO FUNDO (Blur)
local Blur = Instance.new("BlurEffect", Lighting)
Blur.Size = 0
TweenService:Create(Blur, TweenInfo.new(0.6), {Size = 20}):Play()

-- 2. CRIAÇÃO DA INTERFACE DA KEY
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "BK_KeySystem"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 280, 0, 210) -- Aumentado para caber o novo botão
MainFrame.Position = UDim2.new(0.5, -140, 0.4, -105)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.ClipsDescendants = true

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
TextBox.Position = UDim2.new(0.075, 0, 0, 70)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.Text = ""
TextBox.PlaceholderText = "Colar Key aqui..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 12
TextBox.BorderSizePixel = 0

-- Botão de Lembrar Dispositivo (Quadrado e tático)
local LembrarAtivo = false
local BtnLembrar = Instance.new("TextButton", MainFrame)
BtnLembrar.Size = UDim2.new(0.85, 0, 0, 25)
BtnLembrar.Position = UDim2.new(0.075, 0, 0, 115)
BtnLembrar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BtnLembrar.Text = "[ ] Lembrar Dispositivo"
BtnLembrar.TextColor3 = Color3.fromRGB(180, 180, 180)
BtnLembrar.Font = Enum.Font.Gotham
BtnLembrar.TextSize = 11
BtnLembrar.BorderSizePixel = 0

-- Botão de Verificar
local BtnVerificar = Instance.new("TextButton", MainFrame)
BtnVerificar.Size = UDim2.new(0.85, 0, 0, 35)
BtnVerificar.Position = UDim2.new(0.075, 0, 0, 155)
BtnVerificar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BtnVerificar.Text = "Verificar Chave"
BtnVerificar.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnVerificar.Font = Enum.Font.GothamBold
BtnVerificar.TextSize = 14
BtnVerificar.BorderSizePixel = 0

-- POPUP DE TERMOS DO DISPOSITIVO (Fica invisível até clicar)
local PopupFrame = Instance.new("Frame", ScreenGui)
PopupFrame.Size = UDim2.new(0, 320, 0, 240)
PopupFrame.Position = UDim2.new(0.5, -160, 0.5, -120)
PopupFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
PopupFrame.BorderSizePixel = 1
PopupFrame.BorderColor3 = Color3.fromRGB(255, 0, 50)
PopupFrame.Visible = false
PopupFrame.ZIndex = 5

local PopupTexto = Instance.new("TextLabel", PopupFrame)
PopupTexto.Size = UDim2.new(0.9, 0, 0, 150)
PopupTexto.Position = UDim2.new(0, 15, 0, 15)
PopupTexto.Text = "Ativando isto você fará que quando executar a script novamente ela não irá iniciar o sistema de key ele mostrará irá pular está etapa mais os dias da Key estarão contatos mesmo assim caso queria adicionar o sistema de keys novamente nas configurações do script você poderá ativa-lá novamente pois temos atualizações de 7 a 7 dias e a Key é resetada sempre meses dias"
PopupTexto.TextColor3 = Color3.fromRGB(200, 200, 200)
PopupTexto.Font = Enum.Font.Gotham
PopupTexto.TextSize = 11
PopupTexto.TextWrapped = true
PopupTexto.TextXAlignment = Enum.TextXAlignment.Left
PopupTexto.BackgroundTransparency = 1
PopupTexto.ZIndex = 5

local BtnConcordar = Instance.new("TextButton", PopupFrame)
BtnConcordar.Size = UDim2.new(0.4, 0, 0, 35)
BtnConcordar.Position = UDim2.new(0.08, 0, 0, 180)
BtnConcordar.BackgroundColor3 = Color3.fromRGB(0, 150, 70)
BtnConcordar.Text = "Concordar"
BtnConcordar.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnConcordar.Font = Enum.Font.GothamBold
BtnConcordar.ZIndex = 5

local BtnDiscordar = Instance.new("TextButton", PopupFrame)
BtnDiscordar.Size = UDim2.new(0.4, 0, 0, 35)
BtnDiscordar.Position = UDim2.new(0.52, 0, 0, 180)
BtnDiscordar.BackgroundColor3 = Color3.fromRGB(150, 0, 30)
BtnDiscordar.Text = "Discordar"
BtnDiscordar.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnDiscordar.Font = Enum.Font.GothamBold
BtnDiscordar.ZIndex = 5

-- LÓGICA DO POPUP
BtnLembrar.MouseButton1Click:Connect(function()
    PopupFrame.Visible = true
end)

BtnConcordar.MouseButton1Click:Connect(function()
    LembrarAtivo = true
    BtnLembrar.Text = "[X] Dispositivo Lembrado"
    BtnLembrar.TextColor3 = Color3.fromRGB(0, 255, 100)
    PopupFrame.Visible = false
end)

BtnDiscordar.MouseButton1Click:Connect(function()
    LembrarAtivo = false
    BtnLembrar.Text = "[ ] Lembrar Dispositivo"
    BtnLembrar.TextColor3 = Color3.fromRGB(180, 180, 180)
    PopupFrame.Visible = false
end)

-- BOOT DE CARREGAMENTO
local function IniciarBootSript()
    Titulo:Destroy() Subtitulo:Destroy() TextBox:Destroy() BtnLembrar:Destroy() BtnVerificar:Destroy()
    TweenService:Create(MainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0, 250, 0, 100)}):Play()
    
    local LogLabel = Instance.new("TextLabel", MainFrame)
    LogLabel.Size = UDim2.new(0.9, 0, 0, 70)
    LogLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
    LogLabel.BackgroundTransparency = 1
    LogLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
    LogLabel.Font = Enum.Font.Code
    LogLabel.TextSize = 11
    LogLabel.TextXAlignment = Enum.TextXAlignment.Left
    LogLabel.TextWrapped = true
    
    LogLabel.Text = "> Verificando Chave...\n" task.wait(0.5)
    LogLabel.Text = LogLabel.Text .. "> Carregando script bypass...\n" task.wait(0.6)
    LogLabel.Text = LogLabel.Text .. "> Sistema Pronto!" task.wait(0.5)
    
    -- Se o usuário marcou para Lembrar, cria o arquivo local no celular
    if LembrarAtivo and writefile then
        writefile(NOME_ARQUIVO, "KEY_SALVA_BK_2026")
    end
    
    TweenService:Create(MainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1}):Play()
    TweenService:Create(Blur, TweenInfo.new(0.4), {Size = 0}):Play()
    task.wait(0.4)
    ScreenGui:Destroy() Blur:Destroy()
    
    local versao_nova = "?t=" .. tostring(os.time())
    loadstring(game:HttpGet("https://raw.githubusercontent.com/diogogg609-wq/BK-SCRIPTS-/main/ui_main.lua" .. versao_nova))()
end

BtnVerificar.MouseButton1Click:Connect(function()
    if TextBox.Text == KEY_CORRETA then
        BtnVerificar.Text = "Key Autorizada!"
        BtnVerificar.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        task.wait(1)
        IniciarBootSript()
    else
        BtnVerificar.Text = "Chave Incorreta!"
        BtnVerificar.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        task.wait(1)
        BtnVerificar.Text = "Verificar Chave"
        BtnVerificar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)
