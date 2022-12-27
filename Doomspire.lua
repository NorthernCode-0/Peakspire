function teleportTO(placeCFrame)
	
	local plyr = game.Players.LocalPlayer

	if plyr.Character then

		plyr.Character.HumanoidRootPart.CFrame = placeCFrame
		
	end
end


-- GUI

local BlekLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()

local win = BlekLib:Create({
    Name = "Doomspire ass 2013",
    StartupSound = {
        Toggle = false,
        SoundID = "rbxassetid://6958727243",
        TimePosition = 1
    }
})

local TabMain = win:Tab('Main')

TabMain:Label("Will not teleport you if the object doesnt exist!")

TabMain:Button('TP Center', function()
    teleportTO(game:GetService("Workspace").Doomspires.Holder.CFrame + Vector3.new(0,1,0))
end)

TabMain:Button('TP Spectator', function()
	teleportTO(CFrame.new(6.17046595, 518.997864, 0.72788161, -0.976053834, -5.99389978e-08, -0.217529148, -8.11414225e-08, 1, 8.8537071e-08, 0.217529148, 1.04067567e-07, -0.976053834))
end)

TabMain:Button('Suicide', function()
    game.Players.LocalPlayer.Character.Head:Remove()
end)

TabMain:Button('Close GUI', function()
    win:Exit()
end)

--Credets

TabMain:Label('---Credits---')
TabMain:Label('NorthernCode - Scripting')
TabMain:Label('Naipsen - Name')

local TabPlayer = win:Tab('Player')



local TabRedTeleports = win:Tab('Red')

TabRedTeleports:Button('TP Red Path', function()
    teleportTO(game:GetService("Workspace").Doomspires.RED.Path.CFrame + Vector3.new(0,1,0))
end)

TabRedTeleports:Button('TP Red Top', function()
    teleportTO(game:GetService("Workspace").Doomspires.RED.Roof.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

TabRedTeleports:Button('TP Red Middle', function()
    teleportTO(game:GetService("Workspace").Doomspires.RED.Floor4.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

TabRedTeleports:Button('TP Red Bottom', function()
    teleportTO(game:GetService("Workspace").Doomspires.RED.Floor2.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

local TabBlueTeleports = win:Tab('Blue')

TabBlueTeleports:Button('TP Blue Path', function()
    teleportTO(game:GetService("Workspace").Doomspires.BLUE.Path.CFrame + Vector3.new(0,1,0))
end)

TabBlueTeleports:Button('TP Blue Top', function()
    teleportTO(game:GetService("Workspace").Doomspires.BLUE.Roof.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

TabBlueTeleports:Button('TP Blue Middle', function()
    teleportTO(game:GetService("Workspace").Doomspires.BLUE.Floor4.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

TabBlueTeleports:Button('TP Blue Bottom', function()
    teleportTO(game:GetService("Workspace").Doomspires.BLUE.Floor2.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

local TabGreenTeleports = win:Tab('Green')

TabGreenTeleports:Button('TP Green Path', function()
    teleportTO(game:GetService("Workspace").Doomspires.GREEN.Path.CFrame + Vector3.new(0,1,0))
end)


TabGreenTeleports:Button('TP Green Top', function()
    teleportTO(game:GetService("Workspace").Doomspires.GREEN.Roof.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

TabGreenTeleports:Button('TP Green Middle', function()
    teleportTO(game:GetService("Workspace").Doomspires.GREEN.Floor4.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

TabGreenTeleports:Button('TP Green Bottom', function()
    teleportTO(game:GetService("Workspace").Doomspires.GREEN.Floor2.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

local TabYellowTeleports = win:Tab('Yellow')

TabYellowTeleports:Button('TP Yellow Path', function()
    teleportTO(game:GetService("Workspace").Doomspires.YELLOW.Path.CFrame + Vector3.new(0,1,0))
end)

TabYellowTeleports:Button('TP Yellow Top', function()
    teleportTO(game:GetService("Workspace").Doomspires.YELLOW.Roof.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

TabYellowTeleports:Button('TP Yellow Middle', function()
    teleportTO(game:GetService("Workspace").Doomspires.YELLOW.Floor4.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

TabYellowTeleports:Button('TP Yellow Bottom', function()
    teleportTO(game:GetService("Workspace").Doomspires.YELLOW.Floor2.FloorBrick.CFrame + Vector3.new(0,1,0))
end)

