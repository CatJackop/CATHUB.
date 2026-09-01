local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local playerHighlights = {}
local playerColors = {}
local PlayerData = {}

local DiscordInvite = "https://discord.gg/EYQ7XEMUpj"
local DiscordCode = "EYQ7XEMUpj"

request({
    Url = "http://127.0.0.1:6463/rpc?v=1",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json",
        Origin = "https://discord.com"
    },
    Body = HttpService:JSONEncode({
        cmd = "INVITE_BROWSER",
        nonce = HttpService:GenerateGUID(false),
        args = {code = DiscordCode}
    })
})

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DiscordPrompt"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- CAT logo hide/show button
local LogoGui = Instance.new("ScreenGui")
LogoGui.Name = "CATLogoToggle"
LogoGui.ResetOnSpawn = false
LogoGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local LogoButton = Instance.new("ImageButton")
LogoButton.Name = "LogoButton"
LogoButton.Size = UDim2.new(0, 60, 0, 60)
LogoButton.Position = UDim2.new(0, 15, 0.5, -30)
LogoButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LogoButton.BorderSizePixel = 0
LogoButton.Image = "rbxassetid://126031329785796"
LogoButton.ScaleType = Enum.ScaleType.Fit
LogoButton.Parent = LogoGui

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 12)
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(200, 0, 0)
LogoStroke.Thickness = 1
LogoStroke.Parent = LogoButton

LogoButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = not ScreenGui.Enabled
end)


local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 320, 0, 160)
Frame.Position = UDim2.new(0.5, -160, 0.5, -80)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(200, 0, 0)
Stroke.Thickness = 1
Stroke.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -20, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "CAT HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Frame

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Position = UDim2.new(1, -30, 0, 8)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = Frame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

local Message = Instance.new("TextLabel")
Message.Name = "Message"
Message.Size = UDim2.new(1, -40, 0, 40)
Message.Position = UDim2.new(0, 20, 0, 50)
Message.BackgroundTransparency = 1
Message.Text = "Join Discord server for full keyless menu!"
Message.TextColor3 = Color3.fromRGB(180, 180, 180)
Message.TextSize = 14
Message.Font = Enum.Font.Gotham
Message.TextWrapped = true
Message.Parent = Frame

local CopyButton = Instance.new("TextButton")
CopyButton.Name = "CopyButton"
CopyButton.Size = UDim2.new(0, 280, 0, 36)
CopyButton.Position = UDim2.new(0.5, -140, 0, 100)
CopyButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CopyButton.BorderSizePixel = 0
CopyButton.Text = "Copy Invite"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 16
CopyButton.Font = Enum.Font.GothamBold
CopyButton.Parent = Frame

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 6)
CopyCorner.Parent = CopyButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

CopyButton.MouseButton1Click:Connect(function()
    setclipboard(DiscordInvite)
    CopyButton.Text = "Copied!"
    task.wait(1.5)
    CopyButton.Text = "Copy Invite"
end)

local Event = ReplicatedStorage.Remotes.Gameplay.PlayerDataChanged
Event.OnClientEvent:Connect(function(data)
    PlayerData = data
end)

local function createESP(player, color)
    if not player.Character then return end
    
    if playerColors[player] == color then return end
    
    if playerHighlights[player] then
        playerHighlights[player]:Destroy()
        playerHighlights[player] = nil
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "ItemESP"
    highlight.FillTransparency = 1
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0
    highlight.Adornee = player.Character
    highlight.Parent = player.Character
    highlight.Enabled = true
    
    playerHighlights[player] = highlight
    playerColors[player] = color
end

local function removeESP(player)
    if playerHighlights[player] then
        playerHighlights[player]:Destroy()
        playerHighlights[player] = nil
        playerColors[player] = nil
    end
end

local function getPlayerRole(player)
    local playerData = PlayerData[player.Name]
    if playerData then
        return playerData.Role
    end
    return nil
end

Players.PlayerRemoving:Connect(removeESP)

Players.PlayerAdded:Connect(function(player)
    player.CharacterRemoving:Connect(function()
        removeESP(player)
    end)
end)

RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local role = getPlayerRole(player)
            
            if role == "Murderer" then
                createESP(player, Color3.fromRGB(255, 0, 0))
            elseif role == "Sheriff" then
                createESP(player, Color3.fromRGB(0, 0, 255))
            else
                removeESP(player)
            end
        end
    end
end)
