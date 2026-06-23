--====================================================================
-- 🩸 BK SCRIPTS - PERFORMANCE & OPTIMIZATION MODULE 🩸
-- Algoritmos de Redução de Texturas e Widget Flutuante Estilo GeForce
--====================================================================

local Optimization = {}
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

-- Remove elementos pesados no celular para dar FPS máximo em jogos de tiro
function Optimization:BoostFPS()
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 999999
    
    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        terrain.WaterWaveSize = 0
        terrain.WaterWaveSpeed = 0
        terrain.WaterReflectance = 0
        terrain.WaterTransparency = 0
    end
    
    -- Substitui texturas pesadas por plástico liso (melhora visibilidade e lag)
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj:IsA("MeshPart") then
            obj.Material = Enum.Material.SmoothPlastic
        elseif obj:IsA("Texture") or obj:IsA("Decal") then
            obj:Destroy() 
        end
    end
    print("[BK SCRIPTS] Motor gráfico ajustado com sucesso.")
end

-- HUD Flutuante Avançado inspirado nas placas de vídeo de PC (NVIDIA Overlay)
function Optimization:CreateWidget(parentGui)
    local WidgetFrame = Instance.new("Frame")
    WidgetFrame.Size = UDim2.new(0, 160, 0, 55)
    WidgetFrame.Position = UDim2.new(0.5, -80, 0, 10)
    WidgetFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    WidgetFrame.BackgroundTransparency = 0.3
    WidgetFrame.BorderSizePixel = 1
    WidgetFrame.BorderColor3 = Color3.fromRGB(0, 255, 120) -- Borda Verde GeForce
    WidgetFrame.Parent = parentGui

    Instance.new("UICorner", WidgetFrame).CornerRadius = UDim.new(0, 5)

    local FpsText = Instance.new("TextLabel")
    FpsText.Size = UDim2.new(1, 0, 0.5, 0)
    FpsText.BackgroundTransparency = 1
    FpsText.Font = Enum.Font.Code
    FpsText.TextColor3 = Color3.fromRGB(255, 255, 255)
    FpsText.TextSize = 12
    FpsText.Text = "BK-FPS: --"
    FpsText.Parent = WidgetFrame

    local PingText = Instance.new("TextLabel")
    PingText.Size = UDim2.new(1, 0, 0.5, 0)
    PingText.Position = UDim2.new(0, 0, 0.5, 0)
    PingText.BackgroundTransparency = 1
    PingText.Font = Enum.Font.Code
    PingText.TextColor3 = Color3.fromRGB(200, 200, 200)
    PingText.TextSize = 11
    PingText.Text = "BK-PING: -- ms"
    PingText.Parent = WidgetFrame

    local frameCount = 0
    local lastTimestamp = os.clock()

    RunService.RenderStepped:Connect(function()
        frameCount = frameCount + 1
        local currentClock = os.clock()
        
        if currentClock - lastTimestamp >= 1.0 then
            local actualFps = frameCount
            frameCount = 0
            lastTimestamp = currentClock
            
            local pingValue = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            
            FpsText.Text = "BK-FPS: " .. tostring(actualFps)
            PingText.Text = "BK-PING: " .. tostring(pingValue) .. " ms"
            
            -- Sistema Inteligente de Alerta de Desempenho
            if actualFps < 35 then
                WidgetFrame.BorderColor3 = Color3.fromRGB(255, 0, 51) -- Borda Vermelha BK se travar!
            elseif actualFps >= 35 and actualFps < 55 then
                WidgetFrame.BorderColor3 = Color3.fromRGB(255, 180, 0) -- Amarelo (Médio)
            else
                WidgetFrame.BorderColor3 = Color3.fromRGB(0, 255, 120) -- Verde (Liso)
            end
        end
    end)
end

return Optimization
