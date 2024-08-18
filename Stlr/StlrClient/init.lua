local RunService = game:GetService("RunService");
local StarterGui = game:GetService("StarterGui");
local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
local Shared = script:WaitForChild("Shared");
local Util = require(Shared:WaitForChild("Util"));

if RunService:IsClient() == false then
	error("[Stlr] Server scripts cannot require the client library. Please require the server library from the server to use Stlr in your own code.");
end;

--[=[
	@class StlrClient
	@client
	The Stlr client singleton and entry point.
]=]

--[=[
	@within StlrClient
	@prop Registry Registry
	@readonly
	Refers to the current command Registry.
]=]

--[=[
	@within StlrClient
	@prop Dispatcher Dispatcher
	@readonly
	Refers to the current command Dispatcher.
]=]

--[=[
	@within StlrClient
	@prop Util Util
	@readonly
	Refers to a table containing many useful utility functions.
]=]

--[=[
	@within StlrClient
	@prop Enabled boolean
	@readonly
	Whether or not Stlr is enabled (will show via the defined activation keys). Use [`StlrClient:SetEnabled`](#SetEnabled) to change.
]=]

--[=[
	@within StlrClient
	@prop PlaceName string
	@readonly
	The current place name, displayed on the interface. Use [`StlrClient:SetPlaceName`](#SetPlaceName) to change.
]=]

--[=[
	@within StlrClient
	@prop ActivationKeys { [Enum.KeyCode] = true }
	@readonly
	The list of key codes that will show or hide Stlr. Use [`StlrClient:SetActivationKeys`](#SetActivationKeys) to change.
]=]

local Stlr;
do
	Stlr = setmetatable({
		ReplicatedRoot = script,
		RemoteFunction = script:WaitForChild("StlrFunction"),
		RemoteEvent = script:WaitForChild("StlrEvent"),
		ActivationKeys = { [Enum.KeyCode.F2] = true },
		Enabled = true,
		MashToEnable = false,
		ActivationUnlocksMouse = false,
		HideOnLostFocus = true,
		PlaceName = "Stlr",
		Util = Util,
		Events = {},
	}, {
		-- This sucks, and may be redone or removed
		-- Proxies dispatch methods on to main Stlr object
		__index = function(self, k)
			local r = self.Dispatcher[k]
			if r and type(r) == "function" then
				return function(_, ...)
					return r(self.Dispatcher, ...)
				end
			end
		end,
	});

	Stlr.Registry = require(Shared.Registry)(Stlr);
	Stlr.Dispatcher = require(Shared.Dispatcher)(Stlr);
end;

if StarterGui:WaitForChild("Stlr") and wait() and Player:WaitForChild("PlayerGui"):FindFirstChild("Stlr") == nil then
	StarterGui.Stlr:Clone().Parent = Player.PlayerGui;
end;

local Interface = require(script.StlrInterface)(Stlr);

--[=[
	Sets the key codes that will used to show or hide Stlr.

	@within StlrClient
]=]
function Stlr:SetActivationKeys(keys: { Enum.KeyCode })
	self.ActivationKeys = Util.MakeDictionary(keys);
end;

--[=[
	Sets the place name label on the interface. This is useful for a quick way to tell what game you're playing in a universe game.

	@within StlrClient
]=]
function Stlr:SetPlaceName(name: string)
	self.PlaceName = name;
	Interface.Window:UpdateLabel();
end;

--[=[
	Sets whether or not Stlr can be shown via the defined activation keys. Useful for when you want users to opt-in to show the console, for instance in a settings menu.

	@within StlrClient
]=]
function Stlr:SetEnabled(enabled: boolean)
	self.Enabled = enabled;
end;

--[=[
	Sets if activation will free the mouse.

	@within StlrClient
]=]
function Stlr:SetActivationUnlocksMouse(enabled: boolean)
	self.ActivationUnlocksMouse = enabled;
end;

--[=[
	Shows the Stlr window. Does nothing if Stlr isn't enabled.

	@within StlrClient
]=]
function Stlr:Show()
	if not self.Enabled then
		return;
	end;

	Interface.Window:Show();
end;

--[=[
	Hides the Stlr window.

	@within StlrClient
]=]
function Stlr:Hide()
	Interface.Window:Hide();
end;

--[=[
	Toggles the Stlr window. Does nothing if Stlr isn't enabled.

	@within StlrClient
]=]
function Stlr:Toggle()
	if not self.Enabled then
		self:Hide();
		return;
	end;

	Interface.Window:SetVisible(not Interface.Window:IsVisible());
end;

--[=[
	Enables the "Mash to open" feature.
	This feature, when enabled, requires the activation key to be pressed 5 times within a second to [enable](#SetEnabled) Stlr.
	This may be helpful to guard against mispresses from opening the window, for example.

	@within StlrClient
]=]
function Stlr:SetMashToEnable(enabled: boolean)
	self.MashToEnable = enabled;

	if enabled then
		self:SetEnabled(false);
	end;
end;

--[=[
	Sets the hide on 'lost focus' feature.
	This feature, which is enabled by default, will cause Stlr to [hide](#Hide) when the user clicks off the window.

	@within StlrClient
]=]
function Stlr:SetHideOnLostFocus(enabled: boolean)
	self.HideOnLostFocus = enabled;
end;

--[=[
	Sets the [network event handler](/docs/networkeventhandlers) for a certain event type.

	@within StlrClient
]=]
function Stlr:HandleEvent(name: string, callback: (...any) -> ())
	self.Events[name] = callback;
end;

-- "Only register when we aren't in studio because don't want to overwrite what the server portion did"
-- This is legacy code which predates Accurate Play Solo (which is now the only way to test in studio), this code will never run.
if RunService:IsServer() == false then
	Stlr.Registry:RegisterTypesIn(script:WaitForChild("Types"));
	Stlr.Registry:RegisterCommandsIn(script:WaitForChild("Commands"));
end;

-- Hook up event listener
Stlr.RemoteEvent.OnClientEvent:Connect(function(name, ...)
	if Stlr.Events[name] then
		Stlr.Events[name](...);
	end;
end);

require(script.DefaultEventHandlers)(Stlr);

return Stlr;
