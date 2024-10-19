local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "北风中心",
	Content = "正在加载 北风中心-造船寻宝",
	Image = "rbxthumb://type=Asset&id=5107182114&w=150&h=150",
	Time = 2
})

local Window = OrionLib:MakeWindow({Name = "北风中心-造船寻宝", HidePremium = false, SaveConfig = true, IntroText = "北风中心-造船寻宝", ConfigFolder = "BeiFengBuildABoatForTreasure"})

local Back = Window:MakeTab({
	Name = "北风中心",
	Icon = "rbxassetid://14380684950",
	PremiumOnly = false
})

Back:AddButton({
	Name = "返回北风中心",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/UWUBeiFeng/Scripts/main/BeiFengCenter.lua"),true))()
	end
})

local Home = Window:MakeTab({
	Name = "主要功能",
	Icon = "rbxassetid://14361559991",
	PremiumOnly = false
})

farming = false

local positions = {
	{ position = CFrame.new(-122.7, 43.8, 1368.3), waitTime = 4 },
	{ position = CFrame.new(-119.5, 43.8, 2137.3), waitTime = 2 },
	{ position = CFrame.new(-116.3, 43.8, 2906.3), waitTime = 2 },
	{ position = CFrame.new(-113.1, 43.8, 3674.3), waitTime = 2 },
	{ position = CFrame.new(-110.0, 43.8, 4442.3), waitTime = 2 },
	{ position = CFrame.new(-106.7, 43.8, 5212.3), waitTime = 2 },
	{ position = CFrame.new(-103.5, 43.8, 5985.3), waitTime = 2 },
	{ position = CFrame.new(-100.3, 43.8, 6753.3), waitTime = 2 },
	{ position = CFrame.new(-97.1, 43.8, 7524.3), waitTime = 2 },
	{ position = CFrame.new(-112.3, 45.1, 8294.9), waitTime = 2 },
	{ position = CFrame.new(-55.7, -360.4, 9486.5), waitTime = 15 }
}

Home:AddToggle({
	Name = "自动刷钱（自动领取）",
	Default = false,
	Callback = function(Value)
		farming = Value
		while farming do
			for _, data in ipairs(positions) do
				game.Workspace.Gravity = 0
				if not farming then
					game.Workspace.Gravity = 196.1999969482422
					break
				end
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = data.position
				wait(data.waitTime)
				workspace.ClaimRiverResultsGold:FireServer()
			end
		end
	end    
})

Home:AddToggle({
	Name = "自动刷钱（不自动领取）",
	Default = false,
	Callback = function(Value)
		farming = Value
		while farming do
			for _, data in ipairs(positions) do
				game.Workspace.Gravity = 0
				if not farming then
					game.Workspace.Gravity = 196.1999969482422
					break
				end
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = data.position
				wait(data.waitTime)
			end
		end
	end    
})

OrionLib:Init()