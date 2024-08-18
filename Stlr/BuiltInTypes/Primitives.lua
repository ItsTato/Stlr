local Util = require(script.Parent.Parent.Shared.Util);

local stringType = {
	Validate = function(value)
		return value ~= nil;
	end,

	Parse = function(value)
		return tostring(value);
	end,
};

local numberType = {
	Transform = function(text)
		return tonumber(text);
	end,

	Validate = function(value)
		return value ~= nil;
	end,

	Parse = function(value)
		return value;
	end,
};

local intType = {
	Transform = function(text)
		return tonumber(text);
	end,

	Validate = function(value)
		return value ~= nil and value == math.floor(value), "Only whole numbers are valid.";
	end,

	Parse = function(value)
		return value;
	end,
};

local positiveIntType = {
	Transform = function(text)
		return tonumber(text);
	end,

	Validate = function(value)
		return value ~= nil and value == math.floor(value) and value > 0, "Only positive whole numbers are valid.";
	end,

	Parse = function(value)
		return value;
	end,
};

local nonNegativeIntType = {
	Transform = function(text)
		return tonumber(text);
	end,

	Validate = function(value)
		return value ~= nil and value == math.floor(value) and value >= 0, "Only non-negative whole numbers are valid.";
	end,

	Parse = function(value)
		return value;
	end,
};

local byteType = {
	Transform = function(text)
		return tonumber(text);
	end,

	Validate = function(value)
		return value ~= nil and value == math.floor(value) and value >= 0 and value <= 255, "Only bytes are valid.";
	end,

	Parse = function(value)
		return value;
	end,
};

local digitType = {
	Transform = function(text)
		return tonumber(text);
	end,

	Validate = function(value)
		return value ~= nil and value == math.floor(value) and value >= 0 and value <= 9, "Only digits are valid.";
	end,

	Parse = function(value)
		return value;
	end,
};

local boolType;
do
	local truthy = Util.MakeDictionary({ "true", "t", "yes", "y", "on", "enable", "enabled", "1", "+" });
	local falsy = Util.MakeDictionary({ "false", "f", "no", "n", "off", "disable", "disabled", "0", "-" });

	boolType = {
		Transform = function(text)
			return text:lower();
		end,

		Validate = function(value)
			return truthy[value] ~= nil or falsy[value] ~= nil, "Please use true/yes/on or false/no/off.";
		end,

		Parse = function(value)
			if truthy[value] then
				return true;
			elseif falsy[value] then
				return false;
			else
				return nil;
			end;
		end,
	};
end;

return function(stlr)
	stlr:RegisterType("string", stringType);
	stlr:RegisterType("number", numberType);
	stlr:RegisterType("integer", intType);
	stlr:RegisterType("positiveInteger", positiveIntType);
	stlr:RegisterType("nonNegativeInteger", nonNegativeIntType);
	stlr:RegisterType("byte", byteType);
	stlr:RegisterType("digit", digitType);
	stlr:RegisterType("boolean", boolType);

	stlr:RegisterType("strings", Util.MakeListableType(stringType));
	stlr:RegisterType("numbers", Util.MakeListableType(numberType));
	stlr:RegisterType("integers", Util.MakeListableType(intType));
	stlr:RegisterType("positiveIntegers", Util.MakeListableType(positiveIntType));
	stlr:RegisterType("nonNegativeIntegers", Util.MakeListableType(nonNegativeIntType));
	stlr:RegisterType("bytes", Util.MakeListableType(byteType));
	stlr:RegisterType("digits", Util.MakeListableType(digitType));
	stlr:RegisterType("booleans", Util.MakeListableType(boolType));
end;
