local targetPlaceId = 142823291

if game.PlaceId ~= targetPlaceId then game.StarterGui:SetCore("SendNotification", { Title = "CAT HUB"; Text = "You are not in the correct game! (Murder Mystery 2)\nPlease join Murder Mystery 2 to use this script!"; Duration = 5; }) return end

local EUGENE = loadstring(game:HttpGet("https://diser.me/EUGENE/library/ui-library.lua"))()

local Window = EUGENE.new("CAT HUB", "https://rscripts.net/@EUGENE")

-- Slightly reduce the CAT HUB GUI size
task.defer(function()
    task.wait(0.25)
    local function addSmallScale(root)
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("TextLabel") and obj.Text == "CAT HUB" then
                local gui = obj:FindFirstAncestorOfClass("ScreenGui")
                if gui and not gui:FindFirstChild("CAT_HUB_UIScale") then
                    local scale = Instance.new("UIScale")
                    scale.Name = "CAT_HUB_UIScale"
                    scale.Scale = 0.90
                    scale.Parent = gui
                    return true
                end
            end
        end
        return false
    end

    if not addSmallScale(game:GetService("CoreGui")) then
        addSmallScale(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
    end
end)

local Flags = { MurdererESP = true, SheriffESP = true, InnocentESP = true, SelfESP = false, }

local VisualsTab = Window:AddTab("Visuals", "Player highlights", "lucide-eye")

VisualsTab:AddSection("Outlines")

VisualsTab:AddToggle("Murderer", false, function(state) Flags.MurdererESP = state end, "MurdererESP")

VisualsTab:AddToggle("Sheriff", false, function(state) Flags.SheriffESP = state end, "SheriffESP")

VisualsTab:AddToggle("Innocent", false, function(state) Flags.InnocentESP = state end, "InnocentESP")

local SettingsTab = Window:AddTab("Settings", "Menu Settings", "lucide-settings") SettingsTab:AddSection("Self Highlight") SettingsTab:AddToggle("Self", false, function(state) Flags.SelfESP = state end, "SelfESP")

SettingsTab:AddSection("Theme Selection") local ThemeNames = {"Cosmos", "Aurora", "Obsidian", "Sunset"} SettingsTab:AddSelector("Menu Theme", ThemeNames, 1, function(index, value) Window:SetTheme(value) end, "Theme")

Window:AddConfigTab("CAT-HUB-Library/configs", Flags)

local CreditsTab = Window:AddTab("Credits", "Information", "lucide-heart") CreditsTab:AddSection("Made by catjack.gg") CreditsTab:AddButton("Copy Credits", function() setclipboard("catjack.gg") Window:Notify("Credits copied!", 3.5) end) CreditsTab:AddSection("CAT HUB UI Library") CreditsTab:AddButton("Copy UI Library", function() setclipboard("https://diser.me/EUGENE/library/") Window:Notify("UI Library copied!", 3.5) end) local highlights = {}

local function createHighlight(player, color) local char = player.Character if not char then return end

if highlights[player] then
    highlights[player]:Destroy()
end

local highlight = Instance.new("Highlight")
highlight.FillColor = color
highlight.OutlineColor = color
highlight.FillTransparency = 0
highlight.OutlineTransparency = 0
highlight.Parent = char
highlights[player] = highlight
end

local function removeHighlight(player) if highlights[player] then highlights[player]:Destroy() highlights[player] = nil end end

local function getRole(player) if not player.Character then return nil end

local hasKnife = false
local hasGun = false

local backpack = player:FindFirstChild("Backpack")
if backpack then
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local name = tool.Name:lower()
            if name:find("knife") or name:find("murderer") then 
                hasKnife = true 
            end
            if name:find("gun") or name:find("revolver") or name:find("sheriff") then 
                hasGun = true 
            end
        end
    end
end

local charTool = player.Character:FindFirstChildOfClass("Tool")
if charTool then
    local name = charTool.Name:lower()
    if name:find("knife") or name:find("murderer") then 
        hasKnife = true 
    end
    if name:find("gun") or name:find("revolver") or name:find("sheriff") then 
        hasGun = true 
    end
end

if hasKnife then return "Murderer" end
if hasGun then return "Sheriff" end
return "Innocent"
end

local function updateESP() for _, player in ipairs(game.Players:GetPlayers()) do if player == game.Players.LocalPlayer and not Flags.SelfESP then continue end

    local role = getRole(player)
    
    if Flags.MurdererESP and role == "Murderer" then
        createHighlight(player, Color3.fromRGB(255, 0, 0))
    elseif Flags.SheriffESP and role == "Sheriff" then
        createHighlight(player, Color3.fromRGB(0, 0, 255))
    elseif Flags.InnocentESP and role == "Innocent" then
        createHighlight(player, Color3.fromRGB(0, 255, 0))
    else
        removeHighlight(player)
    end
end
end

local function cleanupESP() for player, hl in pairs(highlights) do if hl then hl:Destroy() end end highlights = {} end

game:GetService("RunService").RenderStepped:Connect(updateESP)

game.Players.PlayerRemoving:Connect(function(player) removeHighlight(player) end)

for _, player in ipairs(game.Players:GetPlayers()) do if player ~= game.Players.LocalPlayer then player.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end) end end

game.Players.PlayerAdded:Connect(function(player) if player ~= game.Players.LocalPlayer then player.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end) end end)

game.Players.LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end)local targetPlaceId = 142823291

if game.PlaceId ~= targetPlaceId then game.StarterGui:SetCore("SendNotification", { Title = "CAT HUB"; Text = "You are not in the correct game! (Murder Mystery 2)\nPlease join Murder Mystery 2 to use this script!"; Duration = 5; }) return end

local EUGENE = loadstring(game:HttpGet("https://diser.me/EUGENE/library/ui-library.lua"))()

local Window = EUGENE.new("CAT HUB", "https://rscripts.net/@EUGENE")

local Flags = { MurdererESP = true, SheriffESP = true, InnocentESP = true, SelfESP = false, }

local VisualsTab = Window:AddTab("Visuals", "Player highlights", "lucide-eye")

VisualsTab:AddSection("Outlines")

VisualsTab:AddToggle("Murderer", false, function(state) Flags.MurdererESP = state end, "MurdererESP")

VisualsTab:AddToggle("Sheriff", false, function(state) Flags.SheriffESP = state end, "SheriffESP")

VisualsTab:AddToggle("Innocent", false, function(state) Flags.InnocentESP = state end, "InnocentESP")

local SettingsTab = Window:AddTab("Settings", "Menu Settings", "lucide-settings") SettingsTab:AddSection("Self Highlight") SettingsTab:AddToggle("Self", false, function(state) Flags.SelfESP = state end, "SelfESP")

SettingsTab:AddSection("Theme Selection") local ThemeNames = {"Cosmos", "Aurora", "Obsidian", "Sunset"} SettingsTab:AddSelector("Menu Theme", ThemeNames, 1, function(index, value) Window:SetTheme(value) end, "Theme")

Window:AddConfigTab("CAT-HUB-Library/configs", Flags)

local CreditsTab = Window:AddTab("Credits", "Information", "lucide-heart") CreditsTab:AddSection("Made by catjack.gg") CreditsTab:AddButton("Copy Credits", function() setclipboard("catjack.gg") Window:Notify("Credits copied!", 3.5) end) CreditsTab:AddSection("CAT HUB UI Library") CreditsTab:AddButton("Copy UI Library", function() setclipboard("https://diser.me/EUGENE/library/") Window:Notify("UI Library copied!", 3.5) end) local highlights = {}

local function createHighlight(player, color) local char = player.Character if not char then return end

if highlights[player] then
    highlights[player]:Destroy()
end

local highlight = Instance.new("Highlight")
highlight.FillColor = color
highlight.OutlineColor = color
highlight.FillTransparency = 0
highlight.OutlineTransparency = 0
highlight.Parent = char
highlights[player] = highlight
end

local function removeHighlight(player) if highlights[player] then highlights[player]:Destroy() highlights[player] = nil end end

local function getRole(player) if not player.Character then return nil end

local hasKnife = false
local hasGun = false

local backpack = player:FindFirstChild("Backpack")
if backpack then
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local name = tool.Name:lower()
            if name:find("knife") or name:find("murderer") then 
                hasKnife = true 
            end
            if name:find("gun") or name:find("revolver") or name:find("sheriff") then 
                hasGun = true 
            end
        end
    end
end

local charTool = player.Character:FindFirstChildOfClass("Tool")
if charTool then
    local name = charTool.Name:lower()
    if name:find("knife") or name:find("murderer") then 
        hasKnife = true 
    end
    if name:find("gun") or name:find("revolver") or name:find("sheriff") then 
        hasGun = true 
    end
end

if hasKnife then return "Murderer" end
if hasGun then return "Sheriff" end
return "Innocent"
end

local function updateESP() for _, player in ipairs(game.Players:GetPlayers()) do if player == game.Players.LocalPlayer and not Flags.SelfESP then continue end

    local role = getRole(player)
    
    if Flags.MurdererESP and role == "Murderer" then
        createHighlight(player, Color3.fromRGB(255, 0, 0))
    elseif Flags.SheriffESP and role == "Sheriff" then
        createHighlight(player, Color3.fromRGB(0, 0, 255))
    elseif Flags.InnocentESP and role == "Innocent" then
        createHighlight(player, Color3.fromRGB(0, 255, 0))
    else
        removeHighlight(player)
    end
end
end

local function cleanupESP() for player, hl in pairs(highlights) do if hl then hl:Destroy() end end highlights = {} end

game:GetService("RunService").RenderStepped:Connect(updateESP)

game.Players.PlayerRemoving:Connect(function(player) removeHighlight(player) end)

for _, player in ipairs(game.Players:GetPlayers()) do if player ~= game.Players.LocalPlayer then player.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end) end end

game.Players.PlayerAdded:Connect(function(player) if player ~= game.Players.LocalPlayer then player.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end) end end)

game.Players.LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end)

-- CAT HUB hide/show logo
local CAT_HUB_TOGGLE_GUI = Instance.new("ScreenGui")
CAT_HUB_TOGGLE_GUI.Name = "CAT_HUB_Toggle"
CAT_HUB_TOGGLE_GUI.ResetOnSpawn = false
CAT_HUB_TOGGLE_GUI.Parent = game:GetService("CoreGui")

local CAT_HUB_TOGGLE = Instance.new("ImageButton")
CAT_HUB_TOGGLE.Name = "HideShowLogo"
CAT_HUB_TOGGLE.Size = UDim2.new(0, 52, 0, 52)
CAT_HUB_TOGGLE.Position = UDim2.new(0, 20, 0.5, -26)
CAT_HUB_TOGGLE.BackgroundTransparency = 1
CAT_HUB_TOGGLE.Image = "rbxassetid://126031329785796"
CAT_HUB_TOGGLE.ScaleType = Enum.ScaleType.Fit
CAT_HUB_TOGGLE.ZIndex = 100
CAT_HUB_TOGGLE.Parent = CAT_HUB_TOGGLE_GUI

local CAT_HUB_WINDOWS = {}
for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
    if gui:IsA("ScreenGui") and gui ~= CAT_HUB_TOGGLE_GUI then
        local found = false
        for _, obj in ipairs(gui:GetDescendants()) do
            if (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then
                local text = tostring(obj.Text or ""):lower()
                if text:find("cat hub", 1, true) then
                    found = true
                    break
                end
            end
        end
        if found then
            table.insert(CAT_HUB_WINDOWS, gui)
        end
    end
end

local CAT_HUB_HIDDEN = false
CAT_HUB_TOGGLE.MouseButton1Click:Connect(function()
    CAT_HUB_HIDDEN = not CAT_HUB_HIDDEN
    for _, gui in ipairs(CAT_HUB_WINDOWS) do
        if gui and gui.Parent then
            gui.Enabled = not CAT_HUB_HIDDEN
        end
    end
end)
