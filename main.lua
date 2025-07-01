local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Simpan tracer lines
local tracers = {}

local function createTracer(player)
	if player == LocalPlayer then return end
	if tracers[player] then return end

	local tracer = Drawing.new("Line")
	tracer.Thickness = 2
	tracer.Color = Color3.fromRGB(0, 255, 0) -- Hijau
	tracer.Transparency = 1
	tracer.Visible = true
	tracers[player] = tracer
end

local function removeTracer(player)
	if tracers[player] then
		tracers[player]:Remove()
		tracers[player] = nil
	end
end

-- Buat tracer untuk semua player
for _, player in ipairs(Players:GetPlayers()) do
	createTracer(player)
	player.CharacterAdded:Connect(function()
		wait(1)
		createTracer(player)
	end)
	player.AncestryChanged:Connect(function(_, parent)
		if not parent then
			removeTracer(player)
		end
	end)
end

Players.PlayerAdded:Connect(function(player)
	createTracer(player)
	player.CharacterAdded:Connect(function()
		wait(1)
		createTracer(player)
	end)
end)

Players.PlayerRemoving:Connect(removeTracer)

-- Update setiap frame
RunService.RenderStepped:Connect(function()
	local myChar = LocalPlayer.Character
	local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if not myHRP then return end

	local fromPos3D = myHRP.Position
	local fromScreen, onScreen1 = Camera:WorldToViewportPoint(fromPos3D)

	for player, tracer in pairs(tracers) do
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp and char:FindFirstChildOfClass("Humanoid").Health > 0 then
			local toPos3D = hrp.Position
			local toScreen, onScreen2 = Camera:WorldToViewportPoint(toPos3D)

			if onScreen1 and onScreen2 then
				tracer.From = Vector2.new(fromScreen.X, fromScreen.Y)
				tracer.To = Vector2.new(toScreen.X, toScreen.Y)
				tracer.Visible = true
			else
				tracer.Visible = false
			end
		else
			tracer.Visible = false
		end
	end
end)
