-- CTD Mobile GUI (Daily Reward + Tower Color)

local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "CTDHelperGui"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0, 100, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "CTD GUI"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

local DailyBtn = Instance.new("TextButton", Frame)
DailyBtn.Size = UDim2.new(1, -20, 0, 40)
DailyBtn.Position = UDim2.new(0, 10, 0, 40)
DailyBtn.Text = "Claim Daily"
DailyBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
DailyBtn.TextColor3 = Color3.new(1, 1, 1)
DailyBtn.Font = Enum.Font.GothamBold
DailyBtn.TextSize = 16

local ColorBtn = Instance.new("TextButton", Frame)
ColorBtn.Size = UDim2.new(1, -20, 0, 40)
ColorBtn.Position = UDim2.new(0, 10, 0, 90)
ColorBtn.Text = "Towers → Blue"
ColorBtn.BackgroundColor3 = Color3.fromRGB(100, 149, 237)
ColorBtn.TextColor3 = Color3.new(1, 1, 1)
ColorBtn.Font = Enum.Font.GothamBold
ColorBtn.TextSize = 16

DailyBtn.MouseButton1Click:Connect(function()
    local rf = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
    if rf and rf:FindFirstChild("Daily") then
        rf.Daily:FireServer()
        DailyBtn.Text = "Claimed!"
    else
        DailyBtn.Text = "No 'Daily' Remote"
    end
end)

ColorBtn.MouseButton1Click:Connect(function()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") and not obj:FindFirstChildOfClass("Humanoid") then
            for _, p in pairs(obj:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.BrickColor = BrickColor.new("Bright blue")
                end
            end
        end
    end
    ColorBtn.Text = "Blue Applied!"
end)
