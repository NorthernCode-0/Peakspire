	local ctrl = {f = 0, b = 0, l = 0, r = 0} 
    local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
    local maxspeed = 400 
    local speed = 5000 
	local plr = game.Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	local Humanoid = char:WaitForChild('Humanoid')
	local FowardAnim = Instance.new('Animation')
	FowardAnim.AnimationId = 'rbxassetid://4604323138'
	local PlayFAnim = Humanoid:LoadAnimation(FowardAnim)
	local BackwardAnim = Instance.new('Animation')
	BackwardAnim.AnimationId = 'rbxassetid://4607617459'
	local PlayBAnim = Humanoid:LoadAnimation(BackwardAnim)
	local HumanoidRootPart = char:WaitForChild('HumanoidRootPart')
	local UIS = game:GetService('UserInputService')
	local Mouse = plr:GetMouse()
	local Debris = game:GetService('Debris')
	local Toggle = false

	UIS.InputBegan:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.F then
			if Toggle == false then -- toggling f key
				HumanoidRootPart.Anchored = true
				Toggle = true
				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
			elseif Toggle == true then -- when they press F to untoggle
				HumanoidRootPart.Anchored = false
				Toggle = false
				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
				local Children = HumanoidRootPart:GetChildren()
				for i, child in pairs (Children) do -- to fix the char if something is still in HumanoidRootPart
					if child:IsA('BodyVelocity') then
						child:Destroy()
					elseif child:IsA('BodyGyro') then
						child:Destroy()
					end
				end
			end
		end
	end)

	UIS.InputBegan:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.W then
			if Toggle == false then return end -- makes sure to return back if a plr as toggle = false
			HumanoidRootPart.Anchored = false
			if HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
				HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
			end
			local Forward = Instance.new("BodyVelocity",HumanoidRootPart)
			Forward.Name = "ForwardMovement"
			Forward.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			local Gyro = Instance.new("BodyGyro",HumanoidRootPart)
			Gyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			Gyro.D = 100
			Gyro.P = 10000
			while Toggle == true do
				Forward.Velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (1+1)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(0+0,(0+0)*.4,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*50
				Gyro.CFrame = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				wait()
			end
		end
	end)
	UIS.InputEnded:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.W then
			if Toggle == false then return end
			if HumanoidRootPart:FindFirstChild("ForwardMovement") then
				HumanoidRootPart.ForwardMovement:Destroy()
				HumanoidRootPart.Anchored = true
				if HumanoidRootPart:FindFirstChildOfClass("BodyGyro") then
					HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
				end
			end
		end
	end)
	UIS.InputBegan:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.S then
			if Toggle == false then return end
			HumanoidRootPart.Anchored = false
			if HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
				HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
			end
			local Back = Instance.new("BodyVelocity",HumanoidRootPart)
			Back.Name = "BackMovement"
			Back.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			local Gyro = Instance.new("BodyGyro",HumanoidRootPart)
			Gyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			Gyro.D = 100
			Gyro.P = 10000
			while Toggle == true do
				Back.Velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (1+1)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(0+0,(0+0)*.4,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*-50
				Gyro.CFrame = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				wait()
			end
		end
	end)
	UIS.InputEnded:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.S then
			if Toggle == false then return end
			if HumanoidRootPart:FindFirstChild("BackMovement") then
				HumanoidRootPart.BackMovement:Destroy()
				HumanoidRootPart.Anchored = true
				if HumanoidRootPart:FindFirstChildOfClass("BodyGyro") then
					HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
				end
			end
		end
	end)
	UIS.InputBegan:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.A then
			if Toggle == false then return end
			HumanoidRootPart.Anchored = false
			if HumanoidRootPart:FindFirstChildOfClass('BodyVelocity') then
				HumanoidRootPart:FindFirstChildOfClass('BodyVelocity'):Destroy()
			end
			local Left = Instance.new('BodyVelocity',HumanoidRootPart)
			Left.Name = 'LeftMovement'
			Left.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			local Gyro = Instance.new('BodyGyro',HumanoidRootPart)
			Gyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			Gyro.D = 100
			Gyro.P = 10000
			while Toggle == true do
				Left.Velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (0+0)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(-1+0,(0+0)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*100
				Gyro.CFrame  = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				wait()
			end
		end
	end)
	UIS.InputEnded:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.A then
			if Toggle == false then return end
			if HumanoidRootPart:FindFirstChild("LeftMovement") then
				HumanoidRootPart.LeftMovement:Destroy()
				HumanoidRootPart.Anchored = true
				if HumanoidRootPart:FindFirstChildOfClass("BodyGyro") then
					HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
				end
			end
		end
	end)
	UIS.InputBegan:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.D then
			if Toggle == false then return end
			HumanoidRootPart.Anchored = false
			if HumanoidRootPart:FindFirstChildOfClass('BodyVelocity') then
				HumanoidRootPart:FindFirstChildOfClass('BodyVelocity'):Destroy()
			end
			local Right = Instance.new('BodyVelocity',HumanoidRootPart)
			Right.Name = 'RightMovement'
			Right.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			local Gyro = Instance.new('BodyGyro',HumanoidRootPart)
			Gyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			Gyro.D = 100
			Gyro.P = 10000
			while Toggle == true do
				Right.Velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (0+0)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(0+1,(0+0)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*100
				Gyro.CFrame = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				wait()
			end
		end
	end)
	UIS.InputEnded:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.D then
			if Toggle == false then return end
			if HumanoidRootPart:FindFirstChild("RightMovement") then
				HumanoidRootPart.RightMovement:Destroy()
				HumanoidRootPart.Anchored = true
				if HumanoidRootPart:FindFirstChildOfClass("BodyGyro") then
					HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
				end
			end
		end
	end)
		UIS.InputBegan:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.Space then
			if Toggle == false then return end
			HumanoidRootPart.Anchored = false
			if HumanoidRootPart:FindFirstChildOfClass('BodyVelocity') then
				HumanoidRootPart:FindFirstChildOfClass('BodyVelocity'):Destroy()
			end
			local Up = Instance.new('BodyVelocity',HumanoidRootPart)
			Up.Name = 'RightMovement'
			Up.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			local Gyro = Instance.new('BodyGyro',HumanoidRootPart)
			Gyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			Gyro.D = 100
			Gyro.P = 10000
			while Toggle == true do
				Up.Velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (0+0)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(0+0,(1+1)*1,1).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*25
				Gyro.CFrame = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				wait()
			end
		end
	end)
	UIS.InputEnded:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.Space then
			if Toggle == false then return end
			if HumanoidRootPart:FindFirstChild("RightMovement") then
				HumanoidRootPart.RightMovement:Destroy()
				HumanoidRootPart.Anchored = true
				if HumanoidRootPart:FindFirstChildOfClass("BodyGyro") then
					HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
				end
			end
		end
	end)
			UIS.InputBegan:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.LeftControl or Input.KeyCode == Enum.KeyCode.RightControl then
			if Toggle == false then return end
			HumanoidRootPart.Anchored = false
			if HumanoidRootPart:FindFirstChildOfClass('BodyVelocity') then
				HumanoidRootPart:FindFirstChildOfClass('BodyVelocity'):Destroy()
			end
			local Up = Instance.new('BodyVelocity',HumanoidRootPart)
			Up.Name = 'RightMovement'
			Up.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			local Gyro = Instance.new('BodyGyro',HumanoidRootPart)
			Gyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			Gyro.D = 100
			Gyro.P = 10000
			while Toggle == true do
				Up.Velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (0+0)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(0+0,(1+1)*1,1).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*-25
				Gyro.CFrame = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
				wait()
			end
		end
	end)
	UIS.InputEnded:Connect(function(Input, Istyping)
		if Input.KeyCode == Enum.KeyCode.LeftControl or Input.KeyCode == Enum.KeyCode.RightControl then
			if Toggle == false then return end
			if HumanoidRootPart:FindFirstChild("RightMovement") then
				HumanoidRootPart.RightMovement:Destroy()
				HumanoidRootPart.Anchored = true
				if HumanoidRootPart:FindFirstChildOfClass("BodyGyro") then
					HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
				end
			end
		end
	end)

function teleportTO(placeCFrame)
	
	local plyr = game.Players.LocalPlayer

	if plyr.Character then

		plyr.Character.HumanoidRootPart.CFrame = placeCFrame
		
	end
end



if workspace:FindFirstChild('Kill') then
	game:GetService("Workspace").Kill:Remove()
else
	print('Kill doesnt exist, you probably re-executed script')
end
-- GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local colors = {
    SchemeColor = Color3.fromRGB(50, 50, 50),
    Background = Color3.fromRGB(31, 31, 31),
    Header = Color3.fromRGB(27, 27, 27),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(27, 27, 27)
}

local Window = Library.CreateLib("Doomspire Ass 2013 (Version 1.4)", colors)

local TabMain = Window:NewTab("Main")

local SectionMain = TabMain:NewSection("Main")

SectionMain:NewLabel("Will not teleport you if the object doesnt exist")

SectionMain:NewButton("Tp Center", "Teleports you to the white middle thing", function()
    teleportTO(game:GetService("Workspace").Doomspires.Holder.CFrame + Vector3.new(0,1,0))
end)

SectionMain:NewButton("Tp Spectator", "Teleports you to the spectator lobby", function()
    teleportTO(CFrame.new(1.45292282, 718.997864, -3.43770289, -0.972771883, -1.22582575e-08, -0.231764659, -4.43603154e-09, 1, -3.42718813e-08, 0.231764659, -3.23106057e-08, -0.972771883))
end)

local TabPlayer = Window:NewTab("Player")

local SectionPlayer = TabPlayer:NewSection("Player")

SectionPlayer:NewLabel("These values will be reset after death")

SectionPlayer:NewSlider("Walk Speed", "Changes the player walk speed", 500, 15, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

SectionPlayer:NewSlider("Jump Power", "Changes the player jump power", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

SectionPlayer:NewButton("Suicide", "Kills the player", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

SectionPlayer:NewButton("Heal", "Heals the player", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 100
end)

SectionPlayer:NewToggle("Infinite Jump", "Toggles infinite jump or not", function(state)
	-- code by isaraw8912, I got it from here (https://pastebin.com/raw/HQsQysa8)
	getgenv().infinjump = state
	
	local Player = game:GetService("Players").LocalPlayer
	local Mouse = Player:GetMouse()
	Mouse.KeyDown:connect(function(k)
		if getgenv().infinjump then
			if k:byte() == 32 then
				Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
				Humanoid:ChangeState("Jumping")
			wait(0.1)
				Humanoid:ChangeState("Seated")
			end
		end
	end)
end)

SectionPlayer:NewLabel("Fly Hot Key - F")
SectionPlayer:NewLabel("Re-execute script if fly doesn't work")

local TabRed = Window:NewTab("Red")

local SectionRed = TabRed:NewSection("Red")


SectionRed:NewButton("TP Red Path", "Teleports to the path of the red doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.RED.Path.CFrame + Vector3.new(0,1,0))
end)

SectionRed:NewButton("TP Red Top", "Teleports to the top of the red doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.RED.Roof.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionRed:NewButton("TP Red Middle", "Teleports to the middle of the red doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.RED.Floor4.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionRed:NewButton("TP Red Bottom", "Teleports to the bottom of the red doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.RED.Floor2.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionRed:NewButton("Bomb Red", "Bombs the red doomspire", function()
	
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    teleportTO(CFrame.new(-144.211823, 23.5980911, 14.2219133, -0.45073238, -3.49760292e-08, 0.892659128, -4.795774e-09, 1, 3.67603015e-08, -0.892659128, 1.22880666e-08, -0.45073238))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-118.776993, 23.57971, -13.8673029, 0.862301469, 4.33299707e-09, -0.50639528, -4.74373651e-09, 1, 4.7880766e-10, 0.50639528, 1.98932915e-09, 0.862301469))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-114.300056, 23.5980854, 8.02112961, -0.00595333986, -1.48754919e-08, -0.999982297, -5.86969726e-08, 1, -1.45263064e-08, 0.999982297, 5.86094515e-08, -0.00595333986))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-147.190781, 23.5980854, -7.91655922, 0.00432501128, 6.09686808e-08, 0.999990642, 1.81681745e-08, 1, -6.10478281e-08, -0.999990642, 1.84320381e-08, 0.00432501128))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-100.118988, 129.197922, 4.72416639, 0.183544949, -6.04413088e-08, -0.983011305, -3.39868977e-09, 1, -6.21204634e-08, 0.983011305, 1.47428478e-08, 0.183544949))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-99.9559021, 129.197922, -8.51124763, -0.374645859, 2.28054038e-08, -0.927168012, -2.13100861e-08, 1, 3.32077228e-08, 0.927168012, 3.21991642e-08, -0.374645859))
end)

local TabBlue = Window:NewTab("Blue")

local SectionBlue = TabBlue:NewSection("Blue")

SectionBlue:NewButton("TP Blue Path", "Teleports to the path of the blue doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.BLUE.Path.CFrame + Vector3.new(0,1,0))
end)

SectionBlue:NewButton("TP Blue Top", "Teleports to the top of the blue doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.BLUE.Roof.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionBlue:NewButton("TP Blue Middle", "Teleports to the middle of the blue doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.BLUE.Floor4.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionBlue:NewButton("TP Blue Bottom", "Teleports to the bottom of the blue doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.BLUE.Floor2.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionBlue:NewButton("Bomb Blue", "Bombs the blue doomspire", function()
	
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    teleportTO(CFrame.new(12.4938517, 23.5981159, 145.230545, -0.996459365, -2.425673e-09, -0.0840758234, 2.86568214e-10, 1, -3.22473994e-08, 0.0840758234, -3.21573168e-08, -0.996459365))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-14.0771418, 23.5981159, 119.084045, 0.816693723, 8.50537347e-08, 0.577071369, -1.88230089e-08, 1, -1.20749533e-07, -0.577071369, 8.77531647e-08, 0.816693723))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(7.53284502, 23.5981064, 113.660202, 0.994880676, -1.77239805e-08, -0.101056695, 1.09924105e-08, 1, -6.71686777e-08, 0.101056695, 6.57139623e-08, 0.994880676))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-8.61070251, 23.5981083, 148.755829, -0.949289978, -4.72661625e-08, 0.314401925, -6.57083561e-08, 1, -4.80598707e-08, -0.314401925, -6.62815864e-08, -0.949289978))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(7.30328369, 129.197922, 100.741234, 0.987104774, 9.89073783e-08, -0.160075411, -1.02269823e-07, 1, -1.2766832e-08, 0.160075411, 2.89730853e-08, 0.987104774))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-7.73366117, 129.197937, 100.382195, 0.999183953, -2.20218936e-08, -0.0403906852, 1.92570013e-08, 1, -6.88427733e-08, 0.0403906852, 6.8008795e-08, 0.999183953))
end)

local TabGreen = Window:NewTab("Green")

local SectionGreen = TabGreen:NewSection("Green")

SectionGreen:NewButton("TP Green Path", "Teleports to the path of the green doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.GREEN.Path.CFrame + Vector3.new(0,1,0))
end)


SectionGreen:NewButton("TP Green Top", "Teleports to the top of the green doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.GREEN.Roof.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionGreen:NewButton("TP Green Middle", "Teleports to the middle of the green doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.GREEN.Floor4.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionGreen:NewButton("TP Green Bottom", "Teleports to the bottom of the green doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.GREEN.Floor2.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionGreen:NewButton("Bomb Green", "Bombs the green doomspire", function()
	
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    teleportTO(CFrame.new(-13.5777617, 23.5981159, -145.513168, 0.665997863, -1.66200902e-08, 0.745953619, -5.51483126e-08, 1, 7.15175119e-08, -0.745953619, -8.87685943e-08, 0.665997863))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(13.4746265, 23.5981159, -116.780067, -0.715924323, 3.39662272e-08, -0.698177934, 1.89249327e-08, 1, 2.92438482e-08, 0.698177934, 7.72341124e-09, -0.715924323))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-9.4129715, 23.5981064, -113.104874, -0.95859009, 8.85048621e-08, -0.284789532, 1.01096788e-07, 1, -2.95148332e-08, 0.284789532, -5.70839305e-08, -0.95859009))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(9.29812336, 23.5981064, -148.891953, 0.993951797, -3.27480585e-08, -0.109817132, 3.6324014e-08, 1, 3.05622514e-08, 0.109817132, -3.43664048e-08, 0.993951797))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(-6.46008158, 129.197922, -100.628456, -0.97115922, -2.5026706e-08, -0.238431886, -2.02946868e-08, 1, -2.23012702e-08, 0.238431886, -1.68191843e-08, -0.97115922))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(7.07288408, 129.197922, -100.50367, -0.999593079, 6.0017797e-08, -0.028524369, 5.96370455e-08, 1, 1.41989993e-08, 0.028524369, 1.24921131e-08, -0.999593079))
end)

local TabYellow = Window:NewTab("Yellow")

local SectionYellow = TabYellow:NewSection("Yellow")

SectionYellow:NewButton("TP Yellow Path", "Teleports to the path of the yellow doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.YELLOW.Path.CFrame + Vector3.new(0,1,0))
end)

SectionYellow:NewButton("TP Yellow Top", "Teleports to the top of the yellow doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.YELLOW.Roof.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionYellow:NewButton("TP Yellow Middle", "Teleports to the middle of the yellow doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.YELLOW.Floor4.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionYellow:NewButton("TP Yellow Bottom", "Teleports to the bottom of the yellow doomspire", function()
    teleportTO(game:GetService("Workspace").Doomspires.YELLOW.Floor2.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

SectionYellow:NewButton("Bomb Yellow", "Bombs the yellow doomspire", function()
	
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
    teleportTO(CFrame.new(144.912613, 23.5980759, -14.2098799, 0.67936784, 5.97168004e-09, -0.733797908, -5.84927484e-08, 1, -4.60159555e-08, 0.733797908, 7.41836175e-08, 0.67936784))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(118.417259, 23.5521317, 12.7137823, -0.861784637, 1.77828134e-08, 0.50727433, 1.04931912e-08, 1, -1.72292243e-08, -0.50727433, -9.52495327e-09, -0.861784637))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(114.658943, 23.5980701, -7.64665318, 0.00699019339, 1.13675567e-08, 0.999975562, 2.85878805e-08, 1, -1.15676748e-08, -0.999975562, 2.86680422e-08, 0.00699019339))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(148.353195, 23.5980701, 8.80283451, -0.0769628212, 8.33949088e-08, -0.997033954, -5.74020831e-08, 1, 8.80739606e-08, 0.997033954, 6.40102442e-08, -0.0769628212))
	wait(5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
	teleportTO(CFrame.new(101.557716, 129.197891, -1.01682615, -0.236603707, 7.22571727e-08, 0.971606255, -3.62793209e-08, 1, -8.3203453e-08, -0.971606255, -5.49354588e-08, -0.236603707))
end)

local TabOther = Window:NewTab("Other")

local SectionOtherPlayers = TabOther:NewSection("Players")

for i, player in pairs(game.Players:GetPlayers()) do 
	SectionOtherPlayers:NewButton("Tp to " .. player.Name, "Teleports to " .. player.Name, function()
		teleportTO(player.Character:FindFirstChild("HumanoidRootPart").CFrame)
	end)
end

local SectionOtherChat = TabOther:NewSection("Chat")

SectionOtherChat:NewButton("Remove Chat Box", "Gets rid of the chatbox gui", function()
	game:GetService("Players").ahariugbaeigbaei.PlayerGui.Chat:Remove()
end)
