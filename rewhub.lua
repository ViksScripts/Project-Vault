-- This file was deobfusctated/pasted by Lame (special thanks to project vault)

if not getgenv().RewHubLoaded then
	local LocalPlayer, windUi, ReplicatedStorage, loadFileState, uiLibrary, tag, number, characterTabData, Lighting, FogColor, FogStart, FogEnd, enableFogFlag, fogColor, updateInstancePropertiesNumber, fogStartNumber, fogEndNumber, updateFog, handleFog, parent, enableCustomSkyFlag, tintColor, colorCorrectionEffect, createColorCorrectionEffect, cleanup, handleCustomSky, tintColorData

	do
		do
			do
				local replicatedStorage, Players, localValuePlayer, highlightSheriffData, updateTextData, capturedK, secondaryCapturedK, alternateCapturedK, capturedResult, espGunDropFlag, createNameTagData, createHighlight, isUpdateInstancePropertiesValid, sendGetPlayerData, updateInstanceProperties, data, createGunDropHighlight, cleanup, handleEspGunDrop, createNameTag, handler, updateText, capturedFieldOfView, updateFieldOfView

				do
					do
						do
							do
								local players

								do
									getgenv().RewHubLoaded = true
									LocalPlayer = game:GetService("Players").LocalPlayer

									repeat
										task.wait()
									until LocalPlayer:FindFirstChild("PlayerGui")

									windUi = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
									players = game:GetService("Players")
									game:GetService("RunService")
									game:GetService("ReplicatedStorage")

									local _ = game:GetService("Workspace").CurrentCamera
								end

								local _ = players.LocalPlayer
							end

							game:GetService("CoreGui")
							ReplicatedStorage = game:GetService("ReplicatedStorage")

							function gradient(self, secondaryArgument, tertiaryArgument)
								local textPrefix = ""
								local quotientNumber = #self

								for i = 1, quotientNumber do
									local quotient = (i - 1) / math.max(quotientNumber - 1, 1)

									textPrefix = textPrefix .. "<font color=\"rgb(" .. math.floor((secondaryArgument.R + (tertiaryArgument.R - secondaryArgument.R) * quotient) * 255) .. ", " .. math.floor((secondaryArgument.G + (tertiaryArgument.G - secondaryArgument.G) * quotient) * 255) .. ", " .. math.floor((secondaryArgument.B + (tertiaryArgument.B - secondaryArgument.B) * quotient) * 255) .. ")\">" .. self:sub(i, i) .. "</font>"
								end

								return textPrefix
							end

							windUi:Notify({
								Title = gradient("RewHub", Color3.fromHex("#ff00cc"), Color3.fromHex("#3333ff")),
								Content = gradient("Script successfully loaded!", Color3.fromHex("#00ffcc"), Color3.fromHex("#00ff66")),
								Icon = "check-circle",
								Duration = 3
							})
							loadFileState = (function()
								local susSound = ReplicatedStorage:FindFirstChild("susSound")

								if not susSound then
									susSound = Instance.new("Sound")
									susSound.Name = "susSound"
									susSound.SoundId = "rbxassetid://7604568885"
									susSound.Parent = ReplicatedStorage
								end

								return susSound
							end)()

							local players = game:GetService("Players")
							local _, _ = players:GetUserThumbnailAsync(players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
						end

						uiLibrary = windUi:CreateWindow({
							Title = gradient("RewHub [Helloween Update]", Color3.fromHex("e8971e"), Color3.fromHex("c44e0a")),
							Icon = "geist:window",
							Author = "by Light",
							Folder = "WindUI",
							Size = UDim2.fromOffset(320, 290),
							Theme = "Dark",
							User = {
								Enabled = true,
								Anonymous = true,
								Callback = function()
									windUi:Notify({
										Title = "User Profile",
										Content = "User profile clicked!",
										Duration = 3
									})
								end
							},
							Acrylic = true,
							HideSearchBar = false,
							SideBarWidth = 200
						})
						uiLibrary:EditOpenButton({
							Title = "Open UI",
							Icon = "monitor",
							CornerRadius = UDim.new(2, 6),
							StrokeThickness = 2,
							Color = ColorSequence.new(Color3.fromHex("6600ff"), Color3.fromHex("00ccff")),
							Draggable = true
						})
						tag = uiLibrary:Tag({
							Title = "--:--",
							Radius = 0,
							Color = windUi:Gradient({
								["0"] = {
									Color = Color3.fromHex("#FF0F7B"),
									Transparency = 0
								},
								["100"] = {
									Color = Color3.fromHex("#F89B29"),
									Transparency = 0
								}
							}, {
								Rotation = 45
							})
						})
						number = 0
						task.spawn(function()
							while true do
								local dateResult = os.date("*t")
								local text = string.format("%02d", dateResult.hour)
								local secondaryText = string.format("%02d", dateResult.min)

								number = (number + 0.01) % 1
								Color3.fromHSV(number, 1, 1)
								tag:SetTitle(text .. ":" .. secondaryText)
								task.wait(0.06)
							end
						end)
						uiLibrary:CreateTopbarButton("theme-switcher", "moon", function()
							windUi:SetTheme(windUi:GetCurrentTheme() == "Dark" and "Light" or "Dark")
							windUi:Notify({
								Title = "Theme Changed",
								Content = "Current theme: " .. windUi:GetCurrentTheme(),
								Duration = 2
							})
						end, 990)
						characterTabData = {
							MainTab = uiLibrary:Tab({
								Title = "MAIN",
								Icon = "terminal"
							}),
							Divider = uiLibrary:Divider(),
							VisualTab = uiLibrary:Tab({
								Title = "Visual",
								Icon = "eye"
							}),
							CharacterTab = uiLibrary:Tab({
								Title = "Character",
								Icon = "user"
							}),
							TeleportTab = uiLibrary:Tab({
								Title = "Teleport",
								Icon = "arrow-right"
							}),
							CombatTab = uiLibrary:Tab({
								Title = "Combat",
								Icon = "sword"
							}),
							TrollingTab = uiLibrary:Tab({
								Title = "Trolling",
								Icon = "smile-plus"
							}),
							AutoFarmTab = uiLibrary:Tab({
								Title = "AutoFarm",
								Icon = "calculator"
							}),
							AnimationsTab = uiLibrary:Tab({
								Title = "Animations",
								Icon = "ghost"
							}),
							SpectatorTab = uiLibrary:Tab({
								Title = "Spectator",
								Icon = "camera"
							}),
							OtherTab = uiLibrary:Tab({
								Title = "Other",
								Icon = "file-cog"
							}),
							ServerTab = uiLibrary:Tab({
								Title = "Server",
								Icon = "aperture"
							}),
							Divider2 = uiLibrary:Divider(),
							SettingsTab = uiLibrary:Tab({
								Title = "Settings",
								Icon = "settings"
							})
						}
						replicatedStorage = game:GetService("ReplicatedStorage")
						Players = game:GetService("Players")

						local RunService = game:GetService("RunService")

						localValuePlayer = Players.LocalPlayer
						highlightSheriffData = {
							HighlightMurderer = false,
							HighlightInnocent = false,
							HighlightSheriff = false
						}
						updateTextData = {
							Enabled = false,
							TextSize = 14,
							ShowDistance = true
						}
						capturedK = nil
						secondaryCapturedK = nil
						alternateCapturedK = nil
						capturedResult = {}
						espGunDropFlag = false
						createNameTagData = {}

						function createHighlight(player)
							if player ~= localValuePlayer then
								if player.Character then
									local Highlight = player.Character:FindFirstChild("Highlight")

									if not Highlight then
										Highlight = Instance.new("Highlight")
										Highlight.Name = "Highlight"
										Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
										Highlight.Adornee = player.Character
										Highlight.Parent = player.Character
									end

									return Highlight
								end

								return nil
							end

							return nil
						end
						function isUpdateInstancePropertiesValid(player)
							for k, item in pairs(capturedResult) do
								if k == player.Name then
									return not item.Killed and not item.Dead
								end
							end

							return false
						end
						function sendGetPlayerData()
							local ok, result = pcall(function()
								return replicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
							end)

							if ok and type(result) == "table" then
								capturedResult = result
								alternateCapturedK = nil
								secondaryCapturedK = nil
								capturedK = nil

								for k, item in pairs(capturedResult) do
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
						end
						function updateInstanceProperties()
							for _, player in ipairs(Players:GetPlayers()) do
								if player ~= localValuePlayer then
									local updateInstancePropertiesCondition = createHighlight(player)

									if updateInstancePropertiesCondition then
										local enabled = false
										local fillColor = Color3.new(1, 1, 1)

										if not highlightSheriffData.HighlightMurderer or player.Name ~= capturedK or not isUpdateInstancePropertiesValid(player) then
											if not highlightSheriffData.HighlightSheriff or player.Name ~= secondaryCapturedK or not isUpdateInstancePropertiesValid(player) then
												if not highlightSheriffData.HighlightSheriff or player.Name ~= alternateCapturedK or not isUpdateInstancePropertiesValid(player) or secondaryCapturedK and isUpdateInstancePropertiesValid(Players[secondaryCapturedK]) then
													if highlightSheriffData.HighlightInnocent and isUpdateInstancePropertiesValid(player) and player.Name ~= capturedK and player.Name ~= secondaryCapturedK and player.Name ~= alternateCapturedK then
														fillColor = Color3.fromRGB(0, 255, 0)
														enabled = true
													end
												else
													fillColor = Color3.fromRGB(255, 255, 0)
													enabled = true
												end
											else
												fillColor = Color3.fromRGB(0, 0, 255)
												enabled = true
											end
										else
											fillColor = Color3.fromRGB(255, 0, 0)
											enabled = true
										end

										if not enabled then
											fillColor = Color3.fromRGB(169, 169, 169)
											enabled = true
										end

										updateInstancePropertiesCondition.Enabled = enabled
										updateInstancePropertiesCondition.FillColor = fillColor
										updateInstancePropertiesCondition.OutlineColor = fillColor
									end
								end
							end
						end

						RunService.Heartbeat:Connect(function()
							sendGetPlayerData()
							updateInstanceProperties()
						end)
					end

					data = {
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
						"Office3"
					}

					function createGunDropHighlight(parent)
						if parent and not parent:FindFirstChild("GunDropHighlight") then
							local Highlight = Instance.new("Highlight")

							Highlight.Name = "GunDropHighlight"
							Highlight.FillColor = Color3.fromRGB(0, 255, 255)
							Highlight.OutlineColor = Color3.fromRGB(0, 128, 128)
							Highlight.Adornee = parent
							Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
							Highlight.Parent = parent
						end
					end
					function cleanup(gunDropHighlightContainer)
						if gunDropHighlightContainer and gunDropHighlightContainer:FindFirstChild("GunDropHighlight") then
							gunDropHighlightContainer.GunDropHighlight:Destroy()
						end
					end
					function handleEspGunDrop()
						for _, item in ipairs(data) do
							local firstChild = workspace:FindFirstChild(item)

							if firstChild then
								local GunDrop = firstChild:FindFirstChild("GunDrop")

								if GunDrop then
									if not espGunDropFlag then
										cleanup(GunDrop)
									else
										createGunDropHighlight(GunDrop)
									end
								end
							end
						end
					end

					task.spawn(function()
						while true do
							handleEspGunDrop()
							task.wait(2)
						end
					end)

					function createNameTag(player)
						if player ~= localValuePlayer then
							if createNameTagData[player] then
								createNameTagData[player].gui:Destroy()
								createNameTagData[player] = nil
							end

							local Character = player.Character

							if Character then
								local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart then
									local BillboardGui = Instance.new("BillboardGui")
									local TextLabel = Instance.new("TextLabel")

									BillboardGui.Name = "NameTag"
									BillboardGui.Adornee = HumanoidRootPart
									BillboardGui.Size = UDim2.new(0, 200, 0, 50)
									BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
									BillboardGui.AlwaysOnTop = true
									BillboardGui.MaxDistance = 1000
									BillboardGui.Parent = Character
									TextLabel.Name = "Label"
									TextLabel.Size = UDim2.new(1, 0, 1, 0)
									TextLabel.BackgroundTransparency = 1
									TextLabel.TextStrokeTransparency = 0.5
									TextLabel.TextColor3 = Color3.new(1, 1, 1)
									TextLabel.TextSize = updateTextData.TextSize
									TextLabel.Font = Enum.Font.GothamBold
									TextLabel.Parent = BillboardGui
									createNameTagData[player] = {
										gui = BillboardGui
									}

									return
								end

								return
							end

							return
						end
					end
					function handler(player)
						if createNameTagData[player] then
							if createNameTagData[player].gui then
								createNameTagData[player].gui:Destroy()
							end

							createNameTagData[player] = nil
						end
					end
					function updateText(player)
						local updateTextFlag = createNameTagData[player]

						if updateTextFlag and updateTextFlag.gui then
							local Character = player.Character

							if Character then
								local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
								local updateTextOption = localValuePlayer.Character and localValuePlayer.Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart and updateTextOption then
									local Magnitude = (HumanoidRootPart.Position - updateTextOption.Position).Magnitude

									if not updateTextData.ShowDistance then
										updateTextFlag.gui.Label.Text = player.Name
									else
										updateTextFlag.gui.Label.Text = string.format("%s [%d]", player.Name, math.floor(Magnitude))
									end

									return
								end

								updateTextFlag.gui.Label.Text = player.Name

								return
							end

							return
						end
					end

					task.spawn(function()
						while true do
							task.wait(0.5)

							if not updateTextData.Enabled then
								for k in pairs(createNameTagData) do
									handler(k)
								end
							else
								for _, player in ipairs(Players:GetPlayers()) do
									if player ~= localValuePlayer then
										local Character = player.Character
										local expectedMembership = Character and Character:FindFirstChild("HumanoidRootPart")

										if not expectedMembership then
											handler(player)
										else
											if not createNameTagData[player] or not createNameTagData[player].gui or expectedMembership ~= createNameTagData[player].gui.Adornee then
												createNameTag(player)
											end

											updateText(player)
										end
									end
								end

								for k in pairs(createNameTagData) do
									if not Players:FindFirstChild(k.Name) then
										handler(k)
									end
								end
							end
						end
					end)
					characterTabData.VisualTab:Section({
						Title = gradient("ESP", Color3.fromHex("#ff0000"), Color3.fromHex("#660000"))
					})
					characterTabData.VisualTab:Toggle({
						Title = "ESP Murderer",
						Default = highlightSheriffData.HighlightMurderer,
						Callback = function(highlightMurderer)
							highlightSheriffData.HighlightMurderer = highlightMurderer
						end
					})
					characterTabData.VisualTab:Toggle({
						Title = "ESP Sheriff",
						Default = highlightSheriffData.HighlightSheriff,
						Callback = function(highlightSheriff)
							highlightSheriffData.HighlightSheriff = highlightSheriff
						end
					})
					characterTabData.VisualTab:Toggle({
						Title = "ESP Innocent",
						Default = highlightSheriffData.HighlightInnocent,
						Callback = function(highlightInnocent)
							highlightSheriffData.HighlightInnocent = highlightInnocent
						end
					})
					characterTabData.VisualTab:Toggle({
						Title = "ESP Gun Drop",
						Default = false,
						Callback = function(flag)
							espGunDropFlag = flag
							handleEspGunDrop()
						end
					})
					characterTabData.VisualTab:Button({
						Title = "Force Update ESP",
						Callback = function()
							for _, player in ipairs(Players:GetPlayers()) do
								local forceUpdateEspCondition = player.Character and player.Character:FindFirstChild("Highlight")

								if forceUpdateEspCondition then
									forceUpdateEspCondition:Destroy()
								end
							end
						end
					})
					characterTabData.VisualTab:Section({
						Title = gradient("Nicknames", Color3.fromHex("#00ffcc"), Color3.fromHex("#0066ff"))
					})
					characterTabData.VisualTab:Toggle({
						Title = "Show Nicknames",
						Default = updateTextData.Enabled,
						Callback = function(enabled)
							updateTextData.Enabled = enabled
						end
					})
					characterTabData.VisualTab:Slider({
						Title = "Nickname size",
						Value = {
							Min = 8,
							Max = 32,
							Default = updateTextData.TextSize
						},
						Callback = function(textSize)
							updateTextData.TextSize = textSize

							for _, item in pairs(createNameTagData) do
								if item.gui and item.gui.Label then
									item.gui.Label.TextSize = textSize
								end
							end
						end
					})
					characterTabData.VisualTab:Section({
						Title = gradient("Other", Color3.fromHex("#4a47de"), Color3.fromHex("#4795de"))
					})

					local players = game:GetService("Players")
					local RunService = game:GetService("RunService")
					local _ = players.LocalPlayer

					capturedFieldOfView = 70

					function updateFieldOfView(fieldOfView)
						local CurrentCamera = workspace.CurrentCamera

						if CurrentCamera then
							CurrentCamera.FieldOfView = fieldOfView
						end

						capturedFieldOfView = fieldOfView
					end

					RunService.RenderStepped:Connect(function()
						local CurrentCamera = workspace.CurrentCamera

						if CurrentCamera and CurrentCamera.FieldOfView ~= capturedFieldOfView then
							CurrentCamera.FieldOfView = capturedFieldOfView
						end
					end)
				end

				characterTabData.VisualTab:Slider({
					Title = "FOV",
					Step = 1,
					Value = {
						Min = 40,
						Max = 120,
						Default = 70
					},
					Callback = function(fieldOfView)
						updateFieldOfView(fieldOfView)
					end
				})

				local secondaryLocalValuePlayer = game:GetService("Players").LocalPlayer
				local cameraMaxZoomDistance = 12
				local secondaryCameraMaxZoomDistance = 1000

				local function updateCameraMaxZoomDistance(flag)
					if not flag then
						secondaryLocalValuePlayer.CameraMaxZoomDistance = cameraMaxZoomDistance
					else
						secondaryLocalValuePlayer.CameraMaxZoomDistance = secondaryCameraMaxZoomDistance
					end
				end

				characterTabData.VisualTab:Toggle({
					Title = "Infinite Camera Zoom",
					Desc = "",
					Default = true,
					Callback = function(infiniteCameraZoomFlag)
						updateCameraMaxZoomDistance(infiniteCameraZoomFlag)
					end
				})

				local Workspace = game:GetService("Workspace")
				local alternateLocalValuePlayer = game:GetService("Players").LocalPlayer
				local CurrentCamera = Workspace.CurrentCamera
				local localValueTransparencyModifier = 0.5
				local updateInstancePropertiesFlag = false
				local secondaryData = {}

				local function updateLocalTransparencyModifier(localValueTransparencyModifierFlag)
					if localValueTransparencyModifierFlag and localValueTransparencyModifierFlag:IsA("BasePart") then
						if not secondaryData[localValueTransparencyModifierFlag] then
							secondaryData[localValueTransparencyModifierFlag] = localValueTransparencyModifierFlag.LocalTransparencyModifier
							localValueTransparencyModifierFlag.LocalTransparencyModifier = localValueTransparencyModifier
						end

						return
					end
				end
				local function secondaryUpdateTransparencyModifier()
					for k, item in pairs(secondaryData) do
						if k and k:IsA("BasePart") then
							k.LocalTransparencyModifier = item or 0
						end
					end

					table.clear(secondaryData)
				end
				local function updateCameraNoclip()
					while updateInstancePropertiesFlag do
						secondaryUpdateTransparencyModifier()

						local updateCameraNoclipCondition = alternateLocalValuePlayer.Character and alternateLocalValuePlayer.Character:FindFirstChild("HumanoidRootPart")

						if updateCameraNoclipCondition then
							local raycastParams = RaycastParams.new()

							raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
							raycastParams.FilterDescendantsInstances = { alternateLocalValuePlayer.Character }

							local updateCameraNoclipNumber = updateCameraNoclipCondition.Position - CurrentCamera.CFrame.Position
							local raycastResult = Workspace:Raycast(CurrentCamera.CFrame.Position, updateCameraNoclipNumber, raycastParams)

							if raycastResult and raycastResult.Instance and raycastResult.Instance:IsA("BasePart") then
								updateLocalTransparencyModifier(raycastResult.Instance)
							end
						end

						task.wait(0.05)
					end

					secondaryUpdateTransparencyModifier()
				end

				characterTabData.VisualTab:Toggle({
					Title = "Camera Noclip",
					Desc = "This function does not work very well",
					Default = false,
					Callback = function(cameraNoclipFlag)
						updateInstancePropertiesFlag = cameraNoclipFlag

						if not cameraNoclipFlag then
							secondaryUpdateTransparencyModifier()
						else
							task.spawn(updateCameraNoclip)
						end
					end
				})
			end

			characterTabData.VisualTab:Section({
				Title = gradient("Visual World", Color3.fromHex("#4aa9b0"), Color3.fromHex("#a7b04a"))
			})
			Lighting = game:GetService("Lighting")
			FogColor = Lighting.FogColor
			FogStart = Lighting.FogStart
			FogEnd = Lighting.FogEnd
			enableFogFlag = false
			fogColor = Color3.fromHex("#3985db")
			updateInstancePropertiesNumber = 50
			fogStartNumber = 50
			fogEndNumber = 1000

			function updateFog()
				if not enableFogFlag then
					Lighting.FogColor = FogColor
					Lighting.FogStart = FogStart
					Lighting.FogEnd = FogEnd
				else
					Lighting.FogColor = fogColor

					local fogStart = math.max(0, fogStartNumber)
					local updateFogNumber = math.max(fogEndNumber - (fogStart + 60), 1)
					local fogEnd = fogEndNumber - math.floor(updateInstancePropertiesNumber / 100 * updateFogNumber)

					if fogEnd <= fogStart + 10 then
						fogEnd = fogStart + 10
					end

					Lighting.FogStart = fogStart
					Lighting.FogEnd = fogEnd
				end
			end
			function handleFog(title, content)
				if type(windUi) == "table" and type(windUi.Notify) == "function" then
					pcall(function()
						windUi:Notify({
							Title = title,
							Content = content,
							Duration = 2
						})
					end)
				end
			end

			local function handler(maxArgument)
				if characterTabData and characterTabData.VisualTab and type(characterTabData.VisualTab.Slider) == "function" then
					local flag = false

					pcall(function()
						local sliderConfig = {
							Title = maxArgument.Title,
							Step = maxArgument.Step or 1,
							Value = {
								Min = maxArgument.Min or (maxArgument.ValueMin or 0),
								Max = maxArgument.Max or (maxArgument.ValueMax or 100),
								Default = maxArgument.Default or (maxArgument.Value or 0)
							},
							Callback = maxArgument.Callback
						}

						characterTabData.VisualTab:Slider(sliderConfig)
						flag = true
					end)

					if not flag then
						local flag = false

						pcall(function()
							local sliderConfig = {
								Title = maxArgument.Title,
								Min = maxArgument.Min or 0,
								Max = maxArgument.Max or 100,
								Value = maxArgument.Value or (maxArgument.Default or 0),
								Callback = maxArgument.Callback
							}

							characterTabData.VisualTab:Slider(sliderConfig)
							flag = true
						end)

						return flag
					end

					return true
				end

				return false
			end;

			(function(argument)
				if characterTabData and characterTabData.VisualTab and type(characterTabData.VisualTab.Colorpicker) == "function" then
					local ok, _ = pcall(function()
						characterTabData.VisualTab:Colorpicker(argument)
					end)

					if ok then
						return true
					end

					return false
				end

				return false
			end)({
				Title = "Fog Color",
				Default = fogColor,
				Transparency = 0,
				Callback = function(fogColorFlag, _)
					fogColor = fogColorFlag or fogColor
					handleFog("Fog Color Changed", "New color: " .. (fogColor and (fogColor:ToHex() or tostring(fogColor)) or "unknown"))

					if enableFogFlag then
						updateFog()
					end
				end
			});
			(function(argument)
				if characterTabData and characterTabData.VisualTab and type(characterTabData.VisualTab.Toggle) == "function" then
					local ok, _ = pcall(function()
						characterTabData.VisualTab:Toggle(argument)
					end)

					if ok then
						return true
					end

					return false
				end

				return false
			end)({
				Title = "Enable Fog",
				Default = enableFogFlag,
				Callback = function(flag)
					enableFogFlag = flag and true or false
					updateFog()
					handleFog("Fog", flag and "Enabled" or "Disabled")
				end
			})
			handler({
				Title = "Fog Intensity",
				Step = 1,
				Min = 0,
				Max = 100,
				Default = updateInstancePropertiesNumber,
				Value = updateInstancePropertiesNumber,
				Callback = function(numberText)
					local clampedValueNumber = tonumber(numberText) or 0

					updateInstancePropertiesNumber = math.clamp(clampedValueNumber, 0, 100)

					if enableFogFlag then
						updateFog()
					end
				end
			})
			handler({
				Title = "Fog Start Offset",
				Step = 1,
				Min = 0,
				Max = 200,
				Default = fogStartNumber,
				Value = fogStartNumber,
				Callback = function(numberText)
					local fogStartOffsetNumber = tonumber(numberText) or 0

					fogStartNumber = math.max(0, fogStartOffsetNumber)

					if enableFogFlag then
						updateFog()
					end
				end
			})
			updateFog()

			function _G.__RestoreFogDefaults()
				Lighting.FogColor = FogColor
				Lighting.FogStart = FogStart
				Lighting.FogEnd = FogEnd
			end

			parent = game:GetService("Lighting")
			enableCustomSkyFlag = false
			tintColor = Color3.fromHex("#30a8ff")
			colorCorrectionEffect = nil

			function createColorCorrectionEffect()
				if not colorCorrectionEffect then
					colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
					colorCorrectionEffect.Parent = parent
				end

				colorCorrectionEffect.TintColor = tintColor
			end
			function cleanup()
				if not enableCustomSkyFlag then
					if colorCorrectionEffect then
						colorCorrectionEffect:Destroy()
						colorCorrectionEffect = nil
					end
				else
					createColorCorrectionEffect()
				end
			end
			function handleCustomSky(title, content)
				if type(windUi) == "table" and type(windUi.Notify) == "function" then
					pcall(function()
						windUi:Notify({
							Title = title,
							Content = content,
							Duration = 2
						})
					end)
				end
			end

			tintColorData = {
				["Sky Blue"] = "#30a8ff",
				["Sunset Orange"] = "#ff5733",
				["Lime Green"] = "#33ff57",
				["Hot Pink"] = "#ff33a8",
				["Purple Haze"] = "#a833ff",
				["Deep Red"] = "#990000",
				Gold = "#ffd700",
				Cyan = "#00ffff",
				Magenta = "#ff00ff",
				["Dark Gray"] = "#555555",
				["Light Gray"] = "#aaaaaa",
				["Forest Green"] = "#228b22",
				["Midnight Blue"] = "#191970",
				Orange = "#ffa500",
				Yellow = "#ffff00"
			};
			(function(argument)
				if characterTabData and characterTabData.VisualTab and type(characterTabData.VisualTab.Toggle) == "function" then
					pcall(function()
						characterTabData.VisualTab:Toggle(argument)
					end)
				end
			end)({
				Title = "Enable Custom Sky",
				Default = enableCustomSkyFlag,
				Callback = function(cleanupFlag)
					enableCustomSkyFlag = cleanupFlag
					cleanup()
					handleCustomSky("Custom Sky", cleanupFlag and "Enabled" or "Disabled")
				end
			});
			(function(argument)
				if characterTabData and characterTabData.VisualTab and type(characterTabData.VisualTab.Dropdown) == "function" then
					pcall(function()
						characterTabData.VisualTab:Dropdown(argument)
					end)
				end
			end)({
				Title = "Select Sky Color",
				Values = (function()
					local ks = {}

					for k, _ in pairs(tintColorData) do
						table.insert(ks, k)
					end

					return ks
				end)(),
				Value = "Sky Blue",
				Callback = function(selectSkyColorText)
					tintColor = Color3.fromHex(tintColorData[selectSkyColorText])

					if enableCustomSkyFlag then
						cleanup()
					end

					handleCustomSky("Sky Color Changed", "New color: " .. selectSkyColorText)
				end
			})
			cleanup()

			local CharacterTab = characterTabData.CharacterTab
			local Players = game:GetService("Players")
			local RunService = game:GetService("RunService")
			local UserInputService = game:GetService("UserInputService")
			local localValuePlayer = Players.LocalPlayer
			local Humanoid = nil
			local HumanoidRootPart = nil
			local flagNumber = 16
			local capturedFlagNumber = flagNumber
			local walkSpeedFlag = false

			characterTabData.CharacterTab:Section({
				Title = gradient("WalkSpeed", Color3.fromHex("#ff5500"), Color3.fromHex("#460000"))
			})
			CharacterTab:Slider({
				Title = "WalkSpeed",
				Value = {
					Min = 16,
					Max = 100,
					Default = flagNumber
				},
				Callback = function(flagNumber)
					capturedFlagNumber = flagNumber
				end
			})
			CharacterTab:Toggle({
				Title = "Toggle WalkSpeed",
				Default = false,
				Callback = function(toggleWalkSpeedFlag)
					walkSpeedFlag = toggleWalkSpeedFlag
				end
			})

			local jumpPowerNumber = 50
			local capturedJumpPowerNumber = jumpPowerNumber
			local jumpPowerFlag = false

			characterTabData.CharacterTab:Section({
				Title = gradient("JumpPower", Color3.fromHex("#ff5566"), Color3.fromHex("#491100"))
			})
			CharacterTab:Slider({
				Title = "JumpPower",
				Value = {
					Min = 20,
					Max = 100,
					Default = jumpPowerNumber
				},
				Callback = function(flagNumber)
					capturedJumpPowerNumber = flagNumber
				end
			})
			CharacterTab:Toggle({
				Title = "Toggle JumpPower",
				Default = false,
				Callback = function(toggleJumpPowerFlag)
					jumpPowerFlag = toggleJumpPowerFlag
				end
			})

			local conditionFlag = false
			local velocityNumber = 50
			local guiObject = {}
			local BodyVelocity = nil
			local BodyGyro = nil

			characterTabData.CharacterTab:Section({
				Title = gradient("Movement", Color3.fromHex("#ff2356"), Color3.fromHex("#190990"))
			})
			CharacterTab:Toggle({
				Title = "Fly",
				Default = false,
				Callback = function(flyFlag)
					conditionFlag = flyFlag

					if not flyFlag then
						stopFly()
					else
						startFly()
					end
				end
			})
			CharacterTab:Slider({
				Title = "Fly Speed",
				Value = {
					Min = 10,
					Max = 200,
					Default = 50
				},
				Callback = function(flySpeedNumber)
					velocityNumber = flySpeedNumber
				end
			})

			local characterRespawnFlag = false
			local connection = nil

			CharacterTab:Toggle({
				Title = "Noclip",
				Default = false,
				Callback = function(noclipFlag)
					if not noclipFlag then
						stopNoclip()
					else
						startNoclip()
					end
				end
			})
			characterTabData.CharacterTab:Section({
				Title = gradient("Respawn", Color3.fromHex("#771a8f"), Color3.fromHex("#1132a8"))
			})
			CharacterTab:Button({
				Title = "Character Respawn",
				Callback = function()
					local localValueValuePlayer = localValuePlayer
					local flyFlag = conditionFlag
					local flag = characterRespawnFlag

					if conditionFlag then
						conditionFlag = false
						stopFly()
					end

					if characterRespawnFlag then
						stopNoclip()
					end

					if localValueValuePlayer.Character then
						localValueValuePlayer.Character:BreakJoints()
					end

					task.wait(0.5)

					if flyFlag then
						conditionFlag = true
						startFly()
					end

					if flag then
						startNoclip()
					end
				end
			})

			local function secondaryHandler()
				if localValuePlayer.Character then
					Humanoid = localValuePlayer.Character:FindFirstChildOfClass("Humanoid")
					HumanoidRootPart = localValuePlayer.Character:FindFirstChild("HumanoidRootPart")
				end
			end

			localValuePlayer.CharacterAdded:Connect(function(character)
				character:WaitForChild("Humanoid")
				character:WaitForChild("HumanoidRootPart")
				secondaryHandler()

				if conditionFlag then
					startFly()
				end

				if characterRespawnFlag then
					startNoclip()
				end
			end)
			secondaryHandler()
			RunService.Heartbeat:Connect(function()
				if Humanoid then
					Humanoid.WalkSpeed = walkSpeedFlag and capturedFlagNumber or flagNumber
					Humanoid.JumpPower = jumpPowerFlag and capturedJumpPowerNumber or jumpPowerNumber
				end
			end)

			function startFly()
				if Humanoid and HumanoidRootPart then
					BodyVelocity = Instance.new("BodyVelocity")
					BodyGyro = Instance.new("BodyGyro")
					BodyVelocity.Velocity = Vector3.zero
					BodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
					BodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
					BodyGyro.P = 10000
					BodyGyro.D = 500
					BodyVelocity.Parent = HumanoidRootPart
					BodyGyro.Parent = HumanoidRootPart
					Humanoid.PlatformStand = true

					local CurrentCamera = workspace.CurrentCamera
					local data = {}

					guiObject.InputBegan = UserInputService.InputBegan:Connect(function(input, gameProcessed)
						if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
							data[input.KeyCode] = true
						end
					end)
					guiObject.InputEnded = UserInputService.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Keyboard then
							data[input.KeyCode] = nil
						end
					end)
					guiObject.Heartbeat = RunService.Heartbeat:Connect(function()
						if BodyVelocity and BodyGyro then
							local zero = Vector3.zero
							local CurrentCameraCFrame = CurrentCamera.CFrame
							local LookVector = CurrentCameraCFrame.LookVector
							local RightVector = CurrentCameraCFrame.RightVector
							local zeroNumber = Vector3.new(0, 1, 0)

							if data[Enum.KeyCode.W] then
								zero = zero + LookVector
							end

							if data[Enum.KeyCode.S] then
								zero = zero - LookVector
							end

							if data[Enum.KeyCode.A] then
								zero = zero - RightVector
							end

							if data[Enum.KeyCode.D] then
								zero = zero + RightVector
							end

							if data[Enum.KeyCode.Space] then
								zero = zero + zeroNumber
							end

							if data[Enum.KeyCode.LeftShift] then
								zero = zero - zeroNumber
							end

							BodyGyro.CFrame = CurrentCameraCFrame
							BodyVelocity.Velocity = zero.Magnitude > 0 and zero.Unit * velocityNumber or Vector3.zero

							return
						end
					end)

					return
				end
			end
			function stopFly()
				if BodyVelocity then
					BodyVelocity:Destroy()
					BodyVelocity = nil
				end

				if BodyGyro then
					BodyGyro:Destroy()
					BodyGyro = nil
				end

				for _, item in pairs(guiObject) do
					item:Disconnect()
				end

				guiObject = {}

				if Humanoid then
					Humanoid.PlatformStand = false
				end
			end
			function startNoclip()
				characterRespawnFlag = true
				connection = RunService.Stepped:Connect(function()
					if localValuePlayer.Character then
						for _, descendant in ipairs(localValuePlayer.Character:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanCollide = false
							end
						end
					end
				end)
			end
			function stopNoclip()
				characterRespawnFlag = false

				if connection then
					connection:Disconnect()
					connection = nil
				end
			end

			characterTabData.TeleportTab:Section({
				Title = gradient("Teleport to a person", Color3.fromHex("#231a8f"), Color3.fromHex("#d90fd2"))
			})

			local players = game:GetService("Players")
			local secondaryLocalValuePlayer = players.LocalPlayer
			local firstChild = nil

			local function handlePlayersDropdown()
				local playerNames = { "Select Player" }

				for _, player in ipairs(players:GetPlayers()) do
					if player ~= secondaryLocalValuePlayer then
						table.insert(playerNames, player.Name)
					end
				end

				return playerNames
			end

			local playersDropdown = characterTabData.TeleportTab:Dropdown({
				Title = "Players",
				Values = handlePlayersDropdown(),
				Value = "Select Player",
				Multi = false,
				Callback = function(playersArgument)
					if playersArgument == "Select Player" then
						firstChild = nil
					else
						firstChild = players:FindFirstChild(playersArgument)
					end
				end
			})

			players.PlayerAdded:Connect(function()
				task.wait(1)
				playersDropdown:Refresh(handlePlayersDropdown())
			end)
			players.PlayerRemoving:Connect(function()
				playersDropdown:Refresh(handlePlayersDropdown())
			end)
			characterTabData.TeleportTab:Button({
				Title = "Teleport to Selected",
				Locked = false,
				Callback = function()
					if not firstChild or not firstChild.Character then
						windUi:Notify({
							Title = "Error",
							Content = "Target not found or unavailable",
							Duration = 3,
							loadFileState:Play()
						})
					else
						local humanoidRootPart = firstChild.Character:FindFirstChild("HumanoidRootPart")
						local secondaryHumanoidRootPart = secondaryLocalValuePlayer.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart and secondaryHumanoidRootPart then
							secondaryHumanoidRootPart.CFrame = humanoidRootPart.CFrame
							windUi:Notify({
								Title = "Teleport",
								Content = "Successfully teleported to " .. firstChild.Name,
								Duration = 3,
								loadFileState:Play()
							})
						end
					end
				end
			})
			characterTabData.TeleportTab:Button({
				Title = "Update players list",
				Locked = false,
				Callback = function()
					playersDropdown:Refresh(handlePlayersDropdown())
				end
			})
			characterTabData.TeleportTab:Section({
				Title = gradient("Teleport to", Color3.fromHex("#d4132a"), Color3.fromHex("#0e2ab5"))
			})
			characterTabData.TeleportTab:Button({
				Title = "Teleport to Lobby",
				Description = "Teleport to the main lobby area",
				Callback = function()
					secondaryLocalValuePlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112.961197, 140.25296, 46.383835)
				end
			})
			characterTabData.TeleportTab:Button({
				Title = "Teleport to Sheriff",
				Callback = function()
					for _, player in pairs(players:GetPlayers()) do
						if player.Character and (player.Character:FindFirstChild("Gun") or player.Backpack and player.Backpack:FindFirstChild("Gun")) then
							secondaryLocalValuePlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame

							return
						end
					end
				end
			})
			characterTabData.TeleportTab:Button({
				Title = "Teleport to Murderer",
				Callback = function()
					for _, player in pairs(players:GetPlayers()) do
						if player.Character and (player.Character:FindFirstChild("Knife") or player.Backpack and player.Backpack:FindFirstChild("Knife")) then
							secondaryLocalValuePlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame

							return
						end
					end
				end
			})
			characterTabData.TeleportTab:Section({
				Title = gradient("GrabGun", Color3.fromHex("#092094"), Color3.fromHex("#094a94"))
			})

			local notifyGunDropFlag = true
			local autoGrabGunFlag = false
			local gunDropData = {}
			local flag = false
			local grabGunData = {
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
				"BeachResort"
			}

			local function updateCFrame(updateCFrameFlag)
				local Character = secondaryLocalValuePlayer.Character

				if updateCFrameFlag and Character then
					if not Character:FindFirstChild("Gun") and not secondaryLocalValuePlayer.Backpack:FindFirstChild("Gun") then
						local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							local secondaryCFrame = humanoidRootPart.CFrame

							humanoidRootPart.CFrame = updateCFrameFlag.CFrame + Vector3.new(0, 2.5, 0)
							task.wait(0.05)

							local updateCFrameOption = Character:FindFirstChild("Gun") or secondaryLocalValuePlayer.Backpack:FindFirstChild("Gun")

							humanoidRootPart.CFrame = secondaryCFrame

							return updateCFrameOption
						end

						return false
					end

					return true
				end

				return false
			end
			local function alternateHandler()
				if not flag and autoGrabGunFlag then
					for _, item in ipairs(grabGunData) do
						local firstChild = workspace:FindFirstChild(item)

						if firstChild then
							local GunDrop = firstChild:FindFirstChild("GunDrop")

							if GunDrop then
								if gunDropData[GunDrop] then
									if autoGrabGunFlag and updateCFrame(GunDrop) then
										flag = true
									end
								else
									gunDropData = {}
									gunDropData[GunDrop] = true

									if notifyGunDropFlag then
										windUi:Notify({
											Title = "Gun Drop Spawned",
											Content = "Gun appeared on map: " .. item,
											Icon = "alert-circle",
											Duration = 2,
											loadFileState:Play()
										})
									end

									if autoGrabGunFlag and updateCFrame(GunDrop) then
										flag = true
									end
								end
							end
						end
					end

					return
				end
			end

			secondaryLocalValuePlayer.CharacterAdded:Connect(function()
				flag = false
			end)
			characterTabData.TeleportTab:Toggle({
				Title = "Notify GunDrop",
				Default = true,
				Callback = function(flag)
					notifyGunDropFlag = flag
				end
			})
			characterTabData.TeleportTab:Toggle({
				Title = "Auto Grab Gun",
				Default = false,
				Callback = function(flag)
					autoGrabGunFlag = flag
					windUi:Notify({
						Title = "Gun System",
						Content = autoGrabGunFlag and "Auto Grab Gun enabled" or "Auto Grab Gun disabled",
						Icon = autoGrabGunFlag and "check-circle" or "x",
						Duration = 2,
						loadFileState:Play()
					})
				end
			})
			characterTabData.TeleportTab:Button({
				Title = "Grab Gun",
				Callback = function()
					for _, item in ipairs(grabGunData) do
						local firstChild = workspace:FindFirstChild(item)

						if firstChild then
							local GunDrop = firstChild:FindFirstChild("GunDrop")

							if GunDrop then
								updateCFrame(GunDrop)

								return
							end
						end
					end

					windUi:Notify({
						Title = "Gun System",
						Content = "No GunDrop found on map",
						Icon = "x",
						Duration = 2,
						loadFileState:Play()
					})
				end
			})
			game:GetService("RunService").Heartbeat:Connect(function()
				if autoGrabGunFlag then
					alternateHandler()
				end
			end)
		end

		characterTabData.CombatTab:Section({
			Title = gradient("Sheriff", Color3.fromHex("#1205a3"), Color3.fromHex("#06718a"))
		})

		local Players = game:GetService("Players")
		local Workspace = game:GetService("Workspace")
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local backpackContainer = Players.LocalPlayer
		local CurrentCamera = Workspace.CurrentCamera
		local nameData = {
			"HumanoidRootPart",
			"UpperTorso",
			"Torso",
			"LowerTorso",
			"Head",
			"RightUpperLeg",
			"LeftUpperLeg",
			"RightUpperArm",
			"LeftUpperArm",
			"RightLowerLeg",
			"LeftLowerLeg",
			"RightLowerArm",
			"LeftLowerArm"
		}
		local secondaryNumber = 4
		local alternateNumber = 0.4
		local updateCFrameNumber = 1
		local MouseBehavior = nil
		local flag = false
		local getStateFlag = nil
		local secondaryGetStateFlag = nil
		local aimBotFlag = false
		local alternateGetStateFlag = false
		local E = Enum.KeyCode.E

		local function handleFlag()
			CurrentCamera = CurrentCamera or Workspace.CurrentCamera

			return CurrentCamera
		end
		local function handler()
			local Character = backpackContainer.Character

			if Character then
				for _, child in ipairs(Character:GetChildren()) do
					if child:IsA("Tool") and child.Name:lower():find("gun") then
						return true
					end
				end
			end

			local Backpack = backpackContainer:FindFirstChild("Backpack")

			if Backpack then
				for _, child in ipairs(Backpack:GetChildren()) do
					if child:IsA("Tool") and child.Name:lower():find("gun") then
						return true
					end
				end
			end

			return false
		end
		local function handleName(secondaryBackpackContainer)
			if secondaryBackpackContainer and secondaryBackpackContainer ~= backpackContainer then
				if not secondaryBackpackContainer.Character or not secondaryBackpackContainer.Character:FindFirstChild("Knife") then
					if not secondaryBackpackContainer:FindFirstChild("Backpack") or not secondaryBackpackContainer.Backpack:FindFirstChild("Knife") then
						return false
					end

					return true
				end

				return true
			end

			return false
		end
		local function isUpdateNameInstancePropertiesValid(secondaryInput)
			local vectorFlag = handleFlag()

			if vectorFlag and secondaryInput then
				local vector, worldToViewportPoint = vectorFlag:WorldToViewportPoint(secondaryInput.Position)
				local ViewportSize = vectorFlag.ViewportSize

				return worldToViewportPoint and (vector.X >= 0 and (vector.Y >= 0 and (vector.X <= ViewportSize.X and vector.Y <= ViewportSize.Y)))
			end

			return false
		end
		local function updateName(updateNameCondition)
			if updateNameCondition then
				if isUpdateNameInstancePropertiesValid(updateNameCondition) then
					local CFramePosition = handleFlag().CFrame.Position
					local updateNameNumber = updateNameCondition.Position - CFramePosition
					local raycastParams = RaycastParams.new()

					raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
					raycastParams.FilterDescendantsInstances = { backpackContainer.Character }

					local raycastResult = Workspace:Raycast(CFramePosition, updateNameNumber, raycastParams)

					return not raycastResult or raycastResult.Instance:IsDescendantOf(updateNameCondition.Parent)
				end

				return false
			end

			return false
		end
		local function secondaryHandleName()
			local CFramePosition = handleFlag().CFrame.Position
			local huge = math.huge
			local firstChild = nil
			local backpackContainer = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if handleName(player) and player.Character then
					local Character = player.Character
					local nameFlag = false

					for _, item in ipairs(nameData) do
						local secondaryFirstChild = Character:FindFirstChild(item)

						if secondaryFirstChild and secondaryFirstChild:IsA("BasePart") and updateName(secondaryFirstChild) then
							local Magnitude = (CFramePosition - secondaryFirstChild.Position).Magnitude

							if Magnitude < huge then
								backpackContainer = player
								firstChild = secondaryFirstChild
								huge = Magnitude
							end

							nameFlag = true

							break
						end
					end

					if not nameFlag then
						for _, descendant in ipairs(Character:GetDescendants()) do
							if descendant:IsA("BasePart") and updateName(descendant) then
								local Magnitude = (CFramePosition - descendant.Position).Magnitude

								if not (Magnitude < huge) then
									break
								end

								backpackContainer = player
								firstChild = descendant
								huge = Magnitude

								break
							end
						end
					end
				end
			end

			return firstChild, backpackContainer
		end
		local function updateCFrame(updateCFrameCondition)
			if updateCFrameCondition then
				local updateCFrameResult = handleFlag()
				local cFrame = CFrame.new(updateCFrameResult.CFrame.Position, updateCFrameCondition.Position)

				if not (updateCFrameNumber >= 0.999) then
					updateCFrameResult.CFrame = updateCFrameResult.CFrame:Lerp(cFrame, math.clamp(updateCFrameNumber, 0, 1))
				else
					updateCFrameResult.CFrame = cFrame
				end

				return
			end
		end
		local function updateMouseBehavior()
			if MouseBehavior == nil then
				MouseBehavior = UserInputService.MouseBehavior
			end

			UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
		end
		local function onCharacterRemoving()
			if not MouseBehavior then
				UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			else
				UserInputService.MouseBehavior = MouseBehavior
				MouseBehavior = nil
			end
		end
		local function secondaryHandler()
			if not flag then
				flag = true
				print("[AimBot] No gun equipped!")

				return
			end
		end
		local function alternateHandler()
			flag = false
		end
		local function getState()
			if not getStateFlag or not getStateFlag.GetState then
				return aimBotFlag
			end

			return getStateFlag:GetState()
		end
		local function secondaryGetState()
			if not secondaryGetStateFlag or not secondaryGetStateFlag.GetState then
				return alternateGetStateFlag
			end

			return secondaryGetStateFlag:GetState()
		end

		characterTabData.CombatTab:Toggle({
			Title = "AimBot",
			Callback = function(getStateFlag)
				aimBotFlag = getStateFlag
				print("[AimBot] Toggle:", getStateFlag)

				if not getStateFlag then
					onCharacterRemoving()
				end
			end
		})
		characterTabData.CombatTab:Keybind({
			Title = "Keybind AimBot",
			Desc = "",
			Value = "E",
			Callback = function(keybindAimBotArgument)
				E = Enum.KeyCode[keybindAimBotArgument:upper()] or Enum.KeyCode.E
				print("[AimBot] Keybind set to", keybindAimBotArgument)
			end
		})
		task.spawn(function()
			local flag = nil

			while true do
				flag = false
				task.wait(0.05)

				if getState() and secondaryGetState() then
					if not handler() then
						secondaryHandler()

						while getState() and secondaryGetState() and not handler() do
							task.wait(secondaryNumber)
						end
					end

					if getState() and secondaryGetState() then
						alternateHandler()

						while getState() and secondaryGetState() and handler() do
							local name, player = secondaryHandleName()

							if not name or not player then
								task.wait(alternateNumber)
							else
								updateMouseBehavior()

								while getState() and secondaryGetState() and handler() and player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid").Health > 0 and updateName(name) do
									RunService.RenderStepped:Wait()
									updateCFrame(name)

									if player and player.Character then
										local Name = player.Character:FindFirstChild(name.Name)

										if Name then
											name = Name
										end
									end
								end

								onCharacterRemoving()
							end

							if not backpackContainer.Character or not backpackContainer.Character:FindFirstChildOfClass("Humanoid") or backpackContainer.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
								onCharacterRemoving();
								(function()
									flag = true
								end)()
							end
						end

						onCharacterRemoving()
						task.wait(0.1)
					else
						onCharacterRemoving()
						task.wait(0.1)
					end
				else
					onCharacterRemoving()
					task.wait(0.15)
				end

				if flag then
					break
				end
			end
		end)
		backpackContainer.CharacterAdded:Connect(function(character)
			onCharacterRemoving()
			flag = false

			local ok, result = pcall(function()
				return character:WaitForChild("Humanoid", 30)
			end)

			if not ok or not result then
				onCharacterRemoving()
			else
				result.Died:Connect(function()
					onCharacterRemoving()
				end)
			end
		end)
		backpackContainer.CharacterRemoving:Connect(onCharacterRemoving)

		local players = game:GetService("Players")
		local secondaryWorkspace = game:GetService("Workspace")
		local userInputService = game:GetService("UserInputService")

		game:GetService("RunService")

		local localValuePlayer = players.LocalPlayer
		local option = secondaryWorkspace and secondaryWorkspace.CurrentCamera
		local sumNumber = 1200
		local optionNumber = 1
		local sendRequestNumber = 0.03
		local secondarySendRequestNumber = 1
		local sendRequestText = "AH2"
		local capturedTimestamp = 0
		local capturedSendRequestState = nil
		local sendRequestState = nil
		local silentAimToggleFlag = false
		local R = Enum.KeyCode.R

		local function handleCFramePosition()
			option = option or secondaryWorkspace and secondaryWorkspace.CurrentCamera

			return option
		end
		local function isSendRequestValid()
			local humanoidCondition = localValuePlayer and localValuePlayer.Character

			if humanoidCondition then
				local Humanoid = humanoidCondition:FindFirstChildOfClass("Humanoid")

				return Humanoid and Humanoid.Health > 0
			end

			return false
		end
		local function handleCondition()
			for _, player in ipairs(players:GetPlayers()) do
				if player ~= localValuePlayer and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
					if player.Character:FindFirstChild("Knife") then
						return player
					end

					local Backpack = player:FindFirstChild("Backpack")

					if Backpack and Backpack:FindFirstChild("Knife") then
						return player
					end
				end
			end

			return nil
		end
		local function handleInput(player)
			if player and player.Character then
				for _, item in ipairs({
					"HumanoidRootPart",
					"UpperTorso",
					"Torso",
					"Head",
					"LowerTorso"
				}) do
					local firstChild = player.Character:FindFirstChild(item)

					if firstChild and firstChild:IsA("BasePart") then
						return firstChild
					end
				end

				for _, descendant in ipairs(player.Character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						return descendant
					end
				end

				return nil
			end

			return nil
		end
		local function handleOption(optionCondition)
			if optionCondition then
				local CFramePosition = handleCFramePosition().CFrame.Position
				local p57Position = optionCondition.Position
				local velocity = Vector3.new(0, 0, 0)

				pcall(function()
					velocity = optionCondition.AssemblyLinearVelocity
				end)

				if (velocity == Vector3.new(0, 0, 0) or velocity == nil) and optionCondition.Velocity then
					velocity = optionCondition.Velocity
				end

				local sum = p57Position

				for _ = 1, optionNumber do
					local Magnitude = (sum - CFramePosition).Magnitude

					sum = p57Position + velocity * (sumNumber > 0 and Magnitude / sumNumber or 0.0001)
				end

				return sum
			end

			return nil
		end
		local function secondaryHandleCondition()
			local gunContainer = localValuePlayer and localValuePlayer.Character

			if gunContainer then
				local Gun = gunContainer:FindFirstChild("Gun")

				if Gun and Gun:IsA("Tool") then
					return Gun
				end

				for _, child in ipairs(gunContainer:GetChildren()) do
					if child:IsA("Tool") and child:FindFirstChild("IsGun") then
						return child
					end
				end
			end

			local secondaryGunContainer = localValuePlayer and localValuePlayer:FindFirstChild("Backpack")

			if secondaryGunContainer then
				local Gun = secondaryGunContainer:FindFirstChild("Gun")

				if Gun and Gun:IsA("Tool") then
					return Gun
				end

				for _, child in ipairs(secondaryGunContainer:GetChildren()) do
					if child:IsA("Tool") and child:FindFirstChild("IsGun") then
						return child
					end
				end
			end

			return nil
		end
		local function handleSendRequest()
			local nameCondition = secondaryHandleCondition()

			if nameCondition then
				if localValuePlayer.Character and nameCondition.Parent ~= localValuePlayer.Character then
					pcall(function()
						nameCondition.Parent = localValuePlayer.Character
					end)
					task.wait(0.01)
				end

				if localValuePlayer.Character then
					local Name = localValuePlayer.Character:FindFirstChild(nameCondition.Name)

					if Name and Name:IsA("Tool") then
						return Name
					end
				end

				return nameCondition
			end

			return nil
		end
		local function handleRemoteFunction(remoteFunctionCondition)
			if remoteFunctionCondition then
				for _, descendant in ipairs(remoteFunctionCondition:GetDescendants()) do
					if descendant:IsA("RemoteFunction") then
						return descendant
					end
				end

				return nil
			end

			return nil
		end
		local function secondaryHandleSendRequest()
			local secondarySendRequestState = nil

			capturedSendRequestState = secondarySendRequestState
			sendRequestState = nil
		end
		local function sendRequest()
			local timestamp = tick()

			if not (timestamp - capturedTimestamp < sendRequestNumber) then
				capturedTimestamp = timestamp

				if isSendRequestValid() then
					local inputCondition = handleCondition()

					if inputCondition then
						local sendRequestCondition = handleInput(inputCondition)

						if sendRequestCondition then
							local sendRequestOption = handleOption(sendRequestCondition) or sendRequestCondition.Position
							local remoteFunctionCondition = handleSendRequest()

							if remoteFunctionCondition then
								local remoteFunction = handleRemoteFunction(remoteFunctionCondition)

								if remoteFunction then
									local ok, result = pcall(function()
										return remoteFunction:InvokeServer(secondarySendRequestNumber, sendRequestOption, sendRequestText)
									end)

									if not ok then
										warn("[SilentAimFast] Invoke error:", result)
										secondaryHandleSendRequest()

										return false
									end

									return true
								end

								return false
							end

							return false
						end

						return false
					end

					return false
				end

				return false
			end

			return false
		end

		local silentAimToggle = characterTabData.CombatTab:Toggle({
			Title = "SilentAim Toggle",
			Default = false,
			Callback = function(flag)
				silentAimToggleFlag = flag
				print("[SilentAim] Enabled:", flag)
			end
		})

		characterTabData.CombatTab:Keybind({
			Title = "Bind SilentAim",
			Desc = "",
			Value = "R",
			Callback = function(bindSilentAimArgument)
				if Enum.KeyCode[bindSilentAimArgument] then
					R = Enum.KeyCode[bindSilentAimArgument]
					print("[SilentAim] Keybind changed to:", bindSilentAimArgument)
				end
			end
		})
		userInputService.InputBegan:Connect(function(input, gameProcessed)
			if not gameProcessed then
				if silentAimToggleFlag then
					if input.KeyCode == R then
						pcall(function()
							if sendRequest() then
								print("[SilentAim] Shot fired")
							end
						end)
					end

					return
				end

				return
			end
		end)

		if localValuePlayer then
			localValuePlayer.CharacterAdded:Connect(function(character)
				secondaryHandleSendRequest()
				task.spawn(function()
					local Humanoid = character:WaitForChild("Humanoid", 10)

					if Humanoid then
						Humanoid.Died:Connect(function()
							secondaryHandleSendRequest()
						end)
					end
				end)
			end)
			localValuePlayer.CharacterRemoving:Connect(function()
				secondaryHandleSendRequest()
			end)
		end

		characterTabData.CombatTab:Section({
			Title = gradient("Shot Button", Color3.fromHex("#001e80"), Color3.fromHex("#16f2d9"))
		})

		local secondaryPlayers = game:GetService("Players")
		local replicatedStorage = game:GetService("ReplicatedStorage")
		local TweenService = game:GetService("TweenService")
		local playerGuiContainer = secondaryPlayers.LocalPlayer
		local name = "ShotMurderGui_v2"
		local Frame = nil
		local TextButton = nil
		local createScreenGuiFlag = false
		local createScreenGuiNumber = 60
		local sendGunNumber = 0
		local secondarySendGunNumber = 1.5

		local function handleSendGun(sendGunArgument)
			if not (tick() - sendGunNumber < secondarySendGunNumber) then
				sendGunNumber = tick()
				pcall(function()
					windUi:Notify(sendGunArgument)
				end)

				return
			end
		end
		local function handleRemoteEvent(knifeLocalContainer)
			if knifeLocalContainer then
				local ok, result = pcall(function()
					return knifeLocalContainer:FindFirstChild("KnifeLocal")
				end)

				if ok and result then
					local CreateBeam = result:FindFirstChild("CreateBeam")

					if CreateBeam then
						local RemoteFunction = CreateBeam:FindFirstChildWhichIsA("RemoteFunction")

						if RemoteFunction then
							return RemoteFunction
						end
					end
				end

				for _, descendant in ipairs(knifeLocalContainer:GetDescendants()) do
					if descendant:IsA("RemoteFunction") or descendant:IsA("RemoteEvent") then
						local lower = (descendant.Name or ""):lower()

						if lower:find("create") or lower:find("beam") or lower:find("knife") or lower:find("fire") then
							return descendant
						end
					end
				end

				for _, descendant in ipairs(knifeLocalContainer:GetDescendants()) do
					if descendant:IsA("RemoteFunction") or descendant:IsA("RemoteEvent") then
						return descendant
					end
				end

				return nil
			end

			return nil
		end
		local function sendGetPlayerData()
			local GetPlayerData = replicatedStorage:FindFirstChild("GetPlayerData", true)

			if GetPlayerData then
				local ok, result = pcall(function()
					return GetPlayerData:InvokeServer()
				end)

				if ok and type(result) == "table" then
					for k, item in pairs(result) do
						if item and item.Role == "Murderer" then
							return secondaryPlayers:FindFirstChild(k)
						end
					end

					return nil
				end

				return nil
			end

			return nil
		end
		local function sendGun()
			local Character = playerGuiContainer.Character

			if Character and Character:FindFirstChildOfClass("Humanoid") then
				local player = sendGetPlayerData()

				if player and player.Character then
					local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						local knifeLocalContainer = Character:FindFirstChild("Gun") or playerGuiContainer.Backpack:FindFirstChild("Gun")

						if knifeLocalContainer then
							if Character ~= knifeLocalContainer.Parent then
								knifeLocalContainer.Parent = Character
							end

							local remoteEvent = handleRemoteEvent(knifeLocalContainer)

							if not remoteEvent then
								pcall(function()
									if typeof(knifeLocalContainer.Activate) == "function" then
										knifeLocalContainer:Activate()
									end
								end)
								handleSendGun({
									Title = "Sheriff",
									Content = "Shot (fallback) attempted",
									Icon = "check-circle",
									Duration = 1
								})

								return
							end

							pcall(function()
								if not remoteEvent:IsA("RemoteFunction") then
									remoteEvent:FireServer(10, HumanoidRootPart.Position, "AH2")
								else
									remoteEvent:InvokeServer(10, HumanoidRootPart.Position, "AH2")
								end
							end)
							handleSendGun({
								Title = "Sheriff",
								Content = "Shot invoked",
								Icon = "check-circle",
								Duration = 1
							})

							return
						end

						handleSendGun({
							Title = "Sheriff",
							Content = "No gun found",
							Icon = "x",
							Duration = 1.5
						})

						return
					end

					return
				end

				handleSendGun({
					Title = "Sheriff",
					Content = "Murderer not found",
					Icon = "x",
					Duration = 1.5
				})

				return
			end
		end
		local function createScreenGui()
			if not createScreenGuiFlag then
				local PlayerGui = playerGuiContainer:WaitForChild("PlayerGui")
				local parent = PlayerGui:FindFirstChild(name)

				if not parent then
					parent = Instance.new("ScreenGui")
					parent.Name = name
					parent.ResetOnSpawn = false
					parent.IgnoreGuiInset = false
					parent.DisplayOrder = 50
					parent.Parent = PlayerGui
				end

				Frame = Instance.new("Frame")
				Frame.Name = "ShotButtonFrame"
				Frame.Size = UDim2.new(0, createScreenGuiNumber, 0, createScreenGuiNumber)
				Frame.Position = UDim2.new(1, -createScreenGuiNumber - 20, 0.5, -createScreenGuiNumber / 2)
				Frame.AnchorPoint = Vector2.new(1, 0.5)
				Frame.BackgroundTransparency = 1
				Frame.ZIndex = 100
				Frame.Parent = parent
				TextButton = Instance.new("TextButton")
				TextButton.Name = "SheriffShotButton"
				TextButton.Size = UDim2.new(1, 0, 1, 0)
				TextButton.Position = UDim2.new(0, 0, 0, 0)
				TextButton.BackgroundColor3 = Color3.fromRGB(20, 22, 25)
				TextButton.Text = "\239\191\189\239\191\189"
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextSize = 26
				TextButton.Font = Enum.Font.GothamBold
				TextButton.BorderSizePixel = 0
				TextButton.ZIndex = 101
				TextButton.AutoButtonColor = false
				TextButton.TextScaled = true
				TextButton.Parent = Frame

				local UICorner = Instance.new("UICorner")

				UICorner.CornerRadius = UDim.new(1, 0)
				UICorner.Parent = TextButton

				local UIStroke = Instance.new("UIStroke")

				UIStroke.Thickness = 2
				UIStroke.Color = Color3.fromRGB(0, 120, 255)
				UIStroke.Transparency = 0.25
				UIStroke.Parent = TextButton

				local UIGradient = Instance.new("UIGradient")

				UIGradient.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 160, 255)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 220, 140))
				})
				UIGradient.Rotation = 45
				UIGradient.Parent = TextButton

				local function handleScreenGui()
					local tween = TweenService:Create(TextButton, TweenInfo.new(0.05, Enum.EasingStyle.Quad), {
						Size = UDim2.new(0.92, 0, 0.92, 0),
						BackgroundTransparency = 0.05
					})
					local create = TweenService:Create(TextButton, TweenInfo.new(0.12, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 0
					})

					tween:Play()
					tween.Completed:Wait()
					create:Play()
				end

				TextButton.MouseButton1Click:Connect(function()
					handleScreenGui()
					sendGun()
				end)
				createScreenGuiFlag = true
				handleSendGun({
					Title = "Sheriff System",
					Content = "Shot button activated",
					Icon = "check-circle",
					Duration = 2
				})

				return
			end
		end
		local function handleToggleShotButtonMobile()
			if createScreenGuiFlag then
				local PlayerGui = playerGuiContainer:FindFirstChild("PlayerGui")

				if PlayerGui then
					local firstChild = PlayerGui:FindFirstChild(name)

					if firstChild then
						firstChild:Destroy()
					end
				end

				TextButton = nil
				Frame = nil
				createScreenGuiFlag = false
				handleSendGun({
					Title = "Sheriff System",
					Content = "Shot button removed",
					Icon = "x",
					Duration = 1.2
				})

				return
			end
		end

		characterTabData.CombatTab:Toggle({
			Title = "Toggle Shot Button (Mobile)",
			Default = false,
			Callback = function(toggleShotButtonMobileFlag)
				if not toggleShotButtonMobileFlag then
					handleToggleShotButtonMobile()
				else
					createScreenGui()
				end
			end
		})
		characterTabData.CombatTab:Slider({
			Title = "Button Size",
			Step = 5,
			Value = {
				Min = 40,
				Max = 150,
				Default = createScreenGuiNumber
			},
			Callback = function(sizeNumber)
				createScreenGuiNumber = math.floor(sizeNumber)

				if Frame then
					Frame.Size = UDim2.new(0, createScreenGuiNumber, 0, createScreenGuiNumber)
				end

				handleSendGun({
					Title = "Sheriff System",
					Content = "Button size: " .. tostring(createScreenGuiNumber),
					Icon = "check-circle",
					Duration = 1
				})
			end
		})
		characterTabData.CombatTab:Section({
			Title = gradient("Murder", Color3.fromHex("#ed0e0e"), Color3.fromHex("#f235b3"))
		})

		local alternatePlayers = game:GetService("Players")
		local secondaryReplicatedStorage = game:GetService("ReplicatedStorage")
		local secondaryLocalValuePlayer = alternatePlayers.LocalPlayer
		local KillEvent = secondaryReplicatedStorage.Remotes.Gameplay.KillEvent
		local sendKillEventResult = Color3.new(1, 0, 0)

		local function sendKillEvent(player)
			if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and secondaryLocalValuePlayer.Character then
				local HumanoidRootPart = player.Character.HumanoidRootPart
				local humanoidRootPart = secondaryLocalValuePlayer.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					HumanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -2)
					task.wait(0.1)
					pcall(function()
						KillEvent:FireServer(player.Name, sendKillEventResult)
					end)
				end
			end
		end

		characterTabData.CombatTab:Toggle({
			Title = "KillAll",
			Desc = "",
			Default = false,
			Callback = function(killAllCondition)
				print("KillAll Toggle Activated:", killAllCondition)

				if killAllCondition then
					spawn(function()
						while silentAimToggle.Value do
							for _, player in ipairs(alternatePlayers:GetPlayers()) do
								if player ~= secondaryLocalValuePlayer then
									sendKillEvent(player)
									task.wait(0.2)
								end
							end

							task.wait(0.3)
						end
					end)
				end
			end
		})

		local additionalPlayers = game:GetService("Players")

		game:GetService("RunService")

		local alternateLocalValuePlayer = additionalPlayers.LocalPlayer
		local knifeAuraFlag = false
		local auraRadiusNumber = 15

		local function isInputValid(torsoContainer)
			if torsoContainer then
				return torsoContainer:FindFirstChild("HumanoidRootPart") or (torsoContainer:FindFirstChild("UpperTorso") or torsoContainer:FindFirstChild("Torso"))
			end

			return nil
		end
		local function isValid(player)
			if player and player.Character then
				local Humanoid = player.Character:FindFirstChildOfClass("Humanoid")

				return Humanoid and Humanoid.Health > 0
			end

			return false
		end
		local function useKnife()
			local Character = alternateLocalValuePlayer.Character

			if Character then
				local Humanoid = Character:FindFirstChildOfClass("Humanoid")

				if Humanoid then
					local useKnifeCondition = Character:FindFirstChild("Knife") or alternateLocalValuePlayer.Backpack:FindFirstChild("Knife")

					if useKnifeCondition then
						if useKnifeCondition.Parent == alternateLocalValuePlayer.Backpack then
							Humanoid:EquipTool(useKnifeCondition)
							task.wait(0.05)
						end

						return useKnifeCondition
					end

					return nil
				end

				return nil
			end

			return nil
		end
		local function sendDescendant(sendDescendantFlag, secondaryInput)
			if sendDescendantFlag and secondaryInput then
				pcall(function()
					sendDescendantFlag:Activate()
				end)

				for _, descendant in ipairs(sendDescendantFlag:GetDescendants()) do
					if not descendant:IsA("RemoteEvent") then
						if descendant:IsA("RemoteFunction") then
							pcall(function()
								descendant:InvokeServer(1, secondaryInput.Position, "AH2")
							end)
						end
					else
						pcall(function()
							descendant:FireServer(1, secondaryInput.Position, "AH2")
						end)
					end
				end

				return
			end
		end

		task.spawn(function()
			while task.wait(0.2) do
				if knifeAuraFlag then
					local condition = useKnife()

					if condition then
						local positionCondition = isInputValid(alternateLocalValuePlayer.Character)

						if positionCondition then
							for _, player in ipairs(additionalPlayers:GetPlayers()) do
								if player ~= alternateLocalValuePlayer and isValid(player) then
									local secondaryInput = isInputValid(player.Character)

									if secondaryInput and (secondaryInput.Position - positionCondition.Position).Magnitude <= auraRadiusNumber then
										sendDescendant(condition, secondaryInput)
									end
								end
							end
						end
					end
				end
			end
		end)
		characterTabData.CombatTab:Toggle({
			Title = "Knife Aura",
			Desc = "",
			Default = false,
			Callback = function(flag)
				knifeAuraFlag = flag
			end
		})
		characterTabData.CombatTab:Slider({
			Title = "Aura Radius",
			Step = 1,
			Desc = "",
			Value = {
				Min = 10,
				Max = 100,
				Default = 15
			},
			Callback = function(number)
				auraRadiusNumber = number
			end
		})
	end

	characterTabData.TrollingTab:Section({
		Title = gradient("Fling", Color3.fromHex("#1366a1"), Color3.fromHex("#823f10"))
	})

	local Players = game:GetService("Players")
	local localValuePlayer = Players.LocalPlayer
	local firstChild = nil
	local createBodyVelocityFlag = false

	getgenv().OldPos = nil
	getgenv().FPDH = workspace.FallenPartsDestroyHeight

	local function handlePlayersDropdown()
		local playerNames = { "Select Player" }

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localValuePlayer then
				table.insert(playerNames, player.Name)
			end
		end

		return playerNames
	end

	local playersDropdown = characterTabData.TrollingTab:Dropdown({
		Title = "Players",
		Values = handlePlayersDropdown(),
		Multi = false,
		Value = "Select Player",
		Callback = function(playersArgument)
			if playersArgument == "Select Player" then
				firstChild = nil
			else
				firstChild = Players:FindFirstChild(playersArgument)
			end
		end
	})

	Players.PlayerAdded:Connect(function()
		task.wait(1)
		playersDropdown:Refresh(handlePlayersDropdown())
	end)
	Players.PlayerRemoving:Connect(function()
		playersDropdown:Refresh(handlePlayersDropdown())
	end)

	local function createBodyVelocity(player)
		local Character = localValuePlayer.Character
		local cameraSubject = Character and Character:FindFirstChildOfClass("Humanoid")
		local parent = cameraSubject and cameraSubject.RootPart
		local headContainer = player and player.Character

		if headContainer then
			local Humanoid = headContainer:FindFirstChildOfClass("Humanoid")
			local createBodyVelocityOption = Humanoid and Humanoid.RootPart
			local Head = headContainer:FindFirstChild("Head")
			local Accessory = headContainer:FindFirstChildOfClass("Accessory")
			local secondaryCameraSubject = Accessory and Accessory:FindFirstChild("Handle")

			if not Character or not cameraSubject or not parent then
				return windUi:Notify({
					Title = "Error",
					Content = "Your character is not ready",
					Duration = 3,
					loadFileState:Play()
				})
			end

			if parent.Velocity.Magnitude < 50 then
				getgenv().OldPos = parent.CFrame
			end

			if not Humanoid or not Humanoid.Sit then
				if not Head then
					if not secondaryCameraSubject then
						if Humanoid and createBodyVelocityOption then
							workspace.CurrentCamera.CameraSubject = Humanoid
						end
					else
						workspace.CurrentCamera.CameraSubject = secondaryCameraSubject
					end
				else
					workspace.CurrentCamera.CameraSubject = Head
				end

				if headContainer:FindFirstChildWhichIsA("BasePart") then
					local function updateBodyVelocity(secondaryInput, createBodyVelocityNumber, updateBodyVelocityNumber)
						parent.CFrame = CFrame.new(secondaryInput.Position) * createBodyVelocityNumber * updateBodyVelocityNumber
						Character:SetPrimaryPartCFrame(CFrame.new(secondaryInput.Position) * createBodyVelocityNumber * updateBodyVelocityNumber)
						parent.Velocity = Vector3.new(90000000, 900000000, 90000000)
						parent.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
					end
					local function handleBodyVelocity(cameraSubject)
						local timestamp = tick()
						local createBodyVelocityNumber = 0

						repeat
							if parent and Humanoid then
								if not (cameraSubject.Velocity.Magnitude < 50) then
									updateBodyVelocity(cameraSubject, CFrame.new(0, 1.5, Humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, -1.5, -Humanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, 1.5, Humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
									task.wait()
								else
									createBodyVelocityNumber = createBodyVelocityNumber + 100
									updateBodyVelocity(cameraSubject, CFrame.new(0, 1.5, 0) + Humanoid.MoveDirection * cameraSubject.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(createBodyVelocityNumber), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, -1.5, 0) + Humanoid.MoveDirection * cameraSubject.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(createBodyVelocityNumber), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, 1.5, 0) + Humanoid.MoveDirection * cameraSubject.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(createBodyVelocityNumber), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, -1.5, 0) + Humanoid.MoveDirection * cameraSubject.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(createBodyVelocityNumber), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, 1.5, 0) + Humanoid.MoveDirection, CFrame.Angles(math.rad(createBodyVelocityNumber), 0, 0))
									task.wait()
									updateBodyVelocity(cameraSubject, CFrame.new(0, -1.5, 0) + Humanoid.MoveDirection, CFrame.Angles(math.rad(createBodyVelocityNumber), 0, 0))
									task.wait()
								end
							end
						until timestamp + 2 < tick() or not createBodyVelocityFlag
					end

					workspace.FallenPartsDestroyHeight = 0 / 0

					local BodyVelocity = Instance.new("BodyVelocity")

					BodyVelocity.Parent = parent
					BodyVelocity.Velocity = Vector3.new(0, 0, 0)
					BodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
					cameraSubject:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

					if not createBodyVelocityOption then
						if not Head then
							if not secondaryCameraSubject then
								return windUi:Notify({
									Title = "Error",
									Content = player.Name .. " has no valid parts",
									Duration = 3,
									loadFileState:Play()
								})
							end

							handleBodyVelocity(secondaryCameraSubject)
						else
							handleBodyVelocity(Head)
						end
					else
						handleBodyVelocity(createBodyVelocityOption)
					end

					BodyVelocity:Destroy()
					cameraSubject:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
					workspace.CurrentCamera.CameraSubject = cameraSubject

					if getgenv().OldPos then
						repeat
							parent.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
							Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
							cameraSubject:ChangeState("GettingUp")

							for _, child in pairs(Character:GetChildren()) do
								if child:IsA("BasePart") then
									local velocity = Vector3.new()

									child.RotVelocity = Vector3.new()
									child.Velocity = velocity
								end
							end

							task.wait()
						until (parent.Position - getgenv().OldPos.p).Magnitude < 25

						workspace.FallenPartsDestroyHeight = getgenv().FPDH
					end

					return
				end

				return
			end

			return windUi:Notify({
				Title = "Error",
				Content = player.Name .. " is sitting",
				Duration = 3,
				loadFileState:Play()
			})
		end
	end

	characterTabData.TrollingTab:Button({
		Title = "Fling Target",
		Desc = "",
		Locked = false,
		Callback = function()
			if firstChild and firstChild:IsA("Player") then
				createBodyVelocityFlag = true
				task.spawn(function()
					createBodyVelocity(firstChild)
					createBodyVelocityFlag = false
					UpdateStatus()
				end)

				return
			end

			return windUi:Notify({
				Title = "Error",
				Content = "No Player selected",
				Duration = 3,
				loadFileState:Play()
			})
		end
	})
	characterTabData.TrollingTab:Section({
		Title = gradient("Fling Roles", Color3.fromHex("#561082"), Color3.fromHex("#823f10"))
	})
	characterTabData.TrollingTab:Button({
		Title = "Fling Sheriff",
		Desc = "",
		Locked = false,
		Callback = function()
			local capturedPlayer = nil
			local players = game:GetService("Players")

			for _, player in ipairs(players:GetPlayers()) do
				if player ~= game.Players.LocalPlayer and player.Character then
					local Gun = player.Character:FindFirstChild("Gun")
					local flingSheriffOption = player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Gun")

					if Gun or flingSheriffOption then
						capturedPlayer = player

						break
					end
				end
			end

			if not capturedPlayer then
				windUi:Notify({
					Title = "Info",
					Content = "Sheriff not found",
					Duration = 3,
					loadFileState:Play()
				})
			else
				createBodyVelocityFlag = true
				task.spawn(function()
					createBodyVelocity(capturedPlayer)
					createBodyVelocityFlag = false
					UpdateStatus()
				end)
			end
		end
	})
	characterTabData.TrollingTab:Button({
		Title = "Fling Murderer",
		Description = "",
		Locked = false,
		Callback = function()
			local capturedPlayer = nil
			local players = game:GetService("Players")

			for _, player in ipairs(players:GetPlayers()) do
				if player ~= game.Players.LocalPlayer and player.Character then
					local Knife = player.Character:FindFirstChild("Knife")
					local flingMurdererOption = player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Knife")

					if Knife or flingMurdererOption then
						capturedPlayer = player

						break
					end
				end
			end

			if not capturedPlayer then
				windUi:Notify({
					Title = "Info",
					Content = "Murder not found",
					Duration = 3,
					loadFileState:Play()
				})
			else
				createBodyVelocityFlag = true
				task.spawn(function()
					createBodyVelocity(capturedPlayer)
					createBodyVelocityFlag = false
					UpdateStatus()
				end)
			end
		end
	})
	characterTabData.AutoFarmTab:Section({
		Title = gradient("AutoFarm", Color3.fromHex("#ad56e3"), Color3.fromHex("#5698e3"))
	})

	local players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	local playerGuiContainer = players.LocalPlayer
	local updateCFrameFlag = false
	local smoothSaveModeFlag = false
	local autoFarmModeText = "Smooth"
	local teleportDelayNumber = 1.6
	local updateCFrameNumber = 26
	local capturedUpdateCFrameNumber = 0.35
	local cFrame = CFrame.new(-5009.277344, 334.841064, 21.711405)
	local inputData = {
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
		"Farmhouse"
	}

	local function isInputValid(touchInterestContainer)
		return touchInterestContainer:FindFirstChild("TouchInterest") ~= nil
	end
	local function handleInput()
		if playerGuiContainer.Character and playerGuiContainer.Character:FindFirstChild("HumanoidRootPart") then
			local HumanoidRootPart = playerGuiContainer.Character.HumanoidRootPart
			local touchInterestContainer = nil
			local huge = math.huge

			for _, item in ipairs(inputData) do
				local firstChild = Workspace:FindFirstChild(item)

				if firstChild and firstChild:FindFirstChild("CoinContainer") then
					for _, child in ipairs(firstChild.CoinContainer:GetChildren()) do
						if isInputValid(child) then
							local childPosition = child.Position
							local Magnitude = (HumanoidRootPart.Position - childPosition).Magnitude

							if Magnitude < huge then
								huge = Magnitude
								touchInterestContainer = child
							end
						end
					end
				end
			end

			return touchInterestContainer
		end

		return nil
	end
	local function isUpdateCFrameValid()
		local PlayerGui = playerGuiContainer:FindFirstChild("PlayerGui")

		if PlayerGui then
			local option = PlayerGui:FindFirstChild("MainGUI", true) and (PlayerGui.MainGUI:FindFirstChild("Game", true) and (PlayerGui.MainGUI.Game:FindFirstChild("CoinBags", true) and (PlayerGui.MainGUI.Game.CoinBags:FindFirstChild("Container", true) and PlayerGui.MainGUI.Game.CoinBags.Container:FindFirstChild("Candy"))))

			return option and option.Visible
		end

		return false
	end
	local function isValid()
		local PlayerGui = playerGuiContainer:FindFirstChild("PlayerGui")

		if PlayerGui then
			local isValidOption = PlayerGui:FindFirstChild("MainGUI", true) and (PlayerGui.MainGUI:FindFirstChild("Game", true) and (PlayerGui.MainGUI.Game:FindFirstChild("CoinBags", true) and (PlayerGui.MainGUI.Game.CoinBags:FindFirstChild("Container", true) and (PlayerGui.MainGUI.Game.CoinBags.Container:FindFirstChild("Candy", true) and PlayerGui.MainGUI.Game.CoinBags.Container.Candy:FindFirstChild("Full")))))

			return isValidOption and isValidOption.Visible
		end

		return false
	end
	local function updateHealth()
		local updateHealthCondition = playerGuiContainer.Character and playerGuiContainer.Character:FindFirstChildOfClass("Humanoid")

		if updateHealthCondition then
			updateHealthCondition.Health = 0
		end
	end
	local function handleCFrame(touchInterestContainer)
		if touchInterestContainer and touchInterestContainer.Parent then
			if isInputValid(touchInterestContainer) then
				return true
			end

			return false
		end

		return false
	end
	local function updateCFrame()
		local touchInterestContainer = handleInput()

		if touchInterestContainer and playerGuiContainer.Character and playerGuiContainer.Character:FindFirstChild("HumanoidRootPart") then
			local Position = touchInterestContainer.Position

			playerGuiContainer.Character.HumanoidRootPart.CFrame = CFrame.new(Position)

			local timestamp = tick()

			repeat
				task.wait(0.1)
			until not handleCFrame(touchInterestContainer) or tick() - timestamp > 1.5

			playerGuiContainer.Character.HumanoidRootPart.CFrame = cFrame
			task.wait(capturedUpdateCFrameNumber)
		end
	end
	local function secondaryUpdateCFrame()
		local touchInterestContainer = handleInput()

		if touchInterestContainer and playerGuiContainer.Character and playerGuiContainer.Character:FindFirstChild("HumanoidRootPart") then
			local Position = touchInterestContainer.Position
			local HumanoidRootPart = playerGuiContainer.Character.HumanoidRootPart
			local Magnitude = (Position - HumanoidRootPart.Position).Magnitude

			if Magnitude > 0 then
				local quotient = Magnitude / updateCFrameNumber
				local timestamp = tick()
				local HumanoidRootPartPosition = HumanoidRootPart.Position

				while quotient > tick() - timestamp do
					if not updateCFrameFlag or not isUpdateCFrameValid() or not handleCFrame(touchInterestContainer) then
						return
					end

					local updateCFrameNumber = HumanoidRootPartPosition:Lerp(Position, (tick() - timestamp) / quotient)

					if not smoothSaveModeFlag then
						HumanoidRootPart.CFrame = CFrame.new(updateCFrameNumber)
					else
						local difference = updateCFrameNumber - Vector3.new(0, 2.5, 0)

						HumanoidRootPart.CFrame = CFrame.new(difference) * CFrame.Angles(math.rad(90), 0, 0)
					end

					task.wait(0.015)
				end

				local number = tick()

				repeat
					task.wait(0.05)
				until not handleCFrame(touchInterestContainer) or tick() - number > 1.5

				task.wait(capturedUpdateCFrameNumber)
			end
		end
	end

	task.spawn(function()
		local flag = nil

		while true do
			flag = false
			task.wait(0.3)

			if updateCFrameFlag and isUpdateCFrameValid() then
				if isValid() then
					updateHealth();
					(function()
						flag = true
					end)()
				end

				if autoFarmModeText ~= "Teleport" then
					secondaryUpdateCFrame()
				else
					task.wait(teleportDelayNumber)
					updateCFrame()
				end
			end

			if flag then
				break
			end
		end
	end)
	characterTabData.AutoFarmTab:Dropdown({
		Title = "AutoFarm Mode",
		Values = {
			"Smooth",
			"Teleport"
		},
		Value = "Smooth",
		Callback = function(text)
			autoFarmModeText = text
		end
	})
	characterTabData.AutoFarmTab:Slider({
		Title = "Teleport Delay",
		Step = 0.1,
		Value = {
			Min = 0.5,
			Max = 5,
			Default = teleportDelayNumber
		},
		Callback = function(number)
			teleportDelayNumber = number
		end
	})
	characterTabData.AutoFarmTab:Slider({
		Title = "Smooth Speed",
		Step = 1,
		Value = {
			Min = 20,
			Max = 32,
			Default = updateCFrameNumber
		},
		Callback = function(smoothSpeedNumber)
			updateCFrameNumber = smoothSpeedNumber
		end
	})
	characterTabData.AutoFarmTab:Slider({
		Title = "Interval between collections (Smooth)",
		Step = 0.05,
		Value = {
			Min = 0.1,
			Max = 1.5,
			Default = capturedUpdateCFrameNumber
		},
		Callback = function(updateCFrameNumber)
			capturedUpdateCFrameNumber = updateCFrameNumber
		end
	})
	characterTabData.AutoFarmTab:Toggle({
		Title = "Enable AutoFarm",
		Default = false,
		Callback = function(enableAutoFarmFlag)
			updateCFrameFlag = enableAutoFarmFlag
		end
	})
	characterTabData.AutoFarmTab:Toggle({
		Title = "Smooth Save Mode",
		Default = false,
		Callback = function(updateCFrameFlag)
			smoothSaveModeFlag = updateCFrameFlag
		end
	})

	local function handleCoinEsp()
		local childs = {}

		for _, item in ipairs(inputData) do
			local firstChild = Workspace:FindFirstChild(item)

			if firstChild and firstChild:FindFirstChild("CoinContainer") then
				for _, child in ipairs(firstChild.CoinContainer:GetChildren()) do
					if child:IsA("BasePart") and child:FindFirstChildWhichIsA("TouchTransmitter") then
						table.insert(childs, child)
					end
				end
			end
		end

		return childs
	end
	local function handler()
		for _, child in pairs(game:GetService("CoreGui"):GetChildren()) do
			if child:IsA("BoxHandleAdornment") and child.Name == "CoinESP" then
				child:Destroy()
			end
		end
	end
	local function createCoinEsp()
		handler()

		for _, adornee in pairs(handleCoinEsp()) do
			local BoxHandleAdornment = Instance.new("BoxHandleAdornment")

			BoxHandleAdornment.Name = "CoinESP"
			BoxHandleAdornment.Adornee = adornee
			BoxHandleAdornment.AlwaysOnTop = true
			BoxHandleAdornment.ZIndex = 10
			BoxHandleAdornment.Size = adornee.Size
			BoxHandleAdornment.Color3 = Color3.fromRGB(255, 120, 0)
			BoxHandleAdornment.Transparency = 0.3
			BoxHandleAdornment.Parent = game:GetService("CoreGui")
		end
	end

	local flag = false

	local function handleShowCandyEsp()
		if not flag then
			flag = true
			task.spawn(function()
				while flag do
					createCoinEsp()
					task.wait(1.2)
				end
			end)

			return
		end
	end
	local function secondaryHandleShowCandyEsp()
		flag = false
		handler()
	end

	characterTabData.AutoFarmTab:Toggle({
		Title = "Show Candy ESP",
		Default = false,
		Callback = function(showCandyEspFlag)
			if not showCandyEspFlag then
				secondaryHandleShowCandyEsp()
			else
				handleShowCandyEsp()
			end
		end
	})
	characterTabData.AnimationsTab:Section({
		Title = gradient("Animations|Emotions", Color3.fromHex("#cf3030"), Color3.fromHex("#661f1f"))
	})

	local createAnimatorData = {
		Sit = "rbxassetid://2431845940",
		Ninja = "rbxassetid://2431864798",
		Zen = "rbxassetid://2431812646",
		Dab = "rbxassetid://2445521505",
		Floss = "rbxassetid://2452938820",
		Zombie = "rbxassetid://2513692312",
		Headless = "rbxassetid://2513664073"
	}
	local track = nil
	local choosingEmotionsForABindText = "Zen"
	local bindForEmotionsFlag = nil

	local function createAnimator(createAnimatorText)
		local localValuePlayer = game.Players.LocalPlayer
		local Humanoid = (localValuePlayer.Character or localValuePlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
		local createAnimatorOption = Humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", Humanoid)

		if track and track.IsPlaying then
			track:Stop()
		end

		local Animation = Instance.new("Animation")

		Animation.AnimationId = createAnimatorData[createAnimatorText]
		track = createAnimatorOption:LoadAnimation(Animation)
		track:Play()
		Humanoid.Running:Connect(function(speed)
			if speed > 0 and track and track.IsPlaying then
				track:Stop()
			end
		end)
	end

	for k, _ in pairs(createAnimatorData) do
		characterTabData.AnimationsTab:Button({
			Title = k,
			Desc = "",
			Locked = false,
			Callback = function()
				createAnimator(k)
			end
		})
	end

	characterTabData.AnimationsTab:Dropdown({
		Title = "Choosing emotions for a bind",
		Values = {
			"Sit",
			"Ninja",
			"Zen",
			"Dab",
			"Floss",
			"Zombie",
			"Headless"
		},
		Value = choosingEmotionsForABindText,
		Callback = function(text)
			choosingEmotionsForABindText = text
		end
	})
	characterTabData.AnimationsTab:Keybind({
		Title = "Bind For Emotions",
		Desc = "",
		Value = "",
		Callback = function(flag)
			bindForEmotionsFlag = flag
		end
	})
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and bindForEmotionsFlag and input.KeyCode.Name == bindForEmotionsFlag then
			createAnimator(choosingEmotionsForABindText)
		end
	end)

	local secondaryPlayers = game:GetService("Players")
	local secondaryLocalValuePlayer = secondaryPlayers.LocalPlayer
	local CurrentCamera = workspace.CurrentCamera
	local replicatedStorage = game:GetService("ReplicatedStorage")

	local function sendGetPlayerData(player)
		local GetPlayerData = replicatedStorage:FindFirstChild("GetPlayerData", true)

		if GetPlayerData then
			local data = GetPlayerData:InvokeServer()

			if data and data[player.Name] then
				return data[player.Name].Role
			end
		end

		return nil
	end
	local function updateCameraSubject(player)
		if player and player.Character and player.Character:FindFirstChild("Humanoid") then
			CurrentCamera.CameraSubject = player.Character.Humanoid
			windUi:Notify({
				Title = "Spectator",
				Content = "Now spectating: " .. player.Name,
				Duration = 2,
				loadFileState:Play()
			})
		end
	end
	local function secondaryUpdateCameraSubject()
		if secondaryLocalValuePlayer.Character and secondaryLocalValuePlayer.Character:FindFirstChild("Humanoid") then
			CurrentCamera.CameraSubject = secondaryLocalValuePlayer.Character.Humanoid
			windUi:Notify({
				Title = "Spectator",
				Content = "Returned to yourself",
				Duration = 2,
				loadFileState:Play()
			})
		end
	end
	local function handleSelectPlayerDropdown()
		local playerNames = {}

		for _, player in ipairs(secondaryPlayers:GetPlayers()) do
			if player ~= secondaryLocalValuePlayer then
				table.insert(playerNames, player.Name)
			end
		end

		return playerNames
	end

	characterTabData.SpectatorTab:Section({
		Title = gradient("Tracker", Color3.fromHex("#cf2db4"), Color3.fromHex("#2dcfc4"))
	})

	local capturedSelectPlayerText = nil
	local selectPlayerDropdown = characterTabData.SpectatorTab:Dropdown({
		Title = "Select Player",
		Values = handleSelectPlayerDropdown(),
		Multi = false,
		Default = 1,
		Callback = function(selectPlayerText)
			capturedSelectPlayerText = selectPlayerText
			windUi:Notify({
				Title = "Spectator",
				Content = "Selected player: " .. selectPlayerText,
				Duration = 2,
				loadFileState:Play()
			})
		end
	})

	characterTabData.SpectatorTab:Button({
		Title = "Spectate the selected player",
		Description = "",
		Callback = function()
			local firstChild = secondaryPlayers:FindFirstChild(capturedSelectPlayerText)

			if not firstChild then
				windUi:Notify({
					Title = "Spectator",
					Content = "Player not found",
					Duration = 2,
					loadFileState:Play()
				})
			else
				updateCameraSubject(firstChild)
			end
		end
	})
	characterTabData.SpectatorTab:Section({
		Title = gradient("spectate to roles", Color3.fromHex("#1233db"), Color3.fromHex("#d8db12"))
	})
	characterTabData.SpectatorTab:Button({
		Title = "Spectate the Sheriff",
		Description = "",
		Callback = function()
			for _, player in ipairs(secondaryPlayers:GetPlayers()) do
				if player ~= secondaryLocalValuePlayer and sendGetPlayerData(player) == "Sheriff" then
					updateCameraSubject(player)

					return
				end
			end

			windUi:Notify({
				Title = "Spectator",
				Content = "Sheriff not found",
				Duration = 2,
				loadFileState:Play()
			})
		end
	})
	characterTabData.SpectatorTab:Button({
		Title = "Spectate the Murder",
		Description = "",
		Callback = function()
			for _, player in ipairs(secondaryPlayers:GetPlayers()) do
				if player ~= secondaryLocalValuePlayer and sendGetPlayerData(player) == "Murderer" then
					updateCameraSubject(player)

					return
				end
			end

			windUi:Notify({
				Title = "Spectator",
				Content = "Murderer not found",
				Duration = 2,
				loadFileState:Play()
			})
		end
	})
	characterTabData.SpectatorTab:Section({
		Title = gradient("Spectate to yourself", Color3.fromHex("#db1241"), Color3.fromHex("#4712db"))
	})
	characterTabData.SpectatorTab:Button({
		Title = "Return to yourself",
		Description = "Stop spectating and return",
		Callback = function()
			secondaryUpdateCameraSubject()
		end
	})
	secondaryPlayers.PlayerAdded:Connect(function()
		selectPlayerDropdown:Refresh(handleSelectPlayerDropdown())
	end)
	secondaryPlayers.PlayerRemoving:Connect(function()
		selectPlayerDropdown:Refresh(handleSelectPlayerDropdown())
	end)
	characterTabData.OtherTab:Section({
		Title = gradient("Other", Color3.fromHex("#1291db"), Color3.fromHex("#12db62"))
	})

	local VirtualUser = game:GetService("VirtualUser")
	local antiAfkFlag = false
	local thread = nil
	local antiAfkNumber = 5

	characterTabData.OtherTab:Toggle({
		Title = "Anti-AFK",
		Default = false,
		Callback = function(flag)
			antiAfkFlag = flag

			if not flag then
				antiAfkFlag = false
				windUi:Notify({
					Title = "Anti-AFK",
					Content = "Anti-AFK deactivated",
					Duration = 2,
					loadFileState:Play()
				})
			else
				thread = task.spawn(function()
					while antiAfkFlag do
						task.wait(antiAfkNumber * 60)
						VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
						task.wait(0.1)
						VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
						windUi:Notify({
							Title = "Anti-AFK",
							Content = "Activity simulated after " .. antiAfkNumber .. " min",
							Duration = 2,
							loadFileState:Play()
						})
					end
				end)
				windUi:Notify({
					Title = "Anti-AFK",
					Content = "Anti-AFK activated (every " .. antiAfkNumber .. " min)",
					Duration = 2
				})
			end
		end
	})

	local alternatePlayers = game:GetService("Players")
	local _ = alternatePlayers.LocalPlayer

	characterTabData.OtherTab:Toggle({
		Title = "Anti-Fling",
		Default = false,
		Callback = function(antiFlingFlag)
			if not antiFlingFlag then
				getgenv().AntiFlingActive = false
			else
				getgenv().AntiFlingActive = true
				task.spawn(function()
					while getgenv().AntiFlingActive do
						AntiFling()
						task.wait(0.1)
					end
				end)
			end
		end
	})
	characterTabData.OtherTab:Section({
		Title = gradient("X-ray", Color3.fromHex("#12dbc4"), Color3.fromHex("#2212db"))
	})

	local secondaryWorkspace = game:GetService("Workspace")
	local alternateLocalValuePlayer = alternatePlayers.LocalPlayer
	local xRayModeFlag = false
	local localValueValueTransparencyModifier = 0.4
	local secondaryThread = nil

	local function createXRayIntensityModel(localValueTransparencyModifier)
		for _, descendant in ipairs(secondaryWorkspace:GetDescendants()) do
			if descendant:IsA("BasePart") and not descendant:IsDescendantOf(alternateLocalValuePlayer.Character or Instance.new("Model")) then
				pcall(function()
					descendant.LocalTransparencyModifier = localValueTransparencyModifier
				end)
			end
		end
	end
	local function createModel()
		for _, descendant in ipairs(secondaryWorkspace:GetDescendants()) do
			if descendant:IsA("BasePart") and not descendant:IsDescendantOf(alternateLocalValuePlayer.Character or Instance.new("Model")) then
				pcall(function()
					descendant.LocalTransparencyModifier = 0
				end)
			end
		end
	end
	local function handleXRayMode(flag)
		if not flag then
			if secondaryThread then
				task.cancel(secondaryThread)
				secondaryThread = nil
			end

			createModel()
		else
			secondaryThread = task.spawn(function()
				while xRayModeFlag do
					createXRayIntensityModel(localValueValueTransparencyModifier)
					task.wait(1.5)
				end
			end)
		end
	end

	characterTabData.OtherTab:Toggle({
		Title = "X-ray Mode",
		Default = false,
		Callback = function(xRayIntensityFlag)
			xRayModeFlag = xRayIntensityFlag
			handleXRayMode(xRayIntensityFlag)
			windUi:Notify("X-ray mode:", xRayIntensityFlag and "On" or "Off")
			loadFileState:Play()
		end
	})
	characterTabData.OtherTab:Slider({
		Title = "X-ray Intensity",
		Step = 1,
		Value = {
			Min = 20,
			Max = 80,
			Default = 40
		},
		Callback = function(_)
			localValueValueTransparencyModifier = Value / 100
			windUi:Notify("X-ray Transparency set to:", localValueValueTransparencyModifier)

			if xRayModeFlag then
				createXRayIntensityModel(localValueValueTransparencyModifier)
			end
		end
	})
	characterTabData.ServerTab:Section({
		Title = gradient("Actions with the server", Color3.fromHex("#d1de43"), Color3.fromHex("#8a1e25"))
	})

	local function handleRejoinGame()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
	end

	local item = {}
	local HttpService = game:GetService("HttpService")
	local TeleportService = game:GetService("TeleportService")
	local additionalLocalValuePlayer = game:GetService("Players").LocalPlayer
	local PlaceId = game.PlaceId

	local function handleServerHop()
		local ok, result = pcall(function()
			return game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
		end)

		if not ok then
			warn("Failed to fetch server list.")
		else
			local data = HttpService:JSONDecode(result)

			if data and data.data then
				local secondaryV = nil

				for _, secondaryItem in ipairs(data.data) do
					if secondaryItem.playing < secondaryItem.maxPlayers and not item[secondaryItem.id] then
						secondaryV = secondaryItem

						break
					end
				end

				if not secondaryV then
					warn("No available servers to hop to.")
				else
					item[secondaryV.id] = true
					TeleportService:TeleportToPlaceInstance(PlaceId, secondaryV.id, additionalLocalValuePlayer)
				end
			end
		end
	end

	characterTabData.ServerTab:Button({
		Title = "Rejoin Game",
		Description = "",
		Callback = function()
			handleRejoinGame()
		end
	})
	characterTabData.ServerTab:Button({
		Title = "Server Hop",
		Description = "",
		Callback = function()
			handleServerHop()
		end
	})

	local httpService = game:GetService("HttpService")
	local valuesText = "WindUI"

	makefolder(valuesText)

	local function handleSaveFile(saveFileText, secondaryArgument)
		local assetPath = valuesText .. "/" .. saveFileText .. ".json"
		local json = httpService:JSONEncode(secondaryArgument)

		writefile(assetPath, json)
	end
	local function jsonDecode(text)
		local assetPath = valuesText .. "/" .. text .. ".json"

		if not isfile(assetPath) then
			return
		end

		local readfileResult = readfile(assetPath)

		return httpService:JSONDecode(readfileResult)
	end
	local function handleValues()
		local conditions = {}

		for _, item in ipairs(listfiles(valuesText)) do
			local valuesCondition = item:match("([^/]+)%.json$")

			if valuesCondition then
				table.insert(conditions, valuesCondition)
			end
		end

		return conditions
	end

	characterTabData.SettingsTab:Section({
		Title = gradient("Window", Color3.fromHex("#cc46e0"), Color3.fromHex("#6546e0"))
	})

	local ks = {}

	for k, _ in pairs(windUi:GetThemes()) do
		table.insert(ks, k)
	end

	characterTabData.SettingsTab:Dropdown({
		Title = "Select Theme",
		Multi = false,
		AllowNone = false,
		Value = nil,
		Values = ks,
		Callback = function(selectThemeArgument)
			windUi:SetTheme(selectThemeArgument)
		end
	}):Select(windUi:GetCurrentTheme())

	local toggleWindowTransparency = characterTabData.SettingsTab:Toggle({
		Title = "Toggle Window Transparency",
		Callback = function(toggleWindowTransparencyArgument)
			uiLibrary:ToggleTransparency(toggleWindowTransparencyArgument)
		end,
		Value = windUi:GetTransparency()
	})

	characterTabData.SettingsTab:Section({
		Title = gradient("Save", Color3.fromHex("#3ba33e"), Color3.fromHex("#9a3ba3"))
	})

	local jsonDecodeText = ""

	characterTabData.SettingsTab:Input({
		Title = "Write File Name",
		PlaceholderText = "Enter file name",
		Callback = function(loadFileText)
			jsonDecodeText = loadFileText
		end
	})
	characterTabData.SettingsTab:Button({
		Title = "Save File",
		Callback = function()
			if jsonDecodeText ~= "" then
				handleSaveFile(jsonDecodeText, {
					Transparent = windUi:GetTransparency(),
					Theme = windUi:GetCurrentTheme()
				})
			end
		end
	})
	characterTabData.SettingsTab:Section({
		Title = gradient("Load", Color3.fromHex("#493ba3"), Color3.fromHex("#7e2ce8"))
	})

	local values = handleValues()
	local selectFileDropdown = characterTabData.SettingsTab:Dropdown({
		Title = "Select File",
		Multi = false,
		AllowNone = true,
		Values = values,
		Callback = function(loadFileText)
			jsonDecodeText = loadFileText
		end
	})

	characterTabData.SettingsTab:Button({
		Title = "Load File",
		Callback = function()
			if jsonDecodeText ~= "" then
				local decodedData = jsonDecode(jsonDecodeText)

				if decodedData then
					windUi:Notify({
						Title = "File Loaded",
						Content = "Loaded data: " .. httpService:JSONEncode(decodedData),
						Duration = 5,
						loadFileState:Play()
					})

					if decodedData.Transparent then
						uiLibrary:ToggleTransparency(decodedData.Transparent)
						toggleWindowTransparency:SetValue(decodedData.Transparent)
					end

					if decodedData.Theme then
						windUi:SetTheme(decodedData.Theme)
					end
				end
			end
		end
	})
	characterTabData.SettingsTab:Button({
		Title = "Overwrite File",
		Callback = function()
			if jsonDecodeText ~= "" then
				handleSaveFile(jsonDecodeText, {
					Transparent = windUi:GetTransparency(),
					Theme = windUi:GetCurrentTheme()
				})
			end
		end
	})
	characterTabData.SettingsTab:Button({
		Title = "Refresh List",
		Callback = function()
			selectFileDropdown:Refresh(handleValues())
		end
	})
	loadFileState:Play()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsForMM2RewHub/RewHub/refs/heads/main/qwertyMobile.lua"))()

	return
end

warn("\239\191\189\239\191\189 RewHub уже запущен!")
