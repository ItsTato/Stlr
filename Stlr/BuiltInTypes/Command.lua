local Util = require(script.Parent.Parent.Shared.Util);

return function(stlr)
	local commandType = {
		Transform = function(text)
			local findCommand = Util.MakeFuzzyFinder(stlr:GetCommandNames());
			return findCommand(text);
		end,

		Validate = function(commands)
			return #commands > 0, "No command with that name could be found.";
		end,

		Autocomplete = function(commands)
			return commands;
		end,

		Parse = function(commands)
			return commands[1];
		end,
	}

	stlr:RegisterType("command", commandType);
	stlr:RegisterType("commands", Util.MakeListableType(commandType));
end;
