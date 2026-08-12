-- This file was deobfusctated/pasted by Lame (special thanks to project vault)

if game.PlaceId ~= 142823291 and (game.PlaceId ~= 335132309 and game.PlaceId ~= 636649648) then
	return
end

warn("loading syl")

local LocalPlayerName = game:GetService("Players").LocalPlayer.Name
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/de-ishi/scripts/refs/heads/main/rayfieldSfe"))():CreateWindow({
	Name = "Murder Mystery 2 - SYL",
	Icon = "swords",
	LoadingTitle = "Hi " .. LocalPlayerName,
	LoadingSubtitle = "^w^",
	Theme = "DarkBlue",
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
	Discord = {
		Enabled = true,
		Invite = "nmqG8GMUnn",
		RememberJoins = false,
	},
	KeySystem = true,
	KeySettings = {
		Title = "Hello " .. LocalPlayerName,
		Subtitle = "Thanks for using syl.",
		Note = "Key at : https://discord.gg/nmqG8GMUnn",
		FileName = "mm2_syl",
		SaveKey = true,
		GrabKeyFromSite = true,
		Key = {
			"https://pastebin.com/raw/N7mMmezu",
		},
		ProductSecret = {
			"prod_sk_XIz4u_ffb6d08d2cb314f743ce1e6c3c4d7a4d7ae78711",
		},
	},
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer.Character then
	LocalPlayer.CharacterAdded:Wait()
end

local v7 = v2:CreateTab("Dashboard", "shapes")

v7:CreateSection("Overview")
v7:CreateDivider()
v7:CreateLabel("Version v1.0.2", "shapes", Color3.fromRGB(31, 44, 45), false)
v7:CreateButton({
	Name = "Copy discord server link",
	Callback = function()
		setclipboard("https://discord.gg/nmqG8GMUnn")
	end,
})
v7:CreateSection("Changelog")
v7:CreateDivider()
v7:CreateParagraph({
	Title = "Latest Updates:",
	Content = "Fixed bugs.",
})
v7:CreateSection("Credits")
v7:CreateDivider()
v7:CreateLabel("oshied/aze/syl - Owner", "shapes", Color3.fromRGB(31, 44, 45), false)
v7:CreateLabel("atestrysi - Co-Owner", "shapes", Color3.fromRGB(31, 44, 45), false)

local v8 = v2:CreateTab("Visual", "eye")
local t1 = {
	HighlightMurderer = false,
	HighlightInnocent = false,
	HighlightSheriff = false,
	HighlightGunDrop = false,
}
local t2 = {}
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = LocalPlayer
local u15 = Players
local u16 = LocalPlayer

local function u17(p1)
	if p1 ~= u14 then
		if p1.Character then
			local SYL_Highlight = p1.Character:FindFirstChild("SYL_Highlight")

			if not SYL_Highlight then
				SYL_Highlight = Instance.new("Highlight")
				SYL_Highlight.Name = "SYL_Highlight"
				SYL_Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				SYL_Highlight.Adornee = p1.Character
				SYL_Highlight.FillTransparency = 1
				SYL_Highlight.Parent = p1.Character
			end

			return SYL_Highlight
		end

		return nil
	end

	return nil
end

local u18 = t1

local function u19(p2)
	for k, v in pairs(t2) do
		if k == p2.Name then
			if not v.Killed then
				return not v.Dead
			end

			return false
		end
	end

	return false
end

v8:CreateSection("ESP")

local t3 = {
	Name = "Murderer ESP",
	CurrentValue = t1.HighlightMurderer,
}
local u21 = t1

function t3.Callback(p3)
	u21.HighlightMurderer = p3
end

v8:CreateToggle(t3)

local t4 = {
	Name = "Sheriff ESP",
	CurrentValue = t1.HighlightSheriff,
}
local u23 = t1

function t4.Callback(p4)
	u23.HighlightSheriff = p4
end

v8:CreateToggle(t4)

local t5 = {
	Name = "Innocent ESP",
	CurrentValue = t1.HighlightInnocent,
}
local u25 = t1

function t5.Callback(p5)
	u25.HighlightInnocent = p5
end

v8:CreateToggle(t5)

local t6 = {
	"ResearchFacility",
	"Hospital3",
	"MilBase",
	"House2",
	"Workplace",
	"Mansion2",
	"BioLab",
	"Hotel",
	"Factory",
	"Bank2",
	"PoliceStation",
	"BeachResort",
	"Office3",
	"Barn",
	"Farmhouse",
}
local u27 = Workspace
local u28 = t1

local function u29(p6)
	if p6 and not p6:FindFirstChild("SYL_GunHighlight") then
		local Highlight = Instance.new("Highlight")

		Highlight.Name = "SYL_GunHighlight"
		Highlight.FillTransparency = 1
		Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		Highlight.Adornee = p6
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.Parent = p6
	end
end
local function v30()
	for _, v in ipairs(t6) do
		local v3 = u27:FindFirstChild(v)

		if v3 then
			local GunDrop = v3:FindFirstChild("GunDrop")

			if GunDrop then
				if not u28.HighlightGunDrop then
					if GunDrop and GunDrop:FindFirstChild("SYL_GunHighlight") then
						GunDrop.SYL_GunHighlight:Destroy()
					end
				else
					u29(GunDrop)
				end
			end
		end
	end
end

local spawn = task.spawn
local u32 = v30

spawn(function()
	while true do
		u32()
		task.wait(2)
	end
end)

local t7 = {
	Name = "Gun ESP",
	CurrentValue = t1.HighlightGunDrop,
}
local u34 = t1
local u35 = v30

function t7.Callback(p7)
	u34.HighlightGunDrop = p7
	u35()
end

v8:CreateToggle(t7)

local n1 = 70
local RenderStepped = RunService.RenderStepped
local u39 = Workspace

RenderStepped:Connect(function()
	local CurrentCamera = u39.CurrentCamera

	if CurrentCamera and CurrentCamera.FieldOfView ~= n1 then
		CurrentCamera.FieldOfView = n1
	end
end)

local _ = Players.LocalPlayer
local spawn2 = task.spawn

local function u42()
	local ok, result = pcall(function()
		return game:GetService("ReplicatedStorage"):FindFirstChild("GetPlayerData", true):InvokeServer()
	end)

	if ok and type(result) == "table" then
		t2 = result
		u11 = nil
		u12 = nil
		u13 = nil

		for k, v in pairs(t2) do
			if v.Role ~= "Murderer" then
				if v.Role ~= "Sheriff" then
					if v.Role == "Hero" then
						u13 = k
					end
				else
					u12 = k
				end
			else
				u11 = k
			end
		end
	end
end
local function u43()
	for _, player in ipairs(u15:GetPlayers()) do
		if player ~= u16 then
			local v171 = u17(player)

			if v171 then
				local v172 = false
				local color3 = Color3.new(0.5, 0.5, 0.5)

				if not u18.HighlightMurderer or player.Name ~= u11 or not u19(player) then
					if not u18.HighlightSheriff or player.Name ~= u12 or not u19(player) then
						if u18.HighlightInnocent and u19(player) and player.Name ~= u11 and player.Name ~= u12 and player.Name ~= u13 then
							color3 = Color3.fromRGB(0, 255, 0)
							v172 = true
						end
					else
						color3 = Color3.fromRGB(0, 0, 255)
						v172 = true
					end
				else
					color3 = Color3.fromRGB(255, 0, 0)
					v172 = true
				end

				v171.Enabled = v172 and u18.HighlightMurderer or (u18.HighlightSheriff or u18.HighlightInnocent)
				v171.OutlineColor = color3
			end
		end
	end
end

spawn2(function()
	while true do
		u42()
		u43()
		task.wait(0.5)
	end
end)

local v44 = v2:CreateTab("Character", "user")
local t8 = {
	WalkSpeed = 16,
	WalkSpeedEnabled = false,
	JumpPower = 50,
	JumpPowerEnabled = false,
	Noclip = false,
}
local Humanoid = nil
local HumanoidRootPart
local u48 = nil
local CharacterAdded = LocalPlayer.CharacterAdded
local u51 = LocalPlayer
local u52 = t8

CharacterAdded:Connect(function(p8)
	p8:WaitForChild("Humanoid")
	p8:WaitForChild("HumanoidRootPart")

	if u51.Character then
		Humanoid = u51.Character:FindFirstChildOfClass("Humanoid")
		HumanoidRootPart = u51.Character:FindFirstChild("HumanoidRootPart")
	end

	if u52.Noclip then
		startNoclip()
	end
end)

if LocalPlayer.Character then
	Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end

v44:CreateSection("Movement")

local t9 = {
	Name = "WalkSpeed",
	Range = {
		16,
		100,
	},
	Increment = 1,
	CurrentValue = t8.WalkSpeed,
}
local u54 = t8

function t9.Callback(p9)
	u54.WalkSpeed = p9
end

v44:CreateSlider(t9)

local t10 = {
	Name = "Enable WalkSpeed",
	CurrentValue = false,
}
local u56 = t8

function t10.Callback(p10)
	u56.WalkSpeedEnabled = p10
end

v44:CreateToggle(t10)

local t11 = {
	Name = "JumpPower",
	Range = {
		20,
		100,
	},
	Increment = 1,
	CurrentValue = t8.JumpPower,
}
local u58 = t8

function t11.Callback(p11)
	u58.JumpPower = p11
end

v44:CreateSlider(t11)

local t12 = {
	Name = "Enable JumpPower",
	CurrentValue = false,
}
local u60 = t8

function t12.Callback(p12)
	u60.JumpPowerEnabled = p12
end

v44:CreateToggle(t12)
local t13 = {
	Name = "Noclip",
	CurrentValue = false,
}
local u66 = t8
local u67 = RunService
local u68 = LocalPlayer

function t13.Callback(p13)
	if not p13 then
		u66.Noclip = false

		if u48 then
			u48:Disconnect()
			u48 = nil
		end

		return
	end

	u66.Noclip = true
	u48 = u67.Stepped:Connect(function()
		if u68.Character then
			for _, descendant in ipairs(u68.Character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.CanCollide = false
				end
			end
		end
	end)
end

v44:CreateToggle(t13)

local Heartbeat = RunService.Heartbeat
local u70 = t8

Heartbeat:Connect(function()
	if Humanoid then
		Humanoid.WalkSpeed = u70.WalkSpeedEnabled and u70.WalkSpeed or 16
		Humanoid.JumpPower = u70.JumpPowerEnabled and u70.JumpPower or 50
	end
end)

local v71 = v2:CreateTab("Teleport", "arrow-right")
local u72 = Players
local u73 = LocalPlayer

local function v74()
	local t14 = {
		"Select Player",
	}

	for _, player in ipairs(u72:GetPlayers()) do
		if player ~= u73 then
			local playerName = player.Name

			table.insert(t14, playerName)
		end
	end

	return t14
end

v71:CreateSection("Teleport")

local t15 = {
	Name = "Teleport to Lobby",
}
local u76 = LocalPlayer

function t15.Callback()
	if u76.Character and u76.Character:FindFirstChild("HumanoidRootPart") then
		u76.Character.HumanoidRootPart.CFrame = CFrame.new(-5009.277344, 334.841064, 21.711405)
	end
end

v71:CreateButton(t15)

local t16 = {
	Name = "Teleport to Sheriff",
}
local u78 = Players
local u79 = LocalPlayer

function t16.Callback()
	for _, player in pairs(u78:GetPlayers()) do
		if player.Character and (player.Character:FindFirstChild("Gun") or player.Backpack and player.Backpack:FindFirstChild("Gun")) then
			if not u79.Character or not u79.Character:FindFirstChild("HumanoidRootPart") then
				return
			end

			u79.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame

			return
		end
	end
end

v71:CreateButton(t16)

local t17 = {
	Name = "Teleport to Murderer",
}
local u81 = Players
local u82 = LocalPlayer

function t17.Callback()
	for _, player in pairs(u81:GetPlayers()) do
		if player.Character and (player.Character:FindFirstChild("Knife") or player.Backpack and player.Backpack:FindFirstChild("Knife")) then
			if not u82.Character or not u82.Character:FindFirstChild("HumanoidRootPart") then
				return
			end

			u82.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame

			return
		end
	end
end

v71:CreateButton(t17)

local u83 = false
local t18 = {}
local t19 = {
	"ResearchFacility",
	"Hospital3",
	"MilBase",
	"House2",
	"Workplace",
	"Mansion2",
	"BioLab",
	"Hotel",
	"Factory",
	"Bank2",
	"PoliceStation",
	"Yacht",
	"Office3",
	"BeachResort",
	"Barn",
	"Farmhouse",
}
local u86 = LocalPlayer

local function v87(p14)
	local Character = u86.Character

	if p14 and Character then
		if not Character:FindFirstChild("Gun") and not u86.Backpack:FindFirstChild("Gun") then
			local HumanoidRootPart2 = Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart2 then
				local HumanoidRootPart2CFrame = HumanoidRootPart2.CFrame

				HumanoidRootPart2.CFrame = p14.CFrame + Vector3.new(0, 2.5, 0)
				task.wait(0.05)

				local v207 = Character:FindFirstChild("Gun") or u86.Backpack:FindFirstChild("Gun")

				HumanoidRootPart2.CFrame = HumanoidRootPart2CFrame

				return v207
			end

			return false
		end

		return true
	end

	return false
end

local u88 = t19
local u89 = Workspace
local u90 = v87
local u91 = t19
local u92 = Workspace
local u93 = v87

LocalPlayer.CharacterAdded:Connect(function()
	t18 = {}
end)
v71:CreateSection("Gun")
v71:CreateToggle({
	Name = "Auto Grab Gun",
	CurrentValue = false,
	Callback = function(p15)
		u83 = p15
	end,
})
v71:CreateButton({
	Name = "Grab Gun",
	Callback = function()
		for _, v in ipairs(u91) do
			local v4 = u92:FindFirstChild(v)

			if v4 then
				local GunDrop = v4:FindFirstChild("GunDrop")

				if GunDrop then
					u93(GunDrop)

					return
				end
			end
		end
	end,
})

local Heartbeat2 = RunService.Heartbeat

local function u95()
	if u83 then
		for _, v in ipairs(u88) do
			local v5 = u89:FindFirstChild(v)

			if v5 then
				local GunDrop = v5:FindFirstChild("GunDrop")

				if GunDrop then
					if not t18[GunDrop] then
						t18[GunDrop] = true

						if u83 then
							u90(GunDrop)
						end
					elseif u83 then
						u90(GunDrop)
					end
				end
			end
		end
	end
end

Heartbeat2:Connect(function()
	u95()
end)

local PlayerAdded = Players.PlayerAdded
local u97 = v74

PlayerAdded:Connect(function()
	playerDropdown:Refresh((u97()))
end)

local PlayerRemoving = Players.PlayerRemoving
local u99 = v74

PlayerRemoving:Connect(function()
	playerDropdown:Refresh((u99()))
end)

local v100 = v2:CreateTab("Combat", "sword")
local t20 = {
	Enabled = false,
	Keybind = Enum.KeyCode.E,
}
local CurrentCamera = Workspace.CurrentCamera
local t21 = {
	"HumanoidRootPart",
	"UpperTorso",
	"Torso",
	"LowerTorso",
	"Head",
	"RightUpperLeg",
	"LeftUpperLeg",
	"RightUpperArm",
	"LeftUpperArm",
}
local u104 = nil
local u105 = LocalPlayer
local _ = CurrentCamera
local u108 = CurrentCamera
local u109 = LocalPlayer
local u110 = Workspace

local function v111(p16)
	if p16 then
		local v230

		if u108 and p16 then
			local v228, v229 = u108:WorldToViewportPoint(p16.Position)

			v230 = v229 and (v228.X >= 0 and (v228.Y >= 0 and (v228.X <= u108.ViewportSize.X and v228.Y <= u108.ViewportSize.Y)))
		else
			v230 = false
		end

		if v230 then
			local CFramePosition = u108.CFrame.Position
			local v232 = p16.Position - CFramePosition
			local raycastParams = RaycastParams.new()

			raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
			raycastParams.FilterDescendantsInstances = {
				u109.Character,
			}

			local raycastResult = u110:Raycast(CFramePosition, v232, raycastParams)

			return not raycastResult or raycastResult.Instance:IsDescendantOf(p16.Parent)
		end

		return false
	end

	return false
end

local u112 = CurrentCamera
local u113 = Players
local u114 = LocalPlayer
local u115 = t21
local u116 = v111

local function u117()
	local CFramePosition = u112.CFrame.Position
	local n2 = 1e999
	local v237 = nil
	local v238 = nil

	for _, player in ipairs(u113:GetPlayers()) do
		local v241

		if not player or player == u114 then
			v241 = false
		else
			v241 = player.Character and player.Character:FindFirstChild("Knife")
				or player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Knife")
		end

		if v241 and player.Character then
			local Character = player.Character

			for _, v in ipairs(u115) do
				local v6 = Character:FindFirstChild(v)

				if v6 and v6:IsA("BasePart") and u116(v6) then
					local Magnitude = (CFramePosition - v6.Position).Magnitude

					if Magnitude < n2 then
						n2 = Magnitude
						v237 = v6
						v238 = player
					end
				end
			end
		end
	end

	return v237, v238
end

v100:CreateSection("combat")

local t22 = {
	Name = "Smart Aimbot",
	CurrentValue = false,
}
local u119 = t20

function t22.Callback(p17)
	u119.Enabled = p17

	if not p17 then
		if u104 then
			game:GetService("UserInputService").MouseBehavior = u104
			u104 = nil

			return
		end

		game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
	end
end

v100:CreateToggle(t22)

local t23 = {
	Enabled = false,
	Radius = 15,
}
local u121 = LocalPlayer
local spawn3 = task.spawn

local function u123()
	local Character = u121.Character

	if Character then
		local Humanoid2 = Character:FindFirstChildOfClass("Humanoid")

		if Humanoid2 then
			local v252 = Character:FindFirstChild("Knife") or u121.Backpack:FindFirstChild("Knife")

			if v252 then
				if v252.Parent == u121.Backpack then
					Humanoid2:EquipTool(v252)
					task.wait(0.05)
				end

				return v252
			end

			return nil
		end

		return nil
	end

	return nil
end

local u124 = LocalPlayer
local u125 = Players

spawn3(function()
	while task.wait(0.2) do
		if t23.Enabled then
			local v253 = u123()
			local v254 = u124.Character and u124.Character:FindFirstChild("HumanoidRootPart")

			if v253 and v254 then
				for _, player in ipairs(u125:GetPlayers()) do
					if player ~= u124 then
						local v257

						if not player or not player.Character then
							v257 = false
						else
							local Humanoid3 = player.Character:FindFirstChildOfClass("Humanoid")

							v257 = Humanoid3 and Humanoid3.Health > 0
						end

						if v257 then
							local v259 = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

							if v259 and (v259.Position - v254.Position).Magnitude <= t23.Radius then
								v253:Activate()
							end
						end
					end
				end
			end
		end
	end
end)
v100:CreateToggle({
	Name = "Silent Aim",
	CurrentValue = false,
	Callback = function(_) end,
})

local spawn4 = task.spawn
local u127 = t20

local function u128()
	local Character = u105.Character

	if Character then
		for _, child in ipairs(Character:GetChildren()) do
			if child:IsA("Tool") and child.Name:lower():find("gun") then
				return true
			end
		end
	end

	local Backpack = u105:FindFirstChild("Backpack")

	if Backpack then
		for _, child in ipairs(Backpack:GetChildren()) do
			if child:IsA("Tool") and child.Name:lower():find("gun") then
				return true
			end
		end
	end

	return false
end

local u129 = v111
local u130 = RunService
local u131 = CurrentCamera

spawn4(function()
	while true do
		task.wait(0.05)

		if not u127.Enabled or not u128() then
			if not u104 then
				game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
			else
				game:GetService("UserInputService").MouseBehavior = u104
				u104 = nil
			end

			task.wait(0.1)
		else
			local v261, v262 = u117()

			if not v261 or not v262 then
				task.wait(0.4)
			else
				if u104 == nil then
					u104 = game:GetService("UserInputService").MouseBehavior
				end

				game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter

				while
					u127.Enabled
					and u128()
					and v262
					and v262.Character
					and v262.Character:FindFirstChildOfClass("Humanoid")
					and v262.Character:FindFirstChildOfClass("Humanoid").Health > 0
					and u129(v261)
				do
					u130.RenderStepped:Wait()
					u131.CFrame = CFrame.new(u131.CFrame.Position, v261.Position)

					if v262 and v262.Character then
						local Name = v262.Character:FindFirstChild(v261.Name)

						if Name then
							v261 = Name
						end
					end
				end

				if not u104 then
					game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
				else
					game:GetService("UserInputService").MouseBehavior = u104
					u104 = nil
				end
			end
		end
	end
end)

local v132 = v2:CreateTab("AutoFarm", "calculator")
local t24 = {
	Enabled = false,
	TeleportDelay = 1.6,
}
local t25 = {
	"Factory",
	"Hospital3",
	"MilBase",
	"House2",
	"Workplace",
	"Mansion2",
	"BioLab",
	"Hotel",
	"Bank2",
	"PoliceStation",
	"ResearchFacility",
	"Lobby",
	"BeachResort",
	"Yacht",
	"Office3",
	"Barn",
	"Farmhouse",
}
local cFrame = CFrame.new(-5009.277344, 334.841064, 21.711405)
local u136 = LocalPlayer
local u137 = Workspace

local function u138()
	if u136.Character and u136.Character:FindFirstChild("HumanoidRootPart") then
		local HumanoidRootPart3 = u136.Character.HumanoidRootPart
		local n3 = 1e999
		local v267 = nil

		for _, v in ipairs(t25) do
			local v9 = u137:FindFirstChild(v)

			if v9 and v9:FindFirstChild("CoinContainer") then
				for _, child in ipairs(v9.CoinContainer:GetChildren()) do
					if child:FindFirstChild("TouchInterest") ~= nil then
						local Magnitude = (HumanoidRootPart3.Position - child.Position).Magnitude

						if Magnitude < n3 then
							n3 = Magnitude
							v267 = child
						end
					end
				end
			end
		end

		return v267
	end

	return nil
end

local u139 = LocalPlayer
local u140 = t24

local function u141()
	local v274 = u138()

	if v274 and u139.Character and u139.Character:FindFirstChild("HumanoidRootPart") then
		local HumanoidRootPart4 = u139.Character.HumanoidRootPart

		HumanoidRootPart4.CFrame = CFrame.new(v274.Position)
		task.wait(0.1)
		HumanoidRootPart4.CFrame = cFrame
		task.wait(u140.TeleportDelay)
	end
end

v132:CreateSection("Auto Collection")

local t26 = {
	Name = "Enable AutoFarm",
	CurrentValue = false,
}
local u143 = t24

function t26.Callback(p19)
	u143.Enabled = p19
end

v132:CreateToggle(t26)

local t27 = {
	Name = "Teleport Delay",
	Range = {
		0.5,
		5,
	},
	Increment = 0.1,
	Suffix = "s",
	CurrentValue = 1.6,
}
local u145 = t24

function t27.Callback(p20)
	u145.TeleportDelay = p20
end

v132:CreateSlider(t27)

local spawn5 = task.spawn
local u147 = t24

spawn5(function()
	while true do
		task.wait(u147.TeleportDelay)

		if u147.Enabled then
			u141()
		end
	end
end)

local v148 = v2:CreateTab("Other", "file-cog")
local t28 = {
	Enabled = false,
	Interval = 5,
}
local VirtualUser = game:GetService("VirtualUser")
local u151 = nil

v148:CreateSection("Utility")

local t29 = {
	Name = "Anti-AFK",
	CurrentValue = false,
}
local u157 = t28
local u158 = VirtualUser
local u159 = Workspace

function t29.Callback(p21)
	if not p21 then
		u157.Enabled = false

		if u151 then
			task.cancel(u151)
			u151 = nil
		end

		return
	end

	u157.Enabled = true
	u151 = task.spawn(function()
		while u157.Enabled do
			task.wait(u157.Interval * 60)
			u158:Button2Down(Vector2.new(0, 0), u159.CurrentCamera.CFrame)
			task.wait(0.1)
			u158:Button2Up(Vector2.new(0, 0), u159.CurrentCamera.CFrame)
		end
	end)
end

v148:CreateToggle(t29)
t28.Interval = 5
