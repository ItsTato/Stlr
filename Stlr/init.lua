local RunService = game:GetService("RunService");
local Util = require(script.Shared:WaitForChild("Util"));

if RunService:IsServer() == false then
	error("[Stlr] Client scripts cannot require the server library. Please require the client library from the client to use Stlr in your own code.");
end

--[=[
	@class Stlr
	@server

	The Stlr server singleton and entry point.
]=]

--[=[
	@within Stlr
	@prop Registry Registry
	@readonly
	Refers to the current command Registry.
]=]

--[=[
	@within Stlr
	@prop Dispatcher Dispatcher
	@readonly
	Refers to the current command Dispatcher.
]=]

--[=[
	@within Stlr
	@prop Util Util
	@readonly
	Refers to a table containing many useful utility functions.
]=]

local Stlr
do
	Stlr = setmetatable({
		ReplicatedRoot = nil,
		RemoteFunction = nil,
		RemoteEvent = nil,
		Util = Util,
		DefaultCommandsFolder = script.BuiltInCommands,
	}, {
		__index = function(self, k)
			local r = self.Registry[k]
			if r and type(r) == "function" then
				return function(_, ...)
					return r(self.Registry, ...)
				end
			end
		end,
	})

	Stlr.Registry = require(script.Shared.Registry)(Stlr)
	Stlr.Dispatcher = require(script.Shared.Dispatcher)(Stlr)

	require(script.Initialize)(Stlr)
end

-- Handle command invocations from the clients.
Stlr.RemoteFunction.OnServerInvoke = function(player, text, options)
	if #text > 10000 then
		return "Input too long"
	end

	return Stlr.Dispatcher:EvaluateAndRun(text, player, options)
end

return Stlr
