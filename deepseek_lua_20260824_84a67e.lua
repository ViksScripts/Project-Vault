--[[
    BETTER ODH - RAYFIELD VERSION
    Все функции из оригинального плагина, портированы на Rayfield
    Исправлены все баги, адаптировано для телефонов
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
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local isMobile = UserInputService.TouchEnabled

-- ==================== RAYFIELD SETUP ====================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Better ODH",
    LoadingTitle = "Better ODH",
    LoadingSubtitle = "by B6O6S",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BetterODH",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Better ODH",
        Subtitle = "Key System",
        Note = "No key required",
        FileName = "Key",
        SaveKey = false,
        GrabKeyFromSite = false
    }
})

local Tabs = {
    Visuals = Window:CreateTab("Visuals", 4483362458),
    Combat = Window:CreateTab("Combat", 4483362458),
    Overlay = Window:CreateTab("Overlay", 4483362458),
    Performance = Window:CreateTab("Performance", 4483362458),
    Skybox = Window:CreateTab("Skybox", 4483362458),
    Sound = Window:CreateTab("Sound", 4483362458),
    Privacy = Window:CreateTab("Privacy", 4483362458),
}

-- ==================== VISUALS FUNCTIONS ====================
-- 1. Motion Blur
local blur = Lighting:FindFirstChildOfClass("BlurEffect") or Instance.new("BlurEffect")
blur.Parent = Lighting
blur.Size = 0

local mb_enabled = false
local lastCFrame = Camera.CFrame
local lerpSpeed = 6
local maxBlur = 8
local minThreshold = 0.03

-- 2. Jump Button Size (исправлено)
local jb_enabled = false
local jb_size = 100

local function findJumpButton()
    local tg = CoreGui:FindFirstChild("TouchGui")
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

-- ==================== COMBAT FUNCTIONS ====================
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
    emoteButton.TouchTap:Connect(function()
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

-- ==================== OVERLAY FUNCTIONS ====================
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

-- ==================== PERFORMANCE FUNCTIONS ====================
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

-- Accessories (исправлено)
local function setAccessories(on)
    if on then
        -- Убираем аксессуары у всех текущих игроков
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
        -- Также обрабатываем уже существующих игроков, у которых появился персонаж
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                for _, acc in ipairs(plr.Character:GetChildren()) do
                    if acc:IsA("Accessory") then
                        original_accessories[acc] = plr
                        acc.Parent = nil
                    end
                end
            end
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

-- ==================== SKYBOX FUNCTIONS ====================
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

-- ==================== GUN SOUND FUNCTIONS (исправлено) ====================
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
        custom.Parent = origSound.Parent
        custom:Play()
        task.delay(custom.TimeLength or 0.5, function() custom:Destroy() end)
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

-- ==================== PRIVACY FUNCTIONS (исправлено) ====================
local hideThumbnail = false
local privacyConn = nil

-- ==================== RAYFIELD UI ====================
-- Visuals Tab
local VisualsSection = Tabs.Visuals:CreateSection("Motion Blur")
Tabs.Visuals:CreateToggle(VisualsSection, "Enable Motion Blur", false, function(on)
    mb_enabled = on
    if not on then blur.Size = 0 end
end)
Tabs.Visuals:CreateSlider(VisualsSection, "Blur Strength", 1, 20, 8, function(v)
    maxBlur = v
end)
Tabs.Visuals:CreateSlider(VisualsSection, "Blur Smoothness", 1, 15, 6, function(v)
    lerpSpeed = v
end)

local JumpSection = Tabs.Visuals:CreateSection("Mobile Jump Button")
Tabs.Visuals:CreateToggle(JumpSection, "Enable Jump Button Resize", false, function(on)
    jb_enabled = on
    if not UserInputService.TouchEnabled then return end
    if on then setJumpButtonSize(jb_size) end
end)
Tabs.Visuals:CreateSlider(JumpSection, "Button Size", 50, 125, 100, function(v)
    jb_size = v
    if jb_enabled and UserInputService.TouchEnabled then setJumpButtonSize(jb_size) end
end)

local OutlineSection = Tabs.Visuals:CreateSection("Tool Outline")
Tabs.Visuals:CreateToggle(OutlineSection, "Enable Outline", false, function(on)
    outline_enabled = on
    if on then applyOutlineToAllTools() else removeOutlines() end
end)

local colorNames = {}
for name in pairs(colors) do table.insert(colorNames, name) end
table.sort(colorNames)

Tabs.Visuals:CreateDropdown(OutlineSection, "Outline Color", colorNames, "Purple", function(selected)
    selectedOutline = colors[selected]
    for _, hl in pairs(tool_highlights) do
        if hl then hl.OutlineColor = selectedOutline end
    end
end)
Tabs.Visuals:CreateDropdown(OutlineSection, "Fill Color", colorNames, "Black", function(selected)
    selectedFill = colors[selected]
    for _, hl in pairs(tool_highlights) do
        if hl then hl.FillColor = selectedFill end
    end
end)
Tabs.Visuals:CreateToggle(OutlineSection, "Rainbow Outline", false, function(on)
    outline_rainbow = on
end)

local WideSection = Tabs.Visuals:CreateSection("Wide Screen")
Tabs.Visuals:CreateToggle(WideSection, "Enable Wide Screen", false, function(on)
    wideScreenEnabled = on
end)

local FontSection = Tabs.Visuals:CreateSection("Font Changer")
local fontNames = {"SourceSans","Gotham","Arcade","Arial","ArialBold","Cartoon","Fantasy","Highway","Code"}
Tabs.Visuals:CreateDropdown(FontSection, "Select Font", fontNames, "SourceSans", function(selected)
    selectedFont = selected
    for _, gui in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
        if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
            gui.Font = fonts[selectedFont]
        end
    end
end)

local ThemeSection = Tabs.Visuals:CreateSection("Theme Changer")
local themeColors = {"Black","White","Red","Green","Blue","Yellow","Magenta","Purple","Pink","Orange","Cyan","Gold","Ocean"}
Tabs.Visuals:CreateDropdown(ThemeSection, "Primary Color", themeColors, "Purple", function(selected)
    primaryColor = colors[selected]
end)
Tabs.Visuals:CreateDropdown(ThemeSection, "Secondary Color", themeColors, "Black", function(selected)
    secondaryColor = colors[selected]
end)
Tabs.Visuals:CreateButton(ThemeSection, "Apply Theme", applyTheme)
Tabs.Visuals:CreateButton(ThemeSection, "Reset Theme", resetTheme)

-- Combat Tab
local WallSection = Tabs.Combat:CreateSection("Wallhop")
Tabs.Combat:CreateToggle(WallSection, "Enable Wallhop", false, function(on)
    wallhopEnabled = on
end)
Tabs.Combat:CreateKeybind(WallSection, "Wallhop Key", Enum.KeyCode.J, function(key)
    print("Wallhop key set to:", key.Name)
end)
Tabs.Combat:CreateLabel(WallSection, "Credits: not_.gato (@HeyyCaf)")

local SpeedSection = Tabs.Combat:CreateSection("Speedglitch")
Tabs.Combat:CreateToggle(SpeedSection, "Show Speedglitch Button", false, function(on)
    if on then createEmoteButton()
    elseif emoteButton then emoteButton:Destroy() emoteButton = nil emoteEnabled = false end
end)
Tabs.Combat:CreateSlider(SpeedSection, "Side Speed", 10, 1000, 150, function(v)
    sideSpeed = v
end)
Tabs.Combat:CreateSlider(SpeedSection, "Button Size", 30, 150, 50, function(v)
    buttonSize = v
    if emoteButton then emoteButton.Size = UDim2.new(0, buttonSize, 0, buttonSize) end
end)
local emoteNames = {"Moonwalk","Yungblud - Happier Jump","Baby Queen - Bouncy Twirl","Flex Walk","Custom"}
Tabs.Combat:CreateDropdown(SpeedSection, "Select Emote", emoteNames, "Moonwalk", function(selected)
    if selected == "Custom" then
        customEmoteEnabled = true
        selectedEmoteId = nil
    else
        customEmoteEnabled = false
        selectedEmoteId = emotes[selected]
    end
end)
Tabs.Combat:CreateLabel(SpeedSection, "Credits: not_.gato (@HeyyCaf)")

local FakeKnifeSection = Tabs.Combat:CreateSection("Fake Knife")
Tabs.Combat:CreateToggle(FakeKnifeSection, "Show Fake Knife Button", false, function(on)
    if on then createFakeKnife() elseif fakeKnifeGui then fakeKnifeGui:Destroy() fakeKnifeGui = nil end
end)
Tabs.Combat:CreateLabel(FakeKnifeSection, "The murderer needs to hold the knife")

local FakeDualSection = Tabs.Combat:CreateSection("Fake Dual Slash")
Tabs.Combat:CreateToggle(FakeDualSection, "Show Fake Dual Button", false, function(on)
    if on then createFakeDual() elseif fakeDualGui then fakeDualGui:Destroy() fakeDualGui = nil end
end)
Tabs.Combat:CreateLabel(FakeDualSection, "Works even in the lobby")

-- Overlay Tab
local OverlaySection = Tabs.Overlay:CreateSection("Performance Overlay")
Tabs.Overlay:CreateToggle(OverlaySection, "Enable Overlay", false, function(on)
    overlayEnabled = on
    overlayMainFrame.Visible = overlayEnabled
    updateOverlayLayout()
end)
Tabs.Overlay:CreateToggle(OverlaySection, "Show FPS", false, function(on)
    toggleOverlayStat(fpsLabel, on)
end)
Tabs.Overlay:CreateToggle(OverlaySection, "Show Ping", false, function(on)
    toggleOverlayStat(pingLabel, on)
end)
Tabs.Overlay:CreateToggle(OverlaySection, "Show Players", false, function(on)
    toggleOverlayStat(playersLabel, on)
end)
Tabs.Overlay:CreateSlider(OverlaySection, "Overlay Scale", 1, 100, 50, function(v)
    overlayScale = v
    updateOverlayLayout()
end)

-- Performance Tab
local PerfSection = Tabs.Performance:CreateSection("Performance Boosts")
Tabs.Performance:CreateToggle(PerfSection, "SmoothPlastic (No Textures)", false, setSmoothPlastic)
Tabs.Performance:CreateToggle(PerfSection, "Disable Shadows", false, setShadows)
Tabs.Performance:CreateToggle(PerfSection, "Disable Particles/Trails", false, setParticles)
Tabs.Performance:CreateToggle(PerfSection, "Hide Meshes (World Only)", false, setMeshes)
Tabs.Performance:CreateToggle(PerfSection, "Remove Textures/Decals", false, setTextures)
Tabs.Performance:CreateToggle(PerfSection, "Remove Accessories", false, setAccessories)
Tabs.Performance:CreateToggle(PerfSection, "Gray Skybox", false, setGraySky)
Tabs.Performance:CreateButton(PerfSection, "Remove Weapon Displays", function()
    local wd = Workspace:FindFirstChild("WeaponDisplays")
    if wd then wd:Destroy() end
end)

-- Skybox Tab
local SkySection = Tabs.Skybox:CreateSection("Skybox Presets")
Tabs.Skybox:CreateDropdown(SkySection, "Select Skybox", skyKeys, skyKeys[1], function(selected)
    selectedSkybox = selected
end)
Tabs.Skybox:CreateButton(SkySection, "Apply Skybox", function()
    if selectedSkybox and skyboxPresets[selectedSkybox] then
        skyboxPresets[selectedSkybox]()
        print("[BetterODH] Applied:", selectedSkybox)
    end
end)
Tabs.Skybox:CreateLabel(SkySection, "Credits: not_.gato (@HeyyCaf)")

-- Sound Tab
local SoundSection = Tabs.Sound:CreateSection("Gun Sound Changer")
Tabs.Sound:CreateToggle(SoundSection, "Enable Custom Sound", false, function(on)
    customEnabled = on
    if on then applySounds() end
end)

local soundNames = {}
for _, data in ipairs(sounds) do
    local name = string.match(data, "(.-)|%d+")
    table.insert(soundNames, name)
end

Tabs.Sound:CreateDropdown(SoundSection, "Select Sound", soundNames, "Default", function(selected)
    for _, data in ipairs(sounds) do
        local name, id = string.match(data, "(.-)|(%d+)")
        if name == selected then
            selectedSoundId = "rbxassetid://" .. id
            break
        end
    end
    if customEnabled then applySounds() end
end)

Tabs.Sound:CreateInput(SoundSection, "Custom Sound ID", "Enter Sound ID (e.g. 10209803)", function(text)
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

-- Privacy Tab
local PrivacySection = Tabs.Privacy:CreateSection("Privacy")
Tabs.Privacy:CreateButton(PrivacySection, "Hide My Username", function()
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

Tabs.Privacy:CreateToggle(PrivacySection, "Hide My Avatar", false, function(on)
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

-- ==================== LOOPS ====================
-- Rainbow Outline
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

-- Wide Screen
RunService.RenderStepped:Connect(function()
    if wideScreenEnabled then
        Camera.CFrame = Camera.CFrame * CFrame.new(0,0,0,1,0,0,0,wideScreenStrength,0,0,0,1)
    end
end)

-- Motion Blur
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

print("[BetterODH] Loaded! Open via Rayfield menu.")