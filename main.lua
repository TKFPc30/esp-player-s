local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- GUI Utama
local gui = Instance.new("ScreenGui")
gui.Name = "TKFPGui"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Frame Utama
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.5, -250, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 4
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Judul
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "TKFP Grid GUI"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)

-- Tombol Tutup
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)

-- Tombol Buka Kembali
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 100, 0, 30)
openBtn.Position = UDim2.new(0, 10, 1, -40)
openBtn.Text = "Buka TKFP"
openBtn.Font = Enum.Font.Gotham
openBtn.TextScaled = true
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
openBtn.Visible = false

-- Tween Show/Hide
local function tweenVisible(state)
if state then
frame.Visible = true
openBtn.Visible = false
local tween = TweenService:Create(frame, TweenInfo.new(0.35), {Position = UDim2.new(0.5, -250, 0.5, -150)})
tween:Play()
else
local tween = TweenService:Create(frame, TweenInfo.new(0.35), {Position = UDim2.new(0.5, -250, 1.2, 0)})
tween:Play()
tween.Completed:Connect(function()
frame.Visible = false
openBtn.Visible = true
end)
end
end

closeBtn.MouseButton1Click:Connect(function() tweenVisible(false) end)
openBtn.MouseButton1Click:Connect(function() tweenVisible(true) end)

-- GRID LAYOUT
local grid = Instance.new("UIGridLayout", frame)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.CellSize = UDim2.new(0, 150, 0, 40)
grid.CellPadding = UDim2.new(0, 10, 0, 10)
grid.SortOrder = Enum.SortOrder.LayoutOrder
grid.FillDirectionMaxCells = 3
grid.FillDirection = Enum.FillDirection.Horizontal
grid.VerticalAlignment = Enum.VerticalAlignment.Top

-- Tombol Generator
local function makeButton(text, callback)
local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0, 150, 0, 40)
btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
btn.BorderColor3 = Color3.fromRGB(255, 0, 0)
btn.BorderSizePixel = 2
btn.Font = Enum.Font.Gotham
btn.TextColor3 = Color3.new(1,1,1)
btn.TextScaled = true
btn.Text = text

-- Hover Effect
btn.MouseEnter:Connect(function()
btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)
btn.MouseLeave:Connect(function()
btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
end)

btn.MouseButton1Click:Connect(callback)

end

-- Tombol-tombol contoh
makeButton("Script OP", function()
loadstring(game:HttpGet("https://pastefy.app/fO1AX4ua/raw"))()
end)

makeButton("Virus Script", function()
loadstring(game:HttpGet("https://pastefy.app/7xQZx0KQ/raw"))()
end)

makeButton("Angle Script", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TKFPc30/angle-script/main/script.lua"))()
end)

makeButton("Ban Hammer", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TKFPc30/ban-hammer/main/script.lua"))()
end)

makeButton("Classic Anim", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/vixonpolska/FEClassicAnimations/refs/heads/main/Animations.lua",true))()
end)

makeButton("ESP Player", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TKFPc30/esp-player/refs/heads/main/main.lua"))()
end)

makeButton("Glitch Character", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TKFPc30/glitch-character/main/main.lua"))()
end)

makeButton("Chicken Animation", function()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- Pose tangan
char.Torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0)
* CFrame.Angles(0, math.pi / 2, 0)
* CFrame.Angles(math.pi / 2, 0, 0)
* CFrame.Angles(0, -math.pi / 2, 0)

char.Torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0)
* CFrame.Angles(0, -math.pi / 2, 0)
* CFrame.Angles(math.pi / 2, 0, 0)
* CFrame.Angles(0, -math.pi / 2, 0)

end)

makeButton("Heads Animation", function()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- Goyang kepala & besarin kepala
task.spawn(function()
local t = 0
while true do
task.wait()
t += 0.1
if char:FindFirstChild("Torso") and char.Torso:FindFirstChild("Neck") then
char.Torso.Neck.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(0, math.sin(t) * 1.2, 0)
end
end
end)

for _, v in pairs(game.Players:GetPlayers()) do
local head = v.Character and v.Character:FindFirstChild("Head")
if head and head:FindFirstChildOfClass("SpecialMesh") then
head:FindFirstChildOfClass("SpecialMesh").Scale = Vector3.new(100, 100, 100)
task.wait(1)
head:FindFirstChildOfClass("SpecialMesh").Scale = Vector3.new(1.25, 1.25, 1.25)
end
end
end)
