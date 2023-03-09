return {
	"echasnovski/mini.surround",
	config = function()
		require("mini.surround").setup()
	end,
	keys = {
		{ "sa", mode = "v" },
		"sd", "sf", "sF", "sh", "sr", "sn",
	},
}
