local version = "v1.13.0"

return {
	Name = "version",
	Args = {},
	Description = "Shows the current version of Stlr",
	Group = "DefaultDebug",

	ClientRun = function()
		return ("Stlr Version %s"):format(version)
	end,
}
