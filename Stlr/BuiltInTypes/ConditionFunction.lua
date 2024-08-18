return function(registry)
	registry:RegisterType("conditionFunction", registry.Stlr.Util.MakeEnumType("ConditionFunction", { "startsWith" }));
end;
