--[[
    BETTER ODH STANDALONE
    Все функции из оригинального плагина, но без зависимости от ODH
    Автор: конвертировано из Better ODH v1.5
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Stats = game:GetService("Stats")
local SoundService = game:GetService("SoundService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local playerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ==================== GUI SYSTEM ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BetterODH_Standalone"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
if gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 255, 255)
MainStroke.Thickness = 1
MainStroke.Transparency = 0.5
MainStroke.Parent = MainFrame

-- Заголовок
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "BETTER ODH"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TitleBar
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Навигация
local NavFrame = Instance.new("Frame")
NavFrame.Size = UDim2.new(0, 130, 1, -50)
NavFrame.Position = UDim2.new(0, 10, 0, 45)
NavFrame.BackgroundTransparency = 1
NavFrame.Parent = MainFrame

local tabs = {
    {name = "Visuals", icon = "V"},
    {name = "Combat", icon = "C"},
    {name = "Overlay", icon = "O"},
    {name = "Performance", icon = "P"},
    {name = "Skybox", icon = "S"},
    {name = "Sound", icon = "🔊"},
    {name = "Privacy", icon = "🔒"},
}

local navButtons = {}
local currentTab = "Visuals"

local function CreateNavButton(name, icon, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 0
    btn.Text = icon .. " " .. name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamMedium
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = NavFrame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        for _, b in pairs(navButtons) do
            b.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            b.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        currentTab = name
        LoadTab(name)
    end)
    
    table.insert(navButtons, btn)
    return btn
end

local yPos = 0
for _, tab in ipairs(tabs) do
    CreateNavButton(tab.name, tab.icon, yPos)
    yPos = yPos + 36
end

-- Контент
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -150, 1, -50)
ContentFrame.Position = UDim2.new(0, 145, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 3
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ContentFrame.ElasticBehavior = Enum.ElasticBehavior.Never
ContentFrame.Parent = MainFrame

local ContentList = Instance.new("UIListLayout")
ContentList.Padding = UDim.new(0, 6)
ContentList.SortOrder = Enum.SortOrder.LayoutOrder
ContentList.Parent = ContentFrame

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingLeft = UDim.new(0, 5)
ContentPadding.PaddingRight = UDim.new(0, 5)
ContentPadding.PaddingTop = UDim.new(0, 5)
ContentPadding.PaddingBottom = UDim.new(0, 5)
ContentPadding.Parent = ContentFrame

-- ==================== UI HELPER FUNCTIONS ====================
local function CreateSection(title)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, 0, 0, 0)
    section.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    section.BackgroundTransparency = 0.3
    section.BorderSizePixel = 0
    section.AutomaticSize = Enum.AutomaticSize.Y
    section.Parent = ContentFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = section
    
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size = UDim2.new(1, -20, 0, 24)
    titleLbl.Position = UDim2.new(0, 10, 0, 4)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = title
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLbl.TextSize = 12
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.Parent = section
    
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 0)
    container.Position = UDim2.new(0, 10, 0, 30)
    container.BackgroundTransparency = 1
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.Parent = section
    
    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 4)
    list.Parent = container
    
    local pad = Instance.new("UIPadding")
    pad.PaddingBottom = UDim.new(0, 6)
    pad.Parent = section
    
    return container
end

local function CreateToggle(parent, text, default, callback)
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(1, 0, 0, 28)
    toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    toggle.BackgroundTransparency = 0.5
    toggle.BorderSizePixel = 0
    toggle.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = toggle
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggle
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 36, 0, 18)
    btn.Position = UDim2.new(1, -42, 0.5, -9)
    btn.BackgroundColor3 = default and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(50, 50, 60)
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.Parent = toggle
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 999)
    btnCorner.Parent = btn
    
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 12, 0, 12)
    dot.Position = default and UDim2.new(1, -16, 0.5, -6) or UDim2.new(0, 4, 0.5, -6)
    dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dot.BorderSizePixel = 0
    dot.Parent = btn
    local dotCorner = Instance.new("UICorner")
    dotCorner.CornerRadius = UDim.new(0, 999)
    dotCorner.Parent = dot
    
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(50, 50, 60)
        dot.Position = state and UDim2.new(1, -16, 0.5, -6) or UDim2.new(0, 4, 0.5, -6)
        if callback then pcall(callback, state) end
    end)
    
    return toggle
end

local function CreateSlider(parent, text, min, max, default, callback)
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(1, 0, 0, 38)
    slider.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    slider.BackgroundTransparency = 0.5
    slider.BorderSizePixel = 0
    slider.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = slider
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, -10, 0, 16)
    label.Position = UDim2.new(0, 8, 0, 2)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = slider
    
    local value = Instance.new("TextLabel")
    value.Size = UDim2.new(0.4, -10, 0, 16)
    value.Position = UDim2.new(0.6, 0, 0, 2)
    value.BackgroundTransparency = 1
    value.Text = tostring(default)
    value.TextColor3 = Color3.fromRGB(150, 200, 255)
    value.TextSize = 10
    value.Font = Enum.Font.GothamBold
    value.TextXAlignment = Enum.TextXAlignment.Right
    value.Parent = slider
    
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, -16, 0, 4)
    bg.Position = UDim2.new(0, 8, 1, -10)
    bg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    bg.BorderSizePixel = 0
    bg.Parent = slider
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 999)
    bgCorner.Parent = bg
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    fill.BorderSizePixel = 0
    fill.Parent = bg
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 999)
    fillCorner.Parent = fill
    
    local handle = Instance.new("Frame")
    handle.Size = UDim2.new(0, 10, 0, 10)
    handle.Position = UDim2.new(1, -5, 0.5, -5)
    handle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    handle.BorderSizePixel = 0
    handle.Parent = fill
    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(0, 999)
    handleCorner.Parent = handle
    
    local dragging = false
    local currentValue = default
    
    local function update(input)
        local absPos = bg.AbsolutePosition
        local absSize = bg.AbsoluteSize
        local x = math.clamp(input.Position.X - absPos.X, 0, absSize.X)
        local percent = absSize.X > 0 and (x / absSize.X) or 0
        currentValue = math.floor(min + (max - min) * percent)
        value.Text = tostring(currentValue)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        if callback then pcall(callback, currentValue) end
    end
    
    bg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)
    fill.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    return slider
end

local function CreateButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 28)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    end)
    btn.MouseButton1Click:Connect(function()
        if callback then pcall(callback) end
    end)
    return btn
end

local function CreateLabel(parent, text, rich)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 20)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.TextSize = 10
    lbl.Font = Enum.Font.Gotham
    lbl.RichText = rich or false
    lbl.Parent = parent
    return lbl
end

local function CreateDropdown(parent, text, options, default, callback)
    local dropdown = Instance.new("Frame")
    dropdown.Size = UDim2.new(1, 0, 0, 28)
    dropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    dropdown.BackgroundTransparency = 0.5
    dropdown.BorderSizePixel = 0
    dropdown.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = dropdown
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, -10, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = dropdown
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.5, -10, 0.8, 0)
    btn.Position = UDim2.new(0.5, 0, 0.5, -10)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.BorderSizePixel = 0
    btn.Text = default or options[1]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 10
    btn.Font = Enum.Font.Gotham
    btn.Parent = dropdown
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    
    local currentIndex = 1
    for i, opt in ipairs(options) do
        if opt == (default or options[1]) then currentIndex = i break end
    end
    
    btn.MouseButton1Click:Connect(function()
        currentIndex = currentIndex % #options + 1
        btn.Text = options[currentIndex]
        if callback then pcall(callback, options[currentIndex]) end
    end)
    
    return dropdown
end

local function CreateColorPicker(parent, text, defaultColor, callback)
    local picker = Instance.new("Frame")
    picker.Size = UDim2.new(1, 0, 0, 28)
    picker.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    picker.BackgroundTransparency = 0.5
    picker.BorderSizePixel = 0
    picker.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = picker
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = picker
    
    local colorBox = Instance.new("TextButton")
    colorBox.Size = UDim2.new(0, 30, 0, 18)
    colorBox.Position = UDim2.new(1, -38, 0.5, -9)
    colorBox.BackgroundColor3 = defaultColor
    colorBox.BorderSizePixel = 0
    colorBox.Text = ""
    colorBox.Parent = picker
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 4)
    boxCorner.Parent = colorBox
    
    local currentColor = defaultColor
    local expanded = false
    local presetFrame = nil
    
    local presets = {
        Color3.fromRGB(255,0,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,0,255),
        Color3.fromRGB(255,255,0), Color3.fromRGB(255,0,255), Color3.fromRGB(0,255,255),
        Color3.fromRGB(255,255,255), Color3.fromRGB(128,0,128), Color3.fromRGB(255,105,180),
        Color3.fromRGB(255,165,0), Color3.fromRGB(0,128,200), Color3.fromRGB(255,215,0),
        Color3.fromRGB(128,128,128), Color3.fromRGB(0,0,0)
    }
    
    colorBox.MouseButton1Click:Connect(function()
        if expanded and presetFrame then
            presetFrame:Destroy()
            presetFrame = nil
            expanded = false
            return
        end
        expanded = true
        presetFrame = Instance.new("Frame")
        presetFrame.Size = UDim2.new(1, 0, 0, 60)
        presetFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        presetFrame.BorderSizePixel = 0
        presetFrame.Parent = picker.Parent
        local pCorner = Instance.new("UICorner")
        pCorner.CornerRadius = UDim.new(0, 4)
        pCorner.Parent = presetFrame
        
        local grid = Instance.new("UIGridLayout")
        grid.CellSize = UDim2.new(0, 22, 0, 22)
        grid.CellPadding = UDim2.new(0, 4, 0, 4)
        grid.FillDirectionMaxCells = 7
        grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
        grid.VerticalAlignment = Enum.VerticalAlignment.Center
        grid.Parent = presetFrame
        
        local pad = Instance.new("UIPadding")
        pad.PaddingTop = UDim.new(0, 4)
        pad.PaddingBottom = UDim.new(0, 4)
        pad.PaddingLeft = UDim.new(0, 4)
        pad.PaddingRight = UDim.new(0, 4)
        pad.Parent = presetFrame
        
        for _, color in ipairs(presets) do
            local pBtn = Instance.new("TextButton")
            pBtn.Size = UDim2.new(0, 22, 0, 22)
            pBtn.BackgroundColor3 = color
            pBtn.BorderSizePixel = 0
            pBtn.Text = ""
            pBtn.Parent = presetFrame
            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(0, 4)
            c.Parent = pBtn
            pBtn.MouseButton1Click:Connect(function()
                currentColor = color
                colorBox.BackgroundColor3 = currentColor
                if callback then pcall(callback, currentColor) end
                if presetFrame then presetFrame:Destroy() end
                expanded = false
                presetFrame = nil
            end)
        end
    end)
    
    return picker
end

local function CreateKeybind(parent, text, defaultKey, callback)
    local keybind = Instance.new("Frame")
    keybind.Size = UDim2.new(1, 0, 0, 28)
    keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    keybind.BackgroundTransparency = 0.5
    keybind.BorderSizePixel = 0
    keybind.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = keybind
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -80, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = keybind
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 70, 0, 20)
    btn.Position = UDim2.new(1, -76, 0.5, -10)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.BorderSizePixel = 0
    btn.Text = defaultKey
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.Parent = keybind
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    
    local listening = false
    local currentKey = defaultKey
    btn.MouseButton1Click:Connect(function()
        if listening then return end
        listening = true
        btn.Text = "..."
        local conn
        conn = UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.UserInputType == Enum.UserInputType.Keyboard then
                btn.Text = input.KeyCode.Name
                currentKey = input.KeyCode.Name
                listening = false
                conn:Disconnect()
                if callback then pcall(callback, input.KeyCode) end
            end
        end)
    end)
    
    return keybind
end

-- ==================== VISUALS TAB ====================
-- 1. Motion Blur
local blur = Lighting:FindFirstChildOfClass("BlurEffect") or Instance.new("BlurEffect")
blur.Parent = Lighting
blur.Size = 0

local mb_enabled = false
local lastCFrame = Camera.CFrame
local lerpSpeed = 6
local maxBlur = 8
local minThreshold = 0.03

-- 2. Jump Button Size
local jb_enabled = false
local jb_size = 100

local function findJumpButton()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return nil end
    local tg = pg:FindFirstChild("TouchGui")
    if not tg then return nil end
    for _, d in ipairs(tg:GetDescendants()) do
        if d.Name == "JumpButton" and (d:IsA("ImageButton") or d:IsA("TextButton")) then return d end
    end
    return nil
end

local function setJumpButtonSize(px)
    local jb = findJumpButton()
    if not jb then return end
    local screen = Camera.ViewportSize
    local maxSize = math.min(screen.X, screen.Y) * 0.25
    local clamped = math.clamp(px, 50, maxSize)
    jb.Size = UDim2.new(0, clamped, 0, clamped)
    jb.Position = UDim2.new(1, -clamped - 20, 1, -clamped - 20)
end

-- 3. Tool Outline
local outline_enabled = false
local outline_rainbow = false
local tool_highlights = {}

local colors = {
    Black = Color3.fromRGB(0,0,0), White = Color3.fromRGB(255,255,255),
    Red = Color3.fromRGB(255,0,0), Blue = Color3.fromRGB(0,0,255),
    Pink = Color3.fromRGB(255,105,180), Magenta = Color3.fromRGB(255,0,255),
    Purple = Color3.fromRGB(128,0,128), Orange = Color3.fromRGB(255,165,0),
    Green = Color3.fromRGB(0,128,0), Cyan = Color3.fromRGB(0,255,255),
    Yellow = Color3.fromRGB(255,255,0), Gold = Color3.fromRGB(255,215,0),
    Ocean = Color3.fromRGB(0,128,255)
}
local selectedOutline = colors.Purple
local selectedFill = colors.Black

local function ensureOutline(tool)
    if not tool:IsA("Tool") then return end
    local handle = tool:FindFirstChild("Handle")
    if not handle or not handle:IsA("BasePart") then return end
    local hl = tool:FindFirstChild("ToolOutline")
    if not hl then
        hl = Instance.new("Highlight")
        hl.Name = "ToolOutline"
        hl.Adornee = handle
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.FillTransparency = 0.8
        hl.OutlineTransparency = 0.8
        hl.Parent = tool
    end
    hl.Enabled = outline_enabled
    hl.OutlineColor = selectedOutline
    hl.FillColor = selectedFill
    tool_highlights[tool] = hl
end

local function applyOutlineToAllTools()
    tool_highlights = {}
    for _, t in ipairs(LocalPlayer.Backpack:GetChildren()) do ensureOutline(t) end
    local char = LocalPlayer.Character
    if char then for _, t in ipairs(char:GetChildren()) do ensureOutline(t) end end
end

local function removeOutlines()
    for tool, hl in pairs(tool_highlights) do
        if hl then hl:Destroy() end
    end
    tool_highlights = {}
end

-- 4. Wide Screen
local wideScreenEnabled = false
local wideScreenStrength = 0.7

-- 5. Fonts
local fonts = {
    ["SourceSans"] = Enum.Font.SourceSans,
    ["Gotham"] = Enum.Font.Gotham,
    ["Arcade"] = Enum.Font.Arcade,
    ["Arial"] = Enum.Font.Arial,
    ["ArialBold"] = Enum.Font.ArialBold,
    ["Cartoon"] = Enum.Font.Cartoon,
    ["Fantasy"] = Enum.Font.Fantasy,
    ["Highway"] = Enum.Font.Highway,
    ["Code"] = Enum.Font.Code,
}
local selectedFont = "SourceSans"

-- 6. Theme Changer
local primaryColor = nil
local secondaryColor = nil
local originalColors = {}

local function applyTheme()
    pcall(function()
        local gui = gethui and gethui() or CoreGui
        for _, element in ipairs(gui:GetDescendants()) do
            if element:IsA("GuiObject") then
                if not originalColors[element] then
                    originalColors[element] = {
                        Background = element.BackgroundColor3,
                        Border = element.BorderColor3
                    }
                end
                if primaryColor then element.BackgroundColor3 = primaryColor end
                if secondaryColor then element.BorderColor3 = secondaryColor end
            end
            if element:IsA("UIGradient") and primaryColor then
                element.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, primaryColor),
                    ColorSequenceKeypoint.new(1, secondaryColor or primaryColor)
                })
            end
        end
    end)
end

local function resetTheme()
    pcall(function()
        for element, props in pairs(originalColors) do
            if element then
                if props.Background then element.BackgroundColor3 = props.Background end
                if props.Border then element.BorderColor3 = props.Border end
            end
        end
    end)
end

-- ==================== COMBAT TAB ====================
-- Wallhop
local wallhopEnabled = false
local wallRaycastParams = RaycastParams.new()
wallRaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

local function getWallRaycastResult()
    local character = LocalPlayer.Character
    if not character then return nil end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    wallRaycastParams.FilterDescendantsInstances = {character}
    local closestHit, minDistance = nil, 3
    local hrpCF = hrp.CFrame
    for i = 0,7 do
        local angle = math.rad(i*45)
        local dir = (hrpCF*CFrame.Angles(0,angle,0)).LookVector
        local ray = Workspace:Raycast(hrp.Position, dir*2, wallRaycastParams)
        if ray and ray.Instance and ray.Distance < minDistance then
            minDistance = ray.Distance
            closestHit = ray
        end
    end
    return closestHit
end

local function performWallhop()
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not (humanoid and rootPart and humanoid:GetState() ~= Enum.HumanoidStateType.Dead) then return end
    local wall = getWallRaycastResult()
    if not wall then return end
    rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + wall.Normal)
    RunService.Heartbeat:Wait()
    if humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(0.1)
    end
end

-- Speedglitch
local sideSpeed = 150
local buttonSize = 50
local emoteEnabled = false
local selectedEmoteId = nil
local customEmoteEnabled = false
local emoteButton = nil
local moveInput = 0
local isJumping = false

local emotes = {
    ["Moonwalk"] = "79127989560307",
    ["Yungblud - Happier Jump"] = "15610015346",
    ["Baby Queen - Bouncy Twirl"] = "14353423348",
    ["Flex Walk"] = "15506506103"
}

local function playEmote(assetId)
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local success, err = pcall(function()
        humanoid:PlayEmoteAndGetAnimTrackById(assetId)
    end)
    if not success then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://"..assetId
        humanoid:LoadAnimation(anim):Play()
    end
end

local function createEmoteButton()
    if emoteButton then return end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SpeedGlitchGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    emoteButton = Instance.new("TextButton")
    emoteButton.Size = UDim2.new(0, buttonSize, 0, buttonSize)
    emoteButton.Position = UDim2.new(0, 50, 0, 200)
    emoteButton.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
    emoteButton.Text = "Speed Glitch"
    emoteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    emoteButton.TextScaled = true
    emoteButton.AutoButtonColor = false
    emoteButton.Parent = screenGui
    local dragging, dragInput, mousePos, framePos = false
    emoteButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = emoteButton.Position
        end
    end)
    emoteButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            emoteButton.Position = UDim2.new(0, framePos.X.Offset + delta.X, 0, framePos.Y.Offset + delta.Y)
        end
    end)
    emoteButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    emoteButton.MouseButton1Click:Connect(function()
        emoteEnabled = not emoteEnabled
        if emoteEnabled then
            emoteButton.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
            if selectedEmoteId then playEmote(selectedEmoteId) end
        else
            emoteButton.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
        end
    end)
end

-- Fake Knife
local fakeKnifeGui, fakeKnifeButton

local function createFakeKnife()
    if fakeKnifeGui then fakeKnifeGui:Destroy() end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FakeKnifeGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    fakeKnifeGui = screenGui
    local btn = Instance.new("ImageButton")
    btn.Size = UDim2.new(0, 80, 0, 80)
    btn.Position = UDim2.new(0.2, 0, 0.7, 0)
    btn.Image = "rbxassetid://121774155770924"
    btn.BackgroundTransparency = 0.8
    btn.Active = true
    btn.Draggable = true
    btn.Parent = screenGui
    fakeKnifeButton = btn
    btn.MouseButton1Click:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local knife = char:FindFirstChild("Knife")
        if knife then
            local animFolder = knife:FindFirstChild("Animations")
            if animFolder then
                local slash = animFolder:FindFirstChild("Slash")
                local down = animFolder:FindFirstChild("Down")
                if slash and slash:IsA("Animation") then
                    local track = humanoid:LoadAnimation(slash)
                    track:Play()
                    if down and down:IsA("Animation") then
                        task.delay(1, function()
                            local downTrack = humanoid:LoadAnimation(down)
                            downTrack:Play()
                        end)
                    end
                end
            end
        end
    end)
    btn.TouchTap:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local knife = char:FindFirstChild("Knife")
        if knife then
            local animFolder = knife:FindFirstChild("Animations")
            if animFolder then
                local slash = animFolder:FindFirstChild("Slash")
                local down = animFolder:FindFirstChild("Down")
                if slash and slash:IsA("Animation") then
                    local track = humanoid:LoadAnimation(slash)
                    track:Play()
                    if down and down:IsA("Animation") then
                        task.delay(1, function()
                            local downTrack = humanoid:LoadAnimation(down)
                            downTrack:Play()
                        end)
                    end
                end
            end
        end
    end)
end

-- Fake Dual
local fakeDualGui, fakeDualButton

local function createFakeDual()
    if fakeDualGui then fakeDualGui:Destroy() end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FakeDualGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    fakeDualGui = screenGui
    local btn = Instance.new("ImageButton")
    btn.Size = UDim2.new(0, 80, 0, 80)
    btn.Position = UDim2.new(0.3, 0, 0.7, 0)
    btn.Image = "rbxassetid://131282777381667"
    btn.BackgroundTransparency = 0.8
    btn.Active = true
    btn.Draggable = true
    btn.Parent = screenGui
    fakeDualButton = btn
    btn.MouseButton1Click:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local anim1 = Instance.new("Animation")
        anim1.AnimationId = "rbxassetid://2467577524"
        local track1 = humanoid:LoadAnimation(anim1)
        track1:Play()
        task.delay(1, function()
            local anim2 = Instance.new("Animation")
            anim2.AnimationId = "rbxassetid://2470501967"
            local track2 = humanoid:LoadAnimation(anim2)
            track2:Play()
        end)
    end)
    btn.TouchTap:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local anim1 = Instance.new("Animation")
        anim1.AnimationId = "rbxassetid://2467577524"
        local track1 = humanoid:LoadAnimation(anim1)
        track1:Play()
        task.delay(1, function()
            local anim2 = Instance.new("Animation")
            anim2.AnimationId = "rbxassetid://2470501967"
            local track2 = humanoid:LoadAnimation(anim2)
            track2:Play()
        end)
    end)
end

-- ==================== OVERLAY TAB ====================
local overlayEnabled = false
local overlayScale = 50
local activeStats = {}

local overlayScreenGui = Instance.new("ScreenGui")
overlayScreenGui.Name = "PerformanceOverlay"
overlayScreenGui.ResetOnSpawn = false
overlayScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local overlayMainFrame = Instance.new("Frame")
overlayMainFrame.Position = UDim2.new(0, 10, 0, 10)
overlayMainFrame.BackgroundTransparency = 0.3
overlayMainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
overlayMainFrame.Active = true
overlayMainFrame.Draggable = true
overlayMainFrame.Visible = false
overlayMainFrame.Parent = overlayScreenGui

local overlayLabels = {}
local function createOverlayLabel(name)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,0,0,20)
    lbl.BackgroundTransparency = 1
    lbl.TextScaled = true
    lbl.Font = Enum.Font.SourceSansBold
    lbl.TextColor3 = Color3.fromRGB(255,255,255)
    lbl.Text = name
    lbl.Visible = false
    lbl.Parent = overlayMainFrame
    overlayLabels[name] = lbl
    return lbl
end

local fpsLabel = createOverlayLabel("FPS: 0")
local pingLabel = createOverlayLabel("Ping: 0 ms")
local playersLabel = createOverlayLabel("Players: 0")

local function updateOverlayLayout()
    local scale = overlayScale / 50
    local yOffset = 0
    for _, lbl in ipairs(activeStats) do
        lbl.Position = UDim2.new(0,0,0,yOffset)
        lbl.Size = UDim2.new(1,0,0,20*scale)
        lbl.Visible = true
        yOffset = yOffset + 20*scale
    end
    overlayMainFrame.Size = UDim2.new(0, 120*scale, 0, yOffset)
end

local function toggleOverlayStat(labelObj, on)
    if on then
        table.insert(activeStats, labelObj)
    else
        for i,v in ipairs(activeStats) do
            if v == labelObj then table.remove(activeStats,i) break end
        end
        labelObj.Visible = false
    end
    updateOverlayLayout()
end

local lastUpdate = tick()
local frameCount = 0

RunService.RenderStepped:Connect(function(delta)
    if not overlayEnabled then return end
    local now = tick()
    frameCount = frameCount + 1
    if now - lastUpdate >= 1 then
        local fps = math.floor(frameCount / (now - lastUpdate))
        fpsLabel.Text = "FPS: "..fps
        if fps <= 30 then fpsLabel.TextColor3 = Color3.fromRGB(255,0,0)
        elseif fps <= 45 then fpsLabel.TextColor3 = Color3.fromRGB(255,165,0)
        else fpsLabel.TextColor3 = Color3.fromRGB(0,255,0) end
        frameCount = 0
        lastUpdate = now
    end
    local pingVal = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    local ping = math.floor(pingVal)
    pingLabel.Text = "Ping: "..ping.." ms"
    if ping <= 170 then pingLabel.TextColor3 = Color3.fromRGB(0,255,0)
    elseif ping <= 200 then pingLabel.TextColor3 = Color3.fromRGB(255,165,0)
    else pingLabel.TextColor3 = Color3.fromRGB(255,0,0) end
    local playerCount = #Players:GetPlayers()
    playersLabel.Text = "Players: "..playerCount
    if playerCount >= 9 then playersLabel.TextColor3 = Color3.fromRGB(0,255,0)
    elseif playerCount >= 6 then playersLabel.TextColor3 = Color3.fromRGB(255,165,0)
    else playersLabel.TextColor3 = Color3.fromRGB(255,0,0) end
end)

-- ==================== PERFORMANCE TAB ====================
local original_materials = {}
local original_particle_states = {}
local original_textures = {}
local original_mesh_transparency = {}
local original_accessories = {}
local perf_conns = {}

local function isPlayerDescendant(obj)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character and obj:IsDescendantOf(plr.Character) then return true end
    end
    return false
end

-- SmoothPlastic
local function setSmoothPlastic(on)
    if on then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and not isPlayerDescendant(obj) and obj.Material ~= Enum.Material.SmoothPlastic then
                original_materials[obj] = obj.Material
                obj.Material = Enum.Material.SmoothPlastic
            end
        end
        if not perf_conns.Smooth then
            perf_conns.Smooth = Workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("BasePart") and not isPlayerDescendant(obj) then
                    original_materials[obj] = obj.Material
                    obj.Material = Enum.Material.SmoothPlastic
                end
            end)
        end
    else
        for part, mat in pairs(original_materials) do
            if part and part.Parent then pcall(function() part.Material = mat end) end
        end
        original_materials = {}
        if perf_conns.Smooth then perf_conns.Smooth:Disconnect() perf_conns.Smooth = nil end
    end
end

-- Particles
local function setParticles(on)
    if on then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                original_particle_states[obj] = obj.Enabled
                obj.Enabled = false
            end
        end
        if not perf_conns.Particles then
            perf_conns.Particles = Workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                    original_particle_states[obj] = obj.Enabled
                    obj.Enabled = false
                end
            end)
        end
    else
        for obj, state in pairs(original_particle_states) do
            if obj and obj.Parent then pcall(function() obj.Enabled = state end) end
        end
        original_particle_states = {}
        if perf_conns.Particles then perf_conns.Particles:Disconnect() perf_conns.Particles = nil end
    end
end

-- Textures
local function setTextures(on)
    if on then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Decal") or obj:IsA("Texture") then
                if original_textures[obj] == nil then original_textures[obj] = obj.Texture end
                obj.Texture = ""
            end
        end
        if not perf_conns.Textures then
            perf_conns.Textures = Workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("Decal") or obj:IsA("Texture") then
                    if original_textures[obj] == nil then original_textures[obj] = obj.Texture end
                    obj.Texture = ""
                end
            end)
        end
    else
        for obj, tex in pairs(original_textures) do
            if obj and obj.Parent then pcall(function() obj.Texture = tex end) end
        end
        original_textures = {}
        if perf_conns.Textures then perf_conns.Textures:Disconnect() perf_conns.Textures = nil end
    end
end

-- Meshes
local function setMeshes(on)
    if on then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("MeshPart") and not isPlayerDescendant(obj) then
                if original_mesh_transparency[obj] == nil then original_mesh_transparency[obj] = obj.Transparency end
                obj.Transparency = 1
            end
            if obj:IsA("SpecialMesh") or obj:IsA("BlockMesh") or obj:IsA("CylinderMesh") then
                local parent = obj.Parent
                if parent and parent:IsA("BasePart") and not isPlayerDescendant(parent) then
                    if original_mesh_transparency[parent] == nil then original_mesh_transparency[parent] = parent.Transparency end
                    parent.Transparency = 1
                end
            end
        end
        if not perf_conns.Meshes then
            perf_conns.Meshes = Workspace.DescendantAdded:Connect(function(obj)
                task.defer(function()
                    if obj:IsA("MeshPart") and not isPlayerDescendant(obj) then
                        if original_mesh_transparency[obj] == nil then original_mesh_transparency[obj] = obj.Transparency end
                        obj.Transparency = 1
                    end
                    if obj:IsA("SpecialMesh") or obj:IsA("BlockMesh") or obj:IsA("CylinderMesh") then
                        local parent = obj.Parent
                        if parent and parent:IsA("BasePart") and not isPlayerDescendant(parent) then
                            if original_mesh_transparency[parent] == nil then original_mesh_transparency[parent] = parent.Transparency end
                            parent.Transparency = 1
                        end
                    end
                end)
            end)
        end
    else
        for part, trans in pairs(original_mesh_transparency) do
            if part and part.Parent then pcall(function() part.Transparency = trans end) end
        end
        original_mesh_transparency = {}
        if perf_conns.Meshes then perf_conns.Meshes:Disconnect() perf_conns.Meshes = nil end
    end
end

-- Accessories
local function setAccessories(on)
    if on then
        for _, plr in ipairs(Players:GetPlayers()) do
            local char = plr.Character
            if char then
                for _, acc in ipairs(char:GetChildren()) do
                    if acc:IsA("Accessory") then
                        original_accessories[acc] = plr
                        acc.Parent = nil
                    end
                end
            end
        end
        if not perf_conns.CharacterAdded then
            perf_conns.CharacterAdded = Players.PlayerAdded:Connect(function(p)
                p.CharacterAdded:Connect(function(ch)
                    task.defer(function()
                        for _, acc in ipairs(ch:GetChildren()) do
                            if acc:IsA("Accessory") then
                                original_accessories[acc] = p
                                acc.Parent = nil
                            end
                        end
                    end)
                end)
            end)
        end
    else
        for acc, owner in pairs(original_accessories) do
            if owner and owner.Character and acc and not acc.Parent then
                pcall(function() acc.Parent = owner.Character end)
            end
        end
        original_accessories = {}
        if perf_conns.CharacterAdded then perf_conns.CharacterAdded:Disconnect() perf_conns.CharacterAdded = nil end
    end
end

-- Shadows
local function setShadows(on) Lighting.GlobalShadows = not on end

-- Gray Skybox
local function setGraySky(on)
    if on then
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        local assetId = "rbxassetid://99742693890881"
        sky.SkyboxBk = assetId; sky.SkyboxDn = assetId; sky.SkyboxFt = assetId
        sky.SkyboxLf = assetId; sky.SkyboxRt = assetId; sky.SkyboxUp = assetId
        sky.Parent = Lighting
    else
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
    end
end

-- ==================== SKYBOX TAB ====================
local skyboxPresets = {
    ["Minecraft Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://8735166756"
        sky.SkyboxDn = "rbxassetid://8735166707"
        sky.SkyboxFt = "rbxassetid://8735231668"
        sky.SkyboxLf = "rbxassetid://8735166755"
        sky.SkyboxRt = "rbxassetid://8735166751"
        sky.SkyboxUp = "rbxassetid://8735166729"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(2, 125, 157)
        Lighting.Brightness = 3.133
        Lighting.OutdoorAmbient = Color3.fromRGB(9, 111, 157)
    end,
    ["Realistic Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://144933338"
        sky.SkyboxDn = "rbxassetid://144931530"
        sky.SkyboxFt = "rbxassetid://144933262"
        sky.SkyboxLf = "rbxassetid://144933244"
        sky.SkyboxRt = "rbxassetid://144933299"
        sky.SkyboxUp = "rbxassetid://144931564"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(110, 157, 152)
        Lighting.Brightness = 3.133
        Lighting.OutdoorAmbient = Color3.fromRGB(117, 157, 151)
    end,
    ["Purple Nighty #1"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://159454299"
        sky.SkyboxDn = "rbxassetid://159454296"
        sky.SkyboxFt = "rbxassetid://159454293"
        sky.SkyboxLf = "rbxassetid://159454286"
        sky.SkyboxRt = "rbxassetid://159454300"
        sky.SkyboxUp = "rbxassetid://159454288"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(87, 6, 105)
        Lighting.Brightness = -9
        Lighting.OutdoorAmbient = Color3.fromRGB(69, 0, 157)
    end,
    ["Purple Nighty #2"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://14543264135"
        sky.SkyboxDn = "rbxassetid://14543358958"
        sky.SkyboxFt = "rbxassetid://14543257810"
        sky.SkyboxLf = "rbxassetid://14543275895"
        sky.SkyboxRt = "rbxassetid://14543280890"
        sky.SkyboxUp = "rbxassetid://14543371676"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(124, 1, 205)
        Lighting.Brightness = 0.23
        Lighting.OutdoorAmbient = Color3.fromRGB(95, 0, 182)
    end,
    ["Sunset"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://15502525195"
        sky.SkyboxDn = "rbxassetid://15502522797"
        sky.SkyboxFt = "rbxassetid://15502524520"
        sky.SkyboxLf = "rbxassetid://15502522129"
        sky.SkyboxRt = "rbxassetid://15502523711"
        sky.SkyboxUp = "rbxassetid://15502526102"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(233, 191, 12)
        Lighting.Brightness = 1.7
        Lighting.OutdoorAmbient = Color3.fromRGB(210, 104, 0)
    end,
    ["Nighty Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://168387023"
        sky.SkyboxDn = "rbxassetid://168387089"
        sky.SkyboxFt = "rbxassetid://168387054"
        sky.SkyboxLf = "rbxassetid://168534432"
        sky.SkyboxRt = "rbxassetid://168387190"
        sky.SkyboxUp = "rbxassetid://168387135"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.new(0,0,0)
        Lighting.Brightness = 0.3
        Lighting.OutdoorAmbient = Color3.new(0,0,0)
    end,
    ["Blood Moon"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://401664839"
        sky.SkyboxDn = "rbxassetid://401664862"
        sky.SkyboxFt = "rbxassetid://401664960"
        sky.SkyboxLf = "rbxassetid://401664881"
        sky.SkyboxRt = "rbxassetid://401664901"
        sky.SkyboxUp = "rbxassetid://401664936"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(207,71,6)
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(187,2,2)
    end,
    ["Spongebob Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://15962101128"
        sky.SkyboxDn = "rbxassetid://15970246218"
        sky.SkyboxFt = "rbxassetid://15962101128"
        sky.SkyboxLf = "rbxassetid://15962101128"
        sky.SkyboxRt = "rbxassetid://15962101128"
        sky.SkyboxUp = "rbxassetid://15962901054"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(19,171,207)
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(11,188,178)
    end,
    ["Pink Blossom"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://271042516"
        sky.SkyboxDn = "rbxassetid://271077243"
        sky.SkyboxFt = "rbxassetid://271042556"
        sky.SkyboxLf = "rbxassetid://271042310"
        sky.SkyboxRt = "rbxassetid://271042467"
        sky.SkyboxUp = "rbxassetid://271077958"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(222,186,255)
        Lighting.Brightness = 3.135
        Lighting.OutdoorAmbient = Color3.fromRGB(231,216,255)
    end,
    ["Purple Sunset"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://264908339"
        sky.SkyboxDn = "rbxassetid://264907909"
        sky.SkyboxFt = "rbxassetid://264909420"
        sky.SkyboxLf = "rbxassetid://264909758"
        sky.SkyboxRt = "rbxassetid://264908886"
        sky.SkyboxUp = "rbxassetid://264907379"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(63,21,176)
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(57,29,125)
    end,
    ["Half-Life 2"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://9000922368"
        sky.SkyboxDn = "rbxassetid://9000922033"
        sky.SkyboxFt = "rbxassetid://9000921543"
        sky.SkyboxLf = "rbxassetid://9000920853"
        sky.SkyboxRt = "rbxassetid://9000920563"
        sky.SkyboxUp = "rbxassetid://9000920353"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(169,177,133)
        Lighting.Brightness = 1.299
        Lighting.OutdoorAmbient = Color3.fromRGB(116,126,98)
    end,
    ["Void Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://16262356578"
        sky.SkyboxDn = "rbxassetid://16262358026"
        sky.SkyboxFt = "rbxassetid://16262360469"
        sky.SkyboxLf = "rbxassetid://16262362003"
        sky.SkyboxRt = "rbxassetid://16262363873"
        sky.SkyboxUp = "rbxassetid://16262366016"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(99,12,177)
        Lighting.Brightness = 1.7
        Lighting.OutdoorAmbient = Color3.fromRGB(83,49,139)
    end,
    ["Purple Night"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://5084575798"
        sky.SkyboxDn = "rbxassetid://5084575916"
        sky.SkyboxFt = "rbxassetid://5103949679"
        sky.SkyboxLf = "rbxassetid://5103948542"
        sky.SkyboxRt = "rbxassetid://5103948784"
        sky.SkyboxUp = "rbxassetid://5084576400"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(99,12,177)
        Lighting.Brightness = 1.7
        Lighting.OutdoorAmbient = Color3.fromRGB(83,49,139)
    end,
    ["Pink Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://271042516"
        sky.SkyboxDn = "rbxassetid://271077243"
        sky.SkyboxFt = "rbxassetid://271042556"
        sky.SkyboxLf = "rbxassetid://271042310"
        sky.SkyboxRt = "rbxassetid://271042467"
        sky.SkyboxUp = "rbxassetid://271077958"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(177,112,170)
        Lighting.Brightness = 1.7
        Lighting.OutdoorAmbient = Color3.fromRGB(135,102,140)
    end,
    ["Realistic Moon"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://2670643994"
        sky.SkyboxDn = "rbxassetid://2670643365"
        sky.SkyboxFt = "rbxassetid://2670643214"
        sky.SkyboxLf = "rbxassetid://2670643070"
        sky.SkyboxRt = "rbxassetid://2670644173"
        sky.SkyboxUp = "rbxassetid://2670644331"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(34,39,61)
        Lighting.Brightness = 0.5
        Lighting.OutdoorAmbient = Color3.fromRGB(73,76,100)
    end,
}

local skyKeys = {}
for k in pairs(skyboxPresets) do table.insert(skyKeys, k) end
table.sort(skyKeys)
local selectedSkybox = skyKeys[1]

-- ==================== GUN SOUND TAB ====================
local sounds = {
    "Default|10209803",
    "Meow|7148585764",
    "Laser|8561500387",
    "Pew|2216910282",
    "BoomHeadshot|7551341361",
    "Bruh|6349641063",
    "Fart|8551016315",
}
local selectedSoundId = "rbxassetid://10209803"
local customEnabled = false
local customTextboxId = nil
local soundConnections = {}

local function layerSound(origSound)
    if not selectedSoundId then return end
    origSound.Volume = 0
    if soundConnections[origSound] then soundConnections[origSound]:Disconnect() end
    soundConnections[origSound] = origSound.Played:Connect(function()
        local custom = Instance.new("Sound")
        custom.SoundId = selectedSoundId
        custom.Volume = 1
        custom.PlayOnRemove = true
        custom.Parent = origSound.Parent
        custom:Destroy()
    end)
end

local function applySounds()
    if not customEnabled then return end
    local containers = {LocalPlayer.Backpack, LocalPlayer.Character}
    for _, container in ipairs(containers) do
        if container then
            for _, obj in ipairs(container:GetDescendants()) do
                if obj:IsA("Sound") and obj.Name == "Gunshot" then
                    layerSound(obj)
                end
            end
        end
    end
end

RunService.Heartbeat:Connect(function()
    if customEnabled then applySounds() end
end)

-- ==================== PRIVACY TAB ====================
local hideThumbnail = false
local privacyConn = nil

-- ==================== LOAD TABS ====================
function LoadTab(tabName)
    for _, child in ipairs(ContentFrame:GetChildren()) do
        if child:IsA("Frame") and child ~= ContentList and child ~= ContentPadding then
            child:Destroy()
        end
    end
    
    if tabName == "Visuals" then
        -- Motion Blur
        local sec = CreateSection("Motion Blur")
        CreateToggle(sec, "Enable Motion Blur", false, function(on)
            mb_enabled = on
            if not on then blur.Size = 0 end
        end)
        CreateSlider(sec, "Blur Strength", 1, 20, 8, function(v) maxBlur = v end)
        CreateSlider(sec, "Blur Smoothness", 1, 15, 6, function(v) lerpSpeed = v end)
        
        -- Jump Button Size
        local sec2 = CreateSection("Mobile Jump Button")
        CreateToggle(sec2, "Enable Jump Button Resize", false, function(on)
            jb_enabled = on
            if not UserInputService.TouchEnabled then return end
            if on then setJumpButtonSize(jb_size) end
        end)
        CreateSlider(sec2, "Button Size", 50, 125, 100, function(v)
            jb_size = v
            if jb_enabled and UserInputService.TouchEnabled then setJumpButtonSize(jb_size) end
        end)
        
        -- Tool Outline
        local sec3 = CreateSection("Tool Outline")
        CreateToggle(sec3, "Enable Outline", false, function(on)
            outline_enabled = on
            if on then applyOutlineToAllTools() else removeOutlines() end
        end)
        local colorNames = {}
        for name in pairs(colors) do table.insert(colorNames, name) end
        table.sort(colorNames)
        CreateDropdown(sec3, "Outline Color", colorNames, "Purple", function(selected)
            selectedOutline = colors[selected]
            for _, hl in pairs(tool_highlights) do
                if hl then hl.OutlineColor = selectedOutline end
            end
        end)
        CreateDropdown(sec3, "Fill Color", colorNames, "Black", function(selected)
            selectedFill = colors[selected]
            for _, hl in pairs(tool_highlights) do
                if hl then hl.FillColor = selectedFill end
            end
        end)
        CreateToggle(sec3, "Rainbow Outline", false, function(on) outline_rainbow = on end)
        
        -- Wide Screen
        local sec4 = CreateSection("Wide Screen")
        CreateToggle(sec4, "Enable Wide Screen", false, function(on) wideScreenEnabled = on end)
        
        -- Fonts
        local sec5 = CreateSection("Font Changer")
        local fontNames = {"SourceSans","Gotham","Arcade","Arial","ArialBold","Cartoon","Fantasy","Highway","Code"}
        CreateDropdown(sec5, "Select Font", fontNames, "SourceSans", function(selected)
            selectedFont = selected
            for _, gui in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
                if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
                    gui.Font = fonts[selectedFont]
                end
            end
        end)
        
        -- Theme Changer
        local sec6 = CreateSection("Theme Changer")
        local themeColors = {"Black","White","Red","Green","Blue","Yellow","Magenta","Purple","Pink","Orange","Cyan","Gold","Ocean"}
        CreateDropdown(sec6, "Primary Color", themeColors, "Purple", function(selected)
            primaryColor = colors[selected]
        end)
        CreateDropdown(sec6, "Secondary Color", themeColors, "Black", function(selected)
            secondaryColor = colors[selected]
        end)
        CreateButton(sec6, "Apply Theme", applyTheme)
        CreateButton(sec6, "Reset Theme", resetTheme)
        
    elseif tabName == "Combat" then
        -- Wallhop
        local sec = CreateSection("Wallhop")
        CreateToggle(sec, "Enable Wallhop", false, function(on) wallhopEnabled = on end)
        CreateKeybind(sec, "Wallhop Key", "J", function(key)
            print("Wallhop key set to:", key.Name)
        end)
        CreateLabel(sec, "Credits: not_.gato (@HeyyCaf)", true)
        
        -- Speedglitch
        local sec2 = CreateSection("Speedglitch")
        CreateToggle(sec2, "Show Speedglitch Button", false, function(on)
            if on then createEmoteButton()
            elseif emoteButton then emoteButton:Destroy() emoteButton = nil emoteEnabled = false end
        end)
        CreateSlider(sec2, "Side Speed", 10, 1000, 150, function(v) sideSpeed = v end)
        CreateSlider(sec2, "Button Size", 30, 150, 50, function(v)
            buttonSize = v
            if emoteButton then emoteButton.Size = UDim2.new(0, buttonSize, 0, buttonSize) end
        end)
        local emoteNames = {"Moonwalk","Yungblud - Happier Jump","Baby Queen - Bouncy Twirl","Flex Walk","Custom"}
        CreateDropdown(sec2, "Select Emote", emoteNames, "Moonwalk", function(selected)
            if selected == "Custom" then
                customEmoteEnabled = true
                selectedEmoteId = nil
            else
                customEmoteEnabled = false
                selectedEmoteId = emotes[selected]
            end
        end)
        CreateLabel(sec2, "Credits: not_.gato (@HeyyCaf)", true)
        
        -- Fake Knife
        local sec3 = CreateSection("Fake Knife")
        CreateToggle(sec3, "Show Fake Knife Button", false, function(on)
            if on then createFakeKnife() elseif fakeKnifeGui then fakeKnifeGui:Destroy() fakeKnifeGui = nil end
        end)
        CreateLabel(sec3, "The murderer needs to hold the knife", true)
        
        -- Fake Dual
        local sec4 = CreateSection("Fake Dual Slash")
        CreateToggle(sec4, "Show Fake Dual Button", false, function(on)
            if on then createFakeDual() elseif fakeDualGui then fakeDualGui:Destroy() fakeDualGui = nil end
        end)
        CreateLabel(sec4, "Works even in the lobby", true)
        
    elseif tabName == "Overlay" then
        local sec = CreateSection("Performance Overlay")
        CreateToggle(sec, "Enable Overlay", false, function(on)
            overlayEnabled = on
            overlayMainFrame.Visible = overlayEnabled
            updateOverlayLayout()
        end)
        CreateToggle(sec, "Show FPS", false, function(on) toggleOverlayStat(fpsLabel, on) end)
        CreateToggle(sec, "Show Ping", false, function(on) toggleOverlayStat(pingLabel, on) end)
        CreateToggle(sec, "Show Players", false, function(on) toggleOverlayStat(playersLabel, on) end)
        CreateSlider(sec, "Overlay Scale", 1, 100, 50, function(v)
            overlayScale = v
            updateOverlayLayout()
        end)
        
    elseif tabName == "Performance" then
        local sec = CreateSection("Performance Boosts")
        CreateToggle(sec, "SmoothPlastic (No Textures)", false, setSmoothPlastic)
        CreateToggle(sec, "Disable Shadows", false, setShadows)
        CreateToggle(sec, "Disable Particles/Trails", false, setParticles)
        CreateToggle(sec, "Hide Meshes (World Only)", false, setMeshes)
        CreateToggle(sec, "Remove Textures/Decals", false, setTextures)
        CreateToggle(sec, "Remove Accessories", false, setAccessories)
        CreateToggle(sec, "Gray Skybox", false, setGraySky)
        CreateButton(sec, "Remove Weapon Displays", function()
            local wd = Workspace:FindFirstChild("WeaponDisplays")
            if wd then wd:Destroy() end
        end)
        
    elseif tabName == "Skybox" then
        local sec = CreateSection("Skybox Presets")
        CreateDropdown(sec, "Select Skybox", skyKeys, skyKeys[1], function(selected)
            selectedSkybox = selected
        end)
        CreateButton(sec, "Apply Skybox", function()
            if selectedSkybox and skyboxPresets[selectedSkybox] then
                skyboxPresets[selectedSkybox]()
                print("[BetterODH] Applied:", selectedSkybox)
            end
        end)
        CreateLabel(sec, "Credits: not_.gato (@HeyyCaf)", true)
        
    elseif tabName == "Sound" then
        local sec = CreateSection("Gun Sound Changer")
        CreateToggle(sec, "Enable Custom Sound", false, function(on)
            customEnabled = on
            if on then applySounds() end
        end)
        local soundNames = {}
        for _, data in ipairs(sounds) do
            local name = string.match(data, "(.-)|%d+")
            table.insert(soundNames, name)
        end
        CreateDropdown(sec, "Select Sound", soundNames, "Default", function(selected)
            for _, data in ipairs(sounds) do
                local name, id = string.match(data, "(.-)|(%d+)")
                if name == selected then
                    selectedSoundId = "rbxassetid://" .. id
                    break
                end
            end
            if customEnabled then applySounds() end
        end)
        CreateLabel(sec, "Custom Sound ID (enter numeric ID):", true)
        -- TextBox для кастомного ID
        local textBox = Instance.new("TextBox")
        textBox.Size = UDim2.new(1, 0, 0, 24)
        textBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        textBox.TextColor3 = Color3.fromRGB(200, 200, 200)
        textBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
        textBox.Font = Enum.Font.Gotham
        textBox.TextSize = 10
        textBox.PlaceholderText = "Enter Sound ID (e.g. 10209803)"
        textBox.Text = ""
        textBox.Parent = sec
        local tc = Instance.new("UICorner")
        tc.CornerRadius = UDim.new(0, 4)
        tc.Parent = textBox
        textBox:GetPropertyChangedSignal("Text"):Connect(function()
            local text = textBox.Text
            if text and text ~= "" then
                if not string.find(text, "rbxassetid://") then
                    customTextboxId = "rbxassetid://" .. text
                else
                    customTextboxId = text
                end
                selectedSoundId = customTextboxId
                if customEnabled then applySounds() end
            end
        end)
        
    elseif tabName == "Privacy" then
        local sec = CreateSection("Privacy")
        CreateButton(sec, "Hide My Username", function()
            local function updateGuiNames()
                for _, obj in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if (obj:IsA("TextLabel") or obj:IsA("TextButton")) and obj.Text:find(LocalPlayer.Name) then
                        obj.Text = "Hidden"
                    end
                end
            end
            updateGuiNames()
            LocalPlayer.PlayerGui.DescendantAdded:Connect(function(obj)
                if (obj:IsA("TextLabel") or obj:IsA("TextButton")) and obj.Text:find(LocalPlayer.Name) then
                    task.defer(function() obj.Text = "Hidden" end)
                end
            end)
            print("[BetterODH] Username hidden")
        end)
        
        CreateToggle(sec, "Hide My Avatar", false, function(on)
            hideThumbnail = on
            local function updateThumbnails()
                for _, obj in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if (obj:IsA("ImageLabel") or obj:IsA("ImageButton")) and obj.Image:find(tostring(LocalPlayer.UserId)) then
                        if hideThumbnail then
                            obj.Image = "rbxasset://textures/transparent.png"
                        else
                            local success, thumb = pcall(function()
                                return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                            end)
                            if success then obj.Image = thumb end
                        end
                    end
                end
                if hideThumbnail then
                    if not LocalPlayer.PlayerGui:FindFirstChild("__HideThumbnailConnection") then
                        local conn = Instance.new("BoolValue")
                        conn.Name = "__HideThumbnailConnection"
                        conn.Parent = LocalPlayer.PlayerGui
                        LocalPlayer.PlayerGui.DescendantAdded:Connect(function(obj)
                            if (obj:IsA("ImageLabel") or obj:IsA("ImageButton")) and obj.Image:find(tostring(LocalPlayer.UserId)) then
                                task.defer(function() obj.Image = "rbxasset://textures/transparent.png" end)
                            end
                        end)
                    end
                end
            end
            updateThumbnails()
        end)
    end
end

-- ==================== RAINBOW OUTLINE LOOP ====================
local hue = 0
RunService.RenderStepped:Connect(function()
    if outline_rainbow then
        hue = (hue + 0.5) % 360
        local color = Color3.fromHSV(hue/360, 1, 1)
        for _, hl in pairs(tool_highlights) do
            if hl then
                hl.OutlineColor = color
                hl.FillColor = color
            end
        end
    end
end)

-- ==================== WIDE SCREEN LOOP ====================
RunService.RenderStepped:Connect(function()
    if wideScreenEnabled then
        Camera.CFrame = Camera.CFrame * CFrame.new(0,0,0,1,0,0,0,wideScreenStrength,0,0,0,1)
    end
end)

-- ==================== MOTION BLUR LOOP ====================
RunService.RenderStepped:Connect(function(delta)
    if not mb_enabled then return end
    local lastLook = lastCFrame.LookVector
    local currentLook = Camera.CFrame.LookVector
    local dot = math.clamp(lastLook:Dot(currentLook), -1, 1)
    local angle = math.acos(dot)
    local target = 0
    if angle > minThreshold then
        target = math.clamp(angle / 0.04, 0, 1) * maxBlur
    end
    blur.Size = blur.Size + (target - blur.Size) * math.clamp(lerpSpeed * delta, 0, 1)
    lastCFrame = Camera.CFrame
end)

-- ==================== SPEEDGLITCH HEARTBEAT ====================
local function setupCharacter(char)
    local hum = char:WaitForChild("Humanoid")
    isJumping = false
    hum.Jumping:Connect(function() isJumping = true end)
    hum.StateChanged:Connect(function(_, state)
        if state == Enum.HumanoidStateType.Landed then isJumping = false end
    end)
    return hum
end

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = setupCharacter(Character)
local HRP = Character:WaitForChild("HumanoidRootPart")

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")
    Humanoid = setupCharacter(char)
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.A then moveInput = -1
    elseif input.KeyCode == Enum.KeyCode.D then moveInput = 1 end
end)
UserInputService.InputEnded:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then moveInput = 0 end
end)

RunService.Heartbeat:Connect(function()
    if not emoteEnabled or not isJumping then return end
    local inputDir = moveInput
    if inputDir == 0 and Humanoid.MoveDirection.Magnitude > 0 then
        local camCF = CFrame.new(Vector3.new(), Camera.CFrame.LookVector)
        inputDir = (camCF.RightVector:Dot(Humanoid.MoveDirection) > 0) and 1 or -1
    end
    if inputDir ~= 0 then
        local camRight = Vector3.new(Camera.CFrame.RightVector.X, 0, Camera.CFrame.RightVector.Z).Unit
        HRP.Velocity = camRight * (inputDir * sideSpeed) + Vector3.new(0, HRP.Velocity.Y, 0)
    end
end)

-- ==================== WALLHOP JUMP ====================
UserInputService.JumpRequest:Connect(function()
    if wallhopEnabled then performWallhop() end
end)

-- ==================== KEYBIND TOGGLE ====================
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
        if MainFrame.Visible then LoadTab(currentTab) end
    end
end)

-- ==================== AUTO START ====================
LoadTab("Visuals")
print("[BetterODH] Loaded! Press RightShift to open GUI.")