_G.BK_Engine = _G.BK_Engine or {}
local _0x1A = game:GetService("TweenService")
local _0x2B = game:GetService("CoreGui")
local _0x3C = game:GetService("UserInputService")
local _0x4D = game:GetService("Players")
local _0x5E = _0x4D.LocalPlayer

if _0x2B:FindFirstChild("BK_Interface_Oficial") then
    _0x2B.BK_Interface_Oficial:Destroy()
end

local _0x6F = Instance.new("ScreenGui", _0x2B)
_0x6F.Name = "BK_Interface_Oficial"

local function _0x7A()
    local s = Instance.new("Sound", workspace)
    s.SoundId = "rbxassetid://12221967"
    s.Volume = 0.4
    s:Play()
    game:GetService("Debris"):AddItem(s, 1)
end

local _0x8B = Instance.new("Frame", _0x6F)
_0x8B.Name = "BK_Bolha"
_0x8B.Size = UDim2.new(0, 140, 0, 40)
_0x8B.Position = UDim2.new(0.1, 0, 0.2, 0)
_0x8B.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
_0x8B.BorderSizePixel = 1
_0x8B.BorderColor3 = Color3.fromRGB(0, 0, 0)
_0x8B.ClipsDescendants = true
_0x8B.Active = true

local _0x9C = Instance.new("Frame", _0x8B)
_0x9C.Size = UDim2.new(1, 0, 1, 0)
_0x9C.BackgroundTransparency = 1

local _0x10D = Random.new()
for i = 1, 12 do
    local _e = Instance.new("TextLabel", _0x9C)
    _e.Text = "."
    _e.Font = Enum.Font.GothamBold
    _e.TextSize = _0x10D:NextInteger(8, 12)
    _e.TextColor3 = Color3.fromRGB(255, 255, 255)
    _e.BackgroundTransparency = 1
    _e.Position = UDim2.new(_0x10D:NextNumber(0, 1), 0, _0x10D:NextNumber(0, 1), 0)
    _e.TextTransparency = _0x10D:NextNumber(0.4, 0.8)
end

task.spawn(function()
    while task.wait(0.02) do
        if not _0x9C or not _0x9C.Parent then break end
        for _, v in pairs(_0x9C:GetChildren()) do
            if v:IsA("TextLabel") then
                v.Position = UDim2.new(v.Position.X.Scale - 0.003, 0, v.Position.Y.Scale, 0)
                if v.Position.X.Scale < -0.05 then
                    v.Position = UDim2.new(1.05, 0, _0x10D:NextNumber(0, 1), 0)
                end
            end
        end
    end
end)

local _0x11E = Instance.new("TextLabel", _0x8B)
_0x11E.Size = UDim2.new(1, 0, 1, 0)
_0x11E.BackgroundTransparency = 1
_0x11E.Text = "BK SCRIPTS 🩸"
_0x11E.TextColor3 = Color3.fromRGB(240, 240, 240)
_0x11E.Font = Enum.Font.GothamBold
_0x11E.TextSize = 12
_0x11E.ZIndex = 5

local _dr, _di, _ds, _sp
local _mv = false
_0x8B.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        _dr = true _ds = i.Position _sp = _0x8B.Position _mv = false
    end
end)
_0x3C.InputChanged:Connect(function(i)
    if _dr and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - _ds
        if d.Magnitude > 6 then _mv = true end
        _0x8B.Position = UDim2.new(_sp.X.Scale, _sp.X.Offset + d.X, _sp.Y.Scale, _sp.Y.Offset + d.Y)
    end
end)
_0x3C.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        _dr = false
    end
end)

local _0x12F = Instance.new("Frame", _0x6F)
_0x12F.Name = "BK_MenuPrincipal"
_0x12F.Size = UDim2.new(0, 400, 0, 240)
_0x12F.Position = UDim2.new(0.5, -200, 0.5, -120)
_0x12F.BackgroundColor3 = Color3.fromRGB(14, 14, 16)
_0x12F.BorderSizePixel = 1
_0x12F.BorderColor3 = Color3.fromRGB(25, 25, 28)
_0x12F.ClipsDescendants = true
_0x12F.Visible = false

local _0x13A = Instance.new("Frame", _0x12F)
_0x13A.Size = UDim2.new(1, 0, 0, 55)
_0x13A.BackgroundColor3 = Color3.fromRGB(9, 9, 11)
_0x13A.BorderSizePixel = 0

local _0x14B = Instance.new("ImageLabel", _0x13A)
_0x14B.Size = UDim2.new(0, 38, 0, 38)
_0x14B.Position = UDim2.new(0, 12, 0, 8)
_0x14B.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
_0x14B.BorderSizePixel = 1
_0x14B.BorderColor3 = Color3.fromRGB(30, 30, 35)
_0x14B.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. _0x5E.UserId .. "&width=150&height=150&format=png"

local _0x15C = Instance.new("TextLabel", _0x13A)
_0x15C.Size = UDim2.new(0, 160, 1, 0)
_0x15C.Position = UDim2.new(0, 60, 0, 0)
_0x15C.Text = _0x5E.Name
_0x15C.TextColor3 = Color3.fromRGB(185, 185, 190)
_0x15C.Font = Enum.Font.GothamBold
_0x15C.TextSize = 12
_0x15C.TextXAlignment = Enum.TextXAlignment.Left
_0x15C.BackgroundTransparency = 1

local _0x16D = Instance.new("TextLabel", _0x13A)
_0x16D.Size = UDim2.new(0, 150, 1, 0)
_0x16D.Position = UDim2.new(1, -165, 0, 0)
_0x16D.Text = "BK SCRIPTS 🩸"
_0x16D.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x16D.Font = Enum.Font.GothamBold
_0x16D.TextSize = 13
_0x16D.TextXAlignment = Enum.TextXAlignment.Right
_0x16D.BackgroundTransparency = 1

local _0x17E = Instance.new("ScrollingFrame", _0x12F)
_0x17E.Size = UDim2.new(1, 0, 0, 35)
_0x17E.Position = UDim2.new(0, 0, 0, 55)
_0x17E.BackgroundColor3 = Color3.fromRGB(11, 11, 13)
_0x17E.BorderSizePixel = 0
_0x17E.CanvasSize = UDim2.new(1.2, 0, 0, 0)
_0x17E.ScrollBarThickness = 0
_0x17E.ScrollingDirection = Enum.ScrollingDirection.Horizontal

local _ly = Instance.new("UIListLayout", _0x17E)
_ly.FillDirection = Enum.FillDirection.Horizontal
_ly.SortOrder = Enum.SortOrder.LayoutOrder
_ly.Padding = UDim.new(0, 1)

local _0x18F = Instance.new("Frame", _0x12F)
_0x18F.Size = UDim2.new(1, -24, 1, -105)
_0x18F.Position = UDim2.new(0, 12, 0, 105)
_0x18F.BackgroundTransparency = 1

local _0x19A = Instance.new("Frame", _0x18F)
_0x19A.Size = UDim2.new(1, 0, 1, 0)
_0x19A.BackgroundTransparency = 1
_0x19A.Visible = true

local _0x20B = Instance.new("TextButton", _0x19A)
_0x20B.Size = UDim2.new(1, 0, 0, 36)
_0x20B.Position = UDim2.new(0, 0, 0, 8)
_0x20B.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
_0x20B.BorderSizePixel = 1
_0x20B.BorderColor3 = Color3.fromRGB(28, 28, 32)
_0x20B.Text = "Ligar Sistema de Keys"
_0x20B.TextColor3 = Color3.fromRGB(225, 225, 225)
_0x20B.Font = Enum.Font.GothamBold
_0x20B.TextSize = 11

local _0x21C = Instance.new("TextLabel", _0x19A)
_0x21C.Size = UDim2.new(1, 0, 0, 36)
_0x21C.Position = UDim2.new(0, 0, 0, 52)
_0x21C.BackgroundColor3 = Color3.fromRGB(16, 16, 18)
_0x21C.BorderSizePixel = 1
_0x21C.BorderColor3 = Color3.fromRGB(22, 22, 25)
_0x21C.Text = " Validade da Key: 7 Dias Restantes"
_0x21C.TextColor3 = Color3.fromRGB(0, 240, 90)
_0x21C.Font = Enum.Font.Gotham
_0x21C.TextSize = 11
_0x21C.TextXAlignment = Enum.TextXAlignment.Left

_0x20B.MouseButton1Click:Connect(function()
    _0x7A()
    if delfile then
        delfile("bk_client_token.txt")
        _0x20B.Text = "Sistema Resetado! Execute Novamente"
        _0x20B.BackgroundColor3 = Color3.fromRGB(120, 15, 25)
    else
        _0x20B.Text = "Executor Sem Suporte a Arquivos"
    end
end)

local _0x22D = Instance.new("TextButton", _0x17E)
_0x22D.Size = UDim2.new(0, 110, 1, 0)
_0x22D.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
_0x22D.Text = "Configurações"
_0x22D.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x22D.Font = Enum.Font.GothamBold
_0x22D.TextSize = 11
_0x22D.BorderSizePixel = 0

_0x22D.MouseButton1Click:Connect(function()
    _0x7A()
    _0x19A.Visible = true
end)

local _op = false
_0x3C.InputEnded:Connect(function(i, g)
    if not g and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
        local m = _0x3C:GetMouseLocation()
        local bP = _0x8B.AbsolutePosition
        local bS = _0x8B.AbsoluteSize
        
        if m.X >= bP.X and m.X <= bP.X + bS.X and m.Y >= bP.Y + 36 and m.Y <= bP.Y + bS.Y + 36 then
            if not _mv then
                _0x7A()
                _op = not _op
                if _op then
                    _0x12F.Visible = true
                    _0x12F.Size = UDim2.new(0, 0, 0, 0)
                    _0x12F.Position = UDim2.new(0.5, 0, 0.5, 0)
                    _0x1A:Create(_0x12F, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 240), Position = UDim2.new(0.5, -200, 0.5, -120)}):Play()
                else
                    local c = _0x1A:Create(_0x12F, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
                    c:Play()
                    c.Completed:Connect(function() _0x12F.Visible = false end)
                end
            end
        end
    end
end)

print("BK ENGINE: Modulo Ofuscado Carregado.")
