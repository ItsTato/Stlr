local Teams = game:GetService("Teams");
local Util = require(script.Parent.Parent.Shared.Util);

local teamType = {
	Transform = function(text)
		local findTeam = Util.MakeFuzzyFinder(Teams:GetTeams());
		return findTeam(text);
	end,

	Validate = function(teams)
		return #teams > 0, "No team with that name could be found.";
	end,

	Autocomplete = function(teams)
		return Util.GetNames(teams);
	end,

	Parse = function(teams)
		return teams[1];
	end,
}

local teamPlayersType = {
	Listable = true,
	Transform = teamType.Transform,
	Validate = teamType.Validate,
	Autocomplete = teamType.Autocomplete,

	Parse = function(teams)
		return teams[1]:GetPlayers();
	end,
};

local teamColorType = {
	Transform = teamType.Transform,
	Validate = teamType.Validate,
	Autocomplete = teamType.Autocomplete,

	Parse = function(teams)
		return teams[1].TeamColor;
	end,
};

return function(stlr)
	stlr:RegisterType("team", teamType);
	stlr:RegisterType("teams", Util.MakeListableType(teamType));

	stlr:RegisterType("teamPlayers", teamPlayersType);

	stlr:RegisterType("teamColor", teamColorType);
	stlr:RegisterType("teamColors", Util.MakeListableType(teamColorType));
end;
