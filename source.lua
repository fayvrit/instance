local tween = game:GetService 'TweenService'

local instance = {}

instance.items = {}

instance.__newindex = function(self, key, value)
	local Success = pcall(function()
		self.obj[key] = value
	end)

	if not Success then 
		rawset(self, key, value)
	end
end

instance.__index = function(self, key)
	local Success, Result = pcall(function()
		return self.obj[key] 
	end)
	
	return Success and Result or (rawget(self, key) or rawget(instance, key))
end

instance.new = function(...)
	local args = {...}
	
	local index = type(args[1]) == 'string' and 0 or 1
	
	args.class = args[index + 1]
	args.properties = args[index + 2]
	args.item = Instance.new(args.class)
	
	args.properties.Parent = args.properties.Parent or args[1].obj
	
	local item = instance.add(args.item)
	
	for property, value in args.properties do
		item[property] = value
	end
	
	return item
end

instance.add = function(self)
	local item = setmetatable({}, instance)
	
	item.obj = self
	item.connections = {}
	
	return item
end

instance.connect = function(self, event, callback)
	local connection = self.obj[event]:Connect(callback)
	table.insert(self.connections, connection)
	
	return connection
end

instance.changedproperty = function(self, property, callback)
	local connection = self.obj:GetPropertyChangedSignal(property):Connect(callback)
	table.insert(self.connections, connection)

	return connection
end

instance.tween = function(self, info)
	info = info or {}
	
	info.time = info.time or 1
	info.delay = info.delay or 0
	info.reverse = info.reverse or false
	info.autoplay = info.autoplay or false
	info.repeatcount = info.repeatcount or 0
	info.callback = info.callback or function() end
	info.style = info.style or Enum.EasingStyle.Quad
	info.direction = info.direction or Enum.EasingDirection.Out
	info.goal = assert(info.goal, 'failed to create tween without goal!')

	self.info = TweenInfo.new(info.time, info.style, info.direction, info.repeatcount, info.reverse, info.delay)

	self.tween = tween:Create(self.obj, self.info, info.goal)
	
	self.tween:Play()
	
	task.delay(info.time + info.delay, info.callback)
	
	return self.tween
end

return instance
