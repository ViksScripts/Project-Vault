-- This file was deobfusctated/pasted by Lame (special thanks to project vault)

do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local Workspace = game:GetService("Workspace")
    local VirtualInput = game:GetService("VirtualInputManager")
    local HttpService = game:GetService("HttpService")
    local CORRECT_KEY = "XsM23487dFDSLC"
    local keyVerified = false
    local KEY_LINK = "https://link-center.net/6023738/sCFUmIFoWEkS"
    local function copyToClipboard(text)
        if setclipboard then
            setclipboard(text)
            return true
        end
        if toclipboard then
            toclipboard(text)
            return true
        end
        pcall(function()
            local ClipboardService = game:GetService("Clipboard")
            if ClipboardService and ClipboardService.set then
                ClipboardService:set(text)
                return true
            end
        end)
        pcall(function()
            local btn = Instance.new("TextButton")
            btn.Parent = (gethui and gethui()) or game:GetService("CoreGui")
            btn.Size = UDim2.new(0, 0, 0, 0)
            btn.Position = UDim2.new(0, -100, 0, -100)
            btn.Text = text
            btn:CaptureFocus()
            btn:CopyToClipboard()
            task.wait(0.1)
            btn:Destroy()
        end)
    end
    local _G = {
        EspEnabled = true,
        InventoryCheck = true,
        LogCheck = true,
        GunEsp = true,
        KillAura = false,
        KillAuraRadius = 75,
        WalkSpeedValue = 16,
        JumpPowerValue = 50,
        SpeedEnabled = false,
        JumpEnabled = false,
        NoclipEnabled = false,
        SilentAim = false,
        SilentAimSmoothness = 0.3,
        SilentAimFOV = 100,
        SilentAimHeadshot = true,
    }
    local playerRoles = {}
    local silentAimTarget = nil
    local isMinimized = false
    local COLORS = {
        Sheriff = Color3.fromRGB(0, 130, 255),
        Murderer = Color3.fromRGB(255, 35, 35),
        Innocent = Color3.fromRGB(45, 255, 85),
        DroppedGun = Color3.fromRGB(255, 215, 0),
    }
    local WEAPONS = {
        Knife = "Murderer",
        Blade = "Murderer",
        Sword = "Murderer",
        Gun = "Sheriff",
        Revolver = "Sheriff",
        Pistol = "Sheriff",
    }
    local sg = Instance.new("ScreenGui")
    sg.Name = "MM2_Prestige_Xeno"
    sg.Parent = (gethui and gethui()) or game:GetService("CoreGui")
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local KeyWindow = Instance.new("Frame")
    KeyWindow.Size = UDim2.new(0, 420, 0, 320)
    KeyWindow.Position = UDim2.new(0.5, -210, 0.5, -160)
    KeyWindow.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    KeyWindow.BorderSizePixel = 0
    KeyWindow.Active = true
    KeyWindow.Draggable = true
    KeyWindow.Parent = sg
    local KeyCorner = Instance.new("UICorner")
    KeyCorner.CornerRadius = UDim.new(0, 20)
    KeyCorner.Parent = KeyWindow
    local KeyGlow = Instance.new("Frame")
    KeyGlow.Size = UDim2.new(1, 4, 1, 4)
    KeyGlow.Position = UDim2.new(0, -2, 0, -2)
    KeyGlow.BackgroundColor3 = Color3.fromRGB(235, 180, 50)
    KeyGlow.BackgroundTransparency = 0.85
    KeyGlow.BorderSizePixel = 0
    KeyGlow.Parent = KeyWindow
    local KeyGlowCorner = Instance.new("UICorner")
    KeyGlowCorner.CornerRadius = UDim.new(0, 22)
    KeyGlowCorner.Parent = KeyGlow
    local KeyTitle = Instance.new("TextLabel")
    KeyTitle.Size = UDim2.new(1, 0, 0, 60)
    KeyTitle.Position = UDim2.new(0, 0, 0, 0)
    KeyTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    KeyTitle.BorderSizePixel = 0
    KeyTitle.Text = "⚡ MM2 PRESTIGE XENO V4 ⚡"
    KeyTitle.TextColor3 = Color3.fromRGB(235, 180, 50)
    KeyTitle.Font = Enum.Font.GothamBold
    KeyTitle.TextSize = 20
    KeyTitle.Parent = KeyWindow
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 20)
    TitleCorner.Parent = KeyTitle
    local KeySub = Instance.new("TextLabel")
    KeySub.Size = UDim2.new(1, 0, 0, 25)
    KeySub.Position = UDim2.new(0, 0, 0, 55)
    KeySub.BackgroundTransparency = 1
    KeySub.Text = "ENTER LICENSE KEY"
    KeySub.TextColor3 = Color3.fromRGB(160, 160, 170)
    KeySub.Font = Enum.Font.Gotham
    KeySub.TextSize = 12
    KeySub.Parent = KeyWindow
    local KeyBox = Instance.new("TextBox")
    KeyBox.Size = UDim2.new(0.8, 0, 0, 50)
    KeyBox.Position = UDim2.new(0.5, -160, 0, 100)
    KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    KeyBox.BorderSizePixel = 0
    KeyBox.PlaceholderText = "XXXXXXXXXX"
    KeyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
    KeyBox.Text = ""
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.Font = Enum.Font.GothamBold
    KeyBox.TextSize = 16
    KeyBox.Parent = KeyWindow
    local KeyBoxCorner = Instance.new("UICorner")
    KeyBoxCorner.CornerRadius = UDim.new(0, 12)
    KeyBoxCorner.Parent = KeyBox
    local KeyBoxStroke = Instance.new("UIStroke")
    KeyBoxStroke.Color = Color3.fromRGB(235, 180, 50)
    KeyBoxStroke.Thickness = 1.5
    KeyBoxStroke.Transparency = 0.5
    KeyBoxStroke.Parent = KeyBox
    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Size = UDim2.new(0.8, 0, 0, 45)
    SubmitBtn.Position = UDim2.new(0.5, -160, 0, 170)
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(235, 180, 50)
    SubmitBtn.Text = "VERIFY"
    SubmitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    SubmitBtn.Font = Enum.Font.GothamBold
    SubmitBtn.TextSize = 16
    SubmitBtn.BorderSizePixel = 0
    SubmitBtn.Parent = KeyWindow
    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0, 12)
    SubmitCorner.Parent = SubmitBtn
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 40)
    GetKeyBtn.Position = UDim2.new(0.5, -160, 0, 230)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    GetKeyBtn.Text = "🔑 GET KEY"
    GetKeyBtn.TextColor3 = Color3.fromRGB(235, 180, 50)
    GetKeyBtn.Font = Enum.Font.GothamSemibold
    GetKeyBtn.TextSize = 14
    GetKeyBtn.BorderSizePixel = 0
    GetKeyBtn.Parent = KeyWindow
    local GetKeyCorner = Instance.new("UICorner")
    GetKeyCorner.CornerRadius = UDim.new(0, 12)
    GetKeyCorner.Parent = GetKeyBtn
    local KeyMessage = Instance.new("TextLabel")
    KeyMessage.Size = UDim2.new(1, 0, 0, 25)
    KeyMessage.Position = UDim2.new(0, 0, 0, 275)
    KeyMessage.BackgroundTransparency = 1
    KeyMessage.Text = ""
    KeyMessage.TextColor3 = Color3.fromRGB(255, 100, 100)
    KeyMessage.Font = Enum.Font.Gotham
    KeyMessage.TextSize = 11
    KeyMessage.Parent = KeyWindow
    local CopyNotification = Instance.new("TextLabel")
    CopyNotification.Size = UDim2.new(0, 150, 0, 35)
    CopyNotification.Position = UDim2.new(0.5, -75, 1, -60)
    CopyNotification.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    CopyNotification.Text = "📋 COPIED!"
    CopyNotification.TextColor3 = Color3.fromRGB(235, 180, 50)
    CopyNotification.Font = Enum.Font.GothamBold
    CopyNotification.TextSize = 12
    CopyNotification.BackgroundTransparency = 1
    CopyNotification.Visible = false
    CopyNotification.Parent = KeyWindow
    local CopyCorner = Instance.new("UICorner")
    CopyCorner.CornerRadius = UDim.new(0, 8)
    CopyCorner.Parent = CopyNotification
    local function showNotification(text, isError)
        KeyMessage.Text = text
        KeyMessage.TextColor3 = (isError and Color3.fromRGB(255, 100, 100))
            or Color3.fromRGB(100, 255, 100)
        task.wait(2)
        KeyMessage.Text = ""
    end
    local function showCopyNotification()
        CopyNotification.BackgroundTransparency = 0.9
        CopyNotification.Visible = true
        TweenService:Create(CopyNotification, TweenInfo.new(0.2), { BackgroundTransparency = 0.2 })
            :Play()
        task.wait(1.5)
        TweenService:Create(CopyNotification, TweenInfo.new(0.3), { BackgroundTransparency = 1 })
            :Play()
        task.wait(0.3)
        CopyNotification.Visible = false
    end
    GetKeyBtn.MouseButton1Click:Connect(function()
        copyToClipboard(KEY_LINK)
        showCopyNotification()
    end)
    local createMainMenu
    local function verifyKey()
        local enteredKey = KeyBox.Text
        if enteredKey == CORRECT_KEY then
            showNotification("✓ KEY VERIFIED! Loading menu...", false)
            keyVerified = true
            TweenService:Create(KeyWindow, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
                :Play()
            TweenService:Create(KeyWindow, TweenInfo.new(0.2), { Size = UDim2.new(0, 0, 0, 0) })
                :Play()
            task.wait(0.2)
            KeyWindow.Visible = false
            if createMainMenu then
                createMainMenu()
            else
                task.wait(0.1)
                createMainMenu()
            end
        else
            showNotification("✗ INVALID KEY! Please check and try again.", true)
            KeyBox.Text = ""
        end
    end
    SubmitBtn.MouseButton1Click:Connect(verifyKey)
    KeyBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            verifyKey()
        end
    end)
    function createMainMenu()
        local MainFrame = Instance.new("Frame")
        MainFrame.Size = UDim2.new(0, 680, 0, 580)
        MainFrame.Position = UDim2.new(0.5, -340, 0.5, -290)
        MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
        MainFrame.BorderSizePixel = 0
        MainFrame.Active = true
        MainFrame.Draggable = true
        MainFrame.Parent = sg
        local MainCorner = Instance.new("UICorner")
        MainCorner.CornerRadius = UDim.new(0, 12)
        MainCorner.Parent = MainFrame
        local GlowFrame = Instance.new("Frame")
        GlowFrame.Size = UDim2.new(1, 4, 1, 4)
        GlowFrame.Position = UDim2.new(0, -2, 0, -2)
        GlowFrame.BackgroundColor3 = Color3.fromRGB(235, 180, 50)
        GlowFrame.BackgroundTransparency = 0.8
        GlowFrame.BorderSizePixel = 0
        GlowFrame.Parent = MainFrame
        local GlowCorner = Instance.new("UICorner")
        GlowCorner.CornerRadius = UDim.new(0, 14)
        GlowCorner.Parent = GlowFrame
        local Gradient = Instance.new("UIGradient")
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(235, 180, 50)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 50)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 180, 50)),
        })
        Gradient.Rotation = 45
        GlowFrame.BackgroundTransparency = 0.85
        local ContentContainer = Instance.new("Frame")
        ContentContainer.Size = UDim2.new(1, 0, 1, 0)
        ContentContainer.BackgroundTransparency = 1
        ContentContainer.Parent = MainFrame
        local TopGradient = Instance.new("Frame")
        TopGradient.Size = UDim2.new(1, 0, 0, 60)
        TopGradient.Position = UDim2.new(0, 0, 0, 0)
        TopGradient.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        TopGradient.BorderSizePixel = 0
        TopGradient.Parent = ContentContainer
        local TopGradientCorner = Instance.new("UICorner")
        TopGradientCorner.CornerRadius = UDim.new(0, 12)
        TopGradientCorner.Parent = TopGradient
        local TopGradientEffect = Instance.new("UIGradient")
        TopGradientEffect.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(235, 180, 50)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25)),
        })
        TopGradientEffect.Rotation = 90
        TopGradientEffect.Parent = TopGradient
        local TitleIcon = Instance.new("TextLabel")
        TitleIcon.Size = UDim2.new(0, 45, 1, 0)
        TitleIcon.Position = UDim2.new(0, 15, 0, 0)
        TitleIcon.BackgroundTransparency = 1
        TitleIcon.Text = "⚡"
        TitleIcon.TextColor3 = Color3.fromRGB(235, 180, 50)
        TitleIcon.TextSize = 28
        TitleIcon.Font = Enum.Font.GothamBold
        TitleIcon.TextXAlignment = Enum.TextXAlignment.Center
        TitleIcon.Parent = TopGradient
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(0, 350, 0, 30)
        Title.Position = UDim2.new(0, 65, 0, 10)
        Title.BackgroundTransparency = 1
        Title.Text = "PRESTIGE V4"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 22
        Title.Font = Enum.Font.GothamBold
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = TopGradient
        local Subtitle = Instance.new("TextLabel")
        Subtitle.Size = UDim2.new(0, 250, 0, 18)
        Subtitle.Position = UDim2.new(0, 65, 0, 38)
        Subtitle.BackgroundTransparency = 1
        Subtitle.Text = "MM2 Premium Cheat"
        Subtitle.TextColor3 = Color3.fromRGB(160, 160, 170)
        Subtitle.TextSize = 11
        Subtitle.Font = Enum.Font.Gotham
        Subtitle.TextXAlignment = Enum.TextXAlignment.Left
        Subtitle.Parent = TopGradient
        local MinimizeBtn = Instance.new("TextButton")
        MinimizeBtn.Size = UDim2.new(0, 36, 0, 36)
        MinimizeBtn.Position = UDim2.new(1, -90, 0, 12)
        MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        MinimizeBtn.Text = "−"
        MinimizeBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
        MinimizeBtn.Font = Enum.Font.GothamBold
        MinimizeBtn.TextSize = 24
        MinimizeBtn.BorderSizePixel = 0
        MinimizeBtn.Parent = TopGradient
        local MinCorner = Instance.new("UICorner")
        MinCorner.CornerRadius = UDim.new(0, 8)
        MinCorner.Parent = MinimizeBtn
        MinimizeBtn.MouseEnter:Connect(function()
            TweenService
                :Create(
                    MinimizeBtn,
                    TweenInfo.new(0.2),
                    { BackgroundColor3 = Color3.fromRGB(235, 180, 50), TextColor3 = Color3.fromRGB(
                        0,
                        0,
                        0
                    ) }
                )
                :Play()
        end)
        MinimizeBtn.MouseLeave:Connect(function()
            TweenService
                :Create(
                    MinimizeBtn,
                    TweenInfo.new(0.2),
                    {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 35),
                        TextColor3 = Color3.fromRGB(180, 180, 190),
                    }
                )
                :Play()
        end)
        local CloseBtn = Instance.new("TextButton")
        CloseBtn.Size = UDim2.new(0, 36, 0, 36)
        CloseBtn.Position = UDim2.new(1, -45, 0, 12)
        CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        CloseBtn.Text = "✕"
        CloseBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
        CloseBtn.Font = Enum.Font.GothamBold
        CloseBtn.TextSize = 20
        CloseBtn.BorderSizePixel = 0
        CloseBtn.Parent = TopGradient
        local CloseCorner = Instance.new("UICorner")
        CloseCorner.CornerRadius = UDim.new(0, 8)
        CloseCorner.Parent = CloseBtn
        CloseBtn.MouseEnter:Connect(function()
            TweenService
                :Create(
                    CloseBtn,
                    TweenInfo.new(0.2),
                    {
                        BackgroundColor3 = Color3.fromRGB(200, 60, 60),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                    }
                )
                :Play()
        end)
        CloseBtn.MouseLeave:Connect(function()
            TweenService
                :Create(
                    CloseBtn,
                    TweenInfo.new(0.2),
                    {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 35),
                        TextColor3 = Color3.fromRGB(180, 180, 190),
                    }
                )
                :Play()
        end)
        CloseBtn.MouseButton1Click:Connect(function()
            sg:Destroy()
        end)
        local minimized = false
        local function toggleMinimize()
            minimized = not minimized
            if minimized then
                TweenService:Create(
                    MainFrame,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                    { Size = UDim2.new(0, 680, 0, 60) }
                ):Play()
                TweenService:Create(
                    ContentContainer,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                    { Size = UDim2.new(1, 0, 0, 60) }
                ):Play()
                TweenService:Create(
                    GlowFrame,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                    { Size = UDim2.new(1, 4, 0, 60) }
                ):Play()
                MinimizeBtn.Text = "+"
            else
                TweenService:Create(
                    MainFrame,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                    { Size = UDim2.new(0, 680, 0, 580) }
                ):Play()
                TweenService:Create(
                    ContentContainer,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                    { Size = UDim2.new(1, 0, 1, 0) }
                ):Play()
                TweenService:Create(
                    GlowFrame,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                    { Size = UDim2.new(1, 4, 1, 4) }
                ):Play()
                MinimizeBtn.Text = "−"
            end
        end
        MinimizeBtn.MouseButton1Click:Connect(toggleMinimize)
        local Sidebar = Instance.new("Frame")
        Sidebar.Size = UDim2.new(0, 160, 1, -60)
        Sidebar.Position = UDim2.new(0, 0, 0, 60)
        Sidebar.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
        Sidebar.BorderSizePixel = 0
        Sidebar.Parent = ContentContainer
        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(1, -175, 1, -75)
        Container.Position = UDim2.new(0, 170, 0, 70)
        Container.BackgroundTransparency = 1
        Container.Parent = ContentContainer
        local EspPage = Instance.new("ScrollingFrame")
        local CombatPage = Instance.new("ScrollingFrame")
        local MovePage = Instance.new("ScrollingFrame")
        local TeleportPage = Instance.new("ScrollingFrame")
        local TrollingPage = Instance.new("ScrollingFrame")
        local activePage = EspPage
        for _, p in ipairs({ EspPage, CombatPage, MovePage, TeleportPage, TrollingPage }) do
            p.Size = UDim2.new(1, 0, 1, 0)
            p.BackgroundTransparency = 1
            p.BorderSizePixel = 0
            p.ScrollBarThickness = 3
            p.ScrollBarImageColor3 = Color3.fromRGB(235, 180, 50)
            p.ScrollBarImageTransparency = 0.5
            p.Visible = false
            p.Parent = Container
            local list = Instance.new("UIListLayout")
            list.Padding = UDim.new(0, 10)
            list.HorizontalAlignment = Enum.HorizontalAlignment.Center
            list.Parent = p
        end
        EspPage.Visible = true
        local function switchTab(targetPage)
            if activePage == targetPage then
                return
            end
            targetPage.CanvasPosition = Vector2.new(0, 0)
            targetPage.Visible = true
            TweenService:Create(
                activePage,
                TweenInfo.new(0.15),
                { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, -20) }
            ):Play()
            activePage.Visible = false
            TweenService:Create(
                targetPage,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                { Size = UDim2.new(1, 0, 1, 0) }
            ):Play()
            activePage = targetPage
        end
        local currentActiveButton = nil
        local function createTabBtn(text, icon, pos, targetPage)
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1, -15, 0, 48)
            b.Position = pos
            b.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
            b.BorderSizePixel = 0
            b.Text = "  " .. icon .. "  " .. text
            b.TextColor3 = Color3.fromRGB(160, 160, 170)
            b.Font = Enum.Font.GothamSemibold
            b.TextSize = 14
            b.TextXAlignment = Enum.TextXAlignment.Left
            b.Parent = Sidebar
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 10)
            btnCorner.Parent = b
            if targetPage == EspPage then
                b.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
                b.TextColor3 = Color3.fromRGB(235, 180, 50)
                currentActiveButton = b
                local activeLine = Instance.new("Frame")
                activeLine.Size = UDim2.new(0, 3, 1, -12)
                activeLine.Position = UDim2.new(1, -3, 0, 6)
                activeLine.BackgroundColor3 = Color3.fromRGB(235, 180, 50)
                activeLine.BorderSizePixel = 0
                activeLine.Parent = b
            end
            b.MouseButton1Click:Connect(function()
                if currentActiveButton then
                    for _, child in ipairs(currentActiveButton:GetChildren()) do
                        if child:IsA("Frame") then
                            child:Destroy()
                        end
                    end
                    TweenService
                        :Create(
                            currentActiveButton,
                            TweenInfo.new(0.2),
                            {
                                BackgroundColor3 = Color3.fromRGB(22, 22, 28),
                                TextColor3 = Color3.fromRGB(160, 160, 170),
                            }
                        )
                        :Play()
                end
                currentActiveButton = b
                TweenService
                    :Create(
                        b,
                        TweenInfo.new(0.2),
                        {
                            BackgroundColor3 = Color3.fromRGB(35, 35, 45),
                            TextColor3 = Color3.fromRGB(235, 180, 50),
                        }
                    )
                    :Play()
                local activeLine = Instance.new("Frame")
                activeLine.Size = UDim2.new(0, 3, 1, -12)
                activeLine.Position = UDim2.new(1, -3, 0, 6)
                activeLine.BackgroundColor3 = Color3.fromRGB(235, 180, 50)
                activeLine.BorderSizePixel = 0
                activeLine.Parent = b
                switchTab(targetPage)
            end)
        end
        createTabBtn("Visuals", "👁️", UDim2.new(0, 8, 0, 15), EspPage)
        createTabBtn("Combat", "⚔️", UDim2.new(0, 8, 0, 68), CombatPage)
        createTabBtn("Movement", "🏃", UDim2.new(0, 8, 0, 121), MovePage)
        createTabBtn("Teleport", "🌀", UDim2.new(0, 8, 0, 174), TeleportPage)
        createTabBtn("Trolling", "🎭", UDim2.new(0, 8, 0, 227), TrollingPage)
        local function createToggle(parent, text, startState, callback)
            local state = startState
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, -10, 0, 52)
            row.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
            row.BorderSizePixel = 0
            row.Parent = parent
            local rowCorner = Instance.new("UICorner")
            rowCorner.CornerRadius = UDim.new(0, 8)
            rowCorner.Parent = row
            local rowStroke = Instance.new("UIStroke")
            rowStroke.Color = Color3.fromRGB(30, 30, 35)
            rowStroke.Thickness = 1
            rowStroke.Parent = row
            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(0.7, 0, 1, 0)
            lbl.Position = UDim2.new(0, 15, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = text
            lbl.TextColor3 = Color3.fromRGB(210, 210, 220)
            lbl.Font = Enum.Font.Gotham
            lbl.TextSize = 13
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.Parent = row
            local switch = Instance.new("TextButton")
            switch.Size = UDim2.new(0, 48, 0, 26)
            switch.Position = UDim2.new(1, -58, 0, 13)
            switch.BackgroundColor3 = (state and Color3.fromRGB(235, 180, 50))
                or Color3.fromRGB(45, 45, 50)
            switch.Text = ""
            switch.BorderSizePixel = 0
            switch.Parent = row
            local swCorner = Instance.new("UICorner")
            swCorner.CornerRadius = UDim.new(1, 0)
            swCorner.Parent = switch
            local dot = Instance.new("Frame")
            dot.Size = UDim2.new(0, 20, 0, 20)
            dot.Position = (state and UDim2.new(1, -24, 0, 3)) or UDim2.new(0, 3, 0, 3)
            dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            dot.BorderSizePixel = 0
            dot.Parent = switch
            local dotCorner = Instance.new("UICorner")
            dotCorner.CornerRadius = UDim.new(1, 0)
            dotCorner.Parent = dot
            switch.MouseButton1Click:Connect(function()
                state = not state
                local targetColor = (state and Color3.fromRGB(235, 180, 50))
                    or Color3.fromRGB(45, 45, 50)
                local targetPos = (state and UDim2.new(1, -24, 0, 3)) or UDim2.new(0, 3, 0, 3)
                TweenService:Create(
                    switch,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                    { BackgroundColor3 = targetColor }
                ):Play()
                TweenService
                    :Create(
                        dot,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad),
                        { Position = targetPos }
                    )
                    :Play()
                callback(state)
            end)
        end
        local function createSlider(parent, text, minVal, maxVal, defaultVal, callback)
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, -10, 0, 75)
            row.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
            row.BorderSizePixel = 0
            row.Parent = parent
            local rowCorner = Instance.new("UICorner")
            rowCorner.CornerRadius = UDim.new(0, 8)
            rowCorner.Parent = row
            local rowStroke = Instance.new("UIStroke")
            rowStroke.Color = Color3.fromRGB(30, 30, 35)
            rowStroke.Thickness = 1
            rowStroke.Parent = row
            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(1, -20, 0, 28)
            lbl.Position = UDim2.new(0, 15, 0, 8)
            lbl.BackgroundTransparency = 1
            lbl.Text = text .. "  " .. defaultVal
            lbl.TextColor3 = Color3.fromRGB(210, 210, 220)
            lbl.Font = Enum.Font.Gotham
            lbl.TextSize = 13
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.Parent = row
            local sliderBg = Instance.new("Frame")
            sliderBg.Size = UDim2.new(1, -30, 0, 5)
            sliderBg.Position = UDim2.new(0, 15, 0, 48)
            sliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            sliderBg.BorderSizePixel = 0
            sliderBg.Parent = row
            local sliderBgCorner = Instance.new("UICorner")
            sliderBgCorner.CornerRadius = UDim.new(1, 0)
            sliderBgCorner.Parent = sliderBg
            local sliderFill = Instance.new("Frame")
            sliderFill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
            sliderFill.BackgroundColor3 = Color3.fromRGB(235, 180, 50)
            sliderFill.BorderSizePixel = 0
            sliderFill.Parent = sliderBg
            local sliderFillCorner = Instance.new("UICorner")
            sliderFillCorner.CornerRadius = UDim.new(1, 0)
            sliderFillCorner.Parent = sliderFill
            local sliderBtn = Instance.new("TextButton")
            sliderBtn.Size = UDim2.new(0, 18, 0, 18)
            sliderBtn.Position = UDim2.new((defaultVal - minVal) / (maxVal - minVal), -9, 0, -7)
            sliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderBtn.Text = ""
            sliderBtn.BorderSizePixel = 0
            sliderBtn.Parent = row
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(1, 0)
            btnCorner.Parent = sliderBtn
            local dragging = false
            sliderBtn.MouseButton1Down:Connect(function()
                dragging = true
                while dragging and row.Parent do
                    local mousePos = UserInputService:GetMouseLocation()
                    local rowPos = sliderBg.AbsolutePosition.X
                    local rowWidth = sliderBg.AbsoluteSize.X
                    local percent = math.clamp((mousePos.X - rowPos) / rowWidth, 0, 1)
                    local value = minVal + (percent * (maxVal - minVal))
                    sliderFill.Size = UDim2.new(percent, 0, 1, 0)
                    sliderBtn.Position = UDim2.new(percent, -9, 0, -7)
                    lbl.Text = text .. "  " .. math.floor(value)
                    callback(math.floor(value))
                    task.wait()
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
        end
        local function createTextBox(parent, textStr, placeholder, callback)
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, -10, 0, 52)
            row.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
            row.BorderSizePixel = 0
            row.Parent = parent
            local rowCorner = Instance.new("UICorner")
            rowCorner.CornerRadius = UDim.new(0, 8)
            rowCorner.Parent = row
            local rowStroke = Instance.new("UIStroke")
            rowStroke.Color = Color3.fromRGB(30, 30, 35)
            rowStroke.Thickness = 1
            rowStroke.Parent = row
            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(0.6, 0, 1, 0)
            lbl.Position = UDim2.new(0, 15, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = textStr
            lbl.TextColor3 = Color3.fromRGB(210, 210, 220)
            lbl.Font = Enum.Font.Gotham
            lbl.TextSize = 13
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.Parent = row
            local box = Instance.new("TextBox")
            box.Size = UDim2.new(0, 75, 0, 32)
            box.Position = UDim2.new(1, -90, 0, 10)
            box.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            box.BorderSizePixel = 0
            box.Text = placeholder
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
            box.Font = Enum.Font.GothamBold
            box.TextSize = 13
            box.Parent = row
            local bCorner = Instance.new("UICorner")
            bCorner.CornerRadius = UDim.new(0, 6)
            bCorner.Parent = box
            box.FocusLost:Connect(function()
                local num = tonumber(box.Text)
                if num then
                    callback(num)
                end
            end)
        end
        local function createActionButton(parent, text, callback)
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, -10, 0, 52)
            row.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
            row.BorderSizePixel = 0
            row.Parent = parent
            local rowCorner = Instance.new("UICorner")
            rowCorner.CornerRadius = UDim.new(0, 8)
            rowCorner.Parent = row
            local rowStroke = Instance.new("UIStroke")
            rowStroke.Color = Color3.fromRGB(30, 30, 35)
            rowStroke.Thickness = 1
            rowStroke.Parent = row
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.8, 0, 0, 36)
            btn.Position = UDim2.new(0.5, -150, 0, 8)
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            btn.Text = text
            btn.TextColor3 = Color3.fromRGB(210, 210, 220)
            btn.Font = Enum.Font.GothamSemibold
            btn.TextSize = 13
            btn.BorderSizePixel = 0
            btn.Parent = row
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 6)
            btnCorner.Parent = btn
            btn.MouseEnter:Connect(function()
                TweenService
                    :Create(
                        btn,
                        TweenInfo.new(0.2),
                        {
                            BackgroundColor3 = Color3.fromRGB(235, 180, 50),
                            TextColor3 = Color3.fromRGB(0, 0, 0),
                        }
                    )
                    :Play()
            end)
            btn.MouseLeave:Connect(function()
                TweenService
                    :Create(
                        btn,
                        TweenInfo.new(0.2),
                        {
                            BackgroundColor3 = Color3.fromRGB(30, 30, 35),
                            TextColor3 = Color3.fromRGB(210, 210, 220),
                        }
                    )
                    :Play()
            end)
            btn.MouseButton1Click:Connect(callback)
        end
        local function createToggleButton(parent, text, startState, callback)
            local state = startState
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, -10, 0, 52)
            row.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
            row.BorderSizePixel = 0
            row.Parent = parent
            local rowCorner = Instance.new("UICorner")
            rowCorner.CornerRadius = UDim.new(0, 8)
            rowCorner.Parent = row
            local rowStroke = Instance.new("UIStroke")
            rowStroke.Color = Color3.fromRGB(30, 30, 35)
            rowStroke.Thickness = 1
            rowStroke.Parent = row
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.8, 0, 0, 36)
            btn.Position = UDim2.new(0.5, -150, 0, 8)
            btn.BackgroundColor3 = (state and Color3.fromRGB(235, 180, 50))
                or Color3.fromRGB(30, 30, 35)
            btn.Text = text .. ((state and "  🔴") or "  ⚪")
            btn.TextColor3 = (state and Color3.fromRGB(0, 0, 0)) or Color3.fromRGB(210, 210, 220)
            btn.Font = Enum.Font.GothamSemibold
            btn.TextSize = 13
            btn.BorderSizePixel = 0
            btn.Parent = row
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 6)
            btnCorner.Parent = btn
            btn.MouseButton1Click:Connect(function()
                state = not state
                local targetColor = (state and Color3.fromRGB(235, 180, 50))
                    or Color3.fromRGB(30, 30, 35)
                local targetTextColor = (state and Color3.fromRGB(0, 0, 0))
                    or Color3.fromRGB(210, 210, 220)
                btn.Text = text .. ((state and "  🔴") or "  ⚪")
                TweenService:Create(
                    btn,
                    TweenInfo.new(0.2),
                    { BackgroundColor3 = targetColor, TextColor3 = targetTextColor }
                ):Play()
                callback(state)
            end)
        end
        createToggle(EspPage, "Master Role ESP", _G.EspEnabled, function(v)
            _G.EspEnabled = v
        end)
        createToggle(CombatPage, "Murderer Kill Aura", _G.KillAura, function(v)
            _G.KillAura = v
        end)
        createTextBox(CombatPage, "Kill Aura Radius", "75", function(v)
            _G.KillAuraRadius = v
        end)
        createToggle(MovePage, "Speed Hack", _G.SpeedEnabled, function(v)
            _G.SpeedEnabled = v
        end)
        createTextBox(MovePage, "WalkSpeed Value", "16", function(v)
            _G.WalkSpeedValue = v
        end)
        createToggle(MovePage, "Jump Hack", _G.JumpEnabled, function(v)
            _G.JumpEnabled = v
        end)
        createTextBox(MovePage, "JumpPower Value", "50", function(v)
            _G.JumpPowerValue = v
        end)
        createToggle(MovePage, "Noclip", _G.NoclipEnabled, function(v)
            _G.NoclipEnabled = v
            if v and LocalPlayer.Character then
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            elseif LocalPlayer.Character then
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end)
        createActionButton(TeleportPage, "📡 TP to Murderer", function()
            for _, player in ipairs(Players:GetPlayers()) do
                if
                    (playerRoles[player.Name] == "Murderer")
                    and player.Character
                    and player.Character:FindFirstChild("HumanoidRootPart")
                then
                    local hrp = LocalPlayer.Character
                        and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
                    end
                    break
                end
            end
        end)
        createActionButton(TeleportPage, "🔫 TP to Sheriff", function()
            for _, player in ipairs(Players:GetPlayers()) do
                if
                    (playerRoles[player.Name] == "Sheriff")
                    and player.Character
                    and player.Character:FindFirstChild("HumanoidRootPart")
                then
                    local hrp = LocalPlayer.Character
                        and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
                    end
                    break
                end
            end
        end)
        local flingMurdererActive = false
        local flingSheriffActive = false
        local flingConnection = nil
        local flingStrength = 400
        local function stopFling()
            if flingConnection then
                flingConnection:Disconnect()
                flingConnection = nil
            end
            flingMurdererActive = false
            flingSheriffActive = false
        end
        local function startFling()
            if flingConnection then
                flingConnection:Disconnect()
            end
            flingConnection = RunService.Heartbeat:Connect(function()
                if
                    not LocalPlayer.Character
                    or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                then
                    return
                end
                local hrp = LocalPlayer.Character.HumanoidRootPart
                local targetPlayer = nil
                if flingMurdererActive then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if
                            (playerRoles[p.Name] == "Murderer")
                            and p.Character
                            and p.Character:FindFirstChild("HumanoidRootPart")
                        then
                            targetPlayer = p
                            break
                        end
                    end
                elseif flingSheriffActive then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if
                            (playerRoles[p.Name] == "Sheriff")
                            and p.Character
                            and p.Character:FindFirstChild("HumanoidRootPart")
                        then
                            targetPlayer = p
                            break
                        end
                    end
                end
                if targetPlayer then
                    local targetPos = targetPlayer.Character.HumanoidRootPart.Position
                    local direction = (targetPos - hrp.Position).Unit
                    local horizontalDir = Vector3.new(direction.X, 0, direction.Z).Unit
                    local angle = tick() * 45
                    hrp.AssemblyLinearVelocity = (horizontalDir * flingStrength)
                        + Vector3.new(
                            math.cos(angle) * flingStrength,
                            math.sin(angle * 2) * (flingStrength / 2),
                            math.sin(angle) * flingStrength
                        )
                    hrp.AssemblyAngularVelocity = Vector3.new(35, 90, 35)
                end
            end)
        end
        createToggleButton(TrollingPage, "🌀 Fling Murderer", false, function(state)
            if state then
                flingSheriffActive = false
                flingMurdererActive = true
                startFling()
            else
                flingMurdererActive = false
                stopFling()
            end
        end)
        createToggleButton(TrollingPage, "🌀 Fling Sheriff", false, function(state)
            if state then
                flingMurdererActive = false
                flingSheriffActive = true
                startFling()
            else
                flingSheriffActive = false
                stopFling()
            end
        end)
        createSlider(TrollingPage, "💥 Fling Power", 200, 800, 400, function(v)
            flingStrength = v
        end)
        RunService.Stepped:Connect(function()
            if _G.NoclipEnabled and LocalPlayer.Character then
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        RunService.Stepped:Connect(function()
            if
                _G.SpeedEnabled
                and LocalPlayer.Character
                and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            then
                local hrp = LocalPlayer.Character.HumanoidRootPart
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum and (hum.MoveDirection.Magnitude > 0) then
                    hrp.AssemblyLinearVelocity = hum.MoveDirection * _G.WalkSpeedValue
                end
            end
        end)
        UserInputService.JumpRequest:Connect(function()
            if
                _G.JumpEnabled
                and LocalPlayer.Character
                and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            then
                local hrp = LocalPlayer.Character.HumanoidRootPart
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum and (hum.FloorMaterial ~= Enum.Material.Air) then
                    hrp.AssemblyLinearVelocity = Vector3.new(
                        hrp.AssemblyLinearVelocity.X,
                        _G.JumpPowerValue,
                        hrp.AssemblyLinearVelocity.Z
                    )
                end
            end
        end)
        local function getClosestPlayerInFOV()
            if
                not LocalPlayer.Character
                or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            then
                return nil
            end
            local camera = Workspace.CurrentCamera
            local closestPlayer = nil
            local closestDistance = math.huge
            for _, player in ipairs(Players:GetPlayers()) do
                if
                    (player ~= LocalPlayer)
                    and player.Character
                    and player.Character:FindFirstChild("HumanoidRootPart")
                    and player.Character:FindFirstChild("Humanoid")
                then
                    local targetHrp = player.Character.HumanoidRootPart
                    local targetHum = player.Character.Humanoid
                    if targetHum.Health > 0 then
                        local screenPos, onScreen = camera:WorldToScreenPoint(targetHrp.Position)
                        if onScreen then
                            local mousePos = UserInputService:GetMouseLocation()
                            local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                            if (distance <= _G.SilentAimFOV) and (distance < closestDistance) then
                                closestDistance = distance
                                closestPlayer = player
                            end
                        end
                    end
                end
            end
            return closestPlayer
        end
        local function getTargetPosition(player)
            if not player or not player.Character then
                return nil
            end
            if _G.SilentAimHeadshot then
                local head = player.Character:FindFirstChild("Head")
                if head then
                    return head.Position
                end
            end
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            return hrp and hrp.Position
        end
        local oldMouse = nil
        local toolConnection = nil
        local function setupSilentAim()
            if toolConnection then
                toolConnection:Disconnect()
            end
            toolConnection = LocalPlayer.CharacterAdded:Connect(function(character)
                task.wait(0.5)
                local tool = character:FindFirstChildOfClass("Tool")
                if tool then
                    local gunCheck = tool.Name:lower():find("gun")
                        or tool.Name:lower():find("revolver")
                        or tool.Name:lower():find("pistol")
                        or (tool.Name == "SheriffGun")
                    if gunCheck then
                        local mouse = LocalPlayer:GetMouse()
                        if not oldMouse then
                            oldMouse = mouse.Button1Down
                            mouse.Button1Down = function()
                                if
                                    _G.SilentAim and (playerRoles[LocalPlayer.Name] == "Sheriff")
                                then
                                    local target = getClosestPlayerInFOV()
                                    if target then
                                        local targetPos = getTargetPosition(target)
                                        if targetPos then
                                            local camera = Workspace.CurrentCamera
                                            local oldCFrame = camera.CFrame
                                            local direction = (targetPos - camera.CFrame.Position).Unit
                                            local newCFrame = CFrame.lookAt(
                                                camera.CFrame.Position,
                                                camera.CFrame.Position + direction
                                            )
                                            camera.CFrame = oldCFrame:Lerp(
                                                newCFrame,
                                                1 - _G.SilentAimSmoothness
                                            )
                                            oldMouse()
                                            task.wait(0.05)
                                            camera.CFrame = oldCFrame
                                            return
                                        end
                                    end
                                end
                                oldMouse()
                            end
                        end
                    end
                end
            end)
        end
        setupSilentAim()
        LocalPlayer.CharacterAdded:Connect(setupSilentAim)
        task.spawn(function()
            local lastAttackTime = 0
            local attackCooldown = 0.1
            while true do
                if _G.KillAura then
                    if playerRoles[LocalPlayer.Name] == "Murderer" then
                        local character = LocalPlayer.Character
                        if character then
                            local hrp = character:FindFirstChild("HumanoidRootPart")
                            local tool = character:FindFirstChildOfClass("Tool")
                            if tool and hrp then
                                local toolName = tool.Name:lower()
                                local isKnife = toolName:find("knife")
                                    or toolName:find("blade")
                                    or toolName:find("sword")
                                if isKnife then
                                    local now = tick()
                                    if (now - lastAttackTime) >= attackCooldown then
                                        local closestTarget = nil
                                        local closestDistance = _G.KillAuraRadius + 1
                                        for _, player in ipairs(Players:GetPlayers()) do
                                            if player ~= LocalPlayer then
                                                local targetChar = player.Character
                                                if
                                                    targetChar
                                                    and targetChar:FindFirstChild(
                                                        "HumanoidRootPart"
                                                    )
                                                then
                                                    local targetHrp = targetChar.HumanoidRootPart
                                                    local targetHum =
                                                        targetChar:FindFirstChildOfClass("Humanoid")
                                                    if targetHum and (targetHum.Health > 0) then
                                                        local distance = (
                                                            targetHrp.Position - hrp.Position
                                                        ).Magnitude
                                                        if
                                                            (distance <= _G.KillAuraRadius)
                                                            and (distance < closestDistance)
                                                        then
                                                            closestDistance = distance
                                                            closestTarget = targetChar
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        if closestTarget then
                                            local targetHrp =
                                                closestTarget:FindFirstChild("HumanoidRootPart")
                                            if targetHrp then
                                                hrp.CFrame = CFrame.new(
                                                    hrp.Position,
                                                    Vector3.new(
                                                        targetHrp.Position.X,
                                                        hrp.Position.Y,
                                                        targetHrp.Position.Z
                                                    )
                                                )
                                                tool:Activate()
                                                local handle = tool:FindFirstChild("Handle")
                                                if handle and firetouchinterest then
                                                    firetouchinterest(handle, targetHrp, 0)
                                                    firetouchinterest(handle, targetHrp, 1)
                                                end
                                                lastAttackTime = now
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(0.05)
            end
        end)
        local function applyHighlight(player, role)
            local character = player.Character
            if not character or not _G.EspEnabled then
                if character and character:FindFirstChild("RoleESP") then
                    character.RoleESP:Destroy()
                end
                return
            end
            local color = COLORS[role] or COLORS.Innocent
            local h = character:FindFirstChild("RoleESP") or Instance.new("Highlight")
            h.Name = "RoleESP"
            h.Parent = character
            h.FillColor = color
            h.FillTransparency = 0.5
            h.OutlineColor = color
            h.OutlineTransparency = 0
            h.Enabled = true
        end
        local function checkInventory(player)
            if (player == LocalPlayer) or not _G.InventoryCheck then
                return nil
            end
            local character = player.Character
            local backpack = player:FindFirstChild("Backpack")
            if character then
                for _, item in ipairs(character:GetChildren()) do
                    if item:IsA("Tool") then
                        for keyword, role in pairs(WEAPONS) do
                            if item.Name:lower():find(keyword:lower()) then
                                return role
                            end
                        end
                    end
                end
            end
            if backpack then
                for _, item in ipairs(backpack:GetChildren()) do
                    if item:IsA("Tool") then
                        for keyword, role in pairs(WEAPONS) do
                            if item.Name:lower():find(keyword:lower()) then
                                return role
                            end
                        end
                    end
                end
            end
            return nil
        end
        task.spawn(function()
            while true do
                for _, player in ipairs(Players:GetPlayers()) do
                    if
                        player.Character
                        and player.Character:FindFirstChild("HumanoidRootPart")
                        and (player ~= LocalPlayer)
                    then
                        local hrp = player.Character.HumanoidRootPart
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        if not _G.EspEnabled then
                            if player.Character:FindFirstChild("RoleESP") then
                                player.Character.RoleESP:Destroy()
                            end
                        else
                            local det = checkInventory(player)
                            if det then
                                playerRoles[player.Name] = det
                                applyHighlight(player, det)
                            elseif playerRoles[player.Name] then
                                applyHighlight(player, playerRoles[player.Name])
                            else
                                applyHighlight(player, "Innocent")
                            end
                        end
                    end
                end
                task.wait(0.25)
            end
        end)
        local gameplayFolder = ReplicatedStorage:FindFirstChild("Remotes")
            and ReplicatedStorage.Remotes:FindFirstChild("Gameplay")
        if gameplayFolder then
            local roundStart = gameplayFolder:FindFirstChild("RoundStart")
            if roundStart and roundStart:IsA("RemoteEvent") then
                roundStart.OnClientEvent:Connect(function(...)
                    if not _G.LogCheck then
                        return
                    end
                    local args = { ... }
                    local rawData = args[2]
                    if typeof(rawData) == "table" then
                        table.clear(playerRoles)
                        for _, c in ipairs(workspace:GetChildren()) do
                            if c:FindFirstChild("RoleESP") then
                                c.RoleESP:Destroy()
                            end
                        end
                        for key, value in pairs(rawData) do
                            local name = nil
                            local details = nil
                            if (typeof(key) == "string") and (typeof(value) == "table") then
                                name = key
                                details = value
                            elseif typeof(value) == "string" then
                                name = value
                            end
                            if name then
                                local targetPlayer = Players:FindFirstChild(name)
                                if targetPlayer then
                                    local role = "Innocent"
                                    if details then
                                        if
                                            (details.Role == "Sheriff")
                                            or details.Sheriff
                                            or (details.Value == "Sheriff")
                                        then
                                            role = "Sheriff"
                                        elseif
                                            (details.Role == "Murderer")
                                            or details.Murderer
                                            or (details.Value == "Murderer")
                                        then
                                            role = "Murderer"
                                        end
                                    end
                                    playerRoles[name] = role
                                    applyHighlight(targetPlayer, role)
                                end
                            end
                        end
                    end
                end)
            end
            local roleSelect = gameplayFolder:FindFirstChild("RoleSelect")
            if roleSelect and roleSelect:IsA("RemoteEvent") then
                roleSelect.OnClientEvent:Connect(function(roleName)
                    if not _G.LogCheck then
                        return
                    end
                    if typeof(roleName) == "string" then
                        playerRoles[LocalPlayer.Name] = roleName
                        applyHighlight(LocalPlayer, roleName)
                    end
                end)
            end
        end
        Players.PlayerRemoving:Connect(function(player)
            playerRoles[player.Name] = nil
        end)
    end
    print("✅ MM2 PRESTIGE XENO V4 READY")
    print("🔑 KEY: " .. CORRECT_KEY)
end
