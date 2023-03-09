return {
	"Darazaki/indent-o-matic",
	event = "BufReadPost",
	config = {
		max_lines = 128,
		standard_widths = { 2, 4, 8 },
		skip_multiline = true,
	},
}
