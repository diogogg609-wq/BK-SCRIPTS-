_G.BK_Engine = _G.BK_Engine or {}
local _0xAE1 = game:GetService("TweenService")
local _0xBF2 = game:GetService("CoreGui")
local _0xCG3 = game:GetService("UserInputService")
local _0xDH4 = game:GetService("Players")
local _0xEI5 = _0xDH4.LocalPlayer

if _0xBF2:FindFirstChild("BK_Interface_Oficial") then
    _0xBF2.BK_Interface_Oficial:Destroy()
end

local _0xFI6 = Instance.new("ScreenGui", _0xBF2)
_0xFI6.Name = "BK_Interface_Oficial"

local function _0xSND(_0xID)
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://" .. tostring(_0xID)
    s.Volume = 0.5
    s:Play()
    game:GetService("Debris"):AddItem(s, 1)
end

-- CONTÊNER DA BOLHA
local _0xG7 = Instance.new("Frame", _0xFI6)
_0xG7.Name = "BK_BolhaContainer"
_0xG7.Size = UDim2.new(0, 130, 0, 36)
_0xG7.Position = UDim2.new(0.1, 0, 0.2, 0)
_0xG7.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
_0xG7.BorderSizePixel = 1
_0xG7.BorderColor3 = Color3.fromRGB(40, 40, 45)
_0xG7.Active = true

-- BOTÃO INVISÍVEL COBRE 100% DA BOLHA (Garante clique imediato no Delta)
local _0xCLK = Instance.new("TextButton", _0xG7)
_0xCLK.Size = UDim2.new(1, 0, 1, 0)
_0xCLK.BackgroundTransparency = 1
_0xCLK.Text = ""
_0xCLK.ZIndex = 10

local _0xI9 = Instance.new("TextLabel", _0xG7)
_0xI9.Size = UDim2.new(1, 0, 1, 0)
_0xI9.BackgroundTransparency = 1
_0xI9.Text = "BK SCRIPTS 🩸"
_0xI9.TextColor3 = Color3.fromRGB(245, 245, 245)
_0xI9.Font = Enum.Font.GothamBold
_0xI9.TextSize = 11
_0xI9.ZIndex = 5

-- SISTEMA DE ARRASTO REFORMULADO (Não interfere mais no botão)
local _dr, _ds, _sp
_0xG7.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        _dr = true _ds = i.Position _sp = _0xG7.Position
    end
end)
_0xCG3.InputChanged:Connect(function(i)
    if _dr and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - _ds
        _0xG7.Position = UDim2.new(_sp.X.Scale, _sp.X.Offset + d.X, _sp.Y.Scale, _sp.Y.Offset + d.Y)
    end
end)
_0xCG3.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        _dr = false
    end
end)

-- PAINEL PRINCIPAL
local _0xJA10 = Instance.new("Frame", _0xFI6)
_0xJA10.Name = "BK_MenuPrincipal"
_0xJA10.Size = UDim2.new(0, 390, 0, 230)
_0xJA10.Position = UDim2.new(0.5, -195, 0.5, -115)
_0xJA10.BackgroundColor3 = Color3.fromRGB(11, 11, 13)
_0xJA10.BorderSizePixel = 1
_0xJA10.BorderColor3 = Color3.fromRGB(22, 22, 25)
_0xJA10.ClipsDescendants = true
_0xJA10.Visible = false

local _0xKB11 = Instance.new("Frame", _0xJA10)
_0xKB11.Size = UDim2.new(1, 0, 0, 50)
_0xKB11.BackgroundColor3 = Color3.fromRGB(7, 7, 9)
_0xKB11.BorderSizePixel = 0

local _0xLC12 = Instance.new("ImageLabel", _0xKB11)
_0xLC12.Size = UDim2.new(0, 34, 0, 34)
_0xLC12.Position = UDim2.new(0, 12, 0, 8)
_0xLC12.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
_0xLC12.BorderSizePixel = 1
_0xLC12.BorderColor3 = Color3.fromRGB(28, 28, 32)
_0xLC12.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. _0xEI5.UserId .. "&width=150&height=150&format=png"

local _0xMD13 = Instance.new("TextLabel", _0xKB11)
_0xMD13.Size = UDim2.new(0, 140, 1, 0)
_0xMD13.Position = UDim2.new(0, 54, 0, 0)
_0xMD13.Text = _0xEI5.Name
_0xMD13.TextColor3 = Color3.fromRGB(170, 170, 175)
_0xMD13.Font = Enum.Font.GothamBold
_0xMD13.TextSize = 12
_0xMD13.TextXAlignment = Enum.TextXAlignment.Left
_0xMD13.BackgroundTransparency = 1

local _0xNE14 = Instance.new("TextLabel", _0xKB11)
_0xNE14.Size = UDim2.new(0, 150, 1, 0)
_0xNE14.Position = UDim2.new(1, -162, 0, 0)
_0xNE14.Text = "BK SCRIPTS 🩸"
_0xNE14.TextColor3 = Color3.fromRGB(255, 255, 255)
_0xNE14.Font = Enum.Font.GothamBold
_0xNE14.TextSize = 13
_0xNE14.TextXAlignment = Enum.TextXAlignment.Right
_0xNE14.BackgroundTransparency = 1

local _0xOF15 = Instance.new("ScrollingFrame", _0xJA10)
_0xOF15.Size = UDim2.new(1, 0, 0, 32)
_0xOF15.Position = UDim2.new(0, 0, 0, 50)
_0xOF15.BackgroundColor3 = Color3.fromRGB(9, 9, 11)
_0xOF15.BorderSizePixel = 0
_0xOF15.CanvasSize = UDim2.new(1.3, 0, 0, 0)
_0xOF15.ScrollBarThickness = 0
_0xOF15.ScrollingDirection = Enum.ScrollingDirection.Horizontal

local _ly = Instance.new("UIListLayout", _0xOF15)
_ly.FillDirection = Enum.FillDirection.Horizontal
_ly.SortOrder = Enum.SortOrder.LayoutOrder
_ly.Padding = UDim.new(0, 1)

local _0xPG16 = Instance.new("Frame", _0xJA10)
_0xPG16.Size = UDim2.new(1, -24, 1, -98)
_0xPG16.Position = UDim2.new(0, 12, 0, 98)
_0xPG16.BackgroundTransparency = 1

local _0xQH17 = Instance.new("Frame", _0xPG16)
_0xQH17.Size = UDim2.new(1, 0, 1, 0)
_0xQH17.BackgroundTransparency = 1
_0xQH17.Visible = true

local _0xRI18 = Instance.new("TextButton", _0xQH17)
_0xRI18.Size = UDim2.new(1, 0, 0, 36)
_0xRI18.Position = UDim2.new(0, 0, 0, 10)
_0xRI18.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
_0xRI18.BorderSizePixel = 1
_0xRI18.BorderColor3 = Color3.fromRGB(28, 28, 32)
_0xRI18.Text = "Ligar Sistema de Keys"
_0xRI18.TextColor3 = Color3.fromRGB(230, 230, 230)
_0xRI18.Font = Enum.Font.GothamBold
_0xRI18.TextSize = 11

local _0xSJ19 = Instance.new("TextLabel", _0xQH17)
_0xSJ19.Size = UDim2.new(1, 0, 0, 36)
_0xSJ19.Position = UDim2.new(0, 0, 0, 54)
_0xSJ19.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
_0xSJ19.BorderSizePixel = 1
_0xSJ19.BorderColor3 = Color3.fromRGB(22, 22, 25)
_0xSJ19.Text = " Validade da Key: 7 Days Restantes"
_0xSJ19.TextColor3 = Color3.fromRGB(0, 235, 90)
_0xSJ19.Font = Enum.Font.Gotham
_0xSJ19.TextSize = 11
_0xSJ19.TextXAlignment = Enum.TextXAlignment.Left

_0xRI18.MouseButton1Click:Connect(function()
    _0xSND(12221967)
    if delfile then
        delfile("bk_client_token.txt")
        _0xRI18.Text = "Sistema Resetado! Execute Novamente"
        _0xRI18.BackgroundColor3 = Color3.fromRGB(110, 15, 25)
    else
        _0xRI18.Text = "Executor Sem Suporte a Arquivos"
    end
end)

local _0xTK20 = Instance.new("TextButton", _0xOF15)
_0xTK20.Size = UDim2.new(0, 110, 1, 0)
_0xTK20.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
_0xTK20.Text = "Configurações"
_0xTK20.TextColor3 = Color3.fromRGB(255, 255, 255)
_0xTK20.Font = Enum.Font.GothamBold
_0xTK20.TextSize = 11
_0xTK20.BorderSizePixel = 0

_0xTK20.MouseButton1Click:Connect(function()
    _0xSND(12221967)
    _0xQH17.Visible = true
end)

-- GATILHO DIRETO E LIMPO (Sem travas de movimento)
local _op = false
_0xCLK.MouseButton1Click:Connect(function()
    _0xSND(12221967)
    _op = not _op
    if _op then
        _0xJA10.Visible = true
        _0xJA10.Size = UDim2.new(0, 0, 0, 0)
        _0xJA10.Position = UDim2.new(0.5, 0, 0.5, 0)
        _0xAE1:Create(_0xJA10, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 390, 0, 230), Position = UDim2.new(0.5, -195, 0.5, -115)}):Play()
    else
        local c = _0xAE1:Create(_0xJA10, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
        c:Play()
        c.Completed:Connect(function() _0xJA10.Visible = false end)
    end
end)

print("BK ENGINE: Ativado com Sucesso.")
