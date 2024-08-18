local Util = require(script.Parent.Parent.Shared.Util);

return function(stlr)
	local typeType = {
		Transform = function(text)
			local findCommand = Util.MakeFuzzyFinder(stlr:GetTypeNames());
			return findCommand(text);
		end,

		Validate = function(commands)
			return #commands > 0, "No type with that name could be found.";
		end,

		Autocomplete = function(commands)
			return commands;
		end,

		Parse = function(commands)
			return commands[1];
		end,
	}

	stlr:RegisterType("type", typeType);
	stlr:RegisterType("types", Util.MakeListableType(typeType));
end;
