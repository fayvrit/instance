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
	time = 1, -- default is 1
	delay = 0, -- default is 0
	reverse = true, -- default is false
	autoplay = false, -- default is true
	repeatcount = -1, -- default is 0
	callback = print, -- only call on autoplay
	style = Enum.EasingStyle.Quart, -- default is Enum.EasingStyle.Quad
	direction = Enum.EasingDirection.InOut, -- default is Enum.EasingStyle.Out

	goal = {
		Position = UDim2.new(1, 0, 1, 0), 
		AnchorPoint = Vector2.new(1, 1)
	}
}

```
