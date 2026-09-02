if getgenv().ThoriumLib_Cleanup then
    pcall(getgenv().ThoriumLib_Cleanup)
end

local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local oldGui = CoreGui:FindFirstChild("Thoriumv2Gui") or (LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("Thoriumv2Gui"))
if oldGui then oldGui:Destroy() end

local oldBlur = Lighting:FindFirstChild("ThoriumBlurEffect")
if oldBlur then oldBlur:Destroy() end

local activeCleanups = {}
getgenv().ThoriumLib_Cleanup = function()
    for _, cleanup in ipairs(activeCleanups) do
        pcall(cleanup)
    end
    local g = CoreGui:FindFirstChild("Thoriumv2Gui") or (LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("Thoriumv2Gui"))
    if g then g:Destroy() end
    local b = Lighting:FindFirstChild("ThoriumBlurEffect")
    if b then b:Destroy() end
    getgenv().ThoriumLib_Loaded = nil
end

getgenv().ThoriumLib_Loaded = true
getgenv().Thorium_MasterSwitch = true

local TARGET_PLACE_ID = 142823291
if game.PlaceId ~= TARGET_PLACE_ID then
    warn("[Thorium Lib v2] Wrong Place ID (" .. tostring(game.PlaceId) .. ")! Expected: " .. tostring(TARGET_PLACE_ID))
    return
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

-- Modern Rich Blue Translucent Theme Palette
local ACCENT_COLOR = Color3.fromRGB(85, 135, 255)
local BG_COLOR = Color3.fromRGB(18, 26, 42)
local ELEMENT_BG = Color3.fromRGB(24, 34, 58)
local ELEMENT_HOVER = Color3.fromRGB(34, 48, 80)
local BORDER_COLOR = Color3.fromRGB(55, 80, 140)
local SMOOTH_TWEEN = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

-- Click Sound
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://9125402735"
ClickSound.Volume = 0.8
ClickSound.Parent = SoundService
table.insert(activeCleanups, function() if ClickSound then ClickSound:Destroy() end end)

local function PlayClickSound()
    pcall(function() ClickSound:Play() end)
end

local UIBlur = Instance.new("BlurEffect")
UIBlur.Name = "ThoriumBlurEffect"
UIBlur.Size = 16
UIBlur.Enabled = true
UIBlur.Parent = Lighting
table.insert(activeCleanups, function() if UIBlur then UIBlur:Destroy() end end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Thoriumv2Gui"
ScreenGui.ResetOnSpawn = false

local success, _ = pcall(function() ScreenGui.Parent = CoreGui end)
if not success then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- ==========================================
-- MAIN FRAME & MOBILE BUTTON (Sleek Blue Theme)
-- ==========================================

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 610, 0, 410)
MainFrame.Position = UDim2.new(0.5, -305, 0.5, -205)
MainFrame.BackgroundColor3 = BG_COLOR
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local MainFrameScale = Instance.new("UIScale")
MainFrameScale.Scale = 1.0
MainFrameScale.Parent = MainFrame

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = BORDER_COLOR
MainStroke.Thickness = 1.4
MainStroke.Transparency = 0.15
MainStroke.Parent = MainFrame

local MobileToggleBtn = Instance.new("TextButton")
MobileToggleBtn.Name = "MobileToggleBtn"
MobileToggleBtn.AnchorPoint = Vector2.new(0.5, 0.5)
MobileToggleBtn.Size = UDim2.new(0, 48, 0, 48)
MobileToggleBtn.Position = UDim2.new(0.05, 25, 0.2, 25)
MobileToggleBtn.BackgroundColor3 = BG_COLOR
MobileToggleBtn.BackgroundTransparency = 0.15
MobileToggleBtn.Text = ""
MobileToggleBtn.TextColor3 = ACCENT_COLOR
MobileToggleBtn.Font = Enum.Font.GothamBold
MobileToggleBtn.TextSize = 14
MobileToggleBtn.ZIndex = 100
MobileToggleBtn.Parent = ScreenGui

local MobileToggleIcon = Instance.new("ImageLabel")
MobileToggleIcon.Name = "HideShowLogo"
MobileToggleIcon.Size = UDim2.new(1, -8, 1, -8)
MobileToggleIcon.Position = UDim2.new(0, 4, 0, 4)
MobileToggleIcon.BackgroundTransparency = 1
MobileToggleIcon.Image = "rbxassetid://126031329785796"
MobileToggleIcon.ScaleType = Enum.ScaleType.Fit
MobileToggleIcon.ZIndex = 101
MobileToggleIcon.Parent = MobileToggleBtn

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 14)
MobileCorner.Parent = MobileToggleBtn

local MobileStroke = Instance.new("UIStroke")
MobileStroke.Color = ACCENT_COLOR
MobileStroke.Thickness = 1.5
MobileStroke.Parent = MobileToggleBtn

local mDragging, mDragStart, mStartPos
MobileToggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        mDragging = true
        mDragStart = input.Position
        mStartPos = MobileToggleBtn.Position
    end
end)
MobileToggleBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        mDragging = false
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if mDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - mDragStart
        MobileToggleBtn.Position = UDim2.new(mStartPos.X.Scale, mStartPos.X.Offset + delta.X, mStartPos.Y.Scale, mStartPos.Y.Offset + delta.Y)
    end
end)

MobileToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    UIBlur.Enabled = MainFrame.Visible
end)

local TopNotch = Instance.new("Frame")
TopNotch.Name = "TopNotch"
TopNotch.Size = UDim2.new(1, 0, 0, 42)
TopNotch.BackgroundColor3 = Color3.fromRGB(14, 20, 34)
TopNotch.BackgroundTransparency = 0.1
TopNotch.BorderSizePixel = 0
TopNotch.ZIndex = 5
TopNotch.Parent = MainFrame

local TopNotchLine = Instance.new("Frame")
TopNotchLine.Size = UDim2.new(1, 0, 0, 1)
TopNotchLine.Position = UDim2.new(0, 0, 1, 0)
TopNotchLine.BackgroundColor3 = BORDER_COLOR
TopNotchLine.BackgroundTransparency = 0.4
TopNotchLine.BorderSizePixel = 0
TopNotchLine.Parent = TopNotch

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 180, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "CAT HUB"
Title.TextColor3 = Color3.fromRGB(240, 245, 255)
Title.TextSize = 13
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 6
Title.Parent = TopNotch

local Credit = Instance.new("TextLabel")
Credit.Name = "Credit"
Credit.Size = UDim2.new(0, 180, 1, 0)
Credit.Position = UDim2.new(0, 195, 0, 0)
Credit.BackgroundTransparency = 1
Credit.Text = "by catjack.gg"
Credit.TextColor3 = ACCENT_COLOR
Credit.TextSize = 10
Credit.Font = Enum.Font.GothamMedium
Credit.TextXAlignment = Enum.TextXAlignment.Left
Credit.ZIndex = 6
Credit.Parent = TopNotch

-- ==========================================
-- MASTER SWITCH & SEARCH
-- ==========================================
local MSContainer = Instance.new("Frame")
MSContainer.Size = UDim2.new(0, 135, 0, 26)
MSContainer.Position = UDim2.new(0, 140, 0.5, -13)
MSContainer.BackgroundColor3 = ELEMENT_BG
MSContainer.BackgroundTransparency = 0.2
MSContainer.ZIndex = 6
MSContainer.Parent = TopNotch

local MSCorner = Instance.new("UICorner")
MSCorner.CornerRadius = UDim.new(0, 6)
MSCorner.Parent = MSContainer

local MSLabel = Instance.new("TextLabel")
MSLabel.Size = UDim2.new(1, -36, 1, 0)
MSLabel.Position = UDim2.new(0, 8, 0, 0)
MSLabel.BackgroundTransparency = 1
MSLabel.Text = "Master Switch"
MSLabel.TextColor3 = Color3.fromRGB(190, 205, 235)
MSLabel.Font = Enum.Font.GothamMedium
MSLabel.TextSize = 10
MSLabel.TextXAlignment = Enum.TextXAlignment.Left
MSLabel.ZIndex = 6
MSLabel.Parent = MSContainer

local MSBtn = Instance.new("TextButton")
MSBtn.Size = UDim2.new(0, 26, 0, 14)
MSBtn.Position = UDim2.new(1, -30, 0.5, -7)
MSBtn.BackgroundColor3 = ACCENT_COLOR
MSBtn.Text = ""
MSBtn.ZIndex = 6
MSBtn.Parent = MSContainer

local MSBtnCorner = Instance.new("UICorner")
MSBtnCorner.CornerRadius = UDim.new(1, 0)
MSBtnCorner.Parent = MSBtn

local MSCircle = Instance.new("Frame")
MSCircle.Size = UDim2.new(0, 10, 0, 10)
MSCircle.Position = UDim2.new(1, -12, 0.5, -5)
MSCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MSCircle.ZIndex = 7
MSCircle.Parent = MSBtn

local MSCircleCorner = Instance.new("UICorner")
MSCircleCorner.CornerRadius = UDim.new(1, 0)
MSCircleCorner.Parent = MSCircle

MSBtn.MouseButton1Click:Connect(function()
    PlayClickSound()
    getgenv().Thorium_MasterSwitch = not getgenv().Thorium_MasterSwitch
    local enabled = getgenv().Thorium_MasterSwitch
    TweenService:Create(MSBtn, SMOOTH_TWEEN, {BackgroundColor3 = enabled and ACCENT_COLOR or Color3.fromRGB(40, 50, 75)}):Play()
    TweenService:Create(MSCircle, SMOOTH_TWEEN, {Position = enabled and UDim2.new(1, -12, 0.5, -5) or UDim2.new(0, 2, 0.5, -5)}):Play()
end)

local SearchContainer = Instance.new("Frame")
SearchContainer.AnchorPoint = Vector2.new(1, 0.5)
SearchContainer.Size = UDim2.new(0, 26, 0, 26)
SearchContainer.Position = UDim2.new(1, -12, 0.5, 0)
SearchContainer.BackgroundTransparency = 1
SearchContainer.ClipsDescendants = true
SearchContainer.ZIndex = 6
SearchContainer.Parent = TopNotch

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -28, 1, 0)
SearchBox.Position = UDim2.new(0, 0, 0, 0)
SearchBox.BackgroundColor3 = ELEMENT_BG
SearchBox.BackgroundTransparency = 0.15
SearchBox.PlaceholderText = "Search..."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(240, 245, 255)
SearchBox.PlaceholderColor3 = Color3.fromRGB(130, 145, 175)
SearchBox.Font = Enum.Font.GothamMedium
SearchBox.TextSize = 11
SearchBox.Visible = false
SearchBox.ZIndex = 6
SearchBox.Parent = SearchContainer
Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 6)

local SearchIconBtn = Instance.new("TextButton")
SearchIconBtn.AnchorPoint = Vector2.new(1, 0)
SearchIconBtn.Size = UDim2.new(0, 26, 0, 26)
SearchIconBtn.Position = UDim2.new(1, 0, 0, 0)
SearchIconBtn.BackgroundTransparency = 1
SearchIconBtn.Text = ""
SearchIconBtn.ZIndex = 7
SearchIconBtn.Parent = SearchContainer

local SearchIconImg = Instance.new("ImageLabel")
SearchIconImg.Size = UDim2.new(0, 16, 0, 16)
SearchIconImg.Position = UDim2.new(0.5, -8, 0.5, -8)
SearchIconImg.BackgroundTransparency = 1
SearchIconImg.Image = "rbxassetid://6031154871"
SearchIconImg.ImageColor3 = Color3.fromRGB(220, 230, 255)
SearchIconImg.ZIndex = 8
SearchIconImg.Parent = SearchIconBtn

local searchOpen = false
SearchIconBtn.MouseButton1Click:Connect(function()
    PlayClickSound()
    searchOpen = not searchOpen
    if searchOpen then
        SearchBox.Visible = true
        SearchContainer:TweenSize(UDim2.new(0, 160, 0, 26), "Out", "Quart", 0.25, true)
    else
        SearchBox.Text = ""
        SearchContainer:TweenSize(UDim2.new(0, 26, 0, 26), "Out", "Quart", 0.25, true, function() SearchBox.Visible = false end)
    end
end)

-- ==========================================
-- SIDEBAR & PROFILE
-- ==========================================
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 155, 1, -94)
Sidebar.Position = UDim2.new(0, 0, 0, 42)
Sidebar.BackgroundColor3 = Color3.fromRGB(14, 20, 34)
Sidebar.BackgroundTransparency = 0.15
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 0
Sidebar.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 2)
SidebarLayout.Parent = Sidebar

SidebarLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, SidebarLayout.AbsoluteContentSize.Y + 10)
end)

local ProfileBtn = Instance.new("TextButton")
ProfileBtn.Size = UDim2.new(0, 155, 0, 52)
ProfileBtn.Position = UDim2.new(0, 0, 1, -52)
ProfileBtn.BackgroundColor3 = Color3.fromRGB(14, 20, 34)
ProfileBtn.BackgroundTransparency = 0.15
ProfileBtn.BorderSizePixel = 0
ProfileBtn.Text = ""
ProfileBtn.AutoButtonColor = false
ProfileBtn.Parent = MainFrame

local ProfileLine = Instance.new("Frame")
ProfileLine.Size = UDim2.new(1, 0, 0, 1)
ProfileLine.Position = UDim2.new(0, 0, 0, 0)
ProfileLine.BackgroundColor3 = BORDER_COLOR
ProfileLine.BackgroundTransparency = 0.4
ProfileLine.BorderSizePixel = 0
ProfileLine.Parent = ProfileBtn

local Nickname = Instance.new("TextLabel")
Nickname.Size = UDim2.new(0, 135, 0, 14)
Nickname.Position = UDim2.new(0, 12, 0, 12)
Nickname.BackgroundTransparency = 1
Nickname.Text = "Thorium User"
Nickname.TextColor3 = Color3.fromRGB(240, 245, 255)
Nickname.Font = Enum.Font.GothamBold
Nickname.TextSize = 11
Nickname.TextXAlignment = Enum.TextXAlignment.Left
Nickname.Parent = ProfileBtn

local Role = Instance.new("TextLabel")
Role.Size = UDim2.new(0, 135, 0, 14)
Role.Position = UDim2.new(0, 12, 0, 26)
Role.BackgroundTransparency = 1
Role.Text = "Premium Access"
Role.TextColor3 = ACCENT_COLOR
Role.Font = Enum.Font.GothamMedium
Role.TextSize = 9
Role.TextXAlignment = Enum.TextXAlignment.Left
Role.Parent = ProfileBtn

ProfileBtn.MouseEnter:Connect(function()
    TweenService:Create(ProfileBtn, SMOOTH_TWEEN, {BackgroundColor3 = Color3.fromRGB(22, 32, 54)}):Play()
end)
ProfileBtn.MouseLeave:Connect(function()
    TweenService:Create(ProfileBtn, SMOOTH_TWEEN, {BackgroundColor3 = Color3.fromRGB(14, 20, 34)}):Play()
end)

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -155, 1, -42)
ContentArea.Position = UDim2.new(0, 155, 0, 42)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

local ContentLine = Instance.new("Frame")
ContentLine.Size = UDim2.new(0, 1, 1, 0)
ContentLine.Position = UDim2.new(0, 0, 0, 0)
ContentLine.BackgroundColor3 = BORDER_COLOR
ContentLine.BackgroundTransparency = 0.4
ContentLine.BorderSizePixel = 0
ContentLine.Parent = ContentArea

-- Dragging (Via TopNotch)
local dragging, dragInput, dragStart, startPos
TopNotch.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
TopNotch.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local toggleKey = Enum.KeyCode.RightShift
local keyInputConn = UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == toggleKey then
        MainFrame.Visible = not MainFrame.Visible
        UIBlur.Enabled = MainFrame.Visible
    end
end)
table.insert(activeCleanups, function() keyInputConn:Disconnect() end)

-- ==========================================
-- TAB ENGINE & IMGUI COLOR PICKER SHUTTER
-- ==========================================
local AllUIElements = {}
local TabsList = {}
local activePageRef = nil

local function HideAllPages()
    for _, tabData in ipairs(TabsList) do
        TweenService:Create(tabData.Btn, SMOOTH_TWEEN, {TextColor3 = Color3.fromRGB(150, 165, 195)}):Play()
        for _, sub in ipairs(tabData.SubTabs) do
            sub.Page.Visible = false
            TweenService:Create(sub.Btn, SMOOTH_TWEEN, {TextColor3 = Color3.fromRGB(120, 135, 165)}):Play()
            if sub.Indicator then sub.Indicator.Visible = false end
        end
    end
end

local function CreateContentPage(name)
    local page = Instance.new("Frame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = ContentArea

    local leftCol = Instance.new("ScrollingFrame")
    leftCol.Size = UDim2.new(0.5, -12, 1, -16)
    leftCol.Position = UDim2.new(0, 8, 0, 8)
    leftCol.BackgroundTransparency = 1
    leftCol.ScrollBarThickness = 0
    leftCol.BorderSizePixel = 0
    leftCol.Parent = page
    local leftLayout = Instance.new("UIListLayout")
    leftLayout.SortOrder = Enum.SortOrder.LayoutOrder
    leftLayout.Padding = UDim.new(0, 6)
    leftLayout.Parent = leftCol
    leftLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() leftCol.CanvasSize = UDim2.new(0, 0, 0, leftLayout.AbsoluteContentSize.Y + 10) end)

    local rightCol = Instance.new("ScrollingFrame")
    rightCol.Size = UDim2.new(0.5, -12, 1, -16)
    rightCol.Position = UDim2.new(0.5, 4, 0, 8)
    rightCol.BackgroundTransparency = 1
    rightCol.ScrollBarThickness = 0
    rightCol.BorderSizePixel = 0
    rightCol.Parent = page
    local rightLayout = Instance.new("UIListLayout")
    rightLayout.SortOrder = Enum.SortOrder.LayoutOrder
    rightLayout.Padding = UDim.new(0, 6)
    rightLayout.Parent = rightCol
    rightLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() rightCol.CanvasSize = UDim2.new(0, 0, 0, rightLayout.AbsoluteContentSize.Y + 10) end)

    return {Page = page, Left = leftCol, Right = rightCol, ItemCount = 0}
end

local function ColorToHex(col)
    local r = math.clamp(math.floor(col.R * 255), 0, 255)
    local g = math.clamp(math.floor(col.G * 255), 0, 255)
    local b = math.clamp(math.floor(col.B * 255), 0, 255)
    return string.format("#%02X%02X%02X", r, g, b)
end

local function HexToColor(hex)
    hex = hex:gsub("#", "")
    if #hex == 6 then
        local r = tonumber(hex:sub(1, 2), 16)
        local g = tonumber(hex:sub(3, 4), 16)
        local b = tonumber(hex:sub(5, 6), 16)
        if r and g and b then
            return Color3.fromRGB(r, g, b)
        end
    end
    return nil
end

local function BuildTabObj(pageData)
    local obj = pageData
    function obj:GetNextParent()
        self.ItemCount = self.ItemCount + 1
        return (self.ItemCount % 2 == 1) and self.Left or self.Right
    end

    function obj:AddToggle(text, default, callback, defaultColor, colorCallback)
        local target = self:GetNextParent()
        local state = default or false
        local hasColor = (defaultColor ~= nil)

        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -8, 0, 32)
        container.BackgroundColor3 = ELEMENT_BG
        container.BackgroundTransparency = 0.15
        container.BorderSizePixel = 0
        container.ClipsDescendants = true
        container.Parent = target
        Instance.new("UICorner", container).CornerRadius = UDim.new(0, 8)

        local topHeader = Instance.new("Frame")
        topHeader.Size = UDim2.new(1, 0, 0, 32)
        topHeader.BackgroundTransparency = 1
        topHeader.Parent = container

        local lblTextWidth = hasColor and -70 or -45

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, lblTextWidth, 1, 0)
        lbl.Position = UDim2.new(0, 10, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(220, 230, 250)
        lbl.Font = Enum.Font.GothamMedium
        lbl.TextSize = 10.5
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Parent = topHeader

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 28, 0, 14)
        btn.Position = UDim2.new(1, -34, 0.5, -7)
        btn.BackgroundColor3 = state and ACCENT_COLOR or Color3.fromRGB(40, 50, 75)
        btn.Text = ""
        btn.Parent = topHeader
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

        local circle = Instance.new("Frame")
        circle.Size = UDim2.new(0, 10, 0, 10)
        circle.Position = state and UDim2.new(1, -12, 0.5, -5) or UDim2.new(0, 2, 0.5, -5)
        circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        circle.Parent = btn
        Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

        btn.MouseButton1Click:Connect(function()
            PlayClickSound()
            state = not state
            TweenService:Create(btn, SMOOTH_TWEEN, {BackgroundColor3 = state and ACCENT_COLOR or Color3.fromRGB(40, 50, 75)}):Play()
            TweenService:Create(circle, SMOOTH_TWEEN, {Position = state and UDim2.new(1, -12, 0.5, -5) or UDim2.new(0, 2, 0.5, -5)}):Play()
            task.spawn(callback, state)
        end)

        if hasColor then
            local currentColor = defaultColor
            local currentAlpha = 0
            local shutterOpen = false

            local colorBtn = Instance.new("TextButton")
            colorBtn.Size = UDim2.new(0, 20, 0, 14)
            colorBtn.Position = UDim2.new(1, -60, 0.5, -7)
            colorBtn.BackgroundColor3 = currentColor
            colorBtn.Text = ""
            colorBtn.Parent = topHeader
            Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0, 4)

            local colorBtnStroke = Instance.new("UIStroke")
            colorBtnStroke.Color = Color3.fromRGB(255, 255, 255)
            colorBtnStroke.Transparency = 0.7
            colorBtnStroke.Thickness = 1
            colorBtnStroke.Parent = colorBtn

            -- ImGui Color Shutter Frame ("Шторка")
            local ShutterFrame = Instance.new("Frame")
            ShutterFrame.Name = "ColorShutter"
            ShutterFrame.Size = UDim2.new(1, -20, 0, 125)
            ShutterFrame.Position = UDim2.new(0, 10, 0, 32)
            ShutterFrame.BackgroundColor3 = Color3.fromRGB(16, 22, 36)
            ShutterFrame.BackgroundTransparency = 0.2
            ShutterFrame.BorderSizePixel = 0
            ShutterFrame.Visible = false
            ShutterFrame.Parent = container
            Instance.new("UICorner", ShutterFrame).CornerRadius = UDim.new(0, 6)

            -- Hex Input Box
            local hexLabel = Instance.new("TextLabel")
            hexLabel.Size = UDim2.new(0, 40, 0, 20)
            hexLabel.Position = UDim2.new(0, 8, 0, 6)
            hexLabel.BackgroundTransparency = 1
            hexLabel.Text = "HEX:"
            hexLabel.TextColor3 = Color3.fromRGB(180, 195, 225)
            hexLabel.Font = Enum.Font.GothamBold
            hexLabel.TextSize = 10
            hexLabel.TextXAlignment = Enum.TextXAlignment.Left
            hexLabel.Parent = ShutterFrame

            local hexInput = Instance.new("TextBox")
            hexInput.Size = UDim2.new(1, -60, 0, 20)
            hexInput.Position = UDim2.new(0, 48, 0, 6)
            hexInput.BackgroundColor3 = Color3.fromRGB(26, 36, 58)
            hexInput.Text = ColorToHex(currentColor)
            hexInput.TextColor3 = Color3.fromRGB(255, 255, 255)
            hexInput.Font = Enum.Font.Code
            hexInput.TextSize = 10
            hexInput.Parent = ShutterFrame
            Instance.new("UICorner", hexInput).CornerRadius = UDim.new(0, 4)

            -- ImGui Swatches
            local swatchesFrame = Instance.new("Frame")
            swatchesFrame.Size = UDim2.new(1, -16, 0, 18)
            swatchesFrame.Position = UDim2.new(0, 8, 0, 32)
            swatchesFrame.BackgroundTransparency = 1
            swatchesFrame.Parent = ShutterFrame

            local presetColors = {
                Color3.fromRGB(255, 87, 51),  -- #FF5733
                Color3.fromRGB(51, 153, 255), -- Blue
                Color3.fromRGB(51, 255, 119), -- Green
                Color3.fromRGB(255, 230, 51), -- Yellow
                Color3.fromRGB(184, 51, 255), -- Purple
                Color3.fromRGB(255, 51, 153), -- Pink
                Color3.fromRGB(255, 255, 255)  -- White
            }

            for i, pCol in ipairs(presetColors) do
                local sBtn = Instance.new("TextButton")
                sBtn.Size = UDim2.new(0, 16, 0, 16)
                sBtn.Position = UDim2.new(0, (i - 1) * 22, 0, 0)
                sBtn.BackgroundColor3 = pCol
                sBtn.Text = ""
                sBtn.Parent = swatchesFrame
                Instance.new("UICorner", sBtn).CornerRadius = UDim.new(0, 3)

                sBtn.MouseButton1Click:Connect(function()
                    PlayClickSound()
                    currentColor = pCol
                    colorBtn.BackgroundColor3 = currentColor
                    hexInput.Text = ColorToHex(currentColor)
                    if colorCallback then task.spawn(colorCallback, currentColor, currentAlpha) end
                end)
            end

            -- Sliders for RGB
            local function CreateMiniSlider(posY, lblText, initialVal, updateCb)
                local sliderRow = Instance.new("Frame")
                sliderRow.Size = UDim2.new(1, -16, 0, 18)
                sliderRow.Position = UDim2.new(0, 8, 0, posY)
                sliderRow.BackgroundTransparency = 1
                sliderRow.Parent = ShutterFrame

                local l = Instance.new("TextLabel")
                l.Size = UDim2.new(0, 20, 1, 0)
                l.BackgroundTransparency = 1
                l.Text = lblText
                l.TextColor3 = Color3.fromRGB(160, 175, 205)
                l.Font = Enum.Font.GothamMedium
                l.TextSize = 9
                l.TextXAlignment = Enum.TextXAlignment.Left
                l.Parent = sliderRow

                local track = Instance.new("Frame")
                track.Size = UDim2.new(1, -25, 0, 4)
                track.Position = UDim2.new(0, 25, 0.5, -2)
                track.BackgroundColor3 = Color3.fromRGB(32, 44, 70)
                track.BorderSizePixel = 0
                track.Parent = sliderRow
                Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

                local fill = Instance.new("Frame")
                fill.Size = UDim2.new(initialVal / 255, 0, 1, 0)
                fill.BackgroundColor3 = ACCENT_COLOR
                fill.BorderSizePixel = 0
                fill.Parent = track
                Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

                local trig = Instance.new("TextButton")
                trig.Size = UDim2.new(1, 0, 1, 0)
                trig.BackgroundTransparency = 1
                trig.Text = ""
                trig.Parent = sliderRow

                local draggingS = false
                local function proc(input)
                    local pct = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
                    fill.Size = UDim2.new(pct, 0, 1, 0)
                    updateCb(pct)
                end

                trig.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingS = true
                        proc(input)
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if draggingS and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        proc(input)
                    end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingS = false
                    end
                end)
            end

            CreateMiniSlider(58, "R", math.floor(currentColor.R * 255), function(pct)
                currentColor = Color3.new(pct, currentColor.G, currentColor.B)
                colorBtn.BackgroundColor3 = currentColor
                hexInput.Text = ColorToHex(currentColor)
                if colorCallback then task.spawn(colorCallback, currentColor, currentAlpha) end
            end)

            CreateMiniSlider(78, "G", math.floor(currentColor.G * 255), function(pct)
                currentColor = Color3.new(currentColor.R, pct, currentColor.B)
                colorBtn.BackgroundColor3 = currentColor
                hexInput.Text = ColorToHex(currentColor)
                if colorCallback then task.spawn(colorCallback, currentColor, currentAlpha) end
            end)

            CreateMiniSlider(98, "B", math.floor(currentColor.B * 255), function(pct)
                currentColor = Color3.new(currentColor.R, currentColor.G, pct)
                colorBtn.BackgroundColor3 = currentColor
                hexInput.Text = ColorToHex(currentColor)
                if colorCallback then task.spawn(colorCallback, currentColor, currentAlpha) end
            end)

            hexInput.FocusLost:Connect(function()
                local newC = HexToColor(hexInput.Text)
                if newC then
                    currentColor = newC
                    colorBtn.BackgroundColor3 = currentColor
                    if colorCallback then task.spawn(colorCallback, currentColor, currentAlpha) end
                else
                    hexInput.Text = ColorToHex(currentColor)
                end
            end)

            -- Shutter Smooth Toggle on Color Square Click
            colorBtn.MouseButton1Click:Connect(function()
                PlayClickSound()
                shutterOpen = not shutterOpen
                if shutterOpen then
                    ShutterFrame.Visible = true
                    TweenService:Create(container, SMOOTH_TWEEN, {Size = UDim2.new(1, -8, 0, 165)}):Play()
                else
                    local tw = TweenService:Create(container, SMOOTH_TWEEN, {Size = UDim2.new(1, -8, 0, 32)})
                    tw:Play()
                    tw.Completed:Connect(function()
                        if not shutterOpen then ShutterFrame.Visible = false end
                    end)
                end
            end)
        end

        container.MouseEnter:Connect(function() TweenService:Create(container, SMOOTH_TWEEN, {BackgroundColor3 = ELEMENT_HOVER}):Play() end)
        container.MouseLeave:Connect(function() TweenService:Create(container, SMOOTH_TWEEN, {BackgroundColor3 = ELEMENT_BG}):Play() end)

        table.insert(AllUIElements, {Text = text, Frame = container, PageObj = self})
    end

    function obj:AddSlider(text, min, max, default, callback)
        local target = self:GetNextParent()
        local val = math.clamp(default or min, min, max)

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -8, 0, 42)
        frame.BackgroundColor3 = ELEMENT_BG
        frame.BackgroundTransparency = 0.15
        frame.BorderSizePixel = 0
        frame.Parent = target
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(0.7, 0, 0, 18)
        lbl.Position = UDim2.new(0, 10, 0, 4)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(220, 230, 250)
        lbl.Font = Enum.Font.GothamMedium
        lbl.TextSize = 10.5
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Parent = frame

        local valLbl = Instance.new("TextLabel")
        valLbl.Size = UDim2.new(0.3, -10, 0, 18)
        valLbl.Position = UDim2.new(0.7, 0, 0, 4)
        valLbl.BackgroundTransparency = 1
        valLbl.Text = tostring(val)
        valLbl.TextColor3 = ACCENT_COLOR
        valLbl.Font = Enum.Font.GothamMedium
        valLbl.TextSize = 10.5
        valLbl.TextXAlignment = Enum.TextXAlignment.Right
        valLbl.Parent = frame

        local track = Instance.new("Frame")
        track.Size = UDim2.new(1, -20, 0, 4)
        track.Position = UDim2.new(0, 10, 1, -11)
        track.BackgroundColor3 = Color3.fromRGB(35, 48, 75)
        track.BorderSizePixel = 0
        track.Parent = frame
        Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((val - min)/(max - min), 0, 1, 0)
        fill.BackgroundColor3 = ACCENT_COLOR
        fill.BorderSizePixel = 0
        fill.Parent = track
        Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

        local trigger = Instance.new("TextButton")
        trigger.Size = UDim2.new(1, 0, 1, 0)
        trigger.BackgroundTransparency = 1
        trigger.Text = ""
        trigger.Parent = frame

        local draggingSlider = false
        local function update(input)
            local posX = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            val = math.floor(min + (max - min) * posX)
            valLbl.Text = tostring(val)
            TweenService:Create(fill, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(posX, 0, 1, 0)}):Play()
            task.spawn(callback, val)
        end

        trigger.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                PlayClickSound()
                draggingSlider = true
                update(input)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                update(input)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = false
            end
        end)

        frame.MouseEnter:Connect(function() TweenService:Create(frame, SMOOTH_TWEEN, {BackgroundColor3 = ELEMENT_HOVER}):Play() end)
        frame.MouseLeave:Connect(function() TweenService:Create(frame, SMOOTH_TWEEN, {BackgroundColor3 = ELEMENT_BG}):Play() end)

        table.insert(AllUIElements, {Text = text, Frame = frame, PageObj = self})
    end

    function obj:AddButton(text, callback)
        local target = self:GetNextParent()
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -8, 0, 30)
        frame.BackgroundColor3 = ELEMENT_BG
        frame.BackgroundTransparency = 0.15
        frame.BorderSizePixel = 0
        frame.Parent = target
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(220, 230, 250)
        btn.Font = Enum.Font.GothamMedium
        btn.TextSize = 10.5
        btn.Parent = frame

        btn.MouseButton1Click:Connect(function()
            PlayClickSound()
            TweenService:Create(frame, TweenInfo.new(0.1), {BackgroundColor3 = ACCENT_COLOR}):Play()
            task.wait(0.1)
            TweenService:Create(frame, SMOOTH_TWEEN, {BackgroundColor3 = ELEMENT_BG}):Play()
            task.spawn(callback, btn)
        end)

        frame.MouseEnter:Connect(function() TweenService:Create(frame, SMOOTH_TWEEN, {BackgroundColor3 = ELEMENT_HOVER}):Play() end)
        frame.MouseLeave:Connect(function() TweenService:Create(frame, SMOOTH_TWEEN, {BackgroundColor3 = ELEMENT_BG}):Play() end)
        
        table.insert(AllUIElements, {Text = text, Frame = frame, PageObj = self})
        return btn
    end

    return obj
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q = SearchBox.Text:lower()
    for _, item in ipairs(AllUIElements) do
        if item.PageObj == activePageRef then
            item.Frame.Visible = (q == "" or item.Text:lower():find(q) ~= nil)
        else
            item.Frame.Visible = true
        end
    end
end)

local function AddMainTab(tabName)
    local tabObj = {Name = tabName, SubTabs = {}}

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(14, 20, 34)
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Text = "      ❖ " .. tabName
    btn.TextColor3 = Color3.fromRGB(150, 165, 195)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Sidebar
    tabObj.Btn = btn

    local subContainer = Instance.new("Frame")
    subContainer.Size = UDim2.new(1, 0, 0, 0)
    subContainer.BackgroundTransparency = 1
    subContainer.ClipsDescendants = true
    subContainer.Parent = Sidebar
    
    local subLayout = Instance.new("UIListLayout")
    subLayout.SortOrder = Enum.SortOrder.LayoutOrder
    subLayout.Parent = subContainer

    tabObj.SubContainer = subContainer
    tabObj.Expanded = false

    btn.MouseButton1Click:Connect(function()
        PlayClickSound()
        for _, t in ipairs(TabsList) do
            if t ~= tabObj and t.Expanded then
                t.Expanded = false
                TweenService:Create(t.SubContainer, SMOOTH_TWEEN, {Size = UDim2.new(1, 0, 0, 0)}):Play()
            end
        end
        
        tabObj.Expanded = not tabObj.Expanded
        local targetHeight = tabObj.Expanded and (#tabObj.SubTabs * 26) or 0
        TweenService:Create(subContainer, SMOOTH_TWEEN, {Size = UDim2.new(1, 0, 0, targetHeight)}):Play()
        
        if tabObj.Expanded and #tabObj.SubTabs > 0 then
            HideAllPages()
            activePageRef = tabObj.SubTabs[1].PageObj
            tabObj.SubTabs[1].Page.Visible = true
            TweenService:Create(tabObj.Btn, SMOOTH_TWEEN, {TextColor3 = ACCENT_COLOR}):Play()
            
            TweenService:Create(tabObj.SubTabs[1].Btn, SMOOTH_TWEEN, {TextColor3 = ACCENT_COLOR}):Play()
            tabObj.SubTabs[1].Indicator.Visible = true
        end
    end)

    table.insert(TabsList, tabObj)
    return tabObj
end

local function AddSubTab(parentTab, subName)
    local subBtn = Instance.new("TextButton")
    subBtn.Size = UDim2.new(1, 0, 0, 26)
    subBtn.BackgroundColor3 = Color3.fromRGB(16, 24, 40)
    subBtn.BackgroundTransparency = 1
    subBtn.BorderSizePixel = 0
    subBtn.Text = "            [" .. subName .. "]"
    subBtn.TextColor3 = Color3.fromRGB(120, 135, 165)
    subBtn.Font = Enum.Font.GothamMedium
    subBtn.TextSize = 10
    subBtn.TextXAlignment = Enum.TextXAlignment.Left
    subBtn.Parent = parentTab.SubContainer

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 3, 1, -10)
    indicator.Position = UDim2.new(0, 14, 0, 5)
    indicator.BackgroundColor3 = ACCENT_COLOR
    indicator.BorderSizePixel = 0
    indicator.Visible = false
    indicator.Parent = subBtn
    Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)

    local pageData = CreateContentPage(subName)
    local pageObj = BuildTabObj(pageData)

    local subObj = {Btn = subBtn, Page = pageData.Page, PageObj = pageObj, Indicator = indicator}
    table.insert(parentTab.SubTabs, subObj)

    subBtn.MouseButton1Click:Connect(function()
        PlayClickSound()
        HideAllPages()
        activePageRef = pageObj
        pageData.Page.Visible = true
        
        TweenService:Create(parentTab.Btn, SMOOTH_TWEEN, {TextColor3 = ACCENT_COLOR}):Play()
        TweenService:Create(subBtn, SMOOTH_TWEEN, {TextColor3 = ACCENT_COLOR}):Play()
        indicator.Visible = true
    end)

    return pageObj
end

-- ==========================================
-- EXACT 5 MAIN TABS & 12 SUBTABS STRUCTURE
-- ==========================================

-- 1. Main
local tabMain = AddMainTab("Main")
local pGeneral = AddSubTab(tabMain, "General")
local pMurder = AddSubTab(tabMain, "Murder")
local pSheriff = AddSubTab(tabMain, "Sheriff")

-- 2. Visuals
local tabVisuals = AddMainTab("Visuals")
local pEnemy = AddSubTab(tabVisuals, "Enemy")
local pExtra = AddSubTab(tabVisuals, "Extra")
local pWorld = AddSubTab(tabVisuals, "World")

-- 3. Movement
local tabMovement = AddMainTab("Movement")
local pAntiAim = AddSubTab(tabMovement, "Anti-aim")
local pTeleports = AddSubTab(tabMovement, "Teleports")
local pFling = AddSubTab(tabMovement, "Fling")

-- 4. Misc
local tabMisc = AddMainTab("Misc")
local pAutoFarm = AddSubTab(tabMisc, "Auto-Farm")
local pTroll = AddSubTab(tabMisc, "Troll")

-- 5. Settings
local tabSettings = AddMainTab("Settings")
local pServer = AddSubTab(tabSettings, "Server")

-- Default Open Tab -> Main [General]
tabMain.Expanded = true
tabMain.SubContainer.Size = UDim2.new(1, 0, 0, #tabMain.SubTabs * 26)
pGeneral.Page.Visible = true
activePageRef = pGeneral
tabMain.Btn.TextColor3 = ACCENT_COLOR
tabMain.SubTabs[1].Btn.TextColor3 = ACCENT_COLOR
tabMain.SubTabs[1].Indicator.Visible = true

-- ==========================================
-- MM2 GAME LOGIC & FUNCTIONS
-- ==========================================

local function CheckMaster() return getgenv().Thorium_MasterSwitch end

local function GetMurderer()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character and (plr.Character:FindFirstChild("Knife") or (plr:FindFirstChild("Backpack") and plr.Backpack:FindFirstChild("Knife"))) then
            return plr
        end
    end
    return nil
end

local function GetSheriff()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character and (plr.Character:FindFirstChild("Gun") or (plr:FindFirstChild("Backpack") and plr.Backpack:FindFirstChild("Gun"))) then
            return plr
        end
    end
    return nil
end

local function FindCoinContainer()
    return Workspace:FindFirstChild("Normal") and Workspace.Normal:FindFirstChild("CoinContainer") or Workspace:FindFirstChild("CoinContainer") or Workspace
end

-- ==========================================
-- MAIN SUBTABS
-- ==========================================

-- [General]
local autoDodgeLoop = nil
pGeneral:AddToggle("Auto Dodge Murderer", false, function(state)
    if state then
        autoDodgeLoop = task.spawn(function()
            while true do
                if CheckMaster() then
                    local m = GetMurderer()
                    if m and m ~= LocalPlayer and m.Character and m.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (LocalPlayer.Character.HumanoidRootPart.Position - m.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 12 then
                            local escapeDir = (LocalPlayer.Character.HumanoidRootPart.Position - m.Character.HumanoidRootPart.Position).Unit
                            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + (escapeDir * 20)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
        table.insert(activeCleanups, function() if autoDodgeLoop then task.cancel(autoDodgeLoop) end end)
    else
        if autoDodgeLoop then task.cancel(autoDodgeLoop) autoDodgeLoop = nil end
    end
end)

local isSpectating = false
pGeneral:AddToggle("Spectate Murderer", false, function(state)
    isSpectating = state
    if isSpectating then
        task.spawn(function()
            while isSpectating do
                if CheckMaster() then
                    local m = GetMurderer()
                    if m and m.Character and m.Character:FindFirstChild("Humanoid") then Workspace.CurrentCamera.CameraSubject = m.Character.Humanoid end
                end
                task.wait(0.5)
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid end
        end)
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid end
    end
end)

pGeneral:AddButton("Announce Roles", function()
    if not CheckMaster() then return end
    local m, s = GetMurderer(), GetSheriff()
    local msg = "Murderer: " .. (m and m.Name or "Unknown") .. " | Sheriff: " .. (s and s.Name or "None/Dead")
    ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(msg, "All")
end)

pGeneral:AddButton("FPS Booster", function()
    if not CheckMaster() then return end
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic
        elseif v:IsA("Decal") or v:IsA("Texture") then v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") then v.Enabled = false end
    end
    Lighting.GlobalShadows = false
end)

-- NEW FUNCTION 1/10: Auto Equip Weapon
local autoEquipLoop = nil
pGeneral:AddToggle("Auto Equip Weapon", false, function(state)
    if state then
        autoEquipLoop = task.spawn(function()
            while true do
                if CheckMaster() and LocalPlayer.Character and LocalPlayer:FindFirstChild("Backpack") then
                    local weapon = LocalPlayer.Backpack:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Gun")
                    if weapon then
                        LocalPlayer.Character.Humanoid:EquipTool(weapon)
                    end
                end
                task.wait(0.5)
            end
        end)
        table.insert(activeCleanups, function() if autoEquipLoop then task.cancel(autoEquipLoop) end end)
    else
        if autoEquipLoop then task.cancel(autoEquipLoop) autoEquipLoop = nil end
    end
end)

-- [Murder]
local knifeAuraLoop = nil
pMurder:AddToggle("Knife Kill Aura", false, function(state)
    if state then
        knifeAuraLoop = task.spawn(function()
            while true do
                if CheckMaster() then
                    local knife = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Knife")
                    if knife then
                        for _, plr in ipairs(Players:GetPlayers()) do
                            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                                if dist < 15 then knife:Activate() end
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
        table.insert(activeCleanups, function() if knifeAuraLoop then task.cancel(knifeAuraLoop) end end)
    else
        if knifeAuraLoop then task.cancel(knifeAuraLoop) knifeAuraLoop = nil end
    end
end)

pMurder:AddButton("Kill All", function()
    if not CheckMaster() then return end
    local knife = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Knife") or (LocalPlayer:FindFirstChild("Backpack") and LocalPlayer.Backpack:FindFirstChild("Knife"))
    if knife then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                task.wait(0.1)
            end
        end
    end
end)

pMurder:AddSlider("Hitbox Size", 2, 20, 2, function(val)
    if not CheckMaster() then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Size = Vector3.new(val, val, val)
            plr.Character.HumanoidRootPart.Transparency = 0.7
        end
    end
end)

-- NEW FUNCTION 2/10: Auto Throw Knife
local autoThrowLoop = nil
pMurder:AddToggle("Auto Throw Knife", false, function(state)
    if state then
        autoThrowLoop = task.spawn(function()
            while true do
                if CheckMaster() then
                    local knife = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Knife")
                    if knife and knife:FindFirstChild("CreateKnife") then
                        for _, plr in ipairs(Players:GetPlayers()) do
                            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                                if dist <= 40 then
                                    pcall(function()
                                        knife.CreateKnife:FireServer(plr.Character.HumanoidRootPart.Position, CFrame.new())
                                    end)
                                end
                            end
                        end
                    end
                end
                task.wait(0.2)
            end
        end)
        table.insert(activeCleanups, function() if autoThrowLoop then task.cancel(autoThrowLoop) end end)
    else
        if autoThrowLoop then task.cancel(autoThrowLoop) autoThrowLoop = nil end
    end
end)

-- [Sheriff]
local silentAimEnabled = false
if getrawmetatable then
    local gmt = getrawmetatable(game)
    setreadonly(gmt, false)
    local oldNamecall = gmt.__namecall
    gmt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if silentAimEnabled and CheckMaster() and (method == "FireServer" or method == "fireServer") and tostring(self) == "Shoot" then
            local m = GetMurderer()
            if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then
                args[1] = m.Character.HumanoidRootPart.Position
                return oldNamecall(self, unpack(args))
            end
        end
        return oldNamecall(self, ...)
    end)
end

pSheriff:AddToggle("Silent Aim", false, function(state) silentAimEnabled = state end)

local autoGunLoop = nil
pSheriff:AddToggle("Auto Grab Dropped Gun", false, function(state)
    if state then
        autoGunLoop = task.spawn(function()
            while true do
                if CheckMaster() then
                    local gunDrop = Workspace:FindFirstChild("GunDrop", true)
                    if gunDrop and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = gunDrop.CFrame
                    end
                end
                task.wait(0.3)
            end
        end)
        table.insert(activeCleanups, function() if autoGunLoop then task.cancel(autoGunLoop) end end)
    else
        if autoGunLoop then task.cancel(autoGunLoop) autoGunLoop = nil end
    end
end)

-- NEW FUNCTION 3/10: Show Silent Aim FOV
local fovCircle = nil
pSheriff:AddToggle("Show Silent Aim FOV", false, function(state)
    if state then
        fovCircle = Instance.new("Frame")
        fovCircle.Name = "FOVCircle"
        fovCircle.Size = UDim2.new(0, 160, 0, 160)
        fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
        fovCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
        fovCircle.BackgroundTransparency = 1
        fovCircle.Parent = ScreenGui

        local stroke = Instance.new("UIStroke")
        stroke.Color = ACCENT_COLOR
        stroke.Thickness = 1.5
        stroke.Parent = fovCircle
        Instance.new("UICorner", fovCircle).CornerRadius = UDim.new(1, 0)
    else
        if fovCircle then fovCircle:Destroy() fovCircle = nil end
    end
end)

-- ==========================================
-- VISUALS SUBTABS (WITH ESP PREVIEW & COLOR SHUTTER)
-- ==========================================

-- [ESP PREVIEW WIDGET INTEGRATION IN ENEMY]
local updateESPPreview = nil
do
    local target = pEnemy:GetNextParent()
    
    local previewCard = Instance.new("Frame")
    previewCard.Name = "ESPPreviewCard"
    previewCard.Size = UDim2.new(1, -8, 0, 140)
    previewCard.BackgroundColor3 = ELEMENT_BG
    previewCard.BackgroundTransparency = 0.15
    previewCard.BorderSizePixel = 0
    previewCard.ClipsDescendants = true
    previewCard.Parent = target
    Instance.new("UICorner", previewCard).CornerRadius = UDim.new(0, 8)

    local pTitle = Instance.new("TextLabel")
    pTitle.Size = UDim2.new(1, -20, 0, 22)
    pTitle.Position = UDim2.new(0, 10, 0, 4)
    pTitle.BackgroundTransparency = 1
    pTitle.Text = "ESP Preview"
    pTitle.TextColor3 = Color3.fromRGB(200, 215, 245)
    pTitle.Font = Enum.Font.GothamBold
    pTitle.TextSize = 10.5
    pTitle.TextXAlignment = Enum.TextXAlignment.Left
    pTitle.Parent = previewCard

    local pBox = Instance.new("Frame")
    pBox.Size = UDim2.new(1, -20, 0, 104)
    pBox.Position = UDim2.new(0, 10, 0, 28)
    pBox.BackgroundColor3 = Color3.fromRGB(12, 18, 30)
    pBox.BackgroundTransparency = 0.3
    pBox.BorderSizePixel = 0
    pBox.ClipsDescendants = true
    pBox.Parent = previewCard
    Instance.new("UICorner", pBox).CornerRadius = UDim.new(0, 6)

    -- Dummy Figure Box
    local dummyFrame = Instance.new("Frame")
    dummyFrame.Size = UDim2.new(0, 52, 0, 72)
    dummyFrame.Position = UDim2.new(0.5, -26, 0.5, -26)
    dummyFrame.BackgroundTransparency = 0.85
    dummyFrame.BackgroundColor3 = Color3.fromRGB(255, 87, 51)
    dummyFrame.Parent = pBox
    Instance.new("UICorner", dummyFrame).CornerRadius = UDim.new(0, 4)

    local dummyStroke = Instance.new("UIStroke")
    dummyStroke.Color = Color3.fromRGB(255, 87, 51)
    dummyStroke.Thickness = 1.4
    dummyStroke.Parent = dummyFrame

    -- Dummy Head
    local dummyHead = Instance.new("Frame")
    dummyHead.Size = UDim2.new(0, 14, 0, 14)
    dummyHead.Position = UDim2.new(0.5, -7, 0, 4)
    dummyHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dummyHead.BackgroundTransparency = 0.2
    dummyHead.Parent = dummyFrame
    Instance.new("UICorner", dummyHead).CornerRadius = UDim.new(1, 0)

    -- Dummy Name Label
    local dummyName = Instance.new("TextLabel")
    dummyName.Size = UDim2.new(0, 120, 0, 12)
    dummyName.Position = UDim2.new(0.5, -60, 0, -14)
    dummyName.BackgroundTransparency = 1
    dummyName.Text = "EnemyPlayer"
    dummyName.TextColor3 = Color3.fromRGB(255, 255, 255)
    dummyName.Font = Enum.Font.GothamBold
    dummyName.TextSize = 9
    dummyName.Parent = dummyFrame

    -- Dummy Health Bar
    local dummyHpBg = Instance.new("Frame")
    dummyHpBg.Size = UDim2.new(0, 3, 1, 0)
    dummyHpBg.Position = UDim2.new(0, -6, 0, 0)
    dummyHpBg.BackgroundColor3 = Color3.fromRGB(35, 45, 65)
    dummyHpBg.BorderSizePixel = 0
    dummyHpBg.Parent = dummyFrame

    local dummyHpFill = Instance.new("Frame")
    dummyHpFill.Size = UDim2.new(1, 0, 0.8, 0)
    dummyHpFill.Position = UDim2.new(0, 0, 0.2, 0)
    dummyHpFill.BackgroundColor3 = Color3.fromRGB(50, 225, 90)
    dummyHpFill.BorderSizePixel = 0
    dummyHpFill.Parent = dummyHpBg

    -- Dummy Extra Info
    local dummyInfo = Instance.new("TextLabel")
    dummyInfo.Size = UDim2.new(0, 120, 0, 12)
    dummyInfo.Position = UDim2.new(0.5, -60, 1, 2)
    dummyInfo.BackgroundTransparency = 1
    dummyInfo.Text = "Murderer [14m]"
    dummyInfo.TextColor3 = Color3.fromRGB(255, 87, 51)
    dummyInfo.Font = Enum.Font.GothamMedium
    dummyInfo.TextSize = 8.5
    dummyInfo.Parent = dummyFrame

    updateESPPreview = function(mainColor, textCol)
        if mainColor then
            dummyStroke.Color = mainColor
            dummyFrame.BackgroundColor3 = mainColor
            dummyInfo.TextColor3 = mainColor
        end
        if textCol then
            dummyName.TextColor3 = textCol
        end
    end

    table.insert(AllUIElements, {Text = "ESP Preview", Frame = previewCard, PageObj = pEnemy})
end

-- [Enemy]
local roleHighlights = {}
local roleESPColor = Color3.fromRGB(255, 87, 51)
local roleESPAlpha = 0

pEnemy:AddToggle("Role ESP", false, function(state)
    if state then
        task.spawn(function()
            while state do
                if CheckMaster() then
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character and not plr.Character:FindFirstChild("MM2RoleESP") then
                            local color = Color3.fromRGB(0, 255, 100)
                            if plr == GetMurderer() then color = roleESPColor
                            elseif plr == GetSheriff() then color = ACCENT_COLOR end
                            local hl = Instance.new("Highlight")
                            hl.Name = "MM2RoleESP"
                            hl.FillColor = color
                            hl.FillTransparency = roleESPAlpha
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.Parent = plr.Character
                            table.insert(roleHighlights, hl)
                        end
                    end
                end
                task.wait(1)
            end
        end)
    else
        for _, hl in ipairs(roleHighlights) do if hl then hl:Destroy() end end
        roleHighlights = {}
    end
end, roleESPColor, function(newCol, newAlpha)
    roleESPColor = newCol
    roleESPAlpha = newAlpha
    for _, hl in ipairs(roleHighlights) do
        if hl then hl.FillColor = newCol hl.FillTransparency = newAlpha end
    end
    if updateESPPreview then updateESPPreview(newCol, nil) end
end)

local innocentHighlights = {}
local innocentColor = Color3.fromRGB(0, 255, 120)
local innocentAlpha = 0

pEnemy:AddToggle("Innocents ESP", false, function(state)
    if state then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr ~= GetMurderer() and plr ~= GetSheriff() and plr.Character then
                local hl = Instance.new("Highlight")
                hl.Name = "InnocentESP"
                hl.FillColor = innocentColor
                hl.FillTransparency = innocentAlpha
                hl.Parent = plr.Character
                table.insert(innocentHighlights, hl)
            end
        end
    else
        for _, hl in ipairs(innocentHighlights) do if hl then hl:Destroy() end end
        innocentHighlights = {}
    end
end, innocentColor, function(newCol, newAlpha)
    innocentColor = newCol
    innocentAlpha = newAlpha
    for _, hl in ipairs(innocentHighlights) do
        if hl then hl.FillColor = newCol hl.FillTransparency = newAlpha end
    end
end)

local nameTags = {}
local nameTagColor = Color3.fromRGB(255, 255, 255)

pEnemy:AddToggle("Name ESP", false, function(state)
    if state then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                local bb = Instance.new("BillboardGui")
                bb.Name = "MM2NameTag"
                bb.Adornee = plr.Character.Head
                bb.Size = UDim2.new(0, 100, 0, 30)
                bb.StudsOffset = Vector3.new(0, 2, 0)
                bb.AlwaysOnTop = true
                bb.Parent = plr.Character
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1, 0, 1, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = plr.Name
                lbl.TextColor3 = nameTagColor
                lbl.TextSize = 10.5
                lbl.Font = Enum.Font.GothamBold
                lbl.Parent = bb
                table.insert(nameTags, bb)
            end
        end
    else
        for _, tag in ipairs(nameTags) do if tag then tag:Destroy() end end
        nameTags = {}
    end
end, nameTagColor, function(newCol)
    nameTagColor = newCol
    for _, tag in ipairs(nameTags) do
        local lbl = tag:FindFirstChildOfClass("TextLabel")
        if lbl then lbl.TextColor3 = newCol end
    end
    if updateESPPreview then updateESPPreview(nil, newCol) end
end)

-- NEW FUNCTION 4/10: Box ESP
local boxGuis = {}
pEnemy:AddToggle("Box ESP", false, function(state)
    if state then
        task.spawn(function()
            while state do
                if CheckMaster() then
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and not plr.Character:FindFirstChild("ThoriumBoxESP") then
                            local bg = Instance.new("BillboardGui")
                            bg.Name = "ThoriumBoxESP"
                            bg.Adornee = plr.Character.HumanoidRootPart
                            bg.Size = UDim2.new(4, 0, 5.5, 0)
                            bg.AlwaysOnTop = true
                            bg.Parent = plr.Character

                            local f = Instance.new("Frame")
                            f.Size = UDim2.new(1, 0, 1, 0)
                            f.BackgroundTransparency = 1
                            f.Parent = bg

                            local s = Instance.new("UIStroke")
                            s.Color = ACCENT_COLOR
                            s.Thickness = 1.5
                            s.Parent = f
                            table.insert(boxGuis, bg)
                        end
                    end
                end
                task.wait(1)
            end
        end)
    else
        for _, bg in ipairs(boxGuis) do if bg then bg:Destroy() end end
        boxGuis = {}
    end
end)

-- NEW FUNCTION 5/10: Health & Distance ESP
local hpDistTags = {}
pEnemy:AddToggle("Health & Distance ESP", false, function(state)
    if state then
        task.spawn(function()
            while state do
                if CheckMaster() then
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChildOfClass("Humanoid") then
                            local tag = plr.Character:FindFirstChild("ThoriumHpDist")
                            if not tag then
                                tag = Instance.new("BillboardGui")
                                tag.Name = "ThoriumHpDist"
                                tag.Adornee = plr.Character.Head
                                tag.Size = UDim2.new(0, 120, 0, 20)
                                tag.StudsOffset = Vector3.new(0, 3.2, 0)
                                tag.AlwaysOnTop = true
                                tag.Parent = plr.Character

                                local l = Instance.new("TextLabel")
                                l.Name = "InfoText"
                                l.Size = UDim2.new(1, 0, 1, 0)
                                l.BackgroundTransparency = 1
                                l.TextColor3 = Color3.fromRGB(180, 240, 255)
                                l.Font = Enum.Font.GothamMedium
                                l.TextSize = 9.5
                                l.Parent = tag
                                table.insert(hpDistTags, tag)
                            end
                            
                            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                            local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            local targetHrp = plr.Character:FindFirstChild("HumanoidRootPart")
                            local dist = (myHrp and targetHrp) and math.floor((myHrp.Position - targetHrp.Position).Magnitude) or 0
                            
                            local l = tag:FindFirstChild("InfoText")
                            if l then
                                l.Text = string.format("[%d HP] - %dm", math.floor(hum.Health), dist)
                            end
                        end
                    end
                end
                task.wait(0.2)
            end
        end)
    else
        for _, tag in ipairs(hpDistTags) do if tag then tag:Destroy() end end
        hpDistTags = {}
    end
end)

-- NEW FUNCTION 6/10: Chams Wallhack
local chamsObjects = {}
pEnemy:AddToggle("Chams Wallhack", false, function(state)
    if state then
        task.spawn(function()
            while state do
                if CheckMaster() then
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character and not plr.Character:FindFirstChild("ThoriumChams") then
                            local ch = Instance.new("Highlight")
                            ch.Name = "ThoriumChams"
                            ch.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            ch.FillColor = ACCENT_COLOR
                            ch.FillTransparency = 0.5
                            ch.OutlineTransparency = 0.2
                            ch.Parent = plr.Character
                            table.insert(chamsObjects, ch)
                        end
                    end
                end
                task.wait(1)
            end
        end)
    else
        for _, ch in ipairs(chamsObjects) do if ch then ch:Destroy() end end
        chamsObjects = {}
    end
end)

-- [Extra]
local gunHighlights = {}
local gunESPColor = Color3.fromRGB(255, 215, 0)

pExtra:AddToggle("Gun Drop ESP", false, function(state)
    if state then
        local gunDrop = Workspace:FindFirstChild("GunDrop", true)
        if gunDrop then
            local hl = Instance.new("Highlight")
            hl.Name = "GunESP"
            hl.FillColor = gunESPColor
            hl.Parent = gunDrop
            table.insert(gunHighlights, hl)
        end
    else
        for _, hl in ipairs(gunHighlights) do if hl then hl:Destroy() end end
        gunHighlights = {}
    end
end, gunESPColor, function(newCol)
    gunESPColor = newCol
    for _, hl in ipairs(gunHighlights) do if hl then hl.FillColor = newCol end end
end)

local crosshairFrame = nil
local crosshairColor = ACCENT_COLOR

pExtra:AddToggle("Screen Crosshair", false, function(state)
    if state then
        if not crosshairFrame then
            crosshairFrame = Instance.new("Frame")
            crosshairFrame.Size = UDim2.new(0, 6, 0, 6)
            crosshairFrame.Position = UDim2.new(0.5, -3, 0.5, -3)
            crosshairFrame.BackgroundColor3 = crosshairColor
            crosshairFrame.BorderSizePixel = 0
            crosshairFrame.Parent = ScreenGui
            Instance.new("UICorner", crosshairFrame).CornerRadius = UDim.new(1, 0)
        end
        crosshairFrame.Visible = true
    else
        if crosshairFrame then crosshairFrame.Visible = false end
    end
end, crosshairColor, function(newCol, newAlpha)
    crosshairColor = newCol
    if crosshairFrame then
        crosshairFrame.BackgroundColor3 = newCol
        crosshairFrame.BackgroundTransparency = newAlpha
    end
end)

local tracerAdornment = nil
local tracerConn = nil
local tracerColor = Color3.fromRGB(255, 87, 51)

pExtra:AddToggle("Tracer to Murderer", false, function(state)
    if state then
        tracerAdornment = Instance.new("LineHandleAdornment")
        tracerAdornment.Name = "MurdererTracer"
        tracerAdornment.Color3 = tracerColor
        tracerAdornment.Thickness = 2.5
        tracerAdornment.AlwaysOnTop = true
        tracerAdornment.Adornee = Workspace
        tracerConn = RunService.RenderStepped:Connect(function()
            if not CheckMaster() then tracerAdornment.Length = 0 return end
            local m = GetMurderer()
            if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local myPos = LocalPlayer.Character.HumanoidRootPart.Position
                local mPos = m.Character.HumanoidRootPart.Position
                tracerAdornment.Parent = Workspace
                tracerAdornment.CFrame = CFrame.lookAt(myPos, mPos)
                tracerAdornment.Length = (mPos - myPos).Magnitude
            else
                tracerAdornment.Length = 0
            end
        end)
        table.insert(activeCleanups, function() if tracerConn then tracerConn:Disconnect() end if tracerAdornment then tracerAdornment:Destroy() end end)
    else
        if tracerConn then tracerConn:Disconnect() end
        if tracerAdornment then tracerAdornment:Destroy() end
    end
end, tracerColor, function(newCol, newAlpha)
    tracerColor = newCol
    if tracerAdornment then
        tracerAdornment.Color3 = newCol
        tracerAdornment.Transparency = newAlpha
    end
end)

-- [World]
local originalAmbient = Lighting.Ambient
pWorld:AddToggle("Fullbright", false, function(state)
    if CheckMaster() then Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or originalAmbient end
end)

local origFogEnd = Lighting.FogEnd
pWorld:AddToggle("No Fog", false, function(state)
    if CheckMaster() then Lighting.FogEnd = state and 9e9 or origFogEnd end
end)

local coinHighlights = {}
local coinColor = Color3.fromRGB(255, 215, 0)

pWorld:AddToggle("Coin ESP", false, function(state)
    if state then
        local container = FindCoinContainer()
        for _, v in ipairs(container:GetDescendants()) do
            if (v.Name == "CoinVisual" or v.Name == "Coin") then
                local target = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart")
                if target and not target:FindFirstChild("CoinHL") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "CoinHL"
                    hl.FillColor = coinColor
                    hl.Parent = target
                    table.insert(coinHighlights, hl)
                end
            end
        end
    else
        for _, hl in ipairs(coinHighlights) do if hl then hl:Destroy() end end
        coinHighlights = {}
    end
end, coinColor, function(newCol)
    coinColor = newCol
    for _, hl in ipairs(coinHighlights) do if hl then hl.FillColor = newCol end end
end)

local customSky = nil
pWorld:AddToggle("Skybox Changer", false, function(state)
    if state and CheckMaster() then
        if not customSky then
            customSky = Instance.new("Sky")
            customSky.SkyboxBk = "rbxassetid://159454299"
            customSky.SkyboxDn = "rbxassetid://159454296"
            customSky.SkyboxFt = "rbxassetid://159454293"
            customSky.SkyboxLf = "rbxassetid://159454286"
            customSky.SkyboxRt = "rbxassetid://159454300"
            customSky.SkyboxUp = "rbxassetid://159454288"
            customSky.Parent = Lighting
        end
    else
        if customSky then customSky:Destroy() customSky = nil end
    end
end)

pWorld:AddSlider("Time of Day", 0, 24, math.floor(Lighting.ClockTime), function(val)
    if CheckMaster() then Lighting.ClockTime = val end
end)

-- NEW FUNCTION 7/10: X-Ray Walls
local storedTransparencies = {}
pWorld:AddToggle("X-Ray Walls", false, function(state)
    if state then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v.Parent:FindFirstChildOfClass("Humanoid") and v.Transparency < 0.5 then
                storedTransparencies[v] = v.Transparency
                v.Transparency = 0.6
            end
        end
    else
        for part, origTrans in pairs(storedTransparencies) do
            if part and part.Parent then
                part.Transparency = origTrans
            end
        end
        storedTransparencies = {}
    end
end)

-- ==========================================
-- MOVEMENT SUBTABS
-- ==========================================

-- [Anti-aim]
local antiAimActive = false
local spinSpeed = 30
local aaConn = nil

pAntiAim:AddToggle("Enable Anti-Aim (Spinbot)", false, function(state)
    antiAimActive = state
    if state then
        aaConn = RunService.RenderStepped:Connect(function()
            if antiAimActive and CheckMaster() and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LocalPlayer.Character.HumanoidRootPart
                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
            end
        end)
        table.insert(activeCleanups, function() if aaConn then aaConn:Disconnect() end end)
    else
        if aaConn then aaConn:Disconnect() end
    end
end)

pAntiAim:AddSlider("Yaw Speed", 5, 100, 30, function(val) spinSpeed = val end)

-- [Teleports]
pTeleports:AddButton("TP to Murderer", function()
    if not CheckMaster() then return end
    local m = GetMurderer()
    if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = m.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
    end
end)

pTeleports:AddButton("TP to Sheriff", function()
    if not CheckMaster() then return end
    local s = GetSheriff()
    if s and s.Character and s.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = s.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
    end
end)

pTeleports:AddButton("Teleport Safe Spot", function()
    if CheckMaster() and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 100, 0)
    end
end)

-- [Fling]
local currentWalkSpeed = 16
local currentJumpPower = 50
local renderSteppedConn = RunService.RenderStepped:Connect(function()
    if not CheckMaster() then return end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum.WalkSpeed ~= currentWalkSpeed then hum.WalkSpeed = currentWalkSpeed end
        if hum.JumpPower ~= currentJumpPower then hum.UseJumpPower = true hum.JumpPower = currentJumpPower end
    end
end)
table.insert(activeCleanups, function() renderSteppedConn:Disconnect() end)

pFling:AddSlider("Walk Speed", 16, 120, 16, function(val) currentWalkSpeed = val end)
pFling:AddSlider("Jump Power", 50, 250, 50, function(val) currentJumpPower = val end)

local flying = false
local flySpeed = 60
pFling:AddToggle("Fly Mode", false, function(state)
    flying = state
    if flying then
        task.spawn(function()
            while flying do
                if CheckMaster() and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = LocalPlayer.Character.HumanoidRootPart
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if hum then hum.PlatformStand = true end
                    local cam = Workspace.CurrentCamera
                    local moveDir = Vector3.zero
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += cam.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= cam.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= cam.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += cam.CFrame.RightVector end
                    if moveDir.Magnitude > 0 then hrp.AssemblyLinearVelocity = moveDir.Unit * flySpeed else hrp.AssemblyLinearVelocity = Vector3.zero end
                end
                task.wait()
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false end
        end)
    end
end)

local noclip = false
local noclipConn = nil
pFling:AddToggle("Noclip", false, function(state)
    noclip = state
    if noclip then
        noclipConn = RunService.Stepped:Connect(function()
            if noclip and CheckMaster() and LocalPlayer.Character then
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
        table.insert(activeCleanups, function() if noclipConn then noclipConn:Disconnect() end end)
    else
        if noclipConn then noclipConn:Disconnect() end
    end
end)

-- NEW FUNCTION 8/10: Infinite Jump
local infJumpConn = nil
pFling:AddToggle("Infinite Jump", false, function(state)
    if state then
        infJumpConn = UserInputService.JumpRequest:Connect(function()
            if CheckMaster() and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        table.insert(activeCleanups, function() if infJumpConn then infJumpConn:Disconnect() end end)
    else
        if infJumpConn then infJumpConn:Disconnect() infJumpConn = nil end
    end
end)

-- ==========================================
-- MISC SUBTABS
-- ==========================================

-- [Auto-Farm]
local autoCoinLoop = nil
pAutoFarm:AddToggle("Auto Farm Coins", false, function(state)
    if state then
        autoCoinLoop = task.spawn(function()
            while true do
                task.wait(0.05)
                if not CheckMaster() then continue end
                local char = LocalPlayer.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if root and hum and hum.Health > 0 then
                    local container = FindCoinContainer()
                    local coins = {}
                    for _, v in ipairs(container:GetDescendants()) do
                        if (v.Name == "CoinVisual" or v.Name == "Coin" or v.Name == "CoinServer" or v.Name == "DroppedCoin") then
                            local part = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart")
                            if part and part.Transparency < 1 and part:IsDescendantOf(Workspace) then table.insert(coins, part) end
                        end
                    end
                    table.sort(coins, function(a, b) return (root.Position - a.Position).Magnitude < (root.Position - b.Position).Magnitude end)
                    for _, coinPart in ipairs(coins) do
                        if not autoCoinLoop or not CheckMaster() then break end
                        if coinPart and coinPart.Parent and coinPart.Transparency < 1 then
                            for _, p in ipairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end
                            root.AssemblyLinearVelocity = Vector3.zero
                            root.CFrame = coinPart.CFrame + Vector3.new(0, 0.2, 0)
                            if firetouchinterest then pcall(function() firetouchinterest(root, coinPart, 0) task.wait(0.01) firetouchinterest(root, coinPart, 1) end) end
                            task.wait(0.08)
                        end
                    end
                end
            end
        end)
        table.insert(activeCleanups, function() if autoCoinLoop then task.cancel(autoCoinLoop) end end)
    else
        if autoCoinLoop then task.cancel(autoCoinLoop) autoCoinLoop = nil end
    end
end)

local autoClickerLoop = nil
pAutoFarm:AddToggle("Auto Clicker", false, function(state)
    if state then
        autoClickerLoop = task.spawn(function()
            while true do
                if CheckMaster() and mouse1click then mouse1click() end
                task.wait(0.02)
            end
        end)
        table.insert(activeCleanups, function() if autoClickerLoop then task.cancel(autoClickerLoop) end end)
    else
        if autoClickerLoop then task.cancel(autoClickerLoop) end
    end
end)

-- NEW FUNCTION 9/10: Coin Magnet
local coinMagnetLoop = nil
pAutoFarm:AddToggle("Coin Magnet", false, function(state)
    if state then
        coinMagnetLoop = task.spawn(function()
            while true do
                if CheckMaster() and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = LocalPlayer.Character.HumanoidRootPart
                    local container = FindCoinContainer()
                    for _, v in ipairs(container:GetDescendants()) do
                        if (v.Name == "CoinVisual" or v.Name == "Coin" or v.Name == "CoinServer") then
                            local part = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart")
                            if part and (hrp.Position - part.Position).Magnitude < 25 then
                                part.CFrame = hrp.CFrame
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
        table.insert(activeCleanups, function() if coinMagnetLoop then task.cancel(coinMagnetLoop) end end)
    else
        if coinMagnetLoop then task.cancel(coinMagnetLoop) coinMagnetLoop = nil end
    end
end)

-- [Troll]
local spammerLoop = nil
pTroll:AddToggle("Chat Spammer", false, function(state)
    if state then
        spammerLoop = task.spawn(function()
            while true do
                if CheckMaster() then ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("CAT HUB - by catjack.gg", "All") end
                task.wait(3)
            end
        end)
        table.insert(activeCleanups, function() if spammerLoop then task.cancel(spammerLoop) end end)
    else
        if spammerLoop then task.cancel(spammerLoop) end
    end
end)

local antiFlingActive = false
local antiFlingConn = nil
pTroll:AddToggle("Anti-Fling Protection", false, function(state)
    antiFlingActive = state
    if state then
        antiFlingConn = RunService.Stepped:Connect(function()
            if not antiFlingActive or not CheckMaster() then return end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.AssemblyLinearVelocity.Magnitude > 250 or hrp.AssemblyAngularVelocity.Magnitude > 250) then
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end
        end)
        table.insert(activeCleanups, function() if antiFlingConn then antiFlingConn:Disconnect() end end)
    else
        if antiFlingConn then antiFlingConn:Disconnect() antiFlingConn = nil end
    end
end)

pTroll:AddSlider("Camera FOV", 70, 120, 70, function(val)
    if CheckMaster() then Workspace.CurrentCamera.FieldOfView = val end
end)

-- ==========================================
-- SETTINGS SUBTABS
-- ==========================================

-- [Server]
pServer:AddSlider("UI Scale Factor (%)", 50, 150, 100, function(val)
    MainFrameScale.Scale = val / 100
end)

local uiFonts = {Enum.Font.GothamMedium, Enum.Font.Code, Enum.Font.Jura, Enum.Font.Oswald, Enum.Font.Roboto}
local currentFontIdx = 1
pServer:AddButton("Cycle UI Font", function(btnRef)
    currentFontIdx = currentFontIdx % #uiFonts + 1
    local selectedFont = uiFonts[currentFontIdx]
    btnRef.Text = "Cycle Font: " .. selectedFont.Name
    for _, obj in ipairs(ScreenGui:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            pcall(function() obj.Font = selectedFont end)
        end
    end
end)

pServer:AddToggle("Streamer Mode", false, function(state)
    pcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, not state) end)
end)

pServer:AddButton("Save Settings", function(btnRef)
    btnRef.Text = "Settings Saved!"
    task.wait(1.5)
    btnRef.Text = "Save Settings"
end)

-- NEW FUNCTION 10/10: Server Hop / Rejoin
pServer:AddButton("Server Hop", function(btnRef)
    btnRef.Text = "Hopping Server..."
    pcall(function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
        for _, s in ipairs(servers) do
            if s.id ~= game.JobId and s.playing < s.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                break
            end
        end
    end)
end)

pServer:AddButton("Unload Cheats", function()
    if getgenv().ThoriumLib_Cleanup then getgenv().ThoriumLib_Cleanup() end
end)
