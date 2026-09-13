-- ==========================================
-- LOSTFRONT HUB | Переписано под WindUI
-- ==========================================

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/main.lua"))()

-- ==========================================
-- 1. СЕРВИСЫ И ПЕРЕМЕННЫЕ
-- ==========================================
local Players            = game:GetService("Players")
local TweenService       = game:GetService("TweenService")
local RunService         = game:GetService("RunService")
local UserInputService   = game:GetService("UserInputService")
local Workspace          = game:GetService("Workspace")
local GuiService         = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer
local Mouse       = LocalPlayer:GetMouse()
local playerGui   = LocalPlayer:WaitForChild("PlayerGui")

-- ==========================================
-- 2. КОНФИГУРАЦИЯ (Все настройки тут)
-- ==========================================
local Config = {
    ESP_Enabled = false,
    ESP_Boxes = false,
    ESP_Names = false,
    ESP_Distance = false,
    ESP_Skeleton = false,
    ESP_Health = false,
    ESP_TeamCheck = false,
    ESP_MaxDist = 2000,
    ESP_AimDir = false,
    ESP_LookingAtYou = false,
    ESP_Tracers = false,
    ESP_FPV = false,

    RADAR_Enabled = false,
    RADAR_Size = 120,

    AIM_Enabled = false,
    AIM_FOV = 150,
    AIM_Smooth = 15,
    AIM_ShowFOV = false,
    AIM_TeamCheck = false,
    AIM_FPV = false,
    AIM_NoRecoil = false,
    AIM_HeadScale = 2,

    DESYNC_Enabled = false,
    DESYNC_Amount = 2,

    TRIGGER_Enabled = false,
    TRIGGER_Delay = 50,
    TRIGGER_TeamCheck = false,

    ToggleKey = Enum.KeyCode.Insert,
}

local Tuning = {
    TargetRefreshRate = 0.3,
    VisibilityRefreshRate = 0.2,
    FPVRefreshRate = 2.0,
    BoxWidthRatio = 0.6,
    AimLineLength = 15,
    LookingThreshold = 0.85,
    FPVClusterDist = 100,
    RadarRange = 150,
    RadarDotSize = 6,
    TriggerRadius = 50
}

local Palette = {
    Enemy = Color3.fromRGB(255, 50, 50),
    Team = Color3.fromRGB(0, 150, 255),
    Skeleton = Color3.fromRGB(255, 255, 255),
    LookingAtYou = Color3.fromRGB(255, 255, 0),
    AimDir = Color3.fromRGB(255, 150, 0),
    FPV = Color3.fromRGB(255, 0, 255),
    Tracer = Color3.fromRGB(255, 100, 100),
    HealthHigh = Color3.fromRGB(0, 255, 0),
    HealthMid = Color3.fromRGB(255, 255, 0),
    HealthLow = Color3.fromRGB(255, 0, 0),
    HealthBg = Color3.fromRGB(40, 40, 40),
    RadarBg = Color3.fromRGB(20, 20, 20),
    RadarBorder = Color3.fromRGB(0, 188, 168),
    RadarYou = Color3.fromRGB(0, 255, 0),
    RadarEnemy = Color3.fromRGB(255, 50, 50),
    FOV_Circle = Color3.fromRGB(255, 255, 255),
    FOV_Active = Color3.fromRGB(0, 188, 168)
}

-- ==========================================
-- 3. КЭШ И СОСТОЯНИЕ
-- ==========================================
local Timers = { lastTargetRefresh = 0, lastVisRefresh = 0, lastFPVRefresh = 0 }
local Cache = { targets = {}, humanoids = {}, teamStatus = {}, visibility = {}, lookingAtYou = {}, drones = {}, names = {}, myRoot = nil }
local Bones = {{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}
local Unloaded = false

-- ==========================================
-- 4. ВСПОМОГАТЕЛЬНЫЕ МОДУЛИ
-- ==========================================
local Team = {}
function Team.isTeammate(char)
    if not LocalPlayer.Character or not char or not char.Parent then return false end
    return LocalPlayer.Character.Parent == char.Parent
end

function Team.isSpectator(char)
    if not char or not char.Parent then return true end
    local parentName = char.Parent.Name:lower()
    return parentName:find("spectator") or parentName:find("dead") or parentName:find("observer")
end

local Util = {}
function Util.isVisible(character)
    if not character then return false end
    local cam = Workspace.CurrentCamera
    if not cam then return false end

    local origin = cam.CFrame.Position
    local parts = {"Head", "Torso", "HumanoidRootPart"}
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    local filter = {cam}
    if LocalPlayer.Character then table.insert(filter, LocalPlayer.Character) end
    table.insert(filter, character)
    rayParams.FilterDescendantsInstances = filter

    for _, partName in pairs(parts) do
        local part = character:FindFirstChild(partName)
        if part then
            local dir = (part.Position - origin)
            local result = Workspace:Raycast(origin, dir.Unit * dir.Magnitude, rayParams)
            if not result or (result.Position - part.Position).Magnitude < 5 then
                return true
            end
        end
    end
    return false
end

function Util.isLookingAtYou(char)
    if not LocalPlayer.Character then return false end
    local myHead = LocalPlayer.Character:FindFirstChild("Head")
    local head = char:FindFirstChild("Head")
    if not myHead or not head then return false end
    local toYou = (myHead.Position - head.Position).Unit
    return toYou:Dot(head.CFrame.LookVector) > Tuning.LookingThreshold
end

function Util.getName(char)
    if Cache.names[char] then return Cache.names[char] end
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character == char then
            Cache.names[char] = p.Name
            return p.Name
        end
    end
    local name = (not char.Name:match("^[Il]+")) and char.Name or "Player"
    Cache.names[char] = name
    return name
end

local Targets = {}
function Targets.refresh()
    local new, newTeam, newNames, newHum = {}, {}, {}, {}
    local myChar = LocalPlayer.Character
    Cache.myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local char = plr.Character
            if Team.isSpectator(char) then continue end
            local root = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")
            if root and hum and hum.Health > 0 and root.Position.Y > -50 then
                new[root] = char
                newHum[root] = hum
                newTeam[root] = Team.isTeammate(char)
                if Cache.names[char] then newNames[char] = Cache.names[char] end
            end
        end
    end

    Cache.targets = new
    Cache.humanoids = newHum
    Cache.teamStatus = newTeam
    Cache.names = newNames
end

function Targets.refreshVisibility()
    local count = 0
    for root, char in pairs(Cache.targets) do
        count = count + 1
        if count > 20 then
            Cache.visibility[root] = false
            Cache.lookingAtYou[root] = false
        else
            local vis = Util.isVisible(char)
            Cache.visibility[root] = vis
            Cache.lookingAtYou[root] = vis and Util.isLookingAtYou(char) or false
        end
    end
end

-- ==========================================
-- 5. ESP СИСТЕМА
-- ==========================================
local ESP = { cache = {} }

local function DrawLine(frame, x1, y1, x2, y2, color, thickness)
    thickness = thickness or 1
    local dx = x2 - x1
    local dy = y2 - y1
    local length = math.sqrt(dx * dx + dy * dy)
    if length < 1 then
        frame.Visible = false
        return
    end
    local cx = (x1 + x2) / 2
    local cy = (y1 + y2) / 2
    local angle = math.atan2(dy, dx) * (180 / math.pi)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.new(0, cx, 0, cy)
    frame.Size = UDim2.new(0, length, 0, thickness)
    frame.Rotation = angle
    if color then frame.BackgroundColor3 = color end
    frame.Visible = true
end

function ESP.Create(root)
    if ESP.cache[root] then return end

    local box = Instance.new("Frame")
    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.Visible = false
    box.Parent = playerGui -- Will be moved to protected GUI
    local boxStroke = Instance.new("UIStroke")
    boxStroke.Thickness = 1
    boxStroke.Parent = box

    local name = Instance.new("TextLabel")
    name.BackgroundTransparency = 1
    name.Font = Enum.Font.RobotoMono
    name.TextSize = 13
    name.TextColor3 = Color3.new(1, 1, 1)
    name.TextStrokeTransparency = 0
    name.Size = UDim2.new(0, 200, 0, 16)
    name.TextXAlignment = Enum.TextXAlignment.Center
    name.Visible = false
    name.Parent = playerGui

    local dist = Instance.new("TextLabel")
    dist.BackgroundTransparency = 1
    dist.Font = Enum.Font.RobotoMono
    dist.TextSize = 11
    dist.TextColor3 = Color3.fromRGB(180, 180, 180)
    dist.TextStrokeTransparency = 0
    dist.Size = UDim2.new(0, 200, 0, 14)
    dist.TextXAlignment = Enum.TextXAlignment.Center
    dist.Visible = false
    dist.Parent = playerGui

    local healthBg = Instance.new("Frame")
    healthBg.BackgroundColor3 = Palette.HealthBg
    healthBg.BorderSizePixel = 0
    healthBg.Visible = false
    healthBg.Parent = playerGui

    local healthBar = Instance.new("Frame")
    healthBar.BackgroundColor3 = Palette.HealthHigh
    healthBar.BorderSizePixel = 0
    healthBar.Visible = false
    healthBar.Parent = playerGui

    local skel = {}
    for i = 1, 5 do
        local line = Instance.new("Frame")
        line.BackgroundColor3 = Palette.Skeleton
        line.BorderSizePixel = 0
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.Visible = false
        line.Parent = playerGui
        skel[i] = line
    end

    local aimLine = Instance.new("Frame")
    aimLine.BackgroundColor3 = Palette.AimDir
    aimLine.BorderSizePixel = 0
    aimLine.AnchorPoint = Vector2.new(0.5, 0.5)
    aimLine.Visible = false
    aimLine.Parent = playerGui

    local lookingText = Instance.new("TextLabel")
    lookingText.BackgroundTransparency = 1
    lookingText.Font = Enum.Font.RobotoMono
    lookingText.TextSize = 13
    lookingText.TextColor3 = Palette.LookingAtYou
    lookingText.TextStrokeTransparency = 0
    lookingText.Text = "[!] LOOKING"
    lookingText.Size = UDim2.new(0, 150, 0, 16)
    lookingText.TextXAlignment = Enum.TextXAlignment.Center
    lookingText.Visible = false
    lookingText.Parent = playerGui

    local tracer = Instance.new("Frame")
    tracer.BackgroundColor3 = Palette.Tracer
    tracer.BorderSizePixel = 0
    tracer.AnchorPoint = Vector2.new(0.5, 0.5)
    tracer.Visible = false
    tracer.Parent = playerGui

    ESP.cache[root] = {
        Box = box, BoxStroke = boxStroke, Name = name, Dist = dist,
        HealthBg = healthBg, HealthBar = healthBar, Skel = skel,
        AimLine = aimLine, LookingText = lookingText, Tracer = tracer
    }
end

function ESP.Hide(esp)
    if not esp then return end
    esp.Box.Visible = false
    esp.Name.Visible = false
    esp.Dist.Visible = false
    esp.HealthBg.Visible = false
    esp.HealthBar.Visible = false
    for _, l in ipairs(esp.Skel) do l.Visible = false end
    esp.AimLine.Visible = false
    esp.LookingText.Visible = false
    esp.Tracer.Visible = false
end

function ESP.Destroy(esp)
    if not esp then return end
    pcall(function() esp.Box:Destroy() end)
    pcall(function() esp.Name:Destroy() end)
    pcall(function() esp.Dist:Destroy() end)
    pcall(function() esp.HealthBg:Destroy() end)
    pcall(function() esp.HealthBar:Destroy() end)
    for _, l in ipairs(esp.Skel) do pcall(function() l:Destroy() end) end
    pcall(function() esp.AimLine:Destroy() end)
    pcall(function() esp.LookingText:Destroy() end)
    pcall(function() esp.Tracer:Destroy() end)
end

function ESP.HideAll()
    for _, esp in pairs(ESP.cache) do ESP.Hide(esp) end
end

function ESP.Cleanup()
    local toRemove = {}
    for root, esp in pairs(ESP.cache) do
        if not Cache.targets[root] then
            ESP.Hide(esp)
            ESP.Destroy(esp)
            toRemove[#toRemove + 1] = root
        end
    end
    for _, root in ipairs(toRemove) do ESP.cache[root] = nil end
end

function ESP.Render(esp, root, char, hum, cam, screenSize, screenCenter, dist)
    local head = char:FindFirstChild("Head")
    local headPos = head and head.Position or (root.Position + Vector3.new(0, 2, 0))
    local feetPos = root.Position - Vector3.new(0, 3, 0)
    local topPos = headPos + Vector3.new(0, 0.5, 0)

    local rs, ron = cam:WorldToViewportPoint(root.Position)
    local hs = cam:WorldToViewportPoint(topPos)
    local fs = cam:WorldToViewportPoint(feetPos)

    local onScreen = ron and rs.Z > 0
    local isTeam = Cache.teamStatus[root] or false
    local lookingAtYou = Cache.lookingAtYou[root] or false

    local col = isTeam and Palette.Team or (_G.RainbowColor or Palette.Enemy)
    local skelCol = isTeam and Palette.Team or (_G.RainbowColor or Palette.Skeleton)

    if onScreen then
        local boxTop, boxBottom = hs.Y, fs.Y
        local boxHeight = math.abs(boxBottom - boxTop)
        local boxWidth = boxHeight * Tuning.BoxWidthRatio
        local cx = rs.X

        if Config.ESP_Boxes then
            esp.Box.Position = UDim2.new(0, cx - boxWidth/2, 0, boxTop)
            esp.Box.Size = UDim2.new(0, boxWidth, 0, boxHeight)
            esp.BoxStroke.Color = col
            esp.Box.Visible = true
        else
            esp.Box.Visible = false
        end

        if Config.ESP_Names or Config.ESP_Distance then
            local infoString = ""
            if Config.ESP_Names then infoString = infoString .. Util.getName(char):lower() end
            if Config.ESP_Distance then infoString = infoString .. " [" .. math.floor(dist) .. "m]" end

            esp.Name.Text = infoString
            esp.Name.Font = Enum.Font.GothamBold
            esp.Name.TextSize = 11
            esp.Name.Position = UDim2.new(0, cx - 100, 0, hs.Y - 16)
            esp.Name.TextColor3 = col
            esp.Name.TextStrokeTransparency = 0.3
            esp.Name.Visible = true
        else
            esp.Name.Visible = false
        end

        esp.Dist.Visible = false

        if Config.ESP_Health then
            local pct = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
            local barX = cx - boxWidth/2 - 5

            esp.HealthBg.Position = UDim2.new(0, barX, 0, boxTop)
            esp.HealthBg.Size = UDim2.new(0, 2, 0, boxHeight)
            esp.HealthBg.Visible = true

            local hh = boxHeight * pct
            esp.HealthBar.Position = UDim2.new(0, barX, 0, boxBottom - hh)
            esp.HealthBar.Size = UDim2.new(0, 2, 0, hh)
            esp.HealthBar.BackgroundColor3 = pct > 0.6 and Palette.HealthHigh or pct > 0.3 and Palette.HealthMid or Palette.HealthLow
            esp.HealthBar.Visible = true
        else
            esp.HealthBg.Visible = false
            esp.HealthBar.Visible = false
        end

        if Config.ESP_Skeleton then
            for i, b in ipairs(Bones) do
                local p1, p2 = char:FindFirstChild(b[1]), char:FindFirstChild(b[2])
                if p1 and p2 then
                    local s1, o1 = cam:WorldToViewportPoint(p1.Position)
                    local s2, o2 = cam:WorldToViewportPoint(p2.Position)
                    if o1 and o2 and s1.Z > 0 and s2.Z > 0 then
                        DrawLine(esp.Skel[i], s1.X, s1.Y, s2.X, s2.Y, skelCol, 1)
                    else
                        esp.Skel[i].Visible = false
                    end
                else
                    esp.Skel[i].Visible = false
                end
            end
        else
            for _, l in ipairs(esp.Skel) do l.Visible = false end
        end

        if Config.ESP_AimDir and head then
            local aimEnd = head.Position + head.CFrame.LookVector * Tuning.AimLineLength
            local headScreen, headOn = cam:WorldToViewportPoint(head.Position)
            local aimScreen, aimOn = cam:WorldToViewportPoint(aimEnd)
            if headOn and aimOn and headScreen.Z > 0 and aimScreen.Z > 0 then
                DrawLine(esp.AimLine, headScreen.X, headScreen.Y, aimScreen.X, aimScreen.Y, Palette.AimDir, 1)
            else
                esp.AimLine.Visible = false
            end
        else
            esp.AimLine.Visible = false
        end

        if Config.ESP_LookingAtYou and lookingAtYou then
            esp.LookingText.Font = Enum.Font.GothamBold
            esp.LookingText.TextSize = 10
            esp.LookingText.Position = UDim2.new(0, cx - 75, 0, hs.Y - 28)
            esp.LookingText.Visible = true
        else
            esp.LookingText.Visible = false
        end

        if Config.ESP_Tracers then
            DrawLine(esp.Tracer, screenCenter.X, screenSize.Y, cx, fs.Y, col, 1)
        else
            esp.Tracer.Visible = false
        end
    else
        ESP.Hide(esp)
    end
end

function ESP.Step(cam, screenSize, screenCenter)
    if not Config.ESP_Enabled then
        ESP.HideAll()
        return
    end

    ESP.Cleanup()

    local myRoot = Cache.myRoot
    for root, char in pairs(Cache.targets) do
        if not root or not root.Parent or not char then
            if ESP.cache[root] then ESP.Hide(ESP.cache[root]) end
        else
            local hum = Cache.humanoids[root]
            if not hum or not hum.Parent or hum.Health <= 0 then
                if ESP.cache[root] then ESP.Hide(ESP.cache[root]) end
            elseif Config.ESP_TeamCheck and Cache.teamStatus[root] then
                if ESP.cache[root] then ESP.Hide(ESP.cache[root]) end
            else
                if not ESP.cache[root] then ESP.Create(root) end
                local esp = ESP.cache[root]
                local dist = myRoot and (root.Position - myRoot.Position).Magnitude or 0

                if dist > Config.ESP_MaxDist then
                    ESP.Hide(esp)
                else
                    ESP.Render(esp, root, char, hum, cam, screenSize, screenCenter, dist)
                end
            end
        end
    end
end

-- ==========================================
-- 6. FPV СИСТЕМА
-- ==========================================
local FPV = {
    cache = {},
    partNames = {"Blade_BL", "Blade_BR", "Blade_FL", "Blade_FR", "Explosive", "Explosive1", "Rotator_BL", "Rotator_BR", "Rotator_FL", "Rotator_FR", "FPV"}
}

local fpvNameSet = {}
for _, n in ipairs(FPV.partNames) do fpvNameSet[n] = true end

function FPV.Create(drone)
    if FPV.cache[drone] then return end

    local box = Instance.new("Frame")
    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.Visible = false
    box.Parent = playerGui
    local boxStroke = Instance.new("UIStroke")
    boxStroke.Thickness = 2
    boxStroke.Color = Palette.FPV
    boxStroke.Parent = box

    local name = Instance.new("TextLabel")
    name.BackgroundTransparency = 1
    name.Font = Enum.Font.RobotoMono
    name.TextSize = 13
    name.TextColor3 = Palette.FPV
    name.TextStrokeTransparency = 0
    name.Text = "[FPV DRONE]"
    name.Size = UDim2.new(0, 150, 0, 16)
    name.TextXAlignment = Enum.TextXAlignment.Center
    name.Visible = false
    name.Parent = playerGui

    local dist = Instance.new("TextLabel")
    dist.BackgroundTransparency = 1
    dist.Font = Enum.Font.RobotoMono
    dist.TextSize = 11
    dist.TextColor3 = Palette.FPV
    dist.TextStrokeTransparency = 0
    dist.Size = UDim2.new(0, 100, 0, 14)
    dist.TextXAlignment = Enum.TextXAlignment.Center
    dist.Visible = false
    dist.Parent = playerGui

    FPV.cache[drone] = {Box = box, BoxStroke = boxStroke, Name = name, Dist = dist}
end

function FPV.Hide(esp)
    if not esp then return end
    esp.Box.Visible = false
    esp.Name.Visible = false
    esp.Dist.Visible = false
end

function FPV.Destroy(esp)
    if not esp then return end
    pcall(function() esp.Box:Destroy() end)
    pcall(function() esp.Name:Destroy() end)
    pcall(function() esp.Dist:Destroy() end)
end

function FPV.Scan()
    if not Config.ESP_FPV then return Cache.drones or {} end
    local drones, seen, count = {}, {}, 0
    local camRef = Workspace.CurrentCamera
    local plrs = Players:GetPlayers()

    for _, obj in ipairs(Workspace:GetDescendants()) do
        if count >= 10 then break end
        if obj:IsA("BasePart") and fpvNameSet[obj.Name] then
            local model = obj.Parent
            if model and model:IsA("Model") and not seen[model] then
                local skip = false
                if camRef and model:IsDescendantOf(camRef) then skip = true end
                if not skip then
                    for i = 1, #plrs do
                        if plrs[i].Character and model:IsDescendantOf(plrs[i].Character) then skip = true; break end
                    end
                end
                if not skip then
                    seen[model] = true
                    local center = model:FindFirstChild("Explosive") or model:FindFirstChild("FPV") or obj
                    drones[model] = center
                    count = count + 1
                end
            end
        end
    end
    return drones
end

function FPV.Step(cam)
    if not Config.ESP_Enabled or not Config.ESP_FPV then
        for _, esp in pairs(FPV.cache) do FPV.Hide(esp) end
        return
    end

    local screenPos, toShow = {}, {}
    for drone, part in pairs(Cache.drones) do
        local sp, on = cam:WorldToViewportPoint(part.Position)
        if on and sp.Z > 0 then
            local tooClose = false
            for _, ex in pairs(screenPos) do
                if math.sqrt((sp.X - ex.X)^2 + (sp.Y - ex.Y)^2) < Tuning.FPVClusterDist then
                    tooClose = true
                    break
                end
            end
            if not tooClose then
                screenPos[drone] = sp
                toShow[drone] = part
            end
        end
    end

    for drone, esp in pairs(FPV.cache) do
        if not toShow[drone] then FPV.Hide(esp); FPV.Destroy(esp); FPV.cache[drone] = nil end
    end

    local myRoot = Cache.myRoot
    local activeRGB = _G.RainbowColor or Palette.FPV

    for drone, part in pairs(toShow) do
        if not FPV.cache[drone] then FPV.Create(drone) end
        local esp = FPV.cache[drone]
        local sp = screenPos[drone]
        local dist = myRoot and (part.Position - myRoot.Position).Magnitude or 0

        if dist < Config.ESP_MaxDist then
            local size = math.clamp(1000 / sp.Z, 20, 100)
            esp.Box.Position = UDim2.new(0, sp.X - size/2, 0, sp.Y - size/2)
            esp.Box.Size = UDim2.new(0, size, 0, size)
            esp.BoxStroke.Color = activeRGB
            esp.Box.Visible = true

            esp.Name.Position = UDim2.new(0, sp.X - 75, 0, sp.Y - size/2 - 18)
            esp.Name.TextColor3 = activeRGB
            esp.Name.Font = Enum.Font.GothamBold
            esp.Name.Visible = true

            esp.Dist.Position = UDim2.new(0, sp.X - 50, 0, sp.Y + size/2 + 4)
            esp.Dist.Text = math.floor(dist) .. "m"
            esp.Dist.TextColor3 = activeRGB
            esp.Dist.Font = Enum.Font.Code
            esp.Dist.Visible = true
        else
            FPV.Hide(esp)
        end
    end
end

-- ==========================================
-- 7. RADAR СИСТЕМА
-- ==========================================
local radarDots = {}
local RadarFrame = Instance.new("Frame")
RadarFrame.Name = "Radar"
RadarFrame.BackgroundColor3 = Palette.RadarBg
RadarFrame.BackgroundTransparency = 0.15
RadarFrame.BorderSizePixel = 0
RadarFrame.AnchorPoint = Vector2.new(1, 0)
RadarFrame.Parent = playerGui

local RadarStroke = Instance.new("UIStroke")
RadarStroke.Color = Palette.RadarBorder
RadarStroke.Thickness = 2
RadarStroke.Parent = RadarFrame

local RadarCross1 = Instance.new("Frame")
RadarCross1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RadarCross1.BorderSizePixel = 0
RadarCross1.AnchorPoint = Vector2.new(0.5, 0)
RadarCross1.Parent = RadarFrame

local RadarCross2 = Instance.new("Frame")
RadarCross2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RadarCross2.BorderSizePixel = 0
RadarCross2.AnchorPoint = Vector2.new(0, 0.5)
RadarCross2.Parent = RadarFrame

local RadarCenter = Instance.new("Frame")
RadarCenter.BackgroundColor3 = Palette.RadarYou
RadarCenter.BorderSizePixel = 0
RadarCenter.AnchorPoint = Vector2.new(0.5, 0.5)
RadarCenter.Size = UDim2.new(0, 8, 0, 8)
RadarCenter.Parent = RadarFrame

for i = 1, 50 do
    local dot = Instance.new("Frame")
    dot.BackgroundColor3 = Palette.RadarEnemy
    dot.BorderSizePixel = 0
    dot.AnchorPoint = Vector2.new(0.5, 0.5)
    dot.Size = UDim2.new(0, Tuning.RadarDotSize, 0, Tuning.RadarDotSize)
    dot.Visible = false
    dot.Parent = RadarFrame
    radarDots[i] = dot
end

local fpvRadarDots = {}
for i = 1, 10 do
    local dot = Instance.new("Frame")
    dot.BackgroundColor3 = Palette.FPV
    dot.BorderSizePixel = 0
    dot.AnchorPoint = Vector2.new(0.5, 0.5)
    dot.Size = UDim2.new(0, 8, 0, 8)
    dot.Visible = false
    dot.Parent = RadarFrame
    fpvRadarDots[i] = dot
end

local function UpdateRadar(cam)
    if not Config.RADAR_Enabled then
        RadarFrame.Visible = false
        return
    end

    local myRoot = Cache.myRoot
    if not myRoot or not myRoot.Parent then
        RadarFrame.Visible = false
        return
    end

    local size = Config.RADAR_Size
    RadarFrame.Position = UDim2.new(1, -10, 0, 10)
    RadarFrame.Size = UDim2.new(0, size, 0, size)
    RadarFrame.Visible = true
    RadarCross1.Position = UDim2.new(0.5, 0, 0, 10)
    RadarCross1.Size = UDim2.new(0, 1, 1, -20)
    RadarCross2.Position = UDim2.new(0, 10, 0.5, 0)
    RadarCross2.Size = UDim2.new(1, -20, 0, 1)
    RadarCenter.Position = UDim2.new(0.5, 0, 0.5, 0)

    local myLook = cam.CFrame.LookVector
    local myAngle = math.atan2(-myLook.X, -myLook.Z)
    local cosA, sinA = math.cos(myAngle), math.sin(myAngle)
    local scale = (size/2 - 10) / Tuning.RadarRange

    local idx = 1
    for root, char in pairs(Cache.targets) do
        if idx > #radarDots then break end
        if root and root.Parent then
            local isTeam = Cache.teamStatus[root]
            if not (Config.ESP_TeamCheck and isTeam) then
                local rx, rz = root.Position.X - myRoot.Position.X, root.Position.Z - myRoot.Position.Z
                local dist2D = math.sqrt(rx^2 + rz^2)
                if dist2D < Tuning.RadarRange then
                    local rotX = rx * cosA - rz * sinA
                    local rotZ = rx * sinA + rz * cosA
                    local radarX, radarY = rotX * scale, rotZ * scale
                    local maxD = size/2 - 8
                    local rDist = math.sqrt(radarX^2 + radarY^2)
                    if rDist > maxD then radarX, radarY = radarX/rDist*maxD, radarY/rDist*maxD end

                    radarDots[idx].Position = UDim2.new(0.5, radarX, 0.5, radarY)
                    radarDots[idx].BackgroundColor3 = isTeam and Palette.Team or Palette.RadarEnemy
                    radarDots[idx].Visible = true
                    idx = idx + 1
                end
            end
        end
    end
    for i = idx, #radarDots do radarDots[i].Visible = false end

    local fpvIdx = 1
    if Config.ESP_FPV then
        for _, part in pairs(Cache.drones) do
            if fpvIdx > #fpvRadarDots then break end
            local rx, rz = part.Position.X - myRoot.Position.X, part.Position.Z - myRoot.Position.Z
            local dist2D = math.sqrt(rx^2 + rz^2)
            if dist2D < Tuning.RadarRange then
                local rotX = rx * cosA - rz * sinA
                local rotZ = rx * sinA + rz * cosA
                local radarX, radarY = rotX * scale, rotZ * scale
                local maxD = size/2 - 8
                local rDist = math.sqrt(radarX^2 + radarY^2)
                if rDist > maxD then radarX, radarY = radarX/rDist*maxD, radarY/rDist*maxD end
                fpvRadarDots[fpvIdx].Position = UDim2.new(0.5, radarX, 0.5, radarY)
                fpvRadarDots[fpvIdx].Visible = true
                fpvIdx = fpvIdx + 1
            end
        end
    end
    for i = fpvIdx, #fpvRadarDots do fpvRadarDots[i].Visible = false end
end

-- ==========================================
-- 8. AIMBOT СИСТЕМА
-- ==========================================
local FOVCircle = Instance.new("Frame")
FOVCircle.BackgroundTransparency = 1
FOVCircle.BorderSizePixel = 0
FOVCircle.AnchorPoint = Vector2.new(0.5, 0.5)
FOVCircle.Parent = playerGui
local FOVStroke = Instance.new("UIStroke")
FOVStroke.Color = Palette.FOV_Circle
FOVStroke.Thickness = 1
FOVStroke.Parent = FOVCircle

local Aimbot = { aiming = false, locked = nil, lockedFPV = false }

Mouse.Button2Down:Connect(function() Aimbot.aiming = true; Aimbot.locked = nil; Aimbot.lockedFPV = false end)
Mouse.Button2Up:Connect(function() Aimbot.aiming = false; Aimbot.locked = nil; Aimbot.lockedFPV = false end)

function Aimbot.GetBest(cam)
    local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    local best, bestDist, isFPV = nil, math.huge, false

    for root, char in pairs(Cache.targets) do
        if root and root.Parent and char then
            if not (Config.AIM_TeamCheck and Cache.teamStatus[root]) then
                local head = char:FindFirstChild("Head")
                if head then
                    local sp, on = cam:WorldToViewportPoint(head.Position)
                    if on and sp.Z > 0 then
                        local sDist = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                        if sDist <= Config.AIM_FOV then
                            local wDist = (root.Position - myRoot.Position).Magnitude
                            if wDist < bestDist then bestDist = wDist; best = char; isFPV = false end
                        end
                    end
                end
            end
        end
    end

    if Config.AIM_FPV then
        for drone, part in pairs(Cache.drones) do
            if drone and part and part.Parent then
                local sp, on = cam:WorldToViewportPoint(part.Position)
                if on and sp.Z > 0 then
                    local sDist = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                    if sDist <= Config.AIM_FOV then
                        local wDist = (part.Position - myRoot.Position).Magnitude
                        if wDist < bestDist then bestDist = wDist; best = drone; isFPV = true end
                    end
                end
            end
        end
    end
    return best, isFPV
end

function Aimbot.Step(cam, screenCenter)
    local guiInset = GuiService:GetGuiInset()
    if Config.AIM_Enabled and Config.AIM_ShowFOV then
        FOVCircle.Position = UDim2.new(0, screenCenter.X, 0, screenCenter.Y + guiInset.Y)
        FOVCircle.Size = UDim2.new(0, Config.AIM_FOV * 2, 0, Config.AIM_FOV * 2)
        FOVStroke.Color = (Aimbot.aiming and Aimbot.locked) and Palette.FOV_Active or Palette.FOV_Circle
        FOVCircle.Visible = true
    else
        FOVCircle.Visible = false
    end
end

RunService:BindToRenderStep("AimbotCore", Enum.RenderPriority.Camera.Value + 1, function()
    if Unloaded or not Config.AIM_Enabled then return end
    local rmb = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    if not (Aimbot.aiming or rmb) then Aimbot.locked = nil; Aimbot.lockedFPV = false; return end

    local cam = Workspace.CurrentCamera
    if not cam then return end

    local needNewTarget = not Aimbot.locked or not Aimbot.locked.Parent
    if not needNewTarget and not Aimbot.lockedFPV then
        needNewTarget = not Aimbot.locked:FindFirstChild("Head")
    end
    if needNewTarget then
        local target, isFPV = Aimbot.GetBest(cam)
        Aimbot.locked = target
        Aimbot.lockedFPV = isFPV or false
    end
    if not Aimbot.locked then return end

    local aimPos
    if Aimbot.lockedFPV then
        local part = Cache.drones[Aimbot.locked]
        if not part or not part.Parent then Aimbot.locked = nil; Aimbot.lockedFPV = false; return end
        aimPos = part.Position
    else
        local head = Aimbot.locked:FindFirstChild("Head")
        local hum = Aimbot.locked:FindFirstChild("Humanoid")
        if not head or not hum or hum.Health <= 0 then Aimbot.locked = nil; return end
        aimPos = head.Position
    end

    local goal = CFrame.lookAt(cam.CFrame.Position, aimPos)
    local newCF
    if Config.AIM_Smooth <= 0 then
        newCF = goal
    else
        local alpha = math.clamp(0.9 - (Config.AIM_Smooth/100)*0.8, 0.1, 0.9)
        newCF = cam.CFrame:Lerp(goal, alpha)
    end
    cam.CFrame = newCF

    pcall(function()
        local vm = cam:FindFirstChild("ViewModel")
        if vm then
            local cb = vm:FindFirstChild("CameraBone")
            if cb then cb.CFrame = newCF end
            local hrp = vm:FindFirstChild("HRP")
            if hrp then hrp.CFrame = newCF end
        end
    end)

    pcall(function()
        local net = game.ReplicatedStorage:FindFirstChild("network")
        if net then
            local lv = net:FindFirstChild("characterLookvector")
            if lv then lv:FireServer(newCF.LookVector) end
        end
    end)
end)

-- ==========================================
-- 9. DESYNC СИСТЕМА
-- ==========================================
local Desync = { active = false }

function Desync.Run()
    Desync.active = true
    while Desync.active and Config.DESYNC_Enabled and not Unloaded do
        pcall(function()
            if not LocalPlayer.Character then return end
            local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local a = Config.DESYNC_Amount
            local cf = root.CFrame
            root.CFrame = cf * CFrame.new(math.random(-a,a)*0.1, 0, math.random(-a,a)*0.1)
            task.wait(0.01)
            root.CFrame = cf
        end)
        task.wait(0.1 + 0.3/math.max(Config.DESYNC_Amount, 1))
    end
    Desync.active = false
end

task.spawn(function()
    while not Unloaded do
        if Config.DESYNC_Enabled and not Desync.active then task.spawn(Desync.Run) end
        task.wait(0.5)
    end
end)

-- ==========================================
-- 10. TRIGGERBOT СИСТЕМА
-- ==========================================
local Trigger = { active = false, lastShot = 0 }

function Trigger.Check(cam)
    local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    for root, char in pairs(Cache.targets) do
        if root and char then
            if Config.TRIGGER_TeamCheck and Cache.teamStatus[root] then continue end
            local hum = char:FindFirstChild("Humanoid")
            if not hum or hum.Health <= 0 then continue end
            for _, pn in pairs({"Head", "Torso", "HumanoidRootPart"}) do
                local p = char:FindFirstChild(pn)
                if p then
                    local sp, on = cam:WorldToViewportPoint(p.Position)
                    if on and sp.Z > 0 and (Vector2.new(sp.X, sp.Y) - center).Magnitude < Tuning.TriggerRadius then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function Trigger.Shoot()
    pcall(function() if mouse1click then mouse1click() end end)
    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendMouseButtonEvent(0,0,0,true,game,1)
        task.wait(0.01)
        vim:SendMouseButtonEvent(0,0,0,false,game,1)
    end)
end

function Trigger.Run()
    Trigger.active = true
    while Config.TRIGGER_Enabled and not Unloaded do
        pcall(function()
            local cam = Workspace.CurrentCamera
            if cam and Trigger.Check(cam) then
                local now = tick() * 1000
                if now - Trigger.lastShot >= Config.TRIGGER_Delay then
                    Trigger.Shoot()
                    Trigger.lastShot = now
                end
            end
        end)
        task.wait(0.016)
    end
    Trigger.active = false
end

task.spawn(function()
    while not Unloaded do
        if Config.TRIGGER_Enabled and not Trigger.active then task.spawn(Trigger.Run) end
        task.wait(0.3)
    end
end)

-- ==========================================
-- 11. WINDUI ИНТЕРФЕЙС
-- ==========================================
local Window = WindUI:CreateWindow({
    Title = "LostFront Hub",
    Icon = "solar:ghost-bold",
    Author = "MunkeHub Port",
    Folder = "MunkeHub",
    Size = UDim2.fromOffset(580, 520),
    Theme = "Dark",
    ToggleKey = Enum.KeyCode.Insert,
})

-- Переносим UI-элементы ESP в защищенный GUI
local espGui = Instance.new("ScreenGui")
espGui.Name = "LostFrontESP"
espGui.ResetOnSpawn = false
espGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
espGui.DisplayOrder = 999
espGui.IgnoreGuiInset = true
pcall(function() espGui.Parent = game:GetService("CoreGui") end)
if not espGui.Parent then espGui.Parent = playerGui end

-- Переносим ESP элементы в защищенный GUI
for _, esp in pairs(ESP.cache) do
    esp.Box.Parent = espGui
    esp.Name.Parent = espGui
    esp.Dist.Parent = espGui
    esp.HealthBg.Parent = espGui
    esp.HealthBar.Parent = espGui
    for _, l in ipairs(esp.Skel) do l.Parent = espGui end
    esp.AimLine.Parent = espGui
    esp.LookingText.Parent = espGui
    esp.Tracer.Parent = espGui
end
RadarFrame.Parent = espGui
FOVCircle.Parent = espGui

-- Вкладки
local ESPTab = Window:Tab({ Title = "ESP", Icon = "solar:eye-bold" })
local AimTab = Window:Tab({ Title = "AIM", Icon = "solar:target-bold" })
local MiscTab = Window:Tab({ Title = "MISC", Icon = "solar:settings-bold" })

-- ESP Вкладка
local VisualsSection = ESPTab:Section({ Title = "Visuals" })

VisualsSection:Toggle({ Title = "Enable ESP", Value = false, Callback = function(s) Config.ESP_Enabled = s end })
VisualsSection:Toggle({ Title = "Boxes", Value = false, Callback = function(s) Config.ESP_Boxes = s end })
VisualsSection:Toggle({ Title = "Names", Value = false, Callback = function(s) Config.ESP_Names = s end })
VisualsSection:Toggle({ Title = "Distance", Value = false, Callback = function(s) Config.ESP_Distance = s end })
VisualsSection:Toggle({ Title = "Skeleton", Value = false, Callback = function(s) Config.ESP_Skeleton = s end })
VisualsSection:Toggle({ Title = "Health Bar", Value = false, Callback = function(s) Config.ESP_Health = s end })
VisualsSection:Toggle({ Title = "Aim Direction", Value = false, Callback = function(s) Config.ESP_AimDir = s end })
VisualsSection:Toggle({ Title = "Looking At You", Value = false, Callback = function(s) Config.ESP_LookingAtYou = s end })
VisualsSection:Toggle({ Title = "Tracers", Value = false, Callback = function(s) Config.ESP_Tracers = s end })
VisualsSection:Toggle({ Title = "FPV Drones", Value = false, Callback = function(s) Config.ESP_FPV = s end })
VisualsSection:Toggle({ Title = "Team Check", Value = false, Callback = function(s) Config.ESP_TeamCheck = s end })
VisualsSection:Slider({ Title = "Max Distance", Value = 2000, Min = 500, Max = 5000, Step = 100, Callback = function(v) Config.ESP_MaxDist = v end })

local RadarSection = ESPTab:Section({ Title = "Radar" })
RadarSection:Toggle({ Title = "Enable Radar", Value = false, Callback = function(s) Config.RADAR_Enabled = s end })
RadarSection:Slider({ Title = "Radar Size", Value = 120, Min = 80, Max = 200, Step = 10, Callback = function(v) Config.RADAR_Size = v end })

-- AIM Вкладка
local AimControlSection = AimTab:Section({ Title = "Aimbot Control" })
AimControlSection:Toggle({ Title = "Enable Aimbot", Value = false, Callback = function(s) Config.AIM_Enabled = s end })
AimControlSection:Slider({ Title = "FOV", Value = 150, Min = 50, Max = 500, Step = 25, Callback = function(v) Config.AIM_FOV = v end })
AimControlSection:Slider({ Title = "Smooth", Value = 15, Min = 0, Max = 100, Step = 5, Callback = function(v) Config.AIM_Smooth = v end })
AimControlSection:Toggle({ Title = "Show FOV", Value = false, Callback = function(s) Config.AIM_ShowFOV = s end })
AimControlSection:Toggle({ Title = "Team Check", Value = false, Callback = function(s) Config.AIM_TeamCheck = s end })
AimControlSection:Toggle({ Title = "Target FPV", Value = false, Callback = function(s) Config.AIM_FPV = s end })

local WeaponStabilitySection = AimTab:Section({ Title = "Weapon Stability" })
WeaponStabilitySection:Toggle({ Title = "No Recoil Engine", Value = false, Callback = function(s) Config.AIM_NoRecoil = s end })

local HitboxSection = AimTab:Section({ Title = "Hitbox Overrides" })
HitboxSection:Slider({ Title = "Head Hitbox Scale", Value = 2, Min = 2, Max = 15, Step = 1, Callback = function(v) Config.AIM_HeadScale = v end })

-- MISC Вкладка
local AntiAimSection = MiscTab:Section({ Title = "Anti-Aim Mods" })
AntiAimSection:Toggle({ Title = "Enable Desync", Value = false, Callback = function(s) Config.DESYNC_Enabled = s end })
AntiAimSection:Slider({ Title = "Strength", Value = 2, Min = 1, Max = 10, Step = 1, Callback = function(v) Config.DESYNC_Amount = v end })

local TriggerSection = MiscTab:Section({ Title = "Triggerbot" })
TriggerSection:Toggle({ Title = "Enable Trigger", Value = false, Callback = function(s) Config.TRIGGER_Enabled = s end })
TriggerSection:Slider({ Title = "Delay (ms)", Value = 50, Min = 0, Max = 200, Step = 10, Callback = function(v) Config.TRIGGER_Delay = v end })
TriggerSection:Toggle({ Title = "Team Check", Value = false, Callback = function(s) Config.TRIGGER_TeamCheck = s end })

local InterfaceSection = MiscTab:Section({ Title = "Interface Controls" })
InterfaceSection:Keybind({ Title = "Menu Keybind", Value = Enum.KeyCode.Insert, Callback = function(key) Config.ToggleKey = key end })

-- ==========================================
-- 12. ГЛАВНЫЙ ЦИКЛ РЕНДЕРИНГА
-- ==========================================
RunService.RenderStepped:Connect(function()
    if Unloaded then return end

    local cam = Workspace.CurrentCamera
    if not cam then return end

    -- No Recoil
    if Config.AIM_NoRecoil then
        pcall(function()
            local vm = cam:FindFirstChild("ViewModel")
            if vm then
                local sway = vm:FindFirstChild("Sway") or vm:FindFirstChild("Recoil")
                if sway and sway:IsA("BasePart") then sway.CFrame = CFrame.new(0,0,0) end
                local springs = vm:FindFirstChild("Springs")
                if springs then
                    for _, sp in ipairs(springs:GetChildren()) do
                        if sp:IsA("Vector3Value") or sp:IsA("NumberValue") then sp.Value = sp.Value * 0 end
                    end
                end
            end
        end)
    end

    -- Hitbox Expansion
    pcall(function()
        for root, char in pairs(Cache.targets) do
            if root and char and char.Parent then
                local head = char:FindFirstChild("Head")
                if head and head:IsA("BasePart") then
                    local targetSize = Vector3.new(Config.AIM_HeadScale, Config.AIM_HeadScale, Config.AIM_HeadScale)
                    if head.Size ~= targetSize then
                        head.Size = targetSize
                        head.CanCollide = false
                    end
                end
            end
        end
    end)

    local screenSize = cam.ViewportSize
    local screenCenter = Vector2.new(screenSize.X/2, screenSize.Y/2)
    local now = tick()

    -- Rainbow color update
    local speed = 2
    _G.RainbowColor = Color3.new(math.sin(now*speed)*0.5+0.5, math.sin(now*speed+2)*0.5+0.5, math.sin(now*speed+4)*0.5+0.5)

    -- Timers for cache refresh
    if now - Timers.lastTargetRefresh > Tuning.TargetRefreshRate then Timers.lastTargetRefresh = now; Targets.refresh() end
    if now - Timers.lastVisRefresh > Tuning.VisibilityRefreshRate then Timers.lastVisRefresh = now; Targets.refreshVisibility() end
    if now - Timers.lastFPVRefresh > Tuning.FPVRefreshRate then Timers.lastFPVRefresh = now; Cache.drones = FPV.Scan() end

    -- Renders
    pcall(function() ESP.Step(cam, screenSize, screenCenter) end)
    pcall(function() FPV.Step(cam) end)
    pcall(function() UpdateRadar(cam) end)
    pcall(function() Aimbot.Step(cam, screenCenter) end)
end)

-- ==========================================
-- 13. ВЫГРУЗКА
-- ==========================================
local function Unload()
    if Unloaded then return end
    Unloaded = true

    Config.DESYNC_Enabled = false
    Config.TRIGGER_Enabled = false

    pcall(function() RunService:UnbindFromRenderStep("AimbotCore") end)
    for _, esp in pairs(ESP.cache) do ESP.Destroy(esp) end
    for _, esp in pairs(FPV.cache) do FPV.Destroy(esp) end

    pcall(function() espGui:Destroy() end)
    pcall(function() WindUI:Destroy() end)
end

WindUI:Notify({
    Title = "LostFront Hub",
    Content = "Скрипт успешно загружен!",
    Duration = 5,
    Icon = "solar:check-circle-bold"
})