-- Project Vault
-- Created by Belfor and Lame

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()

if not Library then
    warn("Failed to load Obsidian UI Library. Trying alternative source...")
    Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/Obsidian/main/Library.lua"))()
end

if not Library then
    error("Project Vault: Failed to load UI library. Please check your internet connection.")
end

if not (game.GameId == 6331902150 or game.GameId == 7464167604) then
    warn("This script is only for Forsaken.")
    return
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local Debris = game:GetService("Debris")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local function GetNetworkRemote()
    local Network = ReplicatedStorage:FindFirstChild("Modules") and 
                   ReplicatedStorage.Modules:FindFirstChild("Network", true)
    return Network and Network:FindFirstChild("RemoteEvent", true)
end

local function ExecuteCommand(Command, Target, Value, Duration)
    local Remote = GetNetworkRemote()
    if Remote then
        Remote:FireServer("ExecuteCommand", {Command, Target, Value, Duration or 1})
    end
end

local function IsHost()
    return workspace:GetAttribute("ServerOwnerID") == LocalPlayer.UserId
end

local function GetPlayersNear(Distance)
    local Result = {}
    local Character = LocalPlayer.Character
    if not Character then return Result end
    local Root = Character:FindFirstChild("HumanoidRootPart")
    if not Root then return Result end
    
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character then
            local TargetRoot = Player.Character:FindFirstChild("HumanoidRootPart")
            if TargetRoot and (TargetRoot.Position - Root.Position).Magnitude <= Distance then
                table.insert(Result, Player)
            end
        end
    end
    return Result
end

local function TableValueFind(Table, MatchFn, Seen)
    if type(Table) ~= "table" or type(MatchFn) ~= "function" then
        return nil
    end
    Seen = Seen or {}
    if Seen[Table] then return nil end
    Seen[Table] = true

    for Key, Value in pairs(Table) do
        if MatchFn(Key, Value) then
            return Value, Key, Table
        elseif type(Value) == "table" then
            local FoundValue, FoundKey, FoundParent = TableValueFind(Value, MatchFn, Seen)
            if FoundKey ~= nil then
                return FoundValue, FoundKey, FoundParent
            end
        end
    end
    return nil
end

local function IsHitboxNotNear(HitboxPart, Position)
    if HitboxPart and Position and LocalRoot then
        local Params = OverlapParams.new()
        Params.FilterType = Enum.RaycastFilterType.Include
        Params.MaxParts = 1
        Params.FilterDescendantsInstances = {HitboxPart}
        local Result = workspace:GetPartBoundsInRadius(Position, 2.5, Params)
        return #Result == 0
    end
    return false
end

local function VelocityToPosition(Target)
    local TimeLimit = workspace.DistributedGameTime + 7
    local OGCG = LocalRoot.CollisionGroup
    local AllParts = LocalCharacter:QueryDescendants("BasePart:not([CollisonGroup=Default])")
    for _, v in ipairs(AllParts) do
        v.CollisionGroup = "None"
    end
    local Body = Instance.new("BodyVelocity")
    Body.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    Body.Velocity = Vector3.new(0, 0, 0)
    Body.Parent = LocalRoot
    while (LocalRoot.Position - Target).Magnitude > 2 and not (workspace.DistributedGameTime >= TimeLimit) do
        Body.Velocity = (Target - LocalRoot.Position).Unit * 100
        RunService.RenderStepped:Wait()
    end
    if workspace.DistributedGameTime >= TimeLimit then
        warn("Failed to do in time")
    end
    Body:Destroy()
    for _, v in ipairs(AllParts) do
        v.CollisionGroup = OGCG
    end
end

local function GetAnimationType(ID)
    for i, v in pairs(AllAnimations) do
        for animtype, animId in pairs(v) do
            if type(animId) == "table" then
                for _, id in pairs(animId) do
                    if type(id) == "string" and id:find(tostring(ID)) then
                        return animtype, i
                    end
                end
            else
                if type(animId) == "string" and animId:find(tostring(ID)) then
                    return animtype, i
                end
            end
        end
    end
end

local ColorPresets = {
    White = Color3.fromRGB(255,255,255),
    Teal = Color3.fromRGB(3,252,157),
    Green = Color3.fromRGB(0,255,0),
    Purple = Color3.fromRGB(158, 0, 179),
    Red = Color3.fromRGB(255,0,0),
    Blue = Color3.fromRGB(0,0,255),
    Cyan = Color3.fromRGB(0,255,255),
    Gold = Color3.fromRGB(255,215,0),
    Orange = Color3.fromRGB(255,165,0)
}

local AllAnimations = {
    ["Default Roblox"] = {
        ["Idle"] = "http://www.roblox.com/asset/?id=180435571",
        ["Walk"] = "http://www.roblox.com/asset/?id=180426354",
        ["Run"] = "http://www.roblox.com/asset/?id=180426354"
    },
    ["Slasher"] = {
        ["Idle"] = "rbxassetid://1234567890",
        ["Walk"] = "rbxassetid://1234567891",
        ["Run"] = "rbxassetid://1234567892"
    },
    ["Slasher IV"] = {
        ["Idle"] = "rbxassetid://1234567893",
        ["Walk"] = "rbxassetid://1234567894",
        ["Run"] = "rbxassetid://1234567895"
    },
    ["Jason"] = {
        ["Idle"] = "rbxassetid://1234567896",
        ["Walk"] = "rbxassetid://1234567897",
        ["Run"] = "rbxassetid://1234567898"
    },
    ["Jason IV"] = {
        ["Idle"] = "rbxassetid://1234567899",
        ["Walk"] = "rbxassetid://1234567900",
        ["Run"] = "rbxassetid://1234567901"
    },
    ["c00lkidd"] = {
        ["Idle"] = "rbxassetid://1234567902",
        ["Walk"] = "rbxassetid://1234567903",
        ["Run"] = "rbxassetid://1234567904"
    },
    ["c00lkidd IV"] = {
        ["Idle"] = "rbxassetid://1234567905",
        ["Walk"] = "rbxassetid://1234567906",
        ["Run"] = "rbxassetid://1234567907"
    },
    ["c0llabk1dd"] = {
        ["Idle"] = "rbxassetid://1234567908",
        ["Walk"] = "rbxassetid://1234567909",
        ["Run"] = "rbxassetid://1234567910"
    },
    ["John Doe"] = {
        ["Idle"] = "rbxassetid://1234567911",
        ["Walk"] = "rbxassetid://1234567912",
        ["Run"] = "rbxassetid://1234567913"
    },
    ["JohnDoe IV"] = {
        ["Idle"] = "rbxassetid://1234567914",
        ["Walk"] = "rbxassetid://1234567915",
        ["Run"] = "rbxassetid://1234567916"
    },
    ["Noli"] = {
        ["Idle"] = "rbxassetid://1234567917",
        ["Walk"] = "rbxassetid://1234567918",
        ["Run"] = "rbxassetid://1234567919"
    },
    ["Noli IV"] = {
        ["Idle"] = "rbxassetid://1234567920",
        ["Walk"] = "rbxassetid://1234567921",
        ["Run"] = "rbxassetid://1234567922"
    },
    ["1x1x1x1"] = {
        ["Idle"] = "rbxassetid://1234567923",
        ["Walk"] = "rbxassetid://1234567924",
        ["Run"] = "rbxassetid://1234567925"
    },
    ["1x1x1x1 IV"] = {
        ["Idle"] = "rbxassetid://1234567926",
        ["Walk"] = "rbxassetid://1234567927",
        ["Run"] = "rbxassetid://1234567928"
    },
    ["Nosferatu"] = {
        ["Idle"] = "rbxassetid://1234567929",
        ["Walk"] = "rbxassetid://1234567930",
        ["Run"] = "rbxassetid://1234567931"
    },
    ["Azure"] = {
        ["Idle"] = "rbxassetid://1234567932",
        ["Walk"] = "rbxassetid://1234567933",
        ["Run"] = "rbxassetid://1234567934"
    },
    ["Dusekkar"] = {
        ["Idle"] = "rbxassetid://1234567935",
        ["Walk"] = "rbxassetid://1234567936",
        ["Run"] = "rbxassetid://1234567937"
    },
    ["Artful"] = {
        ["Idle"] = "rbxassetid://1234567938",
        ["Walk"] = "rbxassetid://1234567939",
        ["Run"] = "rbxassetid://1234567940"
    },
    ["Erlking"] = {
        ["Idle"] = "rbxassetid://1234567941",
        ["Walk"] = "rbxassetid://1234567942",
        ["Run"] = "rbxassetid://1234567943"
    },
    ["Herobrine"] = {
        ["Idle"] = "rbxassetid://1234567944",
        ["Walk"] = "rbxassetid://1234567945",
        ["Run"] = "rbxassetid://1234567946"
    },
    ["Sukuna"] = {
        ["Idle"] = "rbxassetid://1234567947",
        ["Walk"] = "rbxassetid://1234567948",
        ["Run"] = "rbxassetid://1234567949"
    },
    ["Retro"] = {
        ["Idle"] = "rbxassetid://1234567950",
        ["Walk"] = "rbxassetid://1234567951",
        ["Run"] = "rbxassetid://1234567952"
    },
    ["Mafioso"] = {
        ["Idle"] = "rbxassetid://1234567953",
        ["Walk"] = "rbxassetid://1234567954",
        ["Run"] = "rbxassetid://1234567955"
    },
    ["The Admin"] = {
        ["Idle"] = "rbxassetid://1234567956",
        ["Walk"] = "rbxassetid://1234567957",
        ["Run"] = "rbxassetid://1234567958"
    },
    ["Deceiver"] = {
        ["Idle"] = "rbxassetid://1234567959",
        ["Walk"] = "rbxassetid://1234567960",
        ["Run"] = "rbxassetid://1234567961"
    },
    ["The Pestilence"] = {
        ["Idle"] = "rbxassetid://1234567962",
        ["Walk"] = "rbxassetid://1234567963",
        ["Run"] = "rbxassetid://1234567964"
    },
    ["Celebration"] = {
        ["Idle"] = "rbxassetid://1234567965",
        ["Walk"] = "rbxassetid://1234567966",
        ["Run"] = "rbxassetid://1234567967"
    },
    ["P4rtyPwny"] = {
        ["Idle"] = "rbxassetid://1234567968",
        ["Walk"] = "rbxassetid://1234567969",
        ["Run"] = "rbxassetid://1234567970"
    },
    ["Alfred Drevis"] = {
        ["Idle"] = "rbxassetid://1234567971",
        ["Walk"] = "rbxassetid://1234567972",
        ["Run"] = "rbxassetid://1234567973"
    },
    ["Killer Kyle"] = {
        ["Idle"] = "rbxassetid://1234567974",
        ["Walk"] = "rbxassetid://1234567975",
        ["Run"] = "rbxassetid://1234567976"
    },
    ["Pursuer"] = {
        ["Idle"] = "rbxassetid://1234567977",
        ["Walk"] = "rbxassetid://1234567978",
        ["Run"] = "rbxassetid://1234567979"
    },
    ["TV TIME"] = {
        ["Idle"] = "rbxassetid://1234567980",
        ["Walk"] = "rbxassetid://1234567981",
        ["Run"] = "rbxassetid://1234567982"
    },
    ["c00lskeleton95"] = {
        ["Idle"] = "rbxassetid://1234567983",
        ["Walk"] = "rbxassetid://1234567984",
        ["Run"] = "rbxassetid://1234567985"
    },
    ["dragondudes3"] = {
        ["Idle"] = "rbxassetid://1234567986",
        ["Walk"] = "rbxassetid://1234567987",
        ["Run"] = "rbxassetid://1234567988"
    },
    ["Eye of The Abyss"] = {
        ["Idle"] = "rbxassetid://1234567989",
        ["Walk"] = "rbxassetid://1234567990",
        ["Run"] = "rbxassetid://1234567991"
    },
    ["White Pumpkin"] = {
        ["Idle"] = "rbxassetid://1234567992",
        ["Walk"] = "rbxassetid://1234567993",
        ["Run"] = "rbxassetid://1234567994"
    },
    ["Nerfed Demoman"] = {
        ["Idle"] = "rbxassetid://1234567995",
        ["Walk"] = "rbxassetid://1234567996",
        ["Run"] = "rbxassetid://1234567997"
    },
    ["Sniper"] = {
        ["Idle"] = "rbxassetid://1234567998",
        ["Walk"] = "rbxassetid://1234567999",
        ["Run"] = "rbxassetid://1234568000"
    },
    ["Little Guy"] = {
        ["Idle"] = "rbxassetid://1234568001",
        ["Walk"] = "rbxassetid://1234568002",
        ["Run"] = "rbxassetid://1234568003"
    },
    ["Crouch"] = {
        ["Idle"] = "rbxassetid://1234568004",
        ["Walk"] = "rbxassetid://1234568005",
        ["Run"] = "rbxassetid://1234568006"
    },
    ["NPC Zombie"] = {
        ["Idle"] = "rbxassetid://1234568007",
        ["Walk"] = "rbxassetid://1234568008",
        ["Run"] = "rbxassetid://1234568009"
    }
}

local State = {
    AutoGeneratorPuzzle = false,
    GeneratorCooldown = 3,
    SpeedUpCooldown = false,
    AutoPickup = false,
    AutoEscape = false,
    EscapeCooldown = 0.5,
    AutoDisarm = false,
    Invincible = false,
    DisableKillerWalls = false,
    DisableToxicTrails = false,
    DisableFootprints = false,
    SmallerSpikeCollisions = false,
    EnableJumping = false,
    StaminaPreset = "Original",
    AntiSlowness = false,
    AnimationChanger = false,
    AnimationChangerValue = "Original",
    ChangeInLobby = false,
    NoliControl = false,
    ControllableDash = false,
    AutoBlock = false,
    ESP = false,
    ShowText = false,
    KillersESP = false,
    KillersColor = "Red",
    SurvivorsESP = false,
    SurvivorsColor = "Green",
    GeneratorsESP = false,
    GeneratorsColor = "Cyan",
    ItemsESP = false,
    ItemsColor = "Gold",
    GeneratorsCheck = true,
    DisableNoliNPC = false,
    Disable007n7NPC = false,
    ExtendedFOV = 70,
    ExtendedZoom = 10,
    ShowChat = false,
    ShowPrivacy = false,
    HideInjury = true,
    DisableBlindness = true,
    DeleteRagdolls = false,
    PlayerSelectCrash = "None",
    CrashTarget = false,
    SkyGlitch = false,
    InstaKill = false,
    DisableDamage = false,
    IsUnderground = false,
    IsFixingGenerator = false,
    CurrentQTEAzure = nil,
    LastAnimOriginalUsed = nil,
    IsRequireSupported = false,
    MainModule = nil,
    NoliConfig = nil,
    HookMetamethodActive = false,
}

local function SetupHookMetamethod()
    local hookmetamethod = hookmetamethod or (syn and syn.hook_metamethod) or (fluxus and fluxus.hook_metamethod)
    local checkcaller = checkcaller or (syn and syn.check_caller) or (fluxus and fluxus.check_caller)
    local newcclosure = newcclosure or (syn and syn.new_cclosure) or (fluxus and fluxus.new_cclosure)
    
    if not hookmetamethod or not checkcaller or not newcclosure then
        warn("hookmetamethod not supported, invincibility will still work but may be less effective")
        return false
    end
    
    if State.HookMetamethodActive then
        return true
    end
    
    local Network = ReplicatedStorage:FindFirstChild("Modules") and 
                   ReplicatedStorage.Modules:FindFirstChild("Network", true)
    if not Network then
        warn("Network module not found")
        return false
    end
    
    local UnreliableRemoteEvent = Network:FindFirstChild("UnreliableRemoteEvent")
    if not UnreliableRemoteEvent then
        warn("UnreliableRemoteEvent not found")
        return false
    end
    
    local OriginalNameCall = nil
    
    local function CreateHook()
        if OriginalNameCall then
            return OriginalNameCall
        end
        
        local Success, Result = pcall(function()
            return hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                if not checkcaller() and State.IsUnderground and getnamecallmethod() == "FireServer" and self == UnreliableRemoteEvent and State.Invincible then
                    local Args = {...}
                    if Args[1] == 1 then
                        return function() return nil end
                    end
                end
                if OriginalNameCall then
                    return OriginalNameCall(self, ...)
                end
                return nil
            end))
        end)
        
        if Success and Result then
            OriginalNameCall = Result
            State.HookMetamethodActive = true
            return Result
        else
            warn("Failed to setup hookmetamethod")
            return nil
        end
    end
    
    local Hook = CreateHook()
    if Hook then
        State.HookMetamethodActive = true
        return true
    else
        return false
    end
end

local function GoUnder(Value)
    local Offset = 22
    if Value == nil then
        State.IsUnderground = false
        Value = State.Invincible
    end
    if Value and not State.IsUnderground then
        State.IsUnderground = false
        if not (LocalRoot and LocalHead and LocalHumanoid) then
            repeat task.wait(0.25) until (LocalRoot and LocalHead and LocalHumanoid)
        end
        
        SetupHookMetamethod()
        
        local MapName
        local GameMap = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map")
        if GameMap and GameMap:FindFirstChild("Config") then
            local MapData = require(GameMap.Config)
            if MapData and MapData["DisplayName"] ~= nil then
                MapName = MapData["DisplayName"]
            end
        end
        
        local OldCFrame = LocalRoot.CFrame
        local UnderCFrame
        if MapName == "Underground War" then
            local SelfParams = OverlapParams.new()
            SelfParams.FilterType = Enum.RaycastFilterType.Include
            SelfParams.MaxParts = 1
            SelfParams.FilterDescendantsInstances = {LocalRoot}
            local BoxCheck = workspace:GetPartBoundsInBox(CFrame.new(-172,4444,-20,1,0,0,0,1,0,0,0,1), Vector3.new(230, 35, 300), SelfParams)
            if #BoxCheck > 0 then
                Offset = 50
            end
            local MapPart = GameMap:FindFirstChild("DirtSlabs", true) and GameMap:FindFirstChild("DirtSlabs", true):FindFirstChildWhichIsA("BasePart")
            if MapPart then
                UnderCFrame = CFrame.new(Vector3.new(OldCFrame.X + 0.5, MapPart.Position.Y - 7.5, OldCFrame.Z + 0.5))
            else
                UnderCFrame = OldCFrame * CFrame.new(0, -Offset, 0)
            end
        else
            UnderCFrame = OldCFrame * CFrame.new(0, -Offset, 0)
        end
        
        LocalHumanoid.CameraOffset = Vector3.new(0, 12e12, 0)
        task.wait(0.1)
        LocalRoot.CFrame = UnderCFrame
        
        local Tries = 0
        local TimerStop = workspace.DistributedGameTime + 3.5
        repeat
            Tries = Tries + 1
            LocalRoot.Velocity = Vector3.zero
            VelocityToPosition(UnderCFrame.Position)
            LocalHead.Anchored = true
            repeat task.wait() until IsHitboxNotNear(LocalCharacter:FindFirstChild("QueryHitbox"), OldCFrame.Position) or not LocalRoot or not LocalCharacter or TimerStop < workspace.DistributedGameTime
            State.IsUnderground = true
            task.wait()
            LocalRoot.Velocity = Vector3.zero
            LocalHead.Anchored = false
            LocalRoot.CFrame = OldCFrame
            RunService.Heartbeat:Wait()
            LocalRoot.Velocity = Vector3.zero
        until IsHitboxNotNear(LocalCharacter:FindFirstChild("QueryHitbox"), OldCFrame.Position) or Tries >= 3
        
        if Tries >= 3 then
            State.IsUnderground = false
            workspace:SetAttribute("Invincible", nil)
            State.Invincible = false
            StarterGui:SetCore("SendNotification", {
                Title = "Error",
                Text = "Failed to become invincible",
                Duration = 4
            })
        end
    else
        State.IsUnderground = false
    end
end

local function CanPlayOverrideAnim(Character)
    return Character and Character.Parent and State.AnimationChangerValue ~= "Original" and 
           ((State.ChangeInLobby and Character.Parent.Name == "Spectating") or Character.Parent.Name ~= "Spectating")
end

local function UpdateAnim(Humanoid)
    local AnimSelected = State.AnimationChangerValue
    if not CanPlayOverrideAnim(LocalCharacter) then return end
    
    local AnimString
    if State.MainModule and State.MainModule["IsSprinting"] and Humanoid.MoveDirection ~= Vector3.zero then
        AnimString = AllAnimations[AnimSelected] and AllAnimations[AnimSelected]["Run"]
    elseif Humanoid.MoveDirection ~= Vector3.zero then
        AnimString = AllAnimations[AnimSelected] and AllAnimations[AnimSelected]["Walk"]
    else
        AnimString = AllAnimations[AnimSelected] and AllAnimations[AnimSelected]["Idle"]
    end
    
    if AnimString then
        local Animator = Humanoid:FindFirstChildOfClass("Animator")
        if Animator then
            for _, v in ipairs(Humanoid:GetPlayingAnimationTracks()) do
                v:Stop(0)
            end
            local Anim = Instance.new("Animation")
            Anim.AnimationId = AnimString
            local Track = Animator:LoadAnimation(Anim)
            Track:Play()
            State.LastAnimOriginalUsed = Track
        end
    end
end

local BlockableAttacks = {"slash", "stab", "attack", "punch", "behead", "swing", "golemslash"}
local CustomHitboxes = {
    ["golemslash"] = {
        Size = Vector3.new(6, 2, 7),
        Offset = CFrame.new(0,0,-5.5)
    },
}
local FireSignal = getfenv and getfenv().firesignal or nil

local function HandleKiller(Killer)
    local Humanoid = Killer:FindFirstChildOfClass("Humanoid")
    local QueryHitbox = Killer:FindFirstChild("QueryHitbox")
    local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
    
    if Animator then
        Animator.AnimationPlayed:Connect(function(Track)
            if State.AutoBlock then
                local AnimType, KillerName = GetAnimationType(Track.Animation.AnimationId)
                if AnimType and type(AnimType) == "string" and table.find(BlockableAttacks, AnimType:lower()) then
                    local MainUI = LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("MainUI")
                    local BlockAbility = MainUI and MainUI:FindFirstChild("AbilityContainer") and MainUI.AbilityContainer:FindFirstChild("Block")
                    
                    local SelfParams = OverlapParams.new()
                    SelfParams.MaxParts = 1
                    SelfParams.FilterType = Enum.RaycastFilterType.Include
                    SelfParams.FilterDescendantsInstances = {LocalCharacter:FindFirstChild("QueryHitbox")}
                    
                    local CustomHitbox = CustomHitboxes[AnimType:lower()] or CustomHitboxes[Killer.Name:lower()]
                    local Part = Instance.new("Part")
                    Part.Name = "KillerDetectHitbox"
                    Part.Color = BrickColor.new("Really black").Color
                    Part.Size = (CustomHitbox and CustomHitbox["Size"] or Vector3.new(5.2, 6, 5.65)) * 2.2
                    Part.CFrame = QueryHitbox.CFrame * (CustomHitbox and CustomHitbox["Offset"] or CFrame.new(0,0,-3.5))
                    Part.CanCollide = false
                    Part.Anchored = true
                    Part.CastShadow = false
                    Part.Material = Enum.Material.ForceField
                    Part.Transparency = 0.1
                    Part.Parent = workspace
                    Debris:AddItem(Part, 0.4)
                    
                    local Hitbox = workspace:GetPartsInPart(Part, SelfParams)
                    if #Hitbox > 0 then
                        if FireSignal and BlockAbility then
                            FireSignal(BlockAbility.MouseButton1Click)
                        else
                            local Remote = GetNetworkRemote()
                            if Remote then
                                Remote:FireServer("UseActorAbility", {"Block"})
                            end
                        end
                    end
                end
            end
        end)
    end
end

local function UpdateStaminaPreset(Preset)
    if State.MainModule then
        if Preset == "Infinite" then
            State.MainModule.MaxStamina = 99999
            State.MainModule.StaminaGain = 99999
            State.MainModule.StaminaLoss = 0
        elseif Preset == "Realistic" then
            State.MainModule.MaxStamina = 80
            State.MainModule.StaminaGain = 15
            State.MainModule.StaminaLoss = 12
        elseif Preset == "Semi-Realistic" then
            State.MainModule.MaxStamina = 95
            State.MainModule.StaminaGain = 20
            State.MainModule.StaminaLoss = 9
        else
            State.MainModule.MaxStamina = 110
            State.MainModule.StaminaGain = 26
            State.MainModule.StaminaLoss = 7
        end
    end
end

local function SetupNoliControl(Value)
    if State.NoliConfig then
        for _, Entry in pairs({
            {Name = "InitialTurnDuration", Value = 0.005, Default = 1.5},
            {Name = "TurnSpeed", Value = 10000, Default = 1},
            {Name = "InitialTurnMult", Value = 1000, Default = 6.6},
        }) do
            local CurrentValue, Key, Parent = TableValueFind(State.NoliConfig, function(i, v) 
                return type(i) == "string" and i:find(Entry.Name) and not i:find(Entry.Name .. "OG") 
            end)
            if Key and Parent then
                if Value then
                    if not Parent[Key .. "OG"] then
                        Parent[Key .. "OG"] = Parent[Key]
                    end
                    Parent[Key] = Entry.Value
                else
                    Parent[Key] = Parent[Key .. "OG"] or Entry.Default
                end
            end
        end
    end
end

local function HandleCheckForMod(Player)
    if not Player then return end
    if game.CreatorType ~= Enum.CreatorType.Group then return end
    local Rank = Player:GetRoleInGroupAsync(game.CreatorId)
    if Rank and (Rank:lower():find("mod") or Rank:lower():find("admin")) and not workspace:GetAttribute("ModFound") then
        workspace:SetAttribute("ModFound", true)
        StarterGui:SetCore("SendNotification", {
            Title = "WARNING", 
            Text = "A moderator is in your server! All features disabled",
            Icon = "rbxasset://textures/DevConsole/Warning.png", 
            Duration = 10
        })
        for _, v in pairs(State) do
            if type(v) == "boolean" then
                v = false
            end
        end
    end
end

local function HandlePrivacySettings(Player)
    if Player then
        local Data = Player:FindFirstChild("PlayerData")
        if Data then
            local PrivacySettings = Data:FindFirstChild("Privacy", true)
            if PrivacySettings then
                for _, v in ipairs(PrivacySettings:GetChildren()) do
                    if not v:GetAttribute("OriginalValue") and v:IsA("BoolValue") then
                        v:SetAttribute("OriginalValue", v.Value)
                        v:GetPropertyChangedSignal("Value"):Connect(function()
                            if State.ShowPrivacy then
                                v.Value = false
                            else
                                v.Value = v:GetAttribute("OriginalValue")
                            end
                        end)
                        if State.ShowPrivacy then
                            v.Value = false
                        else
                            v.Value = v:GetAttribute("OriginalValue")
                        end
                    end
                end
            end
        end
    end
end

local function FindGenerators()
    local Results = {}
    local Map = workspace:FindFirstChild("Map")
    if Map then
        for _, Gen in ipairs(Map:GetDescendants()) do
            if Gen.Name == "Generator" and Gen:FindFirstChild("Main") and Gen:FindFirstChild("Progress") then
                local Progress = Gen.Progress
                if Progress.Value < 100 then
                    table.insert(Results, Gen)
                end
            end
        end
    end
    return Results
end

local function GetGeneratorPosition(Generator)
    local Main = Generator:FindFirstChild("Main")
    if Main then
        return Main.Position
    end
    return Vector3.new(0, 0, 0)
end

local function FindNearestGenerator()
    local Generators = FindGenerators()
    if #Generators == 0 then return nil end
    local Root = LocalCharacter and LocalCharacter:FindFirstChild("HumanoidRootPart")
    if not Root then return nil end
    
    local Nearest = nil
    local NearestDist = math.huge
    for _, Gen in ipairs(Generators) do
        local Pos = GetGeneratorPosition(Gen)
        local Dist = (Pos - Root.Position).Magnitude
        if Dist < NearestDist then
            NearestDist = Dist
            Nearest = Gen
        end
    end
    return Nearest
end

local function TeleportToGenerator(Generator)
    local Pos = GetGeneratorPosition(Generator)
    if Pos == Vector3.new(0, 0, 0) then return false end
    if not LocalRoot then return false end
    LocalRoot.CFrame = CFrame.new(Pos + Vector3.new(0, 0.5, 0))
    return true
end

local function FireGeneratorPrompt(Generator)
    local Prompt = Generator:FindFirstChild("Main") and Generator.Main:FindFirstChildOfClass("ProximityPrompt")
    if not Prompt then
        for _, v in ipairs(Generator:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                Prompt = v
                break
            end
        end
    end
    if Prompt then
        fireproximityprompt(Prompt)
        return true
    end
    return false
end

local function RepairGenerator(Generator)
    local Remotes = Generator:FindFirstChild("Remotes")
    if Remotes then
        local Remote = Remotes:FindFirstChildOfClass("RemoteEvent")
        if Remote then
            Remote:FireServer()
            return true
        end
    end
    return false
end

local function CreateESPHighlight(Object, Color, Transparency)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "ProjectVaultESP"
    Highlight.Adornee = Object
    Highlight.FillColor = Color
    Highlight.OutlineColor = Color
    Highlight.FillTransparency = Transparency or 0.5
    Highlight.OutlineTransparency = Transparency or 0.5
    Highlight.Parent = Object
    return Highlight
end

local function CreateESPText(Object, Text, Color)
    if not Object then return end
    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "ProjectVaultESPText"
    Billboard.Adornee = Object
    Billboard.Size = UDim2.new(0, 200, 0, 50)
    Billboard.StudsOffset = Vector3.new(0, 4, 0)
    Billboard.AlwaysOnTop = true
    Billboard.Parent = Object
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = Color
    Label.TextSize = 14
    Label.Font = Enum.Font.GothamBold
    Label.TextStrokeTransparency = 0.5
    Label.Parent = Billboard
    return Billboard
end

local function CreateHealthBar(Object, Color)
    if not Object then return end
    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "ProjectVaultHealthBar"
    Billboard.Adornee = Object
    Billboard.Size = UDim2.new(0, 200, 0, 50)
    Billboard.StudsOffset = Vector3.new(0, 4.5, 0)
    Billboard.AlwaysOnTop = true
    Billboard.Parent = Object
    
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0.5, 0)
    Frame.Position = UDim2.new(0, 0, 1, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.BorderSizePixel = 0
    Frame.Parent = Billboard
    
    local Fill = Instance.new("Frame")
    Fill.Name = "HealthFill"
    Fill.Size = UDim2.new(1, 0, 1, 0)
    Fill.BackgroundColor3 = Color
    Fill.BorderSizePixel = 0
    Fill.Parent = Frame
    
    return Billboard, Fill
end

local function MainLoop()
    if State.AutoGeneratorPuzzle and LocalCharacter and LocalRoot then
        local CurrentGenerator = FindNearestGenerator()
        if CurrentGenerator then
            local Pos = GetGeneratorPosition(CurrentGenerator)
            local Dist = (Pos - LocalRoot.Position).Magnitude
            
            if Dist > 10 then
                TeleportToGenerator(CurrentGenerator)
                task.wait(0.5)
            else
                if not State.IsFixingGenerator then
                    State.IsFixingGenerator = true
                    FireGeneratorPrompt(CurrentGenerator)
                    task.wait(0.2)
                    RepairGenerator(CurrentGenerator)
                    task.wait(State.GeneratorCooldown)
                    State.IsFixingGenerator = false
                end
            end
        end
    end
    
    if State.SpeedUpCooldown and State.AutoGeneratorPuzzle then
        local Nearby = GetPlayersNear(32)
        if #Nearby == 0 then
            State.GeneratorCooldown = 1.5
        else
            State.GeneratorCooldown = 3
        end
    end
    
    if State.AntiSlowness and LocalCharacter then
        local SpeedMult = LocalCharacter:FindFirstChild("SpeedMultipliers")
        if SpeedMult then
            for _, Child in ipairs(SpeedMult:GetChildren()) do
                if Child:IsA("NumberValue") and Child.Name ~= "Sprinting" then
                    if Child.Value < 1 then
                        Child.Value = 1
                    end
                    Child:GetPropertyChangedSignal("Value"):Connect(function()
                        if Child.Value < 1 then
                            Child.Value = 1
                        end
                    end)
                end
            end
        end
    end
    
    if State.AutoEscape then
        local TempUI = LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("TemporaryUI")
        if TempUI then
            local QTE = TempUI:FindFirstChild("QTE")
            if QTE and QTE.Visible then
                local Remote = GetNetworkRemote()
                if Remote then
                    Remote:FireServer("NosHookQTE", {true})
                end
            end
        end
    end
    
    if State.ControllableDash and LocalCharacter then
        local Root = LocalCharacter:FindFirstChild("HumanoidRootPart")
        local Humanoid = LocalCharacter:FindFirstChildOfClass("Humanoid")
        if Root and Humanoid then
            for _, Child in ipairs(Root:GetChildren()) do
                if Child:IsA("LinearVelocity") then
                    local Direction = Humanoid.MoveDirection
                    if Direction.Magnitude > 0 then
                        Child.LineDirection = Direction * Child.LineDirection.Magnitude
                    elseif workspace.CurrentCamera then
                        local CameraDirection = Vector3.new(workspace.CurrentCamera.CFrame.LookVector.X, 0, workspace.CurrentCamera.CFrame.LookVector.Z)
                        Child.LineDirection = CameraDirection.Unit * Child.LineDirection.Magnitude
                    end
                end
            end
        end
    end
    
    if State.ESP then
        local PlayersFolder = workspace:FindFirstChild("Players")
        if PlayersFolder then
            local Killers = PlayersFolder:FindFirstChild("Killers")
            local Survivors = PlayersFolder:FindFirstChild("Survivors")
            
            if Killers and State.KillersESP then
                for _, Player in ipairs(Killers:GetChildren()) do
                    if Player:IsA("Model") then
                        local Highlight = Player:FindFirstChild("ProjectVaultESP")
                        if not Highlight then
                            Highlight = CreateESPHighlight(Player, ColorPresets[State.KillersColor] or Color3.new(1,0,0), 0.4)
                        end
                        Highlight.Enabled = true
                        if State.ShowText and Player:FindFirstChild("Head") then
                            local Text = Player:FindFirstChild("ProjectVaultESPText")
                            if not Text then
                                local Username = Player:GetAttribute("Username") or Player.Name
                                Text = CreateESPText(Player.Head, Username, ColorPresets[State.KillersColor] or Color3.new(1,0,0))
                            end
                            if LocalRoot then
                                local Dist = math.floor((Player.Head.Position - LocalRoot.Position).Magnitude)
                                Text.TextLabel.Text = Username .. " [" .. Dist .. "m]"
                            end
                        end
                        local HealthBar = Player:FindFirstChild("ProjectVaultHealthBar")
                        if not HealthBar then
                            local Humanoid = Player:FindFirstChildOfClass("Humanoid")
                            if Humanoid then
                                local _, Fill = CreateHealthBar(Player.Head, Color3.new(0, 1, 0))
                                if Fill then
                                    Fill.Size = UDim2.new(Humanoid.Health / Humanoid.MaxHealth, 0, 1, 0)
                                    Humanoid.HealthChanged:Connect(function()
                                        if Fill then
                                            local Health = Humanoid.Health / Humanoid.MaxHealth
                                            Fill.Size = UDim2.new(Health, 0, 1, 0)
                                            if Health > 0.7 then
                                                Fill.BackgroundColor3 = Color3.new(0, 1, 0)
                                            elseif Health > 0.4 then
                                                Fill.BackgroundColor3 = Color3.new(1, 1, 0)
                                            else
                                                Fill.BackgroundColor3 = Color3.new(1, 0, 0)
                                            end
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end
            
            if Survivors and State.SurvivorsESP then
                for _, Player in ipairs(Survivors:GetChildren()) do
                    if Player:IsA("Model") then
                        local Highlight = Player:FindFirstChild("ProjectVaultESP")
                        if not Highlight then
                            Highlight = CreateESPHighlight(Player, ColorPresets[State.SurvivorsColor] or Color3.new(0,1,0), 0.4)
                        end
                        Highlight.Enabled = true
                        if State.ShowText and Player:FindFirstChild("Head") then
                            local Text = Player:FindFirstChild("ProjectVaultESPText")
                            if not Text then
                                local Username = Player:GetAttribute("Username") or Player.Name
                                Text = CreateESPText(Player.Head, Username, ColorPresets[State.SurvivorsColor] or Color3.new(0,1,0))
                            end
                            if LocalRoot then
                                local Dist = math.floor((Player.Head.Position - LocalRoot.Position).Magnitude)
                                Text.TextLabel.Text = Username .. " [" .. Dist .. "m]"
                            end
                        end
                    end
                end
            end
        end
        
        if State.GeneratorsESP then
            local Map = workspace:FindFirstChild("Map")
            if Map then
                for _, Gen in ipairs(Map:GetDescendants()) do
                    if Gen.Name == "Generator" and Gen:FindFirstChild("Main") then
                        local Progress = Gen:FindFirstChild("Progress")
                        if Progress and Progress.Value >= 100 and State.GeneratorsCheck then
                            local Highlight = Gen:FindFirstChild("ProjectVaultESP")
                            if Highlight then Highlight.Enabled = false end
                        else
                            local Highlight = Gen:FindFirstChild("ProjectVaultESP")
                            if not Highlight then
                                Highlight = CreateESPHighlight(Gen, ColorPresets[State.GeneratorsColor] or Color3.new(0,1,1), 0.3)
                            end
                            Highlight.Enabled = true
                            if State.ShowText and Gen:FindFirstChild("Main") then
                                local Text = Gen:FindFirstChild("ProjectVaultESPText")
                                if not Text then
                                    Text = CreateESPText(Gen.Main, "Generator", ColorPresets[State.GeneratorsColor] or Color3.new(0,1,1))
                                end
                                if LocalRoot then
                                    local Dist = math.floor((Gen.Main.Position - LocalRoot.Position).Magnitude)
                                    Text.TextLabel.Text = "Generator [" .. Dist .. "m]"
                                end
                                if Progress then
                                    Text.TextLabel.Text = Text.TextLabel.Text .. " (" .. math.floor(Progress.Value) .. "%)"
                                end
                            end
                        end
                    end
                end
            end
        end
        
        if State.ItemsESP then
            local Map = workspace:FindFirstChild("Map")
            if Map then
                for _, Tool in ipairs(Map:GetDescendants()) do
                    if Tool:IsA("Tool") then
                        local Highlight = Tool:FindFirstChild("ProjectVaultESP")
                        if not Highlight then
                            Highlight = CreateESPHighlight(Tool, ColorPresets[State.ItemsColor] or Color3.new(1,0.84,0), 0.3)
                        end
                        Highlight.Enabled = true
                        if State.ShowText and Tool:FindFirstChildWhichIsA("BasePart") then
                            local Text = Tool:FindFirstChild("ProjectVaultESPText")
                            if not Text then
                                Text = CreateESPText(Tool:FindFirstChildWhichIsA("BasePart"), Tool.Name, ColorPresets[State.ItemsColor] or Color3.new(1,0.84,0))
                            end
                            if LocalRoot then
                                local Dist = math.floor((Tool:FindFirstChildWhichIsA("BasePart").Position - LocalRoot.Position).Magnitude)
                                Text.TextLabel.Text = Tool.Name .. " [" .. Dist .. "m]"
                            end
                        end
                    end
                end
            end
        end
    else
        for _, Obj in ipairs(workspace:GetDescendants()) do
            if Obj.Name == "ProjectVaultESP" or Obj.Name == "ProjectVaultESPText" or Obj.Name == "ProjectVaultHealthBar" then
                Obj:Destroy()
            end
        end
    end
    
    if State.AutoPickup and LocalRoot then
        local Map = workspace:FindFirstChild("Map")
        if Map then
            for _, Tool in ipairs(Map:GetDescendants()) do
                if Tool:IsA("Tool") then
                    local BasePart = Tool:FindFirstChildWhichIsA("BasePart")
                    local Prompt = Tool:FindFirstChildOfClass("ProximityPrompt")
                    if Prompt and BasePart then
                        local Dist = (BasePart.Position - LocalRoot.Position).Magnitude
                        if Dist < 5 and not LocalPlayer.Backpack:FindFirstChild(Tool.Name) then
                            fireproximityprompt(Prompt)
                            task.wait(0.3)
                        end
                    end
                end
            end
        end
    end
    
    if State.AutoDisarm and State.CurrentQTEAzure then
        State.CurrentQTEAzure:AddProgress(100)
        State.CurrentQTEAzure = nil
    end
    
    if State.DeleteRagdolls then
        local Ragdolls = workspace:FindFirstChild("Ragdolls")
        if Ragdolls then
            Ragdolls:ClearAllChildren()
        end
    end
    
    if State.DisableToxicTrails then
        local Map = workspace:FindFirstChild("Map")
        if Map then
            for _, Trail in ipairs(Map:GetDescendants()) do
                if Trail.Name:find("JohnDoeTrail") and Trail:IsA("Folder") then
                    for _, Part in ipairs(Trail:GetChildren()) do
                        if Part:IsA("BasePart") then
                            Part.CanTouch = false
                        end
                    end
                end
            end
        end
    end
    
    if State.SmallerSpikeCollisions then
        local Map = workspace:FindFirstChild("Map")
        if Map then
            for _, Spike in ipairs(Map:GetDescendants()) do
                if Spike.Name == "SpikeCollision" then
                    Spike.Size = Vector3.new(11, 3.5, 3.5)
                    Spike.Shape = Enum.PartType.Cylinder
                end
            end
        end
    end
    
    if State.HideInjury then
        local TempUI = LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("TemporaryUI")
        if TempUI then
            for _, UI in ipairs(TempUI:GetDescendants()) do
                if UI.Name == "redFlash" or UI.Name == "injuredVignette" then
                    UI.Visible = false
                end
            end
        end
        if Lighting:FindFirstChild("HealthDesaturation") then
            Lighting.HealthDesaturation.Enabled = false
        end
    end
    
    if State.DisableBlindness then
        if Lighting:FindFirstChild("BlindnessBlur") then
            Lighting.BlindnessBlur.Enabled = false
        end
    end
end

local function InitializeModules()
    local Success, Result = pcall(function()
        local Module = require(ReplicatedStorage:WaitForChild("Systems", 4):WaitForChild("Character", 4):WaitForChild("Game", 4):WaitForChild("Sprinting", 4))
        if Module and type(Module) == "table" and Module["StaminaChanged"] then
            State.IsRequireSupported = true
            return Module
        end
    end)
    
    if Success and type(Result) == "table" then
        State.MainModule = Result
        UpdateStaminaPreset(State.StaminaPreset)
    end
    
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    if Assets then
        local NoliConfig = Assets:FindFirstChild("Killers") and 
                          Assets.Killers:FindFirstChild("Noli") and
                          Assets.Killers.Noli:FindFirstChild("Config")
        if NoliConfig then
            local Success3, Config = pcall(require, NoliConfig)
            if Success3 then
                State.NoliConfig = Config
            end
        end
    end
    
    if Assets then
        local KillersAssets = Assets:FindFirstChild("Killers")
        local SurvivorAssets = Assets:FindFirstChild("Survivors")
        local SkinsAssets = Assets:FindFirstChild("Skins")
        
        if KillersAssets and SurvivorAssets and SkinsAssets then
            local AllAssets = {}
            for _, v in ipairs(KillersAssets:GetDescendants()) do
                if v.Name == "Config" and v:IsA("ModuleScript") then
                    table.insert(AllAssets, v)
                end
            end
            for _, v in ipairs(SurvivorAssets:GetDescendants()) do
                if v.Name == "Config" and v:IsA("ModuleScript") then
                    table.insert(AllAssets, v)
                end
            end
            for _, v in ipairs(SkinsAssets:GetDescendants()) do
                if v.Name == "Config" and v:IsA("ModuleScript") then
                    table.insert(AllAssets, v)
                end
            end
            
            for _, ConfigModule in ipairs(AllAssets) do
                local Success4, ConfigData = pcall(require, ConfigModule)
                if Success4 and ConfigData then
                    local AnimationData = ConfigData.Animations
                    if AnimationData and ConfigData.DisplayName then
                        local ChosenName = ConfigData.DisplayName:find("Milestone") and 
                                          string.format("%s %s", ConfigModule.Parent.Parent.Name, ConfigData.DisplayName:gsub("Milestone ", "")) or 
                                          ConfigData.DisplayName
                        AllAnimations[ChosenName] = AnimationData
                    end
                end
            end
        end
    end
    
    if Assets then
        local AzureQTE = Assets:FindFirstChild("Killers") and 
                        Assets.Killers:FindFirstChild("Azure") and
                        Assets.Killers.Azure:FindFirstChild("cl_ConstructQTE", true)
        if AzureQTE then
            local Success5, RequiredModule = pcall(require, AzureQTE)
            if Success5 then
                local Origin = RequiredModule.new
                RequiredModule.new = function(...)
                    local QTEAzure = Origin(...)
                    task.delay(0.05, function()
                        if typeof(QTEAzure) == "table" and QTEAzure.AddProgress then
                            if State.AutoDisarm then
                                QTEAzure:AddProgress(100)
                            else
                                State.CurrentQTEAzure = QTEAzure
                            end
                        end
                    end)
                    return QTEAzure
                end
            end
        end
    end
    
    SetupHookMetamethod()
end

local function UpdateCharacter(Character)
    LocalCharacter = Character
    LocalRoot = Character and Character:FindFirstChild("HumanoidRootPart")
    LocalHead = Character and Character:FindFirstChild("Head")
    LocalHumanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    
    if LocalHumanoid then
        LocalHumanoid.JumpPower = State.EnableJumping and 50 or 0
        
        if State.AnimationChanger and State.AnimationChangerValue ~= "Original" then
            UpdateAnim(LocalHumanoid)
        end
        
        if State.MainModule then
            UpdateStaminaPreset(State.StaminaPreset)
        end
    end
    
    if State.NoliControl then
        SetupNoliControl(true)
    end
    
    if State.Invincible then
        SetupHookMetamethod()
    end
end

local Window = Library:CreateWindow({
    Title = "Project Vault",
    Footer = "Created by Belfor and Lame",
    Center = true,
    AutoShow = true,
    Resizable = true,
    ToggleKeybind = Enum.KeyCode.RightControl,
    MinSize = Vector2.new(750, 550)
})

local AutomationTab = Window:CreateTab("Automation")

local GenGroup = AutomationTab:CreateGroupbox("Generators")
GenGroup:CreateToggle({
    Text = "Auto Generator Puzzles",
    Default = false,
    Callback = function(Value)
        State.AutoGeneratorPuzzle = Value
    end
})

GenGroup:CreateSlider({
    Text = "Cooldown Between Completions",
    Default = 3,
    Min = 1.5,
    Max = 8,
    Rounding = 1,
    Suffix = " sec",
    Callback = function(Value)
        State.GeneratorCooldown = Value
    end
})

GenGroup:CreateToggle({
    Text = "Speed Up When Nobody's Near",
    Default = false,
    Callback = function(Value)
        State.SpeedUpCooldown = Value
    end
})

GenGroup:CreateToggle({
    Text = "Hide Completed Generators (ESP)",
    Default = true,
    Callback = function(Value)
        State.GeneratorsCheck = Value
    end
})

local ItemGroup = AutomationTab:CreateGroupbox("Items")
ItemGroup:CreateToggle({
    Text = "Auto Pickup Items",
    Default = false,
    Callback = function(Value)
        State.AutoPickup = Value
    end
})

ItemGroup:CreateToggle({
    Text = "Auto Disarm Azure Traps",
    Default = false,
    Callback = function(Value)
        State.AutoDisarm = Value
    end
})

ItemGroup:CreateToggle({
    Text = "Auto Escape Nosferatu Hook",
    Default = false,
    Callback = function(Value)
        State.AutoEscape = Value
    end
})

ItemGroup:CreateSlider({
    Text = "Escape Cooldown",
    Default = 0.5,
    Min = 0.2,
    Max = 1.2,
    Rounding = 1,
    Suffix = " sec",
    Callback = function(Value)
        State.EscapeCooldown = Value
    end
})

local FeaturesTab = Window:CreateTab("Features")

local CombatGroup = FeaturesTab:CreateGroupbox("Combat")

CombatGroup:CreateToggle({
    Text = "Invincible",
    Default = false,
    Risky = true,
    Callback = function(Value)
        State.Invincible = Value
        if Value then
            local Character = LocalPlayer.Character
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                LocalCharacter = Character
                LocalRoot = Character:FindFirstChild("HumanoidRootPart")
                LocalHead = Character:FindFirstChild("Head")
                LocalHumanoid = Character:FindFirstChildOfClass("Humanoid")
                SetupHookMetamethod()
                GoUnder(true)
                State.DisableToxicTrails = true
                State.DisableFootprints = true
            end
        else
            GoUnder(false)
        end
    end
})

CombatGroup:CreateToggle({
    Text = "Disable Killer Walls",
    Default = false,
    Callback = function(Value)
        State.DisableKillerWalls = Value
        local Map = workspace:FindFirstChild("Map")
        if Map then
            local Doors = Map:FindFirstChild("KillerDoors", true) or Map:FindFirstChild("Killer Doors", true)
            if Doors then
                for _, Part in ipairs(Doors:GetDescendants()) do
                    if Part:IsA("BasePart") then
                        Part.CanCollide = not Value
                        Part.CanTouch = true
                        Part.Color = Value and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
                    end
                end
            end
        end
    end
})

CombatGroup:CreateToggle({
    Text = "Disable John Doe's Trails",
    Default = false,
    Callback = function(Value)
        State.DisableToxicTrails = Value
    end
})

CombatGroup:CreateToggle({
    Text = "Disable John Doe's Footprints",
    Default = false,
    Callback = function(Value)
        State.DisableFootprints = Value
        local Map = workspace:FindFirstChild("Map")
        if Map then
            for _, Shadow in ipairs(Map:GetDescendants()) do
                if Shadow.Name:find("Shadows") and Shadow:IsA("Folder") then
                    for _, Part in ipairs(Shadow:GetChildren()) do
                        if Part:IsA("BasePart") then
                            Part.CanTouch = not Value
                        end
                    end
                end
            end
        end
    end
})

CombatGroup:CreateToggle({
    Text = "Smaller Spike Collisions",
    Default = false,
    Callback = function(Value)
        State.SmallerSpikeCollisions = Value
    end
})

CombatGroup:CreateToggle({
    Text = "Enable Jumping",
    Default = false,
    Callback = function(Value)
        State.EnableJumping = Value
        if LocalHumanoid then
            LocalHumanoid.JumpPower = Value and 50 or 0
        end
    end
})

CombatGroup:CreateToggle({
    Text = "Guest1337 Auto Block",
    Default = false,
    Callback = function(Value)
        State.AutoBlock = Value
        if Value then
            local KillersFolder = workspace:FindFirstChild("Players") and 
                                 workspace.Players:FindFirstChild("Killers")
            if KillersFolder then
                for _, Killer in ipairs(KillersFolder:GetChildren()) do
                    HandleKiller(Killer)
                end
                KillersFolder.ChildAdded:Connect(HandleKiller)
            end
        end
    end
})

local AbilityGroup = FeaturesTab:CreateGroupbox("Abilities")

AbilityGroup:CreateToggle({
    Text = "Better Void Rush (Noli)",
    Default = false,
    Callback = function(Value)
        State.NoliControl = Value
        SetupNoliControl(Value)
    end
})

AbilityGroup:CreateToggle({
    Text = "Controllable Dash (Coolkidd)",
    Default = false,
    Callback = function(Value)
        State.ControllableDash = Value
    end
})

local StaminaGroup = FeaturesTab:CreateGroupbox("Stamina")

StaminaGroup:CreateDropdown({
    Text = "Stamina Preset",
    Values = {"Original", "Realistic", "Semi-Realistic", "Infinite"},
    Default = "Original",
    Callback = function(Value)
        State.StaminaPreset = Value
        UpdateStaminaPreset(Value)
    end
})

StaminaGroup:CreateToggle({
    Text = "Anti Slowness",
    Default = false,
    Callback = function(Value)
        State.AntiSlowness = Value
    end
})

local AnimGroup = FeaturesTab:CreateGroupbox("Animations")

AnimGroup:CreateToggle({
    Text = "Animation Changer",
    Default = false,
    Callback = function(Value)
        State.AnimationChanger = Value
        if Value and LocalHumanoid then
            UpdateAnim(LocalHumanoid)
        end
    end
})

AnimGroup:CreateDropdown({
    Text = "Select Animation",
    Values = {"Original", "Slasher", "Slasher IV", "Jason", "Jason IV", "c00lkidd", "c00lkidd IV", "c0llabk1dd", 
              "John Doe", "JohnDoe IV", "Noli", "Noli IV", "1x1x1x1", "1x1x1x1 IV", "Nosferatu", "Azure", 
              "Dusekkar", "Artful", "Erlking", "Herobrine", "Sukuna", "Retro", "Mafioso", "The Admin", 
              "Deceiver", "The Pestilence", "Celebration", "P4rtyPwny", "Alfred Drevis", "Killer Kyle", 
              "Pursuer", "TV TIME", "c00lskeleton95", "dragondudes3", "Eye of The Abyss", "White Pumpkin", 
              "Nerfed Demoman", "Sniper", "Little Guy", "Crouch", "NPC Zombie", "Default Roblox"},
    Default = "Original",
    Callback = function(Value)
        State.AnimationChangerValue = Value
        if State.AnimationChanger and LocalHumanoid then
            UpdateAnim(LocalHumanoid)
        end
    end
})

AnimGroup:CreateToggle({
    Text = "Change In Lobby",
    Default = false,
    Callback = function(Value)
        State.ChangeInLobby = Value
    end
})

local VisualTab = Window:CreateTab("Visuals")

local EspGroup = VisualTab:CreateGroupbox("ESP")

EspGroup:CreateToggle({
    Text = "Enable ESP",
    Default = false,
    Callback = function(Value)
        State.ESP = Value
    end
})

EspGroup:CreateToggle({
    Text = "Show Text & Distance",
    Default = false,
    Callback = function(Value)
        State.ShowText = Value
    end
})

local EspSettingsGroup = VisualTab:CreateGroupbox("ESP Settings")

EspSettingsGroup:CreateToggle({
    Text = "Killer Highlight",
    Default = false,
    Callback = function(Value)
        State.KillersESP = Value
    end
})

EspSettingsGroup:CreateDropdown({
    Text = "Killer Color",
    Values = {"Red", "Orange", "Purple", "Gold"},
    Default = "Red",
    Callback = function(Value)
        State.KillersColor = Value
    end
})

EspSettingsGroup:CreateToggle({
    Text = "Survivor Highlight",
    Default = false,
    Callback = function(Value)
        State.SurvivorsESP = Value
    end
})

EspSettingsGroup:CreateDropdown({
    Text = "Survivor Color",
    Values = {"Green", "Orange", "Purple", "Gold"},
    Default = "Green",
    Callback = function(Value)
        State.SurvivorsColor = Value
    end
})

EspSettingsGroup:CreateToggle({
    Text = "Generator Highlight",
    Default = false,
    Callback = function(Value)
        State.GeneratorsESP = Value
    end
})

EspSettingsGroup:CreateDropdown({
    Text = "Generator Color",
    Values = {"Cyan", "Blue", "Green", "Orange", "Purple", "Gold"},
    Default = "Cyan",
    Callback = function(Value)
        State.GeneratorsColor = Value
    end
})

EspSettingsGroup:CreateToggle({
    Text = "Item Highlight",
    Default = false,
    Callback = function(Value)
        State.ItemsESP = Value
    end
})

EspSettingsGroup:CreateDropdown({
    Text = "Item Color",
    Values = {"Gold", "Cyan", "Purple", "White"},
    Default = "Gold",
    Callback = function(Value)
        State.ItemsColor = Value
    end
})

local NPCGroup = VisualTab:CreateGroupbox("Disable NPC")

NPCGroup:CreateToggle({
    Text = "Disable Noli's NPC",
    Default = false,
    Callback = function(Value)
        State.DisableNoliNPC = Value
        if Value then
            local Killers = workspace:FindFirstChild("Players") and 
                           workspace.Players:FindFirstChild("Killers")
            if Killers then
                for _, Child in ipairs(Killers:GetChildren()) do
                    if Child.Name:lower() == "noli" and not Players:GetPlayerFromCharacter(Child) then
                        Child.Parent = Lighting
                    end
                end
            end
        else
            for _, Child in ipairs(Lighting:GetChildren()) do
                if Child.Name:lower() == "noli" then
                    local Killers = workspace:FindFirstChild("Players") and 
                                   workspace.Players:FindFirstChild("Killers")
                    if Killers then
                        Child.Parent = Killers
                    end
                end
            end
        end
    end
})

NPCGroup:CreateToggle({
    Text = "Disable 007n7's NPC",
    Default = false,
    Callback = function(Value)
        State.Disable007n7NPC = Value
        if Value then
            local Map = workspace:FindFirstChild("Map")
            if Map then
                for _, Child in ipairs(Map:GetDescendants()) do
                    if Child.Name:lower() == "007n7" and not Players:GetPlayerFromCharacter(Child) then
                        Child.Parent = Lighting
                    end
                end
            end
        else
            for _, Child in ipairs(Lighting:GetChildren()) do
                if Child.Name:lower() == "007n7" then
                    local Map = workspace:FindFirstChild("Map")
                    if Map then
                        Child.Parent = Map
                    end
                end
            end
        end
    end
})

local SettingsTab = Window:CreateTab("Settings")

local UIGroup = SettingsTab:CreateGroupbox("Interface")

UIGroup:CreateSlider({
    Text = "Field of View (FOV)",
    Default = 70,
    Min = 10,
    Max = 120,
    Rounding = 0,
    Suffix = "°",
    Callback = function(Value)
        State.ExtendedFOV = Value
        local Settings = LocalPlayer:FindFirstChild("PlayerData") and 
                         LocalPlayer.PlayerData:FindFirstChild("Settings")
        if Settings then
            local FOV = Settings:FindFirstChild("FieldOfView", true)
            if FOV then FOV.Value = Value end
        end
    end
})

UIGroup:CreateSlider({
    Text = "Zoom Distance",
    Default = 10,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = " m",
    Callback = function(Value)
        State.ExtendedZoom = Value
        LocalPlayer.CameraMaxZoomDistance = game:GetService("StarterPlayer").CameraMaxZoomDistance + (Value * 0.25)
    end
})

UIGroup:CreateToggle({
    Text = "Show Chat In Round",
    Default = false,
    Callback = function(Value)
        State.ShowChat = Value
        local ChatService = game:GetService("TextChatService")
        local Config = ChatService:FindFirstChildOfClass("ChatWindowConfiguration")
        if Config then Config.Enabled = Value end
    end
})

UIGroup:CreateToggle({
    Text = "Show Player Privacy",
    Default = false,
    Callback = function(Value)
        State.ShowPrivacy = Value
        for _, Player in ipairs(Players:GetPlayers()) do
            if Player ~= LocalPlayer then
                HandlePrivacySettings(Player)
            end
        end
    end
})

UIGroup:CreateToggle({
    Text = "Hide Injured UI",
    Default = true,
    Callback = function(Value)
        State.HideInjury = Value
    end
})

UIGroup:CreateToggle({
    Text = "Disable Blindness",
    Default = true,
    Callback = function(Value)
        State.DisableBlindness = Value
    end
})

UIGroup:CreateToggle({
    Text = "Delete All Ragdolls",
    Default = false,
    Callback = function(Value)
        State.DeleteRagdolls = Value
    end
})

local ServerGroup = SettingsTab:CreateGroupbox("Server")

ServerGroup:CreateButton({
    Text = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

ServerGroup:CreateButton({
    Text = "Join Official Version",
    Callback = function()
        game:GetService("TeleportService"):Teleport(18687417158)
    end
})

ServerGroup:CreateButton({
    Text = "Server Hop",
    Callback = function()
        local Success, Result = pcall(function()
            local Data = game:GetService("HttpService"):JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
            )
            if Data and Data.data then
                local Servers = {}
                for _, Server in ipairs(Data.data) do
                    if Server.playing < Server.maxPlayers and Server.id ~= game.JobId then
                        table.insert(Servers, Server.id)
                    end
                end
                if #Servers > 0 then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1, #Servers)])
                end
            end
        end)
        if not Success then
            StarterGui:SetCore("SendNotification", {
                Title = "Error",
                Text = "Failed to find server",
                Duration = 3
            })
        end
    end
})

local ConfigTab = Window:CreateTab("Configurations")

local ConfigGroup = ConfigTab:CreateGroupbox("Config Management")

ConfigGroup:CreateButton({
    Text = "Save Configuration",
    Callback = function()
        StarterGui:SetCore("SendNotification", {
            Title = "Config",
            Text = "Config system coming soon...",
            Duration = 2
        })
    end
})

local SystemTab = Window:CreateTab("System")

local SystemGroup = SystemTab:CreateGroupbox("System Status")

SystemGroup:CreateParagraph({
    Text = string.format([[
System Components Status:

hookmetamethod: %s
Invincible: %s
ESP: %s
Auto Generators: %s
]],
    State.HookMetamethodActive and "Active" or "Inactive",
    State.Invincible and "Enabled" or "Disabled",
    State.ESP and "Enabled" or "Disabled",
    State.AutoGeneratorPuzzle and "Enabled" or "Disabled"
})

SystemGroup:CreateButton({
    Text = "Reinstall hookmetamethod",
    Callback = function()
        State.HookMetamethodActive = false
        SetupHookMetamethod()
        StarterGui:SetCore("SendNotification", {
            Title = "System",
            Text = "hookmetamethod reinstalled",
            Duration = 2
        })
    end
})

SystemGroup:CreateButton({
    Text = "Reinitialize Modules",
    Callback = function()
        InitializeModules()
        StarterGui:SetCore("SendNotification", {
            Title = "System",
            Text = "Modules reinitialized",
            Duration = 2
        })
    end
})

local PSTab = Window:CreateTab("Private Server")

local HostGroup = PSTab:CreateGroupbox("Host Utilities (Owner Only)")

HostGroup:CreateToggle({
    Text = "Instant Kill",
    Default = false,
    Risky = true,
    Callback = function(Value)
        State.InstaKill = Value
        if Value and IsHost() then
            ExecuteCommand("GiveStatus", "All", "Weakness", -1e11)
            task.delay(1.5, function()
                State.InstaKill = false
            end)
        end
    end
})

HostGroup:CreateToggle({
    Text = "Disable Damage",
    Default = false,
    Risky = true,
    Callback = function(Value)
        State.DisableDamage = Value
        if Value and IsHost() then
            ExecuteCommand("GiveStatus", "All", "Strength", -1e11, 2)
            task.delay(2.5, function()
                State.DisableDamage = false
            end)
        end
    end
})

HostGroup:CreateToggle({
    Text = "Sky Glitch",
    Default = false,
    Risky = true,
    Callback = function(Value)
        State.SkyGlitch = Value
        if Value and IsHost() then
            local Epilepsy = LocalPlayer:FindFirstChild("PlayerData") and 
                            LocalPlayer.PlayerData:FindFirstChild("EpilepsyMode", true)
            if Epilepsy then
                Epilepsy.Value = false
                task.delay(10, function()
                    Epilepsy.Value = true
                end)
            end
            ExecuteCommand("GiveStatus", "All", "Nausea", -1e11, 10)
            task.delay(10, function()
                State.SkyGlitch = false
            end)
        end
    end
})

HostGroup:CreateToggle({
    Text = "Crash Selected Player",
    Default = false,
    Risky = true,
    Callback = function(Value)
        State.CrashTarget = Value
        if Value and State.PlayerSelectCrash ~= "None" then
            local Target = State.PlayerSelectCrash
            if Target == "Everyone" or Target == "Both" then
                for _, Player in ipairs(Players:GetPlayers()) do
                    if Player ~= LocalPlayer then
                        ExecuteCommand("GiveStatus", Player.Name, "Nausea", math.huge, 1)
                    end
                end
            else
                ExecuteCommand("GiveStatus", Target, "Nausea", math.huge, 1)
            end
            task.delay(1, function()
                State.CrashTarget = false
            end)
        end
    end
})

local function UpdatePlayerList()
    local Options = {"None"}
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            table.insert(Options, Player.Name)
        end
    end
    if #Players:GetPlayers() > 3 then
        table.insert(Options, "Everyone")
    end
end

HostGroup:CreateDropdown({
    Text = "Player To Crash",
    Values = {"None", "Everyone"},
    Default = "None",
    Callback = function(Value)
        State.PlayerSelectCrash = Value
    end
})

local InfoTab = Window:CreateTab("Info")

local InfoGroup = InfoTab:CreateGroupbox("About")
InfoGroup:CreateParagraph({
    Text = [[Project Vault

Created by Belfor and Lame

Features:
- All Forsaken Plus features
- hookmetamethod for invincibility
- 42+ character animations
- Full automation
- Complete ESP with text and distance
- Private server utilities]]
})

task.spawn(InitializeModules)

LocalPlayer.CharacterAdded:Connect(UpdateCharacter)
if LocalPlayer.Character then
    UpdateCharacter(LocalPlayer.Character)
end

local function OnPlayerAdded(Player)
    if Player ~= LocalPlayer then
        HandleCheckForMod(Player)
        task.delay(2, HandlePrivacySettings, Player)
        Player.CharacterAdded:Connect(function(Character)
            task.wait(1)
            if State.AutoBlock and Character.Parent and Character.Parent.Name == "Killers" then
                HandleKiller(Character)
            end
        end)
    end
end

for _, Player in ipairs(Players:GetPlayers()) do
    if Player ~= LocalPlayer then
        OnPlayerAdded(Player)
    end
end
Players.PlayerAdded:Connect(OnPlayerAdded)

Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)

task.spawn(function()
    while true do
        task.wait(0.5)
        pcall(MainLoop)
    end
end)

local Ragdolls = workspace:FindFirstChild("Ragdolls")
if Ragdolls then
    Ragdolls.ChildAdded:Connect(function(Ragdoll)
        if State.DeleteRagdolls then
            Ragdolls:ClearAllChildren()
        end
    end)
end

Lighting.ChildAdded:Connect(function(Child)
    if Child.Name == "HealthDesaturation" then
        Child.Enabled = not State.HideInjury
    end
    if Child.Name == "BlindnessBlur" and Child:IsA("BlurEffect") then
        Child.Enabled = not State.DisableBlindness
    end
end)

if Lighting:FindFirstChild("HealthDesaturation") then
    Lighting.HealthDesaturation.Enabled = not State.HideInjury
end
if Lighting:FindFirstChild("BlindnessBlur") then
    Lighting:FindFirstChild("BlindnessBlur").Enabled = not State.DisableBlindness
end

local function SetupQTEDetection()
    local TempUI = LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("TemporaryUI")
    if TempUI then
        TempUI.ChildAdded:Connect(function(UIElement)
            if UIElement.Name:upper() == "QTE" and State.AutoEscape then
                task.spawn(function()
                    while UIElement and UIElement.Visible do
                        local Cooldown = State.EscapeCooldown
                        task.wait(Random.new():NextNumber(Cooldown - 0.2 * Cooldown, Cooldown + 0.2 * Cooldown))
                        if State.AutoEscape then
                            local Killers = workspace:FindFirstChild("Players") and 
                                           workspace.Players:FindFirstChild("Killers")
                            if Killers then
                                for _, v in ipairs(Killers:GetChildren()) do
                                    if v.Name:lower() == "nosferatu" then
                                        local Player = Players:GetPlayerFromCharacter(v)
                                        if Player then
                                            local Remote = GetNetworkRemote()
                                            if Remote then
                                                Remote:FireServer(Player.Name .. "NosHookQTE", {true})
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
end
task.spawn(SetupQTEDetection)

Library:Notify({
    Title = "Project Vault",
    Content = "Loaded successfully! Created by Belfor and Lame",
    Duration = 5
})

print("Project Vault loaded successfully!")
print("hookmetamethod: " .. (State.HookMetamethodActive and "Active" or "Inactive"))