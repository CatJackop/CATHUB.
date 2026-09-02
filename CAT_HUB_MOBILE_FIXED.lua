if getgenv().CATHUB_Cleanup then
    pcall(getgenv().CATHUB_Cleanup)
end

local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local oldGui = CoreGui:FindFirstChild("CATHUBGui") or (LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("CATHUBGui"))
if oldGui then oldGui:Destroy() end

local oldBlur = Lighting:FindFirstChild("CATHUBUIBlur")
if oldBlur then oldBlur:Destroy() end

local activeCleanups = {}
getgenv().CATHUB_Cleanup = function()
    for _, cleanup in ipairs(activeCleanups) do
        pcall(cleanup)
    end
    local g = CoreGui:FindFirstChild("CATHUBGui") or (LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("CATHUBGui"))
    if g then g:Destroy() end
    getgenv().CATHUB_Loaded = nil
end

getgenv().CATHUB_Loaded = true

-- Place ID (Murder Mystery 2: 142823291)
local TARGET_PLACE_ID = 142823291
if game.PlaceId ~= TARGET_PLACE_ID then
    warn("[CAT HUB] Wrong Place ID (" .. tostring(game.PlaceId) .. ")! Was expected: " .. tostring(TARGET_PLACE_ID))
    return
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Mouse = LocalPlayer:GetMouse()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CATHUBGui"
ScreenGui.ResetOnSpawn = false

local success, _ = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not success then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end


local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 740, 0, 460)
MainFrame.Position = UDim2.new(0.5, -370, 0.5, -230)
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
MainFrame.BackgroundTransparency = 0.25
MainFrame.BorderSizePixel = 0
MainFrame.Active = false
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(70, 70, 95)
MainStroke.Thickness = 1
MainStroke.Transparency = 0.4
MainStroke.Parent = MainFrame

local MobileToggleBtn = Instance.new("ImageButton")
MobileToggleBtn.Name = "MobileToggleBtn"
MobileToggleBtn.Size = UDim2.new(0, 46, 0, 46)
MobileToggleBtn.Position = UDim2.new(0, 18, 0.35, 0)
MobileToggleBtn.BackgroundColor3 = Color3.fromRGB(108, 92, 231)
MobileToggleBtn.BackgroundTransparency = 0.2
MobileToggleBtn.Image = "rbxassetid://126031329785796"
MobileToggleBtn.ScaleType = Enum.ScaleType.Fit
MobileToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MobileToggleBtn.TextSize = 15
MobileToggleBtn.Font = Enum.Font.GothamBold
MobileToggleBtn.Active = true
MobileToggleBtn.Visible = true
MobileToggleBtn.Parent = ScreenGui

local MobileBtnCorner = Instance.new("UICorner")
MobileBtnCorner.CornerRadius = UDim.new(1, 0)
MobileBtnCorner.Parent = MobileToggleBtn

local MobileBtnStroke = Instance.new("UIStroke")
MobileBtnStroke.Color = Color3.fromRGB(180, 170, 255)
MobileBtnStroke.Thickness = 1.5
MobileBtnStroke.Parent = MobileToggleBtn

local function ToggleMenu()
    MainFrame.Visible = not MainFrame.Visible
end

MobileToggleBtn.MouseButton1Click:Connect(ToggleMenu)

local mDragging, mDragStart, mStartPos
MobileToggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        mDragging = true
        mDragStart = input.Position
        mStartPos = MobileToggleBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                mDragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if mDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - mDragStart
        MobileToggleBtn.Position = UDim2.new(mStartPos.X.Scale, mStartPos.X.Offset + delta.X, mStartPos.Y.Scale, mStartPos.Y.Offset + delta.Y)
    end
end)

local dragging, dragInput, dragStart, startPos
local function updateDrag(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

local toggleKey = Enum.KeyCode.K
local isListeningForKey = false

local keyInputConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if isListeningForKey and input.UserInputType == Enum.UserInputType.Keyboard then
        toggleKey = input.KeyCode
        isListeningForKey = false
        return
    end

    if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == toggleKey then
        ToggleMenu()
    end
end)
table.insert(activeCleanups, function() keyInputConn:Disconnect() end)

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 190, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
Sidebar.BackgroundTransparency = 0.45
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Name = "Credit"
CreditLabel.Size = UDim2.new(1, -16, 0, 18)
CreditLabel.Position = UDim2.new(0, 8, 1, -24)
CreditLabel.BackgroundTransparency = 1
CreditLabel.Text = "Created by catjack.gg"
CreditLabel.TextColor3 = Color3.fromRGB(160, 160, 180)
CreditLabel.TextSize = 10
CreditLabel.Font = Enum.Font.GothamMedium
CreditLabel.TextXAlignment = Enum.TextXAlignment.Center
CreditLabel.Parent = Sidebar

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 12)
SidebarCorner.Parent = Sidebar

local SidebarRightLine = Instance.new("Frame")
SidebarRightLine.Size = UDim2.new(0, 1, 1, -20)
SidebarRightLine.Position = UDim2.new(1, -1, 0, 10)
SidebarRightLine.BackgroundColor3 = Color3.fromRGB(50, 50, 68)
SidebarRightLine.BackgroundTransparency = 0.5
SidebarRightLine.BorderSizePixel = 0
SidebarRightLine.Parent = Sidebar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "CAT HUB <font color='#6C5CE7'>v2.1</font>"
Title.RichText = true
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = Sidebar

local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, -16, 1, -130)
TabContainer.Position = UDim2.new(0, 8, 0, 55)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = Sidebar

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 6)
TabListLayout.Parent = TabContainer

local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -215, 1, -20)
ContentArea.Position = UDim2.new(0, 205, 0, 10)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

local ProfileBox = Instance.new("Frame")
ProfileBox.Name = "ProfileBox"
ProfileBox.Size = UDim2.new(1, -16, 0, 50)
ProfileBox.Position = UDim2.new(0, 8, 1, -60)
ProfileBox.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
ProfileBox.BackgroundTransparency = 0.4
ProfileBox.BorderSizePixel = 0
ProfileBox.Parent = Sidebar

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 8)
ProfileCorner.Parent = ProfileBox

local ProfileStroke = Instance.new("UIStroke")
ProfileStroke.Color = Color3.fromRGB(55, 55, 75)
ProfileStroke.Transparency = 0.6
ProfileStroke.Parent = ProfileBox

local ProfileIcon = Instance.new("ImageLabel")
ProfileIcon.Name = "Avatar"
ProfileIcon.Size = UDim2.new(0, 34, 0, 34)
ProfileIcon.Position = UDim2.new(0, 8, 0.5, -17)
ProfileIcon.BackgroundTransparency = 1
ProfileIcon.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
ProfileIcon.Parent = ProfileBox

local ProfileIconCorner = Instance.new("UICorner")
ProfileIconCorner.CornerRadius = UDim.new(1, 0)
ProfileIconCorner.Parent = ProfileIcon

local NicknameLabel = Instance.new("TextLabel")
NicknameLabel.Name = "Nickname"
NicknameLabel.Size = UDim2.new(1, -50, 0, 16)
NicknameLabel.Position = UDim2.new(0, 48, 0, 8)
NicknameLabel.BackgroundTransparency = 1
NicknameLabel.Text = LocalPlayer.Name
NicknameLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
NicknameLabel.TextSize = 12
NicknameLabel.Font = Enum.Font.GothamSemibold
NicknameLabel.TextXAlignment = Enum.TextXAlignment.Left
NicknameLabel.Parent = ProfileBox

local trustedMode = false
local dangerousElements = {}

local ModeLabel = Instance.new("TextLabel")
ModeLabel.Name = "ModeLabel"
ModeLabel.Size = UDim2.new(1, -50, 0, 14)
ModeLabel.Position = UDim2.new(0, 48, 0, 24)
ModeLabel.BackgroundTransparency = 1
ModeLabel.RichText = true
ModeLabel.Text = "<font color='#FF4D4D'>Unsafe Mode</font>"
ModeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeLabel.TextSize = 10
ModeLabel.Font = Enum.Font.GothamSemibold
ModeLabel.TextXAlignment = Enum.TextXAlignment.Left
ModeLabel.Parent = ProfileBox

local function UpdateModeStatus(state)
    trustedMode = state
    if state then
        ModeLabel.Text = "<font color='#4EFE8C'>Safe Mode</font>"
        for _, elem in ipairs(dangerousElements) do
            if elem.getState() then elem.setState(false) end
            elem.setYellow(true)
        end
    else
        ModeLabel.Text = "<font color='#FF4D4D'>Unsafe Mode</font>"
        for _, elem in ipairs(dangerousElements) do
            elem.setYellow(false)
        end
    end
end

local tabs = {}

local function createTab(name, icon)
    local page = Instance.new("Frame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = ContentArea

    local centerDivider = Instance.new("Frame")
    centerDivider.Name = "CenterDivider"
    centerDivider.Size = UDim2.new(0, 1, 1, -10)
    centerDivider.Position = UDim2.new(0.5, -0.5, 0, 5)
    centerDivider.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
    centerDivider.BackgroundTransparency = 0.5
    centerDivider.BorderSizePixel = 0
    centerDivider.Parent = page

    local leftCol = Instance.new("ScrollingFrame")
    leftCol.Name = "LeftColumn"
    leftCol.Size = UDim2.new(0.5, -12, 1, 0)
    leftCol.Position = UDim2.new(0, 0, 0, 0)
    leftCol.BackgroundTransparency = 1
    leftCol.BorderSizePixel = 0
    leftCol.ScrollBarThickness = 3
    leftCol.ScrollBarImageColor3 = Color3.fromRGB(108, 92, 231)
    leftCol.Parent = page

    local leftLayout = Instance.new("UIListLayout")
    leftLayout.SortOrder = Enum.SortOrder.LayoutOrder
    leftLayout.Padding = UDim.new(0, 6)
    leftLayout.Parent = leftCol

    leftLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        leftCol.CanvasSize = UDim2.new(0, 0, 0, leftLayout.AbsoluteContentSize.Y + 10)
    end)

    local rightCol = Instance.new("ScrollingFrame")
    rightCol.Name = "RightColumn"
    rightCol.Size = UDim2.new(0.5, -12, 1, 0)
    rightCol.Position = UDim2.new(0.5, 12, 0, 0)
    rightCol.BackgroundTransparency = 1
    rightCol.BorderSizePixel = 0
    rightCol.ScrollBarThickness = 3
    rightCol.ScrollBarImageColor3 = Color3.fromRGB(108, 92, 231)
    rightCol.Parent = page

    local rightLayout = Instance.new("UIListLayout")
    rightLayout.SortOrder = Enum.SortOrder.LayoutOrder
    rightLayout.Padding = UDim.new(0, 6)
    rightLayout.Parent = rightCol

    rightLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        rightCol.CanvasSize = UDim2.new(0, 0, 0, rightLayout.AbsoluteContentSize.Y + 10)
    end)

    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = name .. "Tab"
    tabBtn.Size = UDim2.new(1, 0, 0, 34)
    tabBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    tabBtn.BackgroundTransparency = 0.6
    tabBtn.Text = "  " .. (icon or "•") .. "  " .. name
    tabBtn.TextColor3 = Color3.fromRGB(160, 160, 180)
    tabBtn.TextSize = 12
    tabBtn.Font = Enum.Font.GothamMedium
    tabBtn.TextXAlignment = Enum.TextXAlignment.Left
    tabBtn.Parent = TabContainer

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = tabBtn

    local activeIndicator = Instance.new("Frame")
    activeIndicator.Name = "Indicator"
    activeIndicator.Size = UDim2.new(0, 3, 0, 18)
    activeIndicator.Position = UDim2.new(0, 2, 0.5, -9)
    activeIndicator.BackgroundColor3 = Color3.fromRGB(108, 92, 231)
    activeIndicator.BorderSizePixel = 0
    activeIndicator.Visible = false
    activeIndicator.Parent = tabBtn

    local indCorner = Instance.new("UICorner")
    indCorner.CornerRadius = UDim.new(1, 0)
    indCorner.Parent = activeIndicator

    local tabObj = {
        Button = tabBtn,
        Page = page,
        LeftCol = leftCol,
        RightCol = rightCol,
        Indicator = activeIndicator,
        ItemCount = 0
    }

    local function selectTab()
        for _, tabData in pairs(tabs) do
            tabData.Page.Visible = false
            tabData.Indicator.Visible = false
            TweenService:Create(tabData.Button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(24, 24, 32),
                BackgroundTransparency = 0.6,
                TextColor3 = Color3.fromRGB(160, 160, 180)
            }):Play()
        end
        page.Visible = true
        activeIndicator.Visible = true
        TweenService:Create(tabBtn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(108, 92, 231),
            BackgroundTransparency = 0.2,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
    end

    tabBtn.MouseButton1Click:Connect(selectTab)

    function tabObj:GetNextParent()
        self.ItemCount = self.ItemCount + 1
        return (self.ItemCount % 2 == 1) and self.LeftCol or self.RightCol
    end

    function tabObj:AddToggle(text, default, isDangerous, callback)
        if type(isDangerous) == "function" then
            callback = isDangerous
            isDangerous = false
        end

        local targetParent = self:GetNextParent()
        local state = default or false
        
        local toggleFrame = Instance.new("Frame")
        toggleFrame.Size = UDim2.new(1, 0, 0, 38)
        toggleFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        toggleFrame.BackgroundTransparency = 0.35
        toggleFrame.Parent = targetParent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = toggleFrame

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(50, 50, 65)
        stroke.Transparency = 0.6
        stroke.Parent = toggleFrame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -50, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = isDangerous and (trustedMode and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(220, 220, 230)) or Color3.fromRGB(220, 220, 230)
        label.TextSize = 11
        label.Font = Enum.Font.GothamMedium
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextWrapped = true
        label.Parent = toggleFrame

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 34, 0, 18)
        btn.Position = UDim2.new(1, -40, 0.5, -9)
        btn.BackgroundColor3 = state and Color3.fromRGB(108, 92, 231) or Color3.fromRGB(40, 40, 52)
        btn.Text = ""
        btn.Parent = toggleFrame

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(1, 0)
        btnCorner.Parent = btn

        local circle = Instance.new("Frame")
        circle.Size = UDim2.new(0, 14, 0, 14)
        circle.Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
        circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        circle.Parent = btn

        local circleCorner = Instance.new("UICorner")
        circleCorner.CornerRadius = UDim.new(1, 0)
        circleCorner.Parent = circle

        local function applyToggle(newState)
            if trustedMode and isDangerous and newState == true then
                warn("[CAT HUB]: Функция '" .. text .. "' заблокирована в Trusted Mode!")
                return
            end

            state = newState
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = state and Color3.fromRGB(108, 92, 231) or Color3.fromRGB(40, 40, 52)
            }):Play()
            TweenService:Create(circle, TweenInfo.new(0.2), {
                Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
            }):Play()
            task.spawn(callback, state)
        end

        btn.MouseButton1Click:Connect(function()
            applyToggle(not state)
        end)

        if isDangerous then
            table.insert(dangerousElements, {
                getState = function() return state end,
                setState = applyToggle,
                setYellow = function(yellow)
                    label.TextColor3 = yellow and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(220, 220, 230)
                end
            })
            if trustedMode then label.TextColor3 = Color3.fromRGB(255, 215, 0) end
        end
    end

    function tabObj:AddSlider(text, min, max, default, callback)
        local targetParent = self:GetNextParent()
        local val = math.clamp(default or min, min, max)

        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(1, 0, 0, 44)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        sliderFrame.BackgroundTransparency = 0.35
        sliderFrame.Parent = targetParent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = sliderFrame

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(50, 50, 65)
        stroke.Transparency = 0.6
        stroke.Parent = sliderFrame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.7, 0, 0, 18)
        label.Position = UDim2.new(0, 10, 0, 4)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(220, 220, 230)
        label.TextSize = 11
        label.Font = Enum.Font.GothamMedium
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = sliderFrame

        local valLabel = Instance.new("TextLabel")
        valLabel.Size = UDim2.new(0.3, -10, 0, 18)
        valLabel.Position = UDim2.new(0.7, 0, 0, 4)
        valLabel.BackgroundTransparency = 1
        valLabel.Text = tostring(val)
        valLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
        valLabel.TextSize = 11
        valLabel.Font = Enum.Font.Gotham
        valLabel.TextXAlignment = Enum.TextXAlignment.Right
        valLabel.Parent = sliderFrame

        local track = Instance.new("Frame")
        track.Size = UDim2.new(1, -20, 0, 6)
        track.Position = UDim2.new(0, 10, 1, -12)
        track.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
        track.Parent = sliderFrame

        local trackCorner = Instance.new("UICorner")
        trackCorner.CornerRadius = UDim.new(1, 0)
        trackCorner.Parent = track

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((val - min)/(max - min), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(108, 92, 231)
        fill.Parent = track

        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(1, 0)
        fillCorner.Parent = fill

        local knob = Instance.new("Frame")
        knob.Name = "Knob"
        knob.Size = UDim2.new(0, 14, 0, 14)
        knob.Position = UDim2.new(1, -7, 0.5, -7)
        knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        knob.BorderSizePixel = 0
        knob.Parent = fill

        local knobCorner = Instance.new("UICorner")
        knobCorner.CornerRadius = UDim.new(1, 0)
        knobCorner.Parent = knob

        local knobStroke = Instance.new("UIStroke")
        knobStroke.Color = Color3.fromRGB(108, 92, 231)
        knobStroke.Thickness = 1.5
        knobStroke.Parent = knob

        local trigger = Instance.new("TextButton")
        trigger.Size = UDim2.new(1, 0, 1, 0)
        trigger.BackgroundTransparency = 1
        trigger.Text = ""
        trigger.Parent = sliderFrame

        local draggingSlider = false
        local function updateInput(input)
            local posX = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            val = math.floor(min + (max - min) * posX)
            valLabel.Text = tostring(val)
            fill.Size = UDim2.new(posX, 0, 1, 0)
            task.spawn(callback, val)
        end

        trigger.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = true
                updateInput(input)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateInput(input)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = false
            end
        end)
    end

    function tabObj:AddButton(text, callback)
        local targetParent = self:GetNextParent()
        local btnFrame = Instance.new("Frame")
        btnFrame.Size = UDim2.new(1, 0, 0, 36)
        btnFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        btnFrame.BackgroundTransparency = 0.35
        btnFrame.Parent = targetParent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = btnFrame

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(50, 50, 65)
        stroke.Transparency = 0.6
        stroke.Parent = btnFrame

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(220, 220, 230)
        btn.TextSize = 11
        btn.Font = Enum.Font.GothamSemibold
        btn.Parent = btnFrame

        btn.MouseButton1Click:Connect(function()
            TweenService:Create(btnFrame, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(108, 92, 231)}):Play()
            task.wait(0.1)
            TweenService:Create(btnFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(22, 22, 30)}):Play()
            task.spawn(callback, btn)
        end)
        return btn
    end

    table.insert(tabs, tabObj)
    if #tabs == 1 then selectTab() end
    return tabObj
end

local mm2Page        = createTab("MM2 Main", "⚡")
local visualsPage    = createTab("Visuals", "👁")
local extraPage      = createTab("Extra", "✨")
local movementPage   = createTab("Movement", "🏃")
local teleportsPage  = createTab("Teleports", "📍")
local automationPage = createTab("Automation", "⚙")
local miscPage       = createTab("Miscellaneous", "🔧")

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

local function GetInnocents()
    local innocents = {}
    local m = GetMurderer()
    local s = GetSheriff()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr ~= m and plr ~= s and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(innocents, plr)
        end
    end
    return innocents
end

local antiFlingActive = false
local antiFlingConn = nil
local function ToggleAntiFling(state)
    antiFlingActive = state
    if state then
        antiFlingConn = RunService.Stepped:Connect(function()
            if not antiFlingActive then return end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if hrp.AssemblyLinearVelocity.Magnitude > 250 or hrp.AssemblyAngularVelocity.Magnitude > 250 then
                            hrp.AssemblyLinearVelocity = Vector3.zero
                            hrp.AssemblyAngularVelocity = Vector3.zero
                        end
                    end
                end
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local myHrp = LocalPlayer.Character.HumanoidRootPart
                if myHrp.AssemblyLinearVelocity.Magnitude > 300 then
                    myHrp.AssemblyLinearVelocity = Vector3.zero
                    myHrp.AssemblyAngularVelocity = Vector3.zero
                end
            end
        end)
        table.insert(activeCleanups, function() if antiFlingConn then antiFlingConn:Disconnect() end end)
    else
        if antiFlingConn then antiFlingConn:Disconnect() antiFlingConn = nil end
    end
end

local activeFlingRoutine = nil
local function FlingTarget(targetPlayer)
    if activeFlingRoutine then
        task.cancel(activeFlingRoutine)
        activeFlingRoutine = nil
    end

    activeFlingRoutine = task.spawn(function()
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = character.HumanoidRootPart
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        local targetChar = targetPlayer.Character
        if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then return end
        local targetHrp = targetChar.HumanoidRootPart
        
        local oldPos = hrp.CFrame
        if humanoid then humanoid.PlatformStand = true end
        
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not targetHrp or not targetHrp.Parent or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if connection then connection:Disconnect() end
                return
            end
            
            targetHrp = targetPlayer.Character.HumanoidRootPart
            local angle = tick() * 35
            local offset = CFrame.new(math.cos(angle) * 1.5, 0.5, math.sin(angle) * 1.5)
            hrp.CFrame = targetHrp.CFrame * offset * CFrame.Angles(math.rad(90), 0, 0)
            hrp.AssemblyLinearVelocity = Vector3.new(35000, 35000, 35000)
            hrp.AssemblyAngularVelocity = Vector3.new(50000, 50000, 50000)
        end)
        
        task.wait(1.5)
        if connection then connection:Disconnect() end
        
        if humanoid then humanoid.PlatformStand = false end
        hrp.CFrame = oldPos
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        activeFlingRoutine = nil
    end)
end

local function StopAllFlings()
    if activeFlingRoutine then
        task.cancel(activeFlingRoutine)
        activeFlingRoutine = nil
    end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end
end
table.insert(activeCleanups, StopAllFlings)

local silentAimEnabled = false
if getrawmetatable then
    local gmt = getrawmetatable(game)
    setreadonly(gmt, false)
    local oldNamecall = gmt.__namecall
    gmt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if silentAimEnabled and (method == "FireServer" or method == "fireServer") and tostring(self) == "Shoot" then
            local m = GetMurderer()
            if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then
                args[1] = m.Character.HumanoidRootPart.Position
                return oldNamecall(self, unpack(args))
            end
        end
        return oldNamecall(self, ...)
    end)
end

mm2Page:AddToggle("Sheriff Silent Aim", false, true, function(state) silentAimEnabled = state end)

mm2Page:AddButton("Kill All (Murderer)", function()
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

local autoCoinLoop = nil
local function FindCoinContainer()
    return Workspace:FindFirstChild("Normal") and Workspace.Normal:FindFirstChild("CoinContainer")
        or Workspace:FindFirstChild("CoinContainer")
        or Workspace
end

mm2Page:AddToggle("Auto Farm Coins (Overhauled)", false, true, function(state)
    if state then
        autoCoinLoop = task.spawn(function()
            while true do
                task.wait(0.05)
                local char = LocalPlayer.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                
                if root and hum and hum.Health > 0 then
                    local container = FindCoinContainer()
                    local coinsToCollect = {}

                    for _, v in ipairs(container:GetDescendants()) do
                        if (v.Name == "CoinVisual" or v.Name == "Coin" or v.Name == "CoinServer" or v.Name == "DroppedCoin") then
                            local part = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart")
                            if part and part.Transparency < 1 and part:IsDescendantOf(Workspace) then
                                table.insert(coinsToCollect, part)
                            end
                        end
                    end

                    table.sort(coinsToCollect, function(a, b)
                        return (root.Position - a.Position).Magnitude < (root.Position - b.Position).Magnitude
                    end)

                    for _, coinPart in ipairs(coinsToCollect) do
                        if not autoCoinLoop then break end
                        if coinPart and coinPart.Parent and coinPart.Transparency < 1 then
                            for _, p in ipairs(char:GetDescendants()) do
                                if p:IsA("BasePart") then p.CanCollide = false end
                            end

                            root.AssemblyLinearVelocity = Vector3.zero
                            root.AssemblyAngularVelocity = Vector3.zero
                            root.CFrame = coinPart.CFrame + Vector3.new(0, 0.2, 0)

                            if firetouchinterest then
                                pcall(function()
                                    firetouchinterest(root, coinPart, 0)
                                    task.wait(0.01)
                                    firetouchinterest(root, coinPart, 1)
                                end)
                            end
                            task.wait(0.08)
                        end
                    end
                end
            end
        end)
        table.insert(activeCleanups, function() if autoCoinLoop then task.cancel(autoCoinLoop) end end)
    else
        if autoCoinLoop then task.cancel(autoCoinLoop) autoCoinLoop = nil end
        if LocalPlayer.Character then
            for _, p in ipairs(LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.CanCollide = true end
            end
        end
    end
end)

local knifeAuraLoop = nil
mm2Page:AddToggle("Knife Kill Aura", false, true, function(state)
    if state then
        knifeAuraLoop = task.spawn(function()
            while true do
                local knife = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Knife")
                if knife then
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                            local dist = (LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                            if dist < 15 then knife:Activate() end
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

local autoGunLoop = nil
mm2Page:AddToggle("Auto Grab Dropped Gun", false, true, function(state)
    if state then
        autoGunLoop = task.spawn(function()
            while true do
                local gunDrop = Workspace:FindFirstChild("GunDrop", true)
                if gunDrop and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = gunDrop.CFrame
                end
                task.wait(0.3)
            end
        end)
        table.insert(activeCleanups, function() if autoGunLoop then task.cancel(autoGunLoop) end end)
    else
        if autoGunLoop then task.cancel(autoGunLoop) autoGunLoop = nil end
    end
end)

local hitboxSize = 2
mm2Page:AddSlider("Player Hitbox Size", 2, 20, 2, function(val)
    hitboxSize = val
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Size = Vector3.new(val, val, val)
            plr.Character.HumanoidRootPart.Transparency = 0.7
        end
    end
end)

mm2Page:AddButton("Announce Roles in Chat", function()
    local m = GetMurderer()
    local s = GetSheriff()
    local msg = "Murderer: " .. (m and m.Name or "Unknown") .. " | Sheriff: " .. (s and s.Name or "None/Dead")
    ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(msg, "All")
end)

local isSpectating = false
mm2Page:AddToggle("Spectate Murderer", false, function(state)
    isSpectating = state
    if isSpectating then
        task.spawn(function()
            while isSpectating do
                local m = GetMurderer()
                if m and m.Character and m.Character:FindFirstChild("Humanoid") then
                    Workspace.CurrentCamera.CameraSubject = m.Character.Humanoid
                end
                task.wait(0.5)
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end)
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        end
    end
end)

local autoDodgeLoop = nil
mm2Page:AddToggle("Auto Dodge Murderer", false, true, function(state)
    if state then
        autoDodgeLoop = task.spawn(function()
            while true do
                local m = GetMurderer()
                if m and m ~= LocalPlayer and m.Character and m.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - m.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 12 then
                        local escapeDir = (LocalPlayer.Character.HumanoidRootPart.Position - m.Character.HumanoidRootPart.Position).Unit
                        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + (escapeDir * 20)
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

local roleHighlights = {}
visualsPage:AddToggle("Role ESP (Murder/Sheriff)", false, function(state)
    if state then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                local color = Color3.fromRGB(0, 255, 100)
                if plr == GetMurderer() then color = Color3.fromRGB(255, 0, 50)
                elseif plr == GetSheriff() then color = Color3.fromRGB(0, 150, 255) end

                local hl = Instance.new("Highlight")
                hl.Name = "MM2RoleESP"
                hl.FillColor = color
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.Parent = plr.Character
                table.insert(roleHighlights, hl)
            end
        end
    else
        for _, hl in ipairs(roleHighlights) do if hl then hl:Destroy() end end
        roleHighlights = {}
    end
end)

local innocentHighlights = {}
visualsPage:AddToggle("Innocents ESP", false, function(state)
    if state then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr ~= GetMurderer() and plr ~= GetSheriff() and plr.Character then
                local hl = Instance.new("Highlight")
                hl.Name = "InnocentESP"
                hl.FillColor = Color3.fromRGB(0, 255, 120)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.Parent = plr.Character
                table.insert(innocentHighlights, hl)
            end
        end
    else
        for _, hl in ipairs(innocentHighlights) do if hl then hl:Destroy() end end
        innocentHighlights = {}
    end
end)

local gunHighlights = {}
visualsPage:AddToggle("Dropped Gun ESP", false, function(state)
    if state then
        local gunDrop = Workspace:FindFirstChild("GunDrop", true)
        if gunDrop then
            local hl = Instance.new("Highlight")
            hl.Name = "GunESP"
            hl.FillColor = Color3.fromRGB(255, 215, 0)
            hl.Parent = gunDrop
            table.insert(gunHighlights, hl)
        end
    else
        for _, hl in ipairs(gunHighlights) do if hl then hl:Destroy() end end
        gunHighlights = {}
    end
end)

local tracerAdornment = nil
local tracerConn = nil
visualsPage:AddToggle("Tracer to Murderer", false, function(state)
    if state then
        tracerAdornment = Instance.new("LineHandleAdornment")
        tracerAdornment.Name = "MurdererTracer"
        tracerAdornment.Color3 = Color3.fromRGB(255, 0, 0)
        tracerAdornment.Thickness = 3
        tracerAdornment.AlwaysOnTop = true
        tracerAdornment.Adornee = Workspace

        tracerConn = RunService.RenderStepped:Connect(function()
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
end)

local sheriffTracerAdornment = nil
local sheriffTracerConn = nil
visualsPage:AddToggle("Tracer to Sheriff", false, function(state)
    if state then
        sheriffTracerAdornment = Instance.new("LineHandleAdornment")
        sheriffTracerAdornment.Name = "SheriffTracer"
        sheriffTracerAdornment.Color3 = Color3.fromRGB(0, 150, 255)
        sheriffTracerAdornment.Thickness = 3
        sheriffTracerAdornment.AlwaysOnTop = true
        sheriffTracerAdornment.Adornee = Workspace

        sheriffTracerConn = RunService.RenderStepped:Connect(function()
            local s = GetSheriff()
            if s and s.Character and s.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local myPos = LocalPlayer.Character.HumanoidRootPart.Position
                local sPos = s.Character.HumanoidRootPart.Position
                sheriffTracerAdornment.Parent = Workspace
                sheriffTracerAdornment.CFrame = CFrame.lookAt(myPos, sPos)
                sheriffTracerAdornment.Length = (sPos - myPos).Magnitude
            else
                sheriffTracerAdornment.Length = 0
            end
        end)
        table.insert(activeCleanups, function() if sheriffTracerConn then sheriffTracerConn:Disconnect() end if sheriffTracerAdornment then sheriffTracerAdornment:Destroy() end end)
    else
        if sheriffTracerConn then sheriffTracerConn:Disconnect() end
        if sheriffTracerAdornment then sheriffTracerAdornment:Destroy() end
    end
end)

local nameTags = {}
visualsPage:AddToggle("Name", false, function(state)
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
                lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                lbl.TextSize = 11
                lbl.Font = Enum.Font.GothamBold
                lbl.Parent = bb
                table.insert(nameTags, bb)
            end
        end
    else
        for _, tag in ipairs(nameTags) do if tag then tag:Destroy() end end
        nameTags = {}
    end
end)

local originalAmbient = Lighting.Ambient
visualsPage:AddToggle("Fullbright", false, function(state)
    Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or originalAmbient
end)

local origFogEnd = Lighting.FogEnd
visualsPage:AddToggle("No Fog", false, function(state)
    Lighting.FogEnd = state and 9e9 or origFogEnd
end)

local crosshairFrame = nil
visualsPage:AddToggle("Screen Crosshair", false, function(state)
    if state then
        if not crosshairFrame then
            crosshairFrame = Instance.new("Frame")
            crosshairFrame.Size = UDim2.new(0, 6, 0, 6)
            crosshairFrame.Position = UDim2.new(0.5, -3, 0.5, -3)
            crosshairFrame.BackgroundColor3 = Color3.fromRGB(108, 92, 231)
            crosshairFrame.BorderSizePixel = 0
            crosshairFrame.Parent = ScreenGui
            local crCorner = Instance.new("UICorner")
            crCorner.CornerRadius = UDim.new(1, 0)
            crCorner.Parent = crosshairFrame
        end
        crosshairFrame.Visible = true
    else
        if crosshairFrame then crosshairFrame.Visible = false end
    end
end)

local coinHighlights = {}
local coinEspConn = nil

local function applyCoinESP(v)
    if (v.Name == "CoinVisual" or v.Name == "Coin" or v.Name == "CoinServer" or v.Name == "DroppedCoin") then
        local target = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart")
        if target and not target:FindFirstChild("CoinHighlight") then
            local hl = Instance.new("Highlight")
            hl.Name = "CoinHighlight"
            hl.FillColor = Color3.fromRGB(255, 215, 0)
            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
            hl.Parent = target
            table.insert(coinHighlights, hl)
        end
    end
end

visualsPage:AddToggle("Coin ESP", false, function(state)
    if state then
        local container = FindCoinContainer()
        for _, v in ipairs(container:GetDescendants()) do applyCoinESP(v) end
        coinEspConn = container.DescendantAdded:Connect(function(v)
            task.wait(0.05)
            applyCoinESP(v)
        end)
        table.insert(activeCleanups, function() if coinEspConn then coinEspConn:Disconnect() end end)
    else
        if coinEspConn then coinEspConn:Disconnect() coinEspConn = nil end
        for _, hl in ipairs(coinHighlights) do
            if hl and hl.Parent then hl:Destroy() end
        end
        coinHighlights = {}
    end
end)

local alertLoop = nil
visualsPage:AddToggle("Murderer Proximity Alert", false, function(state)
    if state then
        alertLoop = task.spawn(function()
            while true do
                local m = GetMurderer()
                if m and m ~= LocalPlayer and m.Character and m.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - m.Character.HumanoidRootPart.Position).Magnitude
                    if dist <= 25 then
                        Title.Text = "<font color='#FF0033'>DANGER: MURDERER!</font>"
                    else
                        Title.Text = "Thoriumlib <font color='#6C5CE7'>v2.0</font>"
                    end
                end
                task.wait(0.3)
            end
        end)
        table.insert(activeCleanups, function() if alertLoop then task.cancel(alertLoop) end end)
    else
        if alertLoop then task.cancel(alertLoop) end
        Title.Text = "Thoriumlib <font color='#6C5CE7'>v2.0</font>"
    end
end)

local rainbowLoop = nil
visualsPage:AddToggle("Rainbow Held Tool", false, function(state)
    if state then
        rainbowLoop = task.spawn(function()
            local hue = 0
            while true do
                hue = (hue + 0.01) % 1
                local color = Color3.fromHSV(hue, 1, 1)
                if LocalPlayer.Character then
                    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then
                        for _, part in ipairs(tool:GetDescendants()) do
                            if part:IsA("BasePart") or part:IsA("MeshPart") then part.Color = color end
                        end
                    end
                end
                task.wait(0.03)
            end
        end)
        table.insert(activeCleanups, function() if rainbowLoop then task.cancel(rainbowLoop) end end)
    else
        if rainbowLoop then task.cancel(rainbowLoop) end
    end
end)

local currentWalkSpeed = 16
local currentJumpPower = 50

local renderSteppedConn = RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum.WalkSpeed ~= currentWalkSpeed then hum.WalkSpeed = currentWalkSpeed end
        if hum.JumpPower ~= currentJumpPower then hum.UseJumpPower = true hum.JumpPower = currentJumpPower end
    end
end)
table.insert(activeCleanups, function() renderSteppedConn:Disconnect() end)

movementPage:AddSlider("Walk Speed", 16, 120, 16, function(val) currentWalkSpeed = val end)
movementPage:AddSlider("Jump Power", 50, 250, 50, function(val) currentJumpPower = val end)

local flying = false
local flySpeed = 60
movementPage:AddToggle("Fly Mode", false, true, function(state)
    flying = state
    if flying then
        task.spawn(function()
            while flying do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    local hrp = LocalPlayer.Character.HumanoidRootPart
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    hum.PlatformStand = true

                    local cam = Workspace.CurrentCamera
                    local moveDir = Vector3.zero

                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += cam.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= cam.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= cam.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += cam.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir += Vector3.new(0, 1, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir -= Vector3.new(0, 1, 0) end

                    if moveDir.Magnitude > 0 then
                        hrp.AssemblyLinearVelocity = moveDir.Unit * flySpeed
                    else
                        hrp.AssemblyLinearVelocity = Vector3.zero
                    end
                end
                task.wait()
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
            end
        end)
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
        end
    end
end)

local noclip = false
local noclipConn = nil
movementPage:AddToggle("Noclip", false, true, function(state)
    noclip = state
    if noclip then
        noclipConn = RunService.Stepped:Connect(function()
            if noclip and LocalPlayer.Character then
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

local bhopConnection = nil
movementPage:AddToggle("Bunny Hop", false, function(state)
    if state then
        bhopConnection = RunService.RenderStepped:Connect(function()
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        table.insert(activeCleanups, function() if bhopConnection then bhopConnection:Disconnect() end end)
    else
        if bhopConnection then bhopConnection:Disconnect() end
    end
end)

local infJumpConnection = nil
movementPage:AddToggle("Infinite Jump", false, function(state)
    if state then
        infJumpConnection = UserInputService.JumpRequest:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        table.insert(activeCleanups, function() if infJumpConnection then infJumpConnection:Disconnect() end end)
    else
        if infJumpConnection then infJumpConnection:Disconnect() infJumpConnection = nil end
    end
end)

local spinConnection = nil
movementPage:AddToggle("Spinbot", false, true, function(state)
    if state then
        spinConnection = RunService.RenderStepped:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(30), 0)
            end
        end)
        table.insert(activeCleanups, function() if spinConnection then spinConnection:Disconnect() end end)
    else
        if spinConnection then spinConnection:Disconnect() end
    end
end)

local originalGravity = Workspace.Gravity
movementPage:AddToggle("Low Gravity (Moon)", false, function(state)
    Workspace.Gravity = state and 35 or originalGravity
end)

local fakeLagLoop = nil
movementPage:AddToggle("Fake Lag / Desync", false, true, function(state)
    if state then
        fakeLagLoop = task.spawn(function()
            while true do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    task.wait(0.15)
                    LocalPlayer.Character.HumanoidRootPart.Anchored = false
                end
                task.wait(0.2)
            end
        end)
        table.insert(activeCleanups, function() if fakeLagLoop then task.cancel(fakeLagLoop) end end)
    else
        if fakeLagLoop then task.cancel(fakeLagLoop) end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end
    end
end)

movementPage:AddToggle("Ghost Mode (Semi-Invis)", false, function(state)
    if LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = state and 0.7 or 0
            end
        end
    end
end)

teleportsPage:AddButton("TP to Murderer", function()
    local m = GetMurderer()
    if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = m.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
    end
end)

teleportsPage:AddButton("TP to Sheriff", function()
    local s = GetSheriff()
    if s and s.Character and s.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = s.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
    end
end)

teleportsPage:AddButton("Fling Murderer", function()
    local m = GetMurderer()
    if m then FlingTarget(m) end
end)

teleportsPage:AddButton("Fling Sheriff", function()
    local s = GetSheriff()
    if s then FlingTarget(s) end
end)

teleportsPage:AddButton("Fling Random Innocent", function()
    local innocents = GetInnocents()
    if #innocents > 0 then
        local randomInnocent = innocents[math.random(1, #innocents)]
        FlingTarget(randomInnocent)
    end
end)

teleportsPage:AddButton("Stop All Flings / Reset Physics", function()
    StopAllFlings()
end)

teleportsPage:AddButton("TP to Dropped Gun", function()
    local gunDrop = Workspace:FindFirstChild("GunDrop", true)
    if gunDrop and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = gunDrop.CFrame
    end
end)

teleportsPage:AddButton("TP to Lobby", function()
    local lobby = Workspace:FindFirstChild("Lobby") or Workspace:FindFirstChild("SpawnLocation", true)
    if lobby and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = lobby:GetPivot() + Vector3.new(0, 5, 0)
    end
end)

teleportsPage:AddButton("TP Above Map (Safe)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 80, 0)
    end
end)

local clickTpConnection = nil
teleportsPage:AddToggle("Click TP (Ctrl + Click)", false, true, function(state)
    if state then
        clickTpConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                    if Mouse and Mouse.Hit and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 3, 0))
                    end
                end
            end
        end)
        table.insert(activeCleanups, function() if clickTpConnection then clickTpConnection:Disconnect() end end)
    else
        if clickTpConnection then clickTpConnection:Disconnect() end
    end
end)

automationPage:AddButton("FPS Booster", function()
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") then
            v.Enabled = false
        end
    end
    Lighting.GlobalShadows = false
end)

local muteLoop = nil
automationPage:AddToggle("Mute All Radios", false, function(state)
    if state then
        muteLoop = RunService.RenderStepped:Connect(function()
            for _, sound in ipairs(Workspace:GetDescendants()) do
                if sound:IsA("Sound") and sound.Name ~= "Shoot" then sound.Volume = 0 end
            end
        end)
        table.insert(activeCleanups, function() if muteLoop then muteLoop:Disconnect() end end)
    else
        if muteLoop then muteLoop:Disconnect() end
    end
end)

local xrayEnabled = false
automationPage:AddToggle("Wall X-Ray", false, function(state)
    xrayEnabled = state
    for _, part in ipairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Parent:FindFirstChild("Humanoid") then
            part.LocalTransparencyModifier = xrayEnabled and 0.5 or 0
        end
    end
end)

local autoRejoinConn = nil
automationPage:AddToggle("Auto Rejoin on Error", false, function(state)
    if state then
        autoRejoinConn = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
            if child.Name == "ErrorPrompt" then
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end
        end)
        table.insert(activeCleanups, function() if autoRejoinConn then autoRejoinConn:Disconnect() end end)
    else
        if autoRejoinConn then autoRejoinConn:Disconnect() end
    end
end)

automationPage:AddButton("Give Client Fake Knife", function()
    if LocalPlayer.Backpack then
        local fakeKnife = Instance.new("Tool")
        fakeKnife.Name = "Fake Knife"
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 3, 1)
        handle.Color = Color3.fromRGB(255, 0, 0)
        handle.Parent = fakeKnife
        fakeKnife.Parent = LocalPlayer.Backpack
    end
end)

automationPage:AddButton("Destroy Map Traps / Hazards", function()
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v.Name:lower():find("trap") or v.Name:lower():find("hazard") then
            v:Destroy()
        end
    end
end)

local antiStunConn = nil
automationPage:AddToggle("Anti-Stun / Freeze Bypass", false, function(state)
    if state then
        antiStunConn = RunService.RenderStepped:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum.PlatformStand then hum.PlatformStand = false end
            end
        end)
        table.insert(activeCleanups, function() if antiStunConn then antiStunConn:Disconnect() end end)
    else
        if antiStunConn then antiStunConn:Disconnect() end
    end
end)

miscPage:AddToggle("Trusted Mode", false, function(state) UpdateModeStatus(state) end)

miscPage:AddToggle("Anti-Fling (Protect Yourself)", false, true, function(state) ToggleAntiFling(state) end)

local autoClickerLoop = nil
miscPage:AddToggle("Auto Clicker", false, function(state)
    if state then
        autoClickerLoop = task.spawn(function()
            while true do
                mouse1click()
                task.wait(0.02)
            end
        end)
        table.insert(activeCleanups, function() if autoClickerLoop then task.cancel(autoClickerLoop) end end)
    else
        if autoClickerLoop then task.cancel(autoClickerLoop) end
    end
end)

local antiAfkConnection = nil
miscPage:AddToggle("Anti-AFK Disconnect", false, function(state)
    if state then
        antiAfkConnection = LocalPlayer.Idled:Connect(function()
            VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        end)
        table.insert(activeCleanups, function() if antiAfkConnection then antiAfkConnection:Disconnect() end end)
    else
        if antiAfkConnection then antiAfkConnection:Disconnect() end
    end
end)

miscPage:AddSlider("Camera FOV", 70, 120, 70, function(val)
    Workspace.CurrentCamera.FieldOfView = val
end)

miscPage:AddButton("Copy Job ID to Clipboard", function()
    if setclipboard then setclipboard(tostring(game.JobId)) end
end)

miscPage:AddButton("Server Hop", function()
    local api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local successRes, result = pcall(function() return HttpService:JSONDecode(game:HttpGet(api)) end)
    if successRes and result and result.data then
        for _, server in ipairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                break
            end
        end
    end
end)

miscPage:AddSlider("UI Transparency", 20, 80, 25, function(val)
    local alpha = val / 100
    MainFrame.BackgroundTransparency = alpha
    Sidebar.BackgroundTransparency = alpha + 0.15
end)

miscPage:AddButton("Reset Window Position", function()
    MainFrame.Position = UDim2.new(0.5, -370, 0.5, -230)
end)

local spammerLoop = nil
miscPage:AddToggle("Chat Spammer", false, function(state)
    if state then
        spammerLoop = task.spawn(function()
            while true do
                ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("CAT HUB", "All")
                task.wait(3)
            end
        end)
        table.insert(activeCleanups, function() if spammerLoop then task.cancel(spammerLoop) end end)
    else
        if spammerLoop then task.cancel(spammerLoop) end
    end
end)

miscPage:AddSlider("Max Camera Zoom", 12.8, 250, 12.8, function(val)
    LocalPlayer.CameraMaxZoomDistance = val
end)

local keybindBtnObj
keybindBtnObj = miscPage:AddButton("Keybind: [K] (Click to change)", function(btnRef)
    isListeningForKey = true
    btnRef.Text = "Press ANY key on keyboard..."
    
    task.spawn(function()
        while isListeningForKey do task.wait(0.1) end
        btnRef.Text = "Keybind: [" .. toggleKey.Name .. "] (Click to change)"
    end)
end)

miscPage:AddButton("Unload Cheats", function()
    if getgenv().CATHUB_Cleanup then
        getgenv().CATHUB_Cleanup()
    end
end)

-- ==========================================
-- EXTRA PAGE (Скайбокс, Время суток, Гамма)
-- ==========================================

local customSky = nil
extraPage:AddToggle("Skybox Changer", false, function(state)
    if state then
        if not customSky then
            customSky = Instance.new("Sky")
            customSky.Name = "CATHUBSky"
            customSky.SkyboxBk = "rbxassetid://159454299"
            customSky.SkyboxDn = "rbxassetid://159454296"
            customSky.SkyboxFt = "rbxassetid://159454293"
            customSky.SkyboxLf = "rbxassetid://159454286"
            customSky.SkyboxRt = "rbxassetid://159454300"
            customSky.SkyboxUp = "rbxassetid://159454288"
            customSky.Parent = Lighting
        end
    else
        if customSky then 
            customSky:Destroy() 
            customSky = nil 
        end
    end
end)
table.insert(activeCleanups, function()
    if customSky then customSky:Destroy() end
end)

local originalTime = Lighting.ClockTime
extraPage:AddSlider("Time of Day", 0, 24, math.floor(originalTime), function(val)
    Lighting.ClockTime = val
end)
table.insert(activeCleanups, function()
    Lighting.ClockTime = originalTime
end)

local gammaEffect = nil
extraPage:AddToggle("Gamma Mode", false, function(state)
    if state then
        if not gammaEffect then
            gammaEffect = Instance.new("ColorCorrectionEffect")
            gammaEffect.Name = "CATHUBGamma"
            gammaEffect.Brightness = 0.2
            gammaEffect.Contrast = 0.2
            gammaEffect.Saturation = 0.5
            gammaEffect.Parent = Lighting
        end
    else
        if gammaEffect then 
            gammaEffect:Destroy() 
            gammaEffect = nil 
        end
    end
end)
table.insert(activeCleanups, function()
    if gammaEffect then gammaEffect:Destroy() end
end)

-- ДОБАВЛЕННЫЕ ФУНКЦИИ (Astral Steps & Synthwave Matrix) --

local astralStepsLoop = nil
extraPage:AddToggle("Astral Steps (Звездные Следы)", false, function(state)
    if state then
        astralStepsLoop = task.spawn(function()
            local lastStepPos = Vector3.new()
            while true do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    local hrp = LocalPlayer.Character.HumanoidRootPart
                    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    
                    if hum.Health > 0 and hum.MoveDirection.Magnitude > 0 then
                        local pos = hrp.Position
                        if (Vector3.new(pos.X, 0, pos.Z) - Vector3.new(lastStepPos.X, 0, lastStepPos.Z)).Magnitude >= 3.5 then
                            lastStepPos = pos
                            
                            local step = Instance.new("Part")
                            step.Size = Vector3.new(3, 0.1, 3)
                            step.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
                            step.Anchored = true
                            step.CanCollide = false
                            step.Material = Enum.Material.Neon
                            
                            if math.random() > 0.5 then
                                step.Color = Color3.fromRGB(0, 200, 255)
                            else
                                step.Color = Color3.fromRGB(150, 0, 255)
                            end
                            
                            local cyl = Instance.new("CylinderMesh")
                            cyl.Parent = step
                            
                            step.Parent = Workspace
                            
                            local fadeTween = TweenService:Create(step, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 1, Size = Vector3.new(1, 0.1, 1)})
                            fadeTween:Play()
                            
                            fadeTween.Completed:Connect(function()
                                step:Destroy()
                            end)
                        end
                    end
                end
                task.wait(0.05)
            end
        end)
        table.insert(activeCleanups, function() if astralStepsLoop then task.cancel(astralStepsLoop) end end)
    else
        if astralStepsLoop then 
            task.cancel(astralStepsLoop) 
            astralStepsLoop = nil 
        end
    end
end)

local synthwaveEnabled = false
local originalProps = {}
local synthwaveConn = nil

local function applySynthwave(part)
    if not part:IsA("BasePart") or (part.Parent and part.Parent:FindFirstChildOfClass("Humanoid")) then return end
    if not originalProps[part] then
        originalProps[part] = {
            Material = part.Material,
            Color = part.Color
        }
    end
    part.Material = Enum.Material.Neon
    part.Color = math.random() > 0.5 and Color3.fromRGB(30, 0, 60) or Color3.fromRGB(0, 100, 200)
end

extraPage:AddToggle("Synthwave Matrix (Неоновый Мир)", false, function(state)
    synthwaveEnabled = state
    if state then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                applySynthwave(obj)
            elseif obj:IsA("Texture") or obj:IsA("Decal") then
                if not originalProps[obj] then
                    originalProps[obj] = { Transparency = obj.Transparency }
                end
                obj.Transparency = 1
            end
        end
        
        synthwaveConn = Workspace.DescendantAdded:Connect(function(child)
            if synthwaveEnabled then
                task.wait(0.1)
                if child:IsA("BasePart") then
                    applySynthwave(child)
                elseif child:IsA("Texture") or child:IsA("Decal") then
                    if not originalProps[child] then
                        originalProps[child] = { Transparency = child.Transparency }
                    end
                    child.Transparency = 1
                end
            end
        end)
        table.insert(activeCleanups, function() if synthwaveConn then synthwaveConn:Disconnect() end end)
    else
        if synthwaveConn then 
            synthwaveConn:Disconnect() 
            synthwaveConn = nil 
        end
        for obj, props in pairs(originalProps) do
            if obj and obj.Parent then
                if obj:IsA("BasePart") then
                    obj.Material = props.Material
                    obj.Color = props.Color
                elseif obj:IsA("Texture") or obj:IsA("Decal") then
                    obj.Transparency = props.Transparency
                end
            end
        end
        originalProps = {}
    end
end)
table.insert(activeCleanups, function()
    synthwaveEnabled = false
    if synthwaveConn then synthwaveConn:Disconnect() end
    for obj, props in pairs(originalProps) do
        if obj and obj.Parent then
            if obj:IsA("BasePart") then
                obj.Material = props.Material
                obj.Color = props.Color
            elseif obj:IsA("Texture") or obj:IsA("Decal") then
                obj.Transparency = props.Transparency
            end
        end
    end
    originalProps = {}
end)

-- (Cyber Twilight, Starlight Fog, Aether Rain, Eclipse Light, Cloud Drift) --

local backupClockTime = Lighting.ClockTime
local backupColorShift = Lighting.ColorShift_Top
local backupOutdoorAmb = Lighting.OutdoorAmbient
local cyberTwilightLoop = nil
extraPage:AddToggle("Cyber Twilight", false, function(state)
    if state then
        cyberTwilightLoop = RunService.RenderStepped:Connect(function()
            Lighting.ClockTime = 17.5
        end)
        Lighting.ColorShift_Top = Color3.fromRGB(255, 120, 160)
        Lighting.OutdoorAmbient = Color3.fromRGB(110, 50, 130)
    else
        if cyberTwilightLoop then cyberTwilightLoop:Disconnect() cyberTwilightLoop = nil end
        Lighting.ClockTime = backupClockTime
        Lighting.ColorShift_Top = backupColorShift
        Lighting.OutdoorAmbient = backupOutdoorAmb
    end
end)
table.insert(activeCleanups, function()
    if cyberTwilightLoop then cyberTwilightLoop:Disconnect() end
    Lighting.ClockTime = backupClockTime
    Lighting.ColorShift_Top = backupColorShift
    Lighting.OutdoorAmbient = backupOutdoorAmb
end)

local backupFogColor = Lighting.FogColor
local backupFogStart = Lighting.FogStart
local backupFogEnd = Lighting.FogEnd
extraPage:AddToggle("Starlight Fog", false, function(state)
    if state then
        Lighting.FogColor = Color3.fromRGB(15, 10, 50)
        Lighting.FogStart = 40
        Lighting.FogEnd = 450
    else
        Lighting.FogColor = backupFogColor
        Lighting.FogStart = backupFogStart
        Lighting.FogEnd = backupFogEnd
    end
end)
table.insert(activeCleanups, function()
    Lighting.FogColor = backupFogColor
    Lighting.FogStart = backupFogStart
    Lighting.FogEnd = backupFogEnd
end)

local aetherRainPart = nil
extraPage:AddToggle("Aether Rain", false, function(state)
    if state then
        if not aetherRainPart then
            aetherRainPart = Instance.new("Part")
            aetherRainPart.Name = "ThoriumAetherRain"
            aetherRainPart.Anchored = true
            aetherRainPart.CanCollide = false
            aetherRainPart.Transparency = 1
            aetherRainPart.Size = Vector3.new(120, 2, 120)
            
            local pe = Instance.new("ParticleEmitter")
            pe.Name = "RainDrops"
            pe.Color = ColorSequence.new(Color3.fromRGB(100, 200, 255))
            pe.Size = NumberSequence.new(0.06, 0.06)
            pe.EmissionDirection = Enum.NormalId.Bottom
            pe.Lifetime = NumberRange.new(2, 3)
            pe.Rate = 250
            pe.Speed = NumberRange.new(45, 55)
            pe.SpreadAngle = Vector2.new(2, 2)
            pe.LightEmission = 1
            pe.Parent = aetherRainPart
            aetherRainPart.Parent = Workspace
        end
        
        task.spawn(function()
            while aetherRainPart and aetherRainPart.Parent do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    aetherRainPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                end
                task.wait(0.1)
            end
        end)
    else
        if aetherRainPart then
            aetherRainPart:Destroy()
            aetherRainPart = nil
        end
    end
end)
table.insert(activeCleanups, function()
    if aetherRainPart then aetherRainPart:Destroy() aetherRainPart = nil end
end)

local backupBrightness = Lighting.Brightness
local backupAmbientEclipse = Lighting.Ambient
local backupGlobalShadows = Lighting.GlobalShadows
local backupExposure = Lighting.ExposureCompensation
extraPage:AddToggle("Eclipse Light", false, function(state)
    if state then
        Lighting.Brightness = 0.3
        Lighting.Ambient = Color3.fromRGB(10, 10, 15)
        Lighting.ExposureCompensation = -0.5
        Lighting.GlobalShadows = true
    else
        Lighting.Brightness = backupBrightness
        Lighting.Ambient = backupAmbientEclipse
        Lighting.ExposureCompensation = backupExposure
        Lighting.GlobalShadows = backupGlobalShadows
    end
end)
table.insert(activeCleanups, function()
    Lighting.Brightness = backupBrightness
    Lighting.Ambient = backupAmbientEclipse
    Lighting.ExposureCompensation = backupExposure
    Lighting.GlobalShadows = backupGlobalShadows
end)

local customDriftClouds = nil
extraPage:AddToggle("Cloud Drift", false, function(state)
    if state then
        if not customDriftClouds then
            customDriftClouds = Instance.new("Clouds")
            customDriftClouds.Name = "ThoriumDriftClouds"
            customDriftClouds.Cover = 0.65
            customDriftClouds.Density = 0.4
            customDriftClouds.Color = Color3.fromRGB(220, 190, 255)
            customDriftClouds.Parent = Workspace.Terrain
            
            task.spawn(function()
                local phase = 0
                while customDriftClouds and customDriftClouds.Parent do
                    phase = phase + 0.001
                    customDriftClouds.Cover = 0.60 + (math.sin(phase) * 0.1)
                    task.wait(0.1)
                end
            end)
        end
    else
        if customDriftClouds then
            customDriftClouds:Destroy()
            customDriftClouds = nil
        end
    end
end)
table.insert(activeCleanups, function()
    if customDriftClouds then customDriftClouds:Destroy() customDriftClouds = nil end
end)
