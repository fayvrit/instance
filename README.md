# Example
Roblox's OOP Instance

```lua
local instance = loadstring(game:HttpGet'https://github.com/fayvrit/instance/raw/refs/heads/main/source.lua')()
local Holder = game.Players.LocalPlayer.PlayerGui

local ScreenGui = instance.new('ScreenGui', {
	Parent = Holder
})

local Frame = ScreenGui:new('Frame', {
	Name = 'Frame Test',
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(0, 50, 0, 50)
})

local ChangedProperty = Frame:connect('InputBegan', function(input)
	print('Input', input)
end)

local ChangedProperty = Frame:changedproperty('Position', function()
	print('Position Changed', Frame.Position.X.Scale, Frame.Position.Y.Scale)
end)

local Tween = Frame:tween{
	time = 1,
	delay = 0,
	reverse = true,
	autoplay = false,
	repeatcount = -1,
	callback = print,
	style = Enum.EasingStyle.Quart,
	direction = Enum.EasingDirection.InOut,
	goal = {
		Position = UDim2.new(1, 0, 1, 0), 
		AnchorPoint = Vector2.new(1, 1)
	}
}

```
