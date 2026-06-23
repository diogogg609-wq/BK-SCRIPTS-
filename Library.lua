--====================================================================
-- 🩸 BK SCRIPTS - UI & UX LIBRARY (PC STYLE FOR MOBILE) 🩸
-- Interface Avançada Adaptativa de Vidro Escuro e Efeitos Sonoros
--====================================================================

local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function Library:Initialize(Optimization)
    -- Criar ScreenGui principal protegida no CoreGui contra detecções simples
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "BK_Scripts_Engine"
    ScreenGui.ResetOnSpawn = false
    
    if syn and syn.protect_gui then syn.protect_gui(ScreenGui) end
    ScreenGui.Parent = game:CoreGui

    --================================================================
    -- 1. EFEITO DE ABERTURA: CYBER-SPLASH
    --================================================================
    local SplashFrame = Instance.new("Frame")
    SplashFrame.Size = UDim2.new(1, 0, 1, 0)
    SplashFrame.BackgroundColor3 = Color3.fromRGB(4, 4, 4)
    SplashFrame.BackgroundTransparency = 0.15
    SplashFrame.ZIndex = 10
    SplashFrame.Parent = ScreenGui

    local SplashText = Instance.new("TextLabel")
    SplashText.Size = UDim2.new(0, 500, 0, 100)
    SplashText.Position = UDim2.new(0.5, -250, 0.5, -50)
    SplashText.BackgroundTransparency = 1
    SplashText.Font = Enum.Font.Code
    SplashText.TextSize = 42
    SplashText.TextColor3 = Color3.fromRGB(255, 0, 51) -- Vermelho BK 🩸
    SplashText.Text = ""
    SplashText.ZIndex = 11
    SplashText.Parent = SplashFrame

    -- Som de Inicialização Tecnológica Sci-Fi
    local BootSound = Instance.new("Sound")
    BootSound.SoundId = "rbxassetid://9114223171" 
    BootSound.Volume = 0.6
    BootSound.Parent = game:GetService("SoundService")
    
    -- Efeito de Digitação Hacker em Tempo Real
    local targetText = "BK SCRIPTS 🩸"
    BootSound:Play()
    for i = 1, #targetText do
        SplashText.Text = string.sub(targetText, 1, i)
        task.wait(0.07)
    end
    task.wait(1.2)

    -- Animação de Fade Out da Abertura
    TweenService:Create(SplashText, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
    local fadeTween = TweenService:Create(SplashFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
    fadeTween:Play()
    fadeTween.Completed:Connect(function()
        SplashFrame:Destroy()
    end)

    --================================================================
    -- 2. JANELA PRINCIPAL (ESTILO COMPUTAÇÃO DE PC)
    --================================================================
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 520, 0, 320)
    MainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.BackgroundTransparency = 0.15
    MainFrame.BorderSizePixel = 1
    MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 51)
    MainFrame.ClipsDescendants = false
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 6)
    MainCorner.Parent = MainFrame

    -- Arrastabilidade Inteligente Adaptada para Telas Touch (Mobile)
    local dragging, dragInput, dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    --================================================================
    -- 3. GAVETA LATERAL RETRÁTIL (TASKBAR SIDEBAR)
    --================================================================
    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 50, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    Sidebar.BackgroundTransparency = 0.2
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = MainFrame
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 6)

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(1, 0, 0, 45)
    ToggleBtn.BackgroundTransparency = 1
    ToggleBtn.Text = "🩸"
    ToggleBtn.TextSize = 22
    ToggleBtn.Parent = Sidebar

    local sidebarExpanded = false
    ToggleBtn.MouseButton1Click:Connect(function()
        sidebarExpanded = not sidebarExpanded
        local targetWidth = sidebarExpanded and 130 or 50
        TweenService:Create(Sidebar, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, targetWidth, 1, 0)}):Play()
    end)

    --================================================================
    -- 4. CONTAINER DE FUNÇÕES
    --================================================================
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, -65, 1, -20)
    ContentFrame.Position = UDim2.new(0, 60, 0, 10)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.Code
    Title.Text = "BK SCRIPTS CENTRAL // MOBILE GENERATION"
    Title.TextColor3 = Color3.fromRGB(200, 200, 200)
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = ContentFrame

    local OptButton = Instance.new("TextButton")
    OptButton.Size = UDim2.new(0, 240, 0, 45)
    OptButton.Position = UDim2.new(0, 0, 0, 40)
    OptButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    OptButton.BorderSizePixel = 1
    OptButton.BorderColor3 = Color3.fromRGB(255, 0, 51)
    OptButton.Font = Enum.Font.SourceSansBold
    OptButton.Text = "ATIVAR MOTOR GRÁFICO (FPS BOOST)"
    OptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    OptButton.TextSize = 14
    OptButton.Parent = ContentFrame
    Instance.new("UICorner", OptButton).CornerRadius = UDim.new(0, 4)

    local ClickSound = Instance.new("Sound")
    ClickSound.SoundId = "rbxassetid://6895079653"
    ClickSound.Volume = 0.5
    ClickSound.Parent = game:GetService("SoundService")

    OptButton.MouseButton1Click:Connect(function()
        ClickSound:Play()
        Optimization:BoostFPS()
        OptButton.BackgroundColor3 = Color3.fromRGB(255, 0, 51)
        OptButton.Text = "SISTEMA OTIMIZADO ⚡"
        task.wait(2.5)
        OptButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        OptButton.Text = "ATIVAR MOTOR GRÁFICO (FPS BOOST)"
    end)

    --================================================================
    -- 5. INTERFACE ADAPTATIVA INTELIGENTE (SMART UI)
    --================================================================
    local function HandleCombatTransparency(isCombating)
        local targetTransparency = isCombating and 0.85 or 0.15
        TweenService:Create(MainFrame, TweenInfo.new(0.4), {BackgroundTransparency = targetTransparency}):Play()
    end

    local function MonitorCharacter(char)
        char.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then 
                HandleCombatTransparency(true)
            end
        end)
        char.ChildRemoved:Connect(function(child)
            if child:IsA("Tool") then 
                HandleCombatTransparency(false)
            end
        end)
    end

    if LocalPlayer.Character then MonitorCharacter(LocalPlayer.Character) end
    LocalPlayer.CharacterAdded:Connect(MonitorCharacter)

    --================================================================
    -- 6. CRIAR O WIDGET DE PERFORMANCE ESTILO GEFORCE
    --================================================================
    Optimization:CreateWidget(ScreenGui)
end

return Library
