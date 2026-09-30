-- ============================================
-- FULL GAME DUMPER v5.0
-- Полный дамп всего, что доступно клиенту
-- Без фильтров, без категоризации, без отсечения
-- Работает на ПК и Android
-- ============================================

local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst   = game:GetService("ReplicatedFirst")
local Workspace         = game:GetService("Workspace")
local StarterGui        = game:GetService("StarterGui")
local StarterPack       = game:GetService("StarterPack")
local StarterPlayer     = game:GetService("StarterPlayer")
local Lighting          = game:GetService("Lighting")
local SoundService      = game:GetService("SoundService")
local Chat              = game:GetService("Chat")
local Teams             = game:GetService("Teams")
local RunService        = game:GetService("RunService")
local ContentProvider   = game:GetService("ContentProvider")

local LocalPlayer = Players.LocalPlayer

-- ============================================
-- ОПРЕДЕЛЕНИЕ ЭКЗЕКЬЮТОРА
-- ============================================

local writefile_    = writefile    or (syn and syn.write_file)
local appendfile_   = appendfile   or (syn and syn.append_file)
local makefolder_   = makefolder   or (syn and syn.make_folder)
local isfolder_     = isfolder     or (syn and syn.is_folder)
local listfiles_    = listfiles    or (syn and syn.list_files)
local getgenv_      = getgenv      or function() return _G end
local setclipboard_ = setclipboard or toclipboard or (syn and syn.set_clipboard)
local getExecutorName = getexecutorname or function() return "Unknown" end

-- Автоопределение пути сохранения
local function getSavePath()
    local candidates = {
        "/storage/emulated/0/Delta/Workspace/FullDumps/",
        "/storage/emulated/0/Fluxus/Workspace/FullDumps/",
        "/storage/emulated/0/Documents/FullDumps/",
        "/storage/emulated/0/FullDumps/",
        "./FullDumps/",
        "FullDumps/",
    }
    for _, path in ipairs(candidates) do
        if isfolder_ then
            local ok = pcall(isfolder_, path)
            if ok then return path end
            local parent = path:match("(.+)/$") or path
            if makefolder_ then
                pcall(makefolder_, parent)
                local check = pcall(isfolder_, path)
                if check then return path end
            end
        else
            return path
        end
    end
    return "./FullDumps/"
end

local SAVE_PATH = getSavePath()
if makefolder_ then pcall(makefolder_, SAVE_PATH) end

-- ============================================
-- УТИЛИТЫ
-- ============================================

local function safe(func, ...)
    local ok, res = pcall(func, ...)
    if ok then return res end
    return nil
end

local function getPath(obj)
    if not obj then return "nil" end
    local path = {}
    local current = obj
    local depth = 0
    while current and current ~= game and depth < 100 do
        table.insert(path, 1, current.Name)
        local ok, parent = pcall(function() return current.Parent end)
        if not ok or not parent then break end
        current = parent
        depth = depth + 1
    end
    return table.concat(path, ".")
end

local function formatValue(v, depth)
    depth = depth or 0
    if depth > 3 then return "..." end
    local t = typeof(v)
    if t == "string" then return '"' .. v .. '"'
    elseif t == "number" then return tostring(v)
    elseif t == "boolean" then return tostring(v)
    elseif t == "nil" then return "nil"
    elseif t == "Vector3" then return string.format("Vector3(%.3f, %.3f, %.3f)", v.X, v.Y, v.Z)
    elseif t == "Vector2" then return string.format("Vector2(%.3f, %.3f)", v.X, v.Y)
    elseif t == "CFrame" then
        local p = v.Position
        return string.format("CFrame(%.2f, %.2f, %.2f)", p.X, p.Y, p.Z)
    elseif t == "Color3" then
        return string.format("Color3(%d, %d, %d)", v.R * 255, v.G * 255, v.B * 255)
    elseif t == "BrickColor" then return "BrickColor(" .. tostring(v.Number) .. ")"
    elseif t == "Instance" then
        local ok, name = pcall(function() return v:GetFullName() end)
        return ok and name or "<Instance>"
    elseif t == "EnumItem" then
        return "Enum." .. tostring(v.EnumType) .. "." .. tostring(v.Name)
    elseif t == "table" then
        local parts = {}
        local count = 0
        for k, val in pairs(v) do
            count = count + 1
            if count > 20 then parts[#parts + 1] = "..."; break end
            parts[#parts + 1] = tostring(k) .. "=" .. formatValue(val, depth + 1)
        end
        return "{" .. table.concat(parts, ", ") .. "}"
    elseif t == "function" then return "<function>"
    elseif t == "userdata" then return "<userdata>"
    else return tostring(v) end
end

-- ============================================
-- ДАМП СВОЙСТВ INSTANCE
-- ============================================

local IGNORED_PROPS = {
    Parent = true,  -- уже есть в Path
}

local function dumpProperties(obj)
    local props = {}
    local ok, names = pcall(function()
        return obj:GetPropertyChangedSignal and nil or nil
    end)
    -- Используем рефлексию если доступна
    if getproperties then
        local ok2, list = pcall(getproperties, obj)
        if ok2 and list then
            for _, propName in ipairs(list) do
                if not IGNORED_PROPS[propName] then
                    local ok3, value = pcall(function() return obj[propName] end)
                    if ok3 then
                        props[propName] = formatValue(value)
                    end
                end
            end
            return props
        end
    end
    -- Fallback: основные свойства
    local knownProps = {
        "Name", "ClassName", "Archivable", "Position", "Size", "CFrame",
        "Orientation", "Color", "BrickColor", "Material", "Transparency",
        "CanCollide", "Anchored", "Massless", "Shape", "Velocity",
        "RotVelocity", "AssemblyLinearVelocity", "AssemblyAngularVelocity",
        "Value", "Text", "Font", "TextSize", "TextColor3", "TextTransparency",
        "BackgroundColor3", "BackgroundTransparency", "BorderSizePixel",
        "Visible", "Enabled", "Image", "ImageColor3", "ImageTransparency",
        "SoundId", "Volume", "Looped", "Playing", "TimePosition",
        "AnimationId", "WalkSpeed", "JumpPower", "JumpHeight", "Health",
        "MaxHealth", "DisplayName", "UserId", "AccountAge",
        "WorldPosition", "LookVector", "RightVector", "UpVector",
        "Focus", "Target", "FieldOfView", "CameraType",
        "MaxPlayers", "PlaceId", "JobId", "Workspace",
    }
    for _, propName in ipairs(knownProps) do
        if not IGNORED_PROPS[propName] then
            local ok3, value = pcall(function() return obj[propName] end)
            if ok3 and value ~= nil then
                props[propName] = formatValue(value)
            end
        end
    end
    return props
end

-- ============================================
-- РЕКУРСИВНЫЙ ДАМП INSTANCE
-- ============================================

local totalInstances = 0
local dumpLines = {}
local function add(line) table.insert(dumpLines, line or "") end

local function dumpInstance(obj, depth)
    depth = depth or 0
    if depth > 100 then return end
    if not obj then return end

    totalInstances = totalInstances + 1

    local indent = string.rep("  ", depth)
    local className = safe(function() return obj.ClassName end) or "Unknown"
    local name = safe(function() return obj.Name end) or "?"

    -- Заголовок
    add(string.format("%s[%s] %s", indent, className, name))

    -- Свойства
    local props = dumpProperties(obj)
    local propKeys = {}
    for k in pairs(props) do table.insert(propKeys, k) end
    table.sort(propKeys)
    for _, k in ipairs(propKeys) do
        add(string.format("%s  %s = %s", indent, k, props[k]))
    end

    -- Дети
    local ok, children = pcall(function() return obj:GetChildren() end)
    if ok and children then
        for _, child in ipairs(children) do
            dumpInstance(child, depth + 1)
        end
    end
end

-- ============================================
-- СПЕЦИАЛЬНЫЕ СЕКЦИИ
-- ============================================

local function section(title)
    add("")
    add(string.rep("=", 70))
    add("  " .. title)
    add(string.rep("=", 70))
    add("")
end

-- ============================================
-- ОСНОВНОЙ ДАМП
-- ============================================

add("======================================================================")
add("          FULL GAME DUMPER v5.0")
add("          " .. os.date("%Y-%m-%d %H:%M:%S"))
add("          Executor: " .. tostring(safe(getExecutorName)))
add("          NO FILTERS - FULL DUMP")
add("======================================================================")

-- ============ GAME ============
section("GAME")
add("PlaceId: " .. tostring(game.PlaceId))
add("JobId: " .. tostring(game.JobId))
add("GameId: " .. tostring(game.GameId))
add("CreatorId: " .. tostring(game.CreatorId))
add("CreatorType: " .. tostring(game.CreatorType))
add("PlaceVersion: " .. tostring(game.PlaceVersion))
add("Workspace: " .. tostring(game.Workspace))
add("Players: " .. #Players:GetPlayers())
add("MaxPlayers: " .. tostring(Players.MaxPlayers))
add("PreferredPlayers: " .. tostring(Players.PreferredPlayers))

-- ============ SERVICES ============
section("SERVICES")
local services = {
    "Players", "Workspace", "Lighting", "ReplicatedStorage", "ReplicatedFirst",
    "StarterGui", "StarterPack", "StarterPlayer", "SoundService", "Chat",
    "Teams", "ServerScriptService", "ServerStorage", "Chat", "LocalizationService",
    "TestService", "ScriptContext", "ContentProvider", "ContextActionService",
    "GuiService", "HapticService", "HistoryService", "HttpService", "InsertService",
    "JointsService", "KeyframeSequenceProvider", "LogService", "MarketplaceService",
    "MessagingService", "PathfindingService", "PhysicsService", "PolicyService",
    "ProximityPromptService", "RbxAnalyticsService", "RunService", "Selection",
    "SocialService", "Stats", "TeleportService", "TextChatService", "TextService",
    "TouchInputService", "TweenService", "UserInputService", "VRService",
    "VoiceChatService", "LocalizationService", "ChangeHistoryService",
}
for _, svcName in ipairs(services) do
    local svc = game:FindService(svcName)
    if svc then
        add(string.format("  ✅ %s", svcName))
    end
end

-- ============ PLAYERS ============
section("PLAYERS (" .. #Players:GetPlayers() .. ")")
for _, player in ipairs(Players:GetPlayers()) do
    add(string.format("  %s%s | UserId: %d | Team: %s | AccountAge: %d",
        player == LocalPlayer and "[LOCAL] " or "",
        player.Name,
        player.UserId,
        player.Team and player.Team.Name or "None",
        player.AccountAge))
end

-- ============ LOCAL PLAYER FULL ============
if LocalPlayer then
    section("LOCAL PLAYER FULL")
    add("Name: " .. LocalPlayer.Name)
    add("DisplayName: " .. LocalPlayer.DisplayName)
    add("UserId: " .. tostring(LocalPlayer.UserId))
    add("AccountAge: " .. tostring(LocalPlayer.AccountAge))
    add("MembershipType: " .. tostring(LocalPlayer.MembershipType))
    add("FollowUserId: " .. tostring(LocalPlayer.FollowUserId))
    add("")
    add("Character: " .. tostring(LocalPlayer.Character and LocalPlayer.Character.Name or "nil"))
    if LocalPlayer.Character then
        local char = LocalPlayer.Character
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            add("  Humanoid:")
            add("    Health: " .. tostring(hum.Health))
            add("    MaxHealth: " .. tostring(hum.MaxHealth))
            add("    WalkSpeed: " .. tostring(hum.WalkSpeed))
            add("    JumpPower: " .. tostring(hum.JumpPower))
            add("    JumpHeight: " .. tostring(hum.JumpHeight))
            add("    DisplayName: " .. tostring(hum.DisplayName))
            add("    RigType: " .. tostring(hum.RigType))
        end
    end
    add("")
    add("PlayerGui children:")
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if pg then
        for _, gui in ipairs(pg:GetChildren()) do
            add(string.format("  %s (%s) - Enabled: %s",
                gui.Name, gui.ClassName,
                tostring(safe(function() return gui.Enabled end))))
        end
    end
end

-- ============ WORKSPACE ============
section("WORKSPACE (полный дамп)")
dumpInstance(Workspace, 0)

-- ============ REPLICATED STORAGE ============
section("REPLICATED STORAGE (полный дамп)")
dumpInstance(ReplicatedStorage, 0)

-- ============ REPLICATED FIRST ============
section("REPLICATED FIRST (полный дамп)")
dumpInstance(ReplicatedFirst, 0)

-- ============ STARTER GUI ============
section("STARTER GUI (полный дамп)")
dumpInstance(StarterGui, 0)

-- ============ STARTER PACK ============
section("STARTER PACK (полный дамп)")
dumpInstance(StarterPack, 0)

-- ============ STARTER PLAYER ============
section("STARTER PLAYER (полный дамп)")
dumpInstance(StarterPlayer, 0)

-- ============ LIGHTING ============
section("LIGHTING (полный дамп)")
dumpInstance(Lighting, 0)

-- ============ SOUND SERVICE ============
section("SOUND SERVICE (полный дамп)")
dumpInstance(SoundService, 0)

-- ============ CHAT ============
section("CHAT (полный дамп)")
dumpInstance(Chat, 0)

-- ============ TEAMS ============
section("TEAMS (полный дамп)")
dumpInstance(Teams, 0)

-- ============ PLAYER GUI (ВСЕ ИГРОКИ) ============
if LocalPlayer then
    section("LOCAL PLAYER GUI (полный дамп)")
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if pg then
        dumpInstance(pg, 0)
    end
end

-- ============ BACKPACK ============
if LocalPlayer then
    section("BACKPACK (полный дамп)")
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        dumpInstance(backpack, 0)
    end
end

-- ============ CHARACTER ============
if LocalPlayer and LocalPlayer.Character then
    section("CHARACTER (полный дамп)")
    dumpInstance(LocalPlayer.Character, 0)
end

-- ============ CAMERA ============
section("CAMERA (полный дамп)")
local cam = Workspace.CurrentCamera
if cam then
    dumpInstance(cam, 0)
end

-- ============ ВСЕ REMOTE ============
section("ALL REMOTES (без фильтров)")
local remotes = {}
local function collectRemotes(container)
    if not container then return end
    local ok, descendants = pcall(function() return container:GetDescendants() end)
    if not ok or not descendants then return end
    for _, obj in ipairs(descendants) do
        local cn = obj.ClassName
        if cn == "RemoteEvent" or cn == "RemoteFunction"
           or cn == "BindableEvent" or cn == "BindableFunction"
           or cn == "UnreliableRemoteEvent" then
            table.insert(remotes, {
                Class = cn,
                Name = obj.Name,
                Path = getPath(obj),
            })
        end
    end
end

collectRemotes(ReplicatedStorage)
collectRemotes(ReplicatedFirst)
collectRemotes(Workspace)
collectRemotes(StarterGui)
if LocalPlayer then
    collectRemotes(LocalPlayer:FindFirstChild("PlayerGui"))
    collectRemotes(LocalPlayer:FindFirstChild("Backpack"))
    if LocalPlayer.Character then
        collectRemotes(LocalPlayer.Character)
    end
end

add("Всего найдено: " .. #remotes)
add("")
for _, r in ipairs(remotes) do
    add(string.format("  [%s] %s", r.Class, r.Path))
end

-- ============ ВСЕ SOUND ============
section("ALL SOUNDS (без фильтров)")
local allSounds = {}
local function collectSounds(container)
    if not container then return end
    local ok, descendants = pcall(function() return container:GetDescendants() end)
    if not ok or not descendants then return end
    for _, obj in ipairs(descendants) do
        if obj:IsA("Sound") then
            table.insert(allSounds, {
                Name = obj.Name,
                SoundId = safe(function() return obj.SoundId end),
                Volume = safe(function() return obj.Volume end),
                Path = getPath(obj),
            })
        end
    end
end

collectSounds(ReplicatedStorage)
collectSounds(ReplicatedFirst)
collectSounds(Workspace)
collectSounds(SoundService)
if LocalPlayer and LocalPlayer.Character then
    collectSounds(LocalPlayer.Character)
end

add("Всего: " .. #allSounds)
for _, s in ipairs(allSounds) do
    add(string.format("  🔊 %s | SoundId: %s | Volume: %s", s.Name, tostring(s.SoundId), tostring(s.Volume)))
    add("     Path: " .. s.Path)
end

-- ============ ВСЕ ANIMATION ============
section("ALL ANIMATIONS (без фильтров)")
local allAnims = {}
local function collectAnims(container)
    if not container then return end
    local ok, descendants = pcall(function() return container:GetDescendants() end)
    if not ok or not descendants then return end
    for _, obj in ipairs(descendants) do
        if obj:IsA("Animation") then
            table.insert(allAnims, {
                Name = obj.Name,
                AnimationId = safe(function() return obj.AnimationId end),
                Path = getPath(obj),
            })
        end
    end
end

collectAnims(ReplicatedStorage)
collectAnims(ReplicatedFirst)
collectAnims(Workspace)
if LocalPlayer and LocalPlayer.Character then
    collectAnims(LocalPlayer.Character)
end

add("Всего: " .. #allAnims)
for _, a in ipairs(allAnims) do
    add(string.format("  🎬 %s | AnimationId: %s", a.Name, tostring(a.AnimationId)))
    add("     Path: " .. a.Path)
end

-- ============ ВСЕ SCRIPT ============
section("ALL SCRIPTS (без фильтров)")
local allScripts = {}
local function collectScripts(container)
    if not container then return end
    local ok, descendants = pcall(function() return container:GetDescendants() end)
    if not ok or not descendants then return end
    for _, obj in ipairs(descendants) do
        if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
            local src = safe(function() return obj.Source end)
            table.insert(allScripts, {
                Class = obj.ClassName,
                Name = obj.Name,
                Path = getPath(obj),
                SourceLength = src and #src or 0,
            })
        end
    end
end

collectScripts(ReplicatedStorage)
collectScripts(ReplicatedFirst)
collectScripts(Workspace)
collectScripts(StarterGui)
collectScripts(StarterPack)
if LocalPlayer then
    collectScripts(LocalPlayer:FindFirstChild("PlayerGui"))
    if LocalPlayer.Character then
        collectScripts(LocalPlayer.Character)
    end
end

add("Всего: " .. #allScripts)
for _, s in ipairs(allScripts) do
    add(string.format("  📜 [%s] %s (source length: %d)", s.Class, s.Path, s.SourceLength))
end

-- ============ FIRED REMOTES (хук) ============
section("FIRED REMOTES (hook __namecall)")

local firedRemotes = {}
local firedCount = 0
local MAX_LOG = 1000
local hookActive = false

if hookmetamethod and getrawmetatable and newcclosure and getnamecallmethod and setreadonly then
    local ok = pcall(function()
        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "FireServer" or method == "InvokeServer" or method == "Fire" then
                if firedCount < MAX_LOG then
                    firedCount = firedCount + 1
                    local path = getPath(self)
                    local args = {...}
                    local argStr = {}
                    for i = 1, math.min(#args, 10) do
                        argStr[#argStr + 1] = formatValue(args[i])
                    end
                    if #args > 10 then argStr[#argStr + 1] = "..." .. (#args - 10) .. " more" end
                    firedRemotes[path] = firedRemotes[path] or {
                        Name = self.Name,
                        Class = self.ClassName,
                        Path = path,
                        Method = method,
                        Calls = 0,
                        Samples = {},
                    }
                    firedRemotes[path].Calls = firedRemotes[path].Calls + 1
                    if #firedRemotes[path].Samples < 10 then
                        firedRemotes[path].Samples[#firedRemotes[path].Samples + 1] = table.concat(argStr, ", ")
                    end
                end
            end
            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
        hookActive = true
    end)
    if not ok then hookActive = false end
end

if hookActive then
    add("Хук установлен. Поиграй 2-5 минут — данные появятся.")
else
    add("⚠️ Хук не установлен (экзекьютор не поддерживает hookmetamethod).")
end

-- ============================================
-- ИТОГИ
-- ============================================

section("SUMMARY")
add("Total instances dumped: " .. totalInstances)
add("Total remotes found: " .. #remotes)
add("Total sounds found: " .. #allSounds)
add("Total animations found: " .. #allAnims)
add("Total scripts found: " .. #allScripts)
add("Hook active: " .. tostring(hookActive))

add("")
add("======================================================================")
add("          DUMP COMPLETE!")
add("======================================================================")

-- ============================================
-- СОХРАНЕНИЕ
-- ============================================

local fileName = string.format("FullDump_%s_Place%s.txt",
    os.date("%Y-%m-%d_%H-%M-%S"),
    tostring(game.PlaceId)
)
local filePath = SAVE_PATH .. fileName

local saveSuccess, saveErr = pcall(function()
    if not writefile_ then error("writefile недоступен") end
    writefile_(filePath, table.concat(dumpLines, "\n"))
end)

if saveSuccess then
    print("✅ Полный дамп сохранён!")
    print("📁 Путь: " .. filePath)
    print("")
    print("📊 СТАТИСТИКА:")
    print("   • Всего инстансов: " .. totalInstances)
    print("   • Ремоутов: " .. #remotes)
    print("   • Звуков: " .. #allSounds)
    print("   • Анимаций: " .. #allAnims)
    print("   • Скриптов: " .. #allScripts)
    print("   • Строк в дампе: " .. #dumpLines)
    print("   • Хук __namecall: " .. tostring(hookActive))
    if setclipboard_ then
        pcall(setclipboard_, filePath)
        print("📋 Путь скопирован в буфер обмена!")
    end
else
    warn("❌ Ошибка сохранения: " .. tostring(saveErr))
end

-- Возврат данных
local result = {
    FilePath = filePath,
    Lines = #dumpLines,
    Instances = totalInstances,
    Remotes = remotes,
    Sounds = allSounds,
    Animations = allAnims,
    Scripts = allScripts,
    FiredRemotes = firedRemotes,
    HookActive = hookActive,
}
getgenv_().LastFullDump = result
return result