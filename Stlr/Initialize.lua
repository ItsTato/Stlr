local ReplicatedStorage = game:GetService("ReplicatedStorage");
local StarterGui = game:GetService("StarterGui");
local CreateGui = require(script.Parent.CreateGui);

-- Handles initial preparation of the game server-side.
return function(stlr)
	local ReplicatedRoot, RemoteFunction, RemoteEvent;

	local function Create(class, name, parent)
		local object = Instance.new(class);
		object.Name = name;
		object.Parent = parent or ReplicatedRoot;

		return object;
	end;

	ReplicatedRoot = script.Parent.StlrClient;
	ReplicatedRoot.Parent = ReplicatedStorage;

	RemoteFunction = Create("RemoteFunction", "StlrFunction");
	RemoteEvent = Create("RemoteEvent", "StlrEvent");

	Create("Folder", "Commands");
	Create("Folder", "Types");

	script.Parent.Shared.Parent = ReplicatedRoot;

	stlr.ReplicatedRoot = ReplicatedRoot;
	stlr.RemoteFunction = RemoteFunction;
	stlr.RemoteEvent = RemoteEvent;

	stlr:RegisterTypesIn(script.Parent.BuiltInTypes);

	script.Parent.BuiltInTypes:Destroy();
	script.Parent.BuiltInCommands.Name = "Server commands";

	if StarterGui:FindFirstChild("Stlr") == nil then
		CreateGui();
	end;
end;
