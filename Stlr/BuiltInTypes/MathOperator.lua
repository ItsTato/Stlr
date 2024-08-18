return function(registry)
	registry:RegisterType(
		"mathOperator",
		registry.Stlr.Util.MakeEnumType("Math Operator", {
			{
				Name = "+",
				Perform = function(a, b)
					return a + b
				end,
			},
			{
				Name = "-",
				Perform = function(a, b)
					return a - b
				end,
			},
			{
				Name = "*",
				Perform = function(a, b)
					return a * b
				end,
			},
			{
				Name = "/",
				Perform = function(a, b)
					return a / b
				end,
			},
			{
				Name = "**",
				Perform = function(a, b)
					return a ^ b
				end,
			},
			{
				Name = "%",
				Perform = function(a, b)
					return a % b
				end,
			}
		})
	);
end;
