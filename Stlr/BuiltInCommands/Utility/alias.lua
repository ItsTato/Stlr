return {
	Name = "alias",
	Aliases = {},
	Description = "Creates a new, single command out of a command and given arguments.",
	Group = "DefaultUtil",
	Args = {
		{
			Type = "string",
			Name = "Alias name",
			Description = "The key or input type you'd like to bind the command to.",
		},
		{
			Type = "string",
			Name = "Command string",
			Description = 'The command text you want to run. Separate multiple commands with "&&". Accept arguments with $1, $2, $3, etc.',
		},
	},

	ClientRun = function(context, name, commandString)
		context.Stlr.Registry:RegisterCommandObject(context.Stlr.Util.MakeAliasCommand(name, commandString), true)

		return ("Created alias %q"):format(name)
	end,
}
