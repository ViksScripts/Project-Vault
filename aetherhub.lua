-- This file was deobfusctated/pasted by Lame (special thanks to project vault)

local fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local saveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local interfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local window = fluent:CreateWindow({
	Title = "Aether Hub | Murder Mystery 2 - " .. fluent.Version,
	SubTitle = "by Zyxer",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.RightShift
})
local addDropdownData = {
	Discord = window:AddTab({
		Title = "Discord",
		Icon = "link"
	}),
	Player = window:AddTab({
		Title = "Player",
		Icon = "user"
	}),
	Visual = window:AddTab({
		Title = "Visuals",
		Icon = "eye"
	}),
	Target = window:AddTab({
		Title = "Targets",
		Icon = "crosshair"
	}),
	Settings = window:AddTab({
		Title = "Settings",
		Icon = "settings"
	})
}
local _ = fluent.Options

fluent:Notify({
	Title = "Welcome to Aether Hub",
	Content = "Your script has successfully loaded. Join our discord server for more scripts.",
	Duration = 8
})
addDropdownData.Discord:AddParagraph({
	Title = "Want more scripts?",
	Content = "All our scripts are listed in our Discord server below! "
})
addDropdownData.Discord:AddButton({
	Title = "Join Discord",
	Description = "Join our Discord server for updates and support.",
	Callback = function()
		setclipboard("discord.gg/uyM5Jd8knb")
		fluent:Notify({
			Title = "Copied!",
			Content = "The Discord invite link has been copied to your clipboard!",
			Duration = 5
		})
	end
})
addDropdownData.Discord:AddParagraph({
	Title = "Credits",
	Content = "Our development team consists of only two people, so please be patient with us! \n \n" .. "Contributors: \n" .. "Zyxer - Developer \n" .. "Kyoka - Developer \n\n" .. "Aether Hub is a free script hub, and we are working hard to make it the best it can be. \n\n" .. "If you have any suggestions or feedback, please let us know!"
})
addDropdownData.Player:AddToggle("NoClip", {
	Title = "NoClip",
	Description = "Walk through walls (disables on reset/jump).",
	Default = false
}):OnChanged(function(canCollideFlag)
	local LocalPlayer = game.Players.LocalPlayer

	if LocalPlayer and LocalPlayer.Character then
		for _, descendant in ipairs(LocalPlayer.Character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = not canCollideFlag
			end
		end
	end
end)

local flag = false

addDropdownData.Player:AddToggle("InfiniteJump", {
	Title = "Infinite Jump",
	Default = false
}):OnChanged(function(secondaryFlag)
	flag = secondaryFlag
end)

local capturedFlag = false

addDropdownData.Player:AddToggle("ClickToTeleport", {
	Title = "Click to Teleport",
	Default = false
}):OnChanged(function(flag)
	capturedFlag = flag
end)
addDropdownData.Player:AddSection("Movement")
addDropdownData.Player:AddSlider("Slider", {
	Title = "Walkspeed",
	Description = "Set this to 35 or below to avoid being kicked.",
	Default = 16,
	Min = 10,
	Max = 50,
	Rounding = 0,
	Increment = 1,
	Callback = function(walkSpeed)
		local LocalPlayer = game.Players.LocalPlayer

		if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
		end
	end
})
addDropdownData.Player:AddSlider("JumpPower", {
	Title = "Jump Power Multiplier",
	Description = "Adjust your jump power multiplier.",
	Default = 50,
	Min = 50,
	Max = 200,
	Rounding = 0,
	Increment = 5,
	Callback = function(jumpPower)
		local LocalPlayer = game.Players.LocalPlayer

		if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			LocalPlayer.Character.Humanoid.JumpPower = jumpPower
		end
	end
})
addDropdownData.Player:AddParagraph({
	Title = "Tips",
	Content = "- NoClip disables on reset or jump.\n- Infinite Jump works by holding space.\n- Use Click to Teleport carefully."
})
game:GetService("UserInputService").JumpRequest:Connect(function()
	if flag and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if capturedFlag and input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessed then
		local Mouse = game.Players.LocalPlayer:GetMouse()
		local LocalPlayer = game.Players.LocalPlayer

		if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.p)
		end
	end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local updateFillColorData = nil
local capturedK = nil
local secondaryCapturedK = nil
local alternateCapturedK = nil
local secondaryFlag = false
local alternateFlag = false
local additionalFlag = false
local createRoleTagData = {}

local function fromRgb(updateInstancePropertiesOption)
	if updateInstancePropertiesOption ~= "Murderer" then
		if updateInstancePropertiesOption ~= "Sheriff" then
			if updateInstancePropertiesOption ~= "Hero" then
				return Color3.fromRGB(0, 225, 0)
			end

			return Color3.fromRGB(255, 250, 0)
		end

		return Color3.fromRGB(0, 0, 225)
	end

	return Color3.fromRGB(225, 0, 0)
end
local function handleTextLabel(updateInstancePropertiesOption)
	if updateInstancePropertiesOption ~= "Murderer" then
		if updateInstancePropertiesOption ~= "Sheriff" then
			if updateInstancePropertiesOption ~= "Hero" then
				return "Innocent"
			end

			return "Hero"
		end

		return "Sheriff"
	end

	return "Murderer"
end
local function createHighlight(secondaryPlayer)
	if secondaryPlayer ~= LocalPlayer and secondaryPlayer.Character and not secondaryPlayer.Character:FindFirstChild("Highlight") then
		Instance.new("Highlight", secondaryPlayer.Character)
	end
end
local function updateFillColor(secondaryPlayer)
	local updateFillColorCondition = secondaryPlayer.Character and secondaryPlayer.Character:FindFirstChild("Highlight")

	if updateFillColorCondition then
		local updateFillColorOption = updateFillColorData and updateFillColorData[secondaryPlayer.Name]

		updateFillColorCondition.FillColor = fromRgb(updateFillColorOption and updateFillColorOption.Role)
	end
end
local function cleanup(secondaryPlayer)
	if secondaryPlayer.Character then
		local Highlight = secondaryPlayer.Character:FindFirstChild("Highlight")

		if Highlight then
			Highlight:Destroy()
		end
	end
end
local function createRoleTag(secondaryPlayer)
	if secondaryPlayer ~= LocalPlayer and secondaryPlayer.Character and secondaryPlayer.Character:FindFirstChild("Head") then
		if createRoleTagData[secondaryPlayer] then
			createRoleTagData[secondaryPlayer]:Destroy()
		end

		local BillboardGui = Instance.new("BillboardGui")

		BillboardGui.Name = "RoleTag"
		BillboardGui.Adornee = secondaryPlayer.Character.Head
		BillboardGui.Size = UDim2.new(0, 100, 0, 30)
		BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.Parent = secondaryPlayer.Character

		local TextLabel = Instance.new("TextLabel")

		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.BackgroundTransparency = 1
		TextLabel.TextStrokeTransparency = 0.2
		TextLabel.TextScaled = true
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Parent = BillboardGui
		createRoleTagData[secondaryPlayer] = BillboardGui
	end
end
local function updateInstanceProperties(secondaryPlayer)
	if secondaryPlayer ~= LocalPlayer and secondaryPlayer.Character and secondaryPlayer.Character:FindFirstChild("RoleTag") then
		local TextLabel = secondaryPlayer.Character.RoleTag:FindFirstChildOfClass("TextLabel")

		if TextLabel then
			local updateInstancePropertiesOption = updateFillColorData and updateFillColorData[secondaryPlayer.Name]
			local textLabelOption = updateInstancePropertiesOption and updateInstancePropertiesOption.Role or "Innocent"

			TextLabel.Text = "[" .. handleTextLabel(textLabelOption) .. "]"
			TextLabel.TextColor3 = fromRgb(textLabelOption)
		end
	end
end
local function secondaryCleanup(cleanupArgument)
	if createRoleTagData[cleanupArgument] then
		createRoleTagData[cleanupArgument]:Destroy()
		createRoleTagData[cleanupArgument] = nil
	end
end
local function createDistanceLabel(secondaryPlayer)
	if secondaryPlayer ~= LocalPlayer and secondaryPlayer.Character and secondaryPlayer.Character:FindFirstChild("HumanoidRootPart") and not secondaryPlayer.Character:FindFirstChild("DistanceLabel") then
		local BillboardGui = Instance.new("BillboardGui")

		BillboardGui.Name = "DistanceLabel"
		BillboardGui.Adornee = secondaryPlayer.Character.HumanoidRootPart
		BillboardGui.Size = UDim2.new(0, 100, 0, 30)
		BillboardGui.StudsOffset = Vector3.new(0, -3, 0)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.Parent = secondaryPlayer.Character

		local TextLabel = Instance.new("TextLabel")

		TextLabel.Name = "DistanceText"
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.BackgroundTransparency = 1
		TextLabel.TextColor3 = Color3.new(1, 1, 1)
		TextLabel.TextStrokeTransparency = 0.5
		TextLabel.TextScaled = true
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Parent = BillboardGui
	end
end
local function updateText(secondaryPlayer)
	if secondaryPlayer ~= LocalPlayer and secondaryPlayer.Character and secondaryPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local DistanceLabel = secondaryPlayer.Character:FindFirstChild("DistanceLabel")

		if DistanceLabel then
			local DistanceText = DistanceLabel:FindFirstChild("DistanceText")

			if DistanceText and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - secondaryPlayer.Character.HumanoidRootPart.Position).Magnitude

				DistanceText.Text = string.format("Distance: %d", math.floor(Magnitude))
			end
		end
	end
end
local function alternateCleanup(secondaryPlayer)
	if secondaryPlayer.Character then
		local DistanceLabel = secondaryPlayer.Character:FindFirstChild("DistanceLabel")

		if DistanceLabel then
			DistanceLabel:Destroy()
		end
	end
end

addDropdownData.Visual:AddToggle("HighlightToggle", {
	Title = "Role Highlight",
	Description = "Highlights players by their role.",
	Default = false
}):OnChanged(function(flag)
	secondaryFlag = flag

	for _, player in ipairs(Players:GetPlayers()) do
		if not flag then
			cleanup(player)
		end
	end
end)
addDropdownData.Visual:AddToggle("RoleTagToggle", {
	Title = "Role Tags",
	Description = "Shows a tag above each player's head with their role.",
	Default = false
}):OnChanged(function(flag)
	additionalFlag = flag

	if not flag then
		for k, _ in pairs(createRoleTagData) do
			secondaryCleanup(k)
		end

		createRoleTagData = {}
	end
end)
addDropdownData.Visual:AddToggle("DistanceToggle", {
	Title = "Distance Labels",
	Description = "Displays the distance to each player.",
	Default = false
}):OnChanged(function(flag)
	alternateFlag = flag

	if not flag then
		for _, player in ipairs(Players:GetPlayers()) do
			alternateCleanup(player)
		end
	end
end)
addDropdownData.Visual:AddParagraph({
	Title = "Tips",
	Content = "- Only one highlight per player is shown.\n- Role tags and distance labels are visible for all except yourself."
})
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if additionalFlag then
			task.wait(1)
			createRoleTag(player)
		end

		if alternateFlag then
			task.wait(1)
			createDistanceLabel(player)
		end
	end)
end)

for _, player in ipairs(Players:GetPlayers()) do
	player.CharacterAdded:Connect(function()
		if additionalFlag then
			task.wait(1)
			createRoleTag(player)
		end

		if alternateFlag then
			task.wait(1)
			createDistanceLabel(player)
		end
	end)
end

RunService.RenderStepped:Connect(function()
	local GetPlayerData = ReplicatedStorage:FindFirstChild("GetPlayerData", true)

	if GetPlayerData then
		updateFillColorData = GetPlayerData:InvokeServer()
		alternateCapturedK = nil
		secondaryCapturedK = nil
		capturedK = nil

		for k, item in pairs(updateFillColorData) do
			if item.Role ~= "Murderer" then
				if item.Role ~= "Sheriff" then
					if item.Role == "Hero" then
						alternateCapturedK = k
					end
				else
					secondaryCapturedK = k
				end
			else
				capturedK = k
			end
		end
	end

	if secondaryFlag then
		for _, player in ipairs(Players:GetPlayers()) do
			createHighlight(player)
			updateFillColor(player)
		end
	end

	if additionalFlag then
		for _, player in ipairs(Players:GetPlayers()) do
			createRoleTag(player)
			updateInstanceProperties(player)
		end
	end

	if alternateFlag then
		for _, player in ipairs(Players:GetPlayers()) do
			createDistanceLabel(player)
			updateText(player)
		end
	end
end)
addDropdownData.Target:AddSection("Spectate")

local function handleAddDropdown()
	local playerNames = { "No one selected" }

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			table.insert(playerNames, player.Name)
		end
	end

	return playerNames
end

local addDropdown = addDropdownData.Target:AddDropdown("SpectateDropdown", {
	Title = "Spectate Player",
	Values = handleAddDropdown(),
	Multi = false,
	Default = 1
})
local capturedFirstChild = nil
local CurrentCamera = workspace.CurrentCamera

addDropdown:OnChanged(function(argument)
	if argument ~= "No one selected" then
		local firstChild = Players:FindFirstChild(argument)

		if firstChild and firstChild.Character and firstChild.Character:FindFirstChild("Humanoid") then
			capturedFirstChild = firstChild
			CurrentCamera.CameraSubject = firstChild.Character.Humanoid
		end

		return
	end

	CurrentCamera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer.Character
	capturedFirstChild = nil
end)
Players.PlayerAdded:Connect(function()
	addDropdown:SetValues(handleAddDropdown())
end)
Players.PlayerRemoving:Connect(function()
	addDropdown:SetValues(handleAddDropdown())

	if capturedFirstChild and not Players:FindFirstChild(capturedFirstChild.Name) then
		CurrentCamera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer.Character
		capturedFirstChild = nil
	end
end)
addDropdownData.Target:AddSection("Teleports")

local secondaryAddDropdown = addDropdownData.Target:AddDropdown("TeleportDropdown", {
	Title = "Teleport to Player",
	Values = handleAddDropdown(),
	Multi = false,
	Default = 1
})
local confirmTeleportText = nil

secondaryAddDropdown:OnChanged(function(text)
	if text ~= "No one selected" then
		confirmTeleportText = text
	else
		confirmTeleportText = nil
	end
end)
addDropdownData.Target:AddButton({
	Title = "Confirm Teleport",
	Description = "Teleport to the selected player.",
	Callback = function()
		if confirmTeleportText and confirmTeleportText ~= "No one selected" then
			local firstChild = Players:FindFirstChild(confirmTeleportText)

			if not firstChild or not firstChild.Character or not firstChild.Character:FindFirstChild("HumanoidRootPart") or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				fluent:Notify({
					Title = "Teleport Failed",
					Content = "Could not teleport to the selected player.",
					Duration = 4
				})
			else
				LocalPlayer.Character.HumanoidRootPart.CFrame = firstChild.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
				fluent:Notify({
					Title = "Teleported!",
					Content = "You have been teleported to " .. confirmTeleportText .. ".",
					Duration = 4
				})
			end

			return
		end

		fluent:Notify({
			Title = "Teleport Failed",
			Content = "Please select a player to teleport to.",
			Duration = 4
		})
	end
})
Players.PlayerAdded:Connect(function()
	secondaryAddDropdown:SetValues(handleAddDropdown())
end)
Players.PlayerRemoving:Connect(function()
	secondaryAddDropdown:SetValues(handleAddDropdown())
end)
saveManager:SetLibrary(fluent)
interfaceManager:SetLibrary(fluent)
saveManager:IgnoreThemeSettings()
saveManager:SetIgnoreIndexes({})
interfaceManager:SetFolder("FluentScriptHub")
saveManager:SetFolder("FluentScriptHub/specific-game")
interfaceManager:BuildInterfaceSection(addDropdownData.Settings)
saveManager:BuildConfigSection(addDropdownData.Settings)
window:SelectTab(1)
saveManager:LoadAutoloadConfig()
