local custom_header = {
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"██╗    ██╗     ██╗███████╗███╗   ██╗",
	"██║    ██║     ██║██╔════╝████╗  ██║",
	"██║ █╗ ██║     ██║███████╗██╔██╗ ██║",
	"██║███╗██║██   ██║╚════██║██║╚██╗██║",
	"╚███╔███╔╝╚█████╔╝███████║██║ ╚████║",
	"╚══╝╚══╝  ╚════╝ ╚══════╝╚═╝  ╚═══╝",
	"",
	"",
	"",
}

local setup, alpha = pcall(require, "alpha")
if not setup then
	return
end

local db = require("alpha.themes.dashboard")

db.section.header.val = custom_header
db.section.buttons.val = {
	db.button("Quit?", "Exit", ":wqa<cr>"),
	db.button("SPC ff", "Find File", ":Telescope find_files<cr>"),
	db.button("SPC fg", "Find Word", ":Telescope live_grep<cr>"),
	db.button("SPC fh", "Help Tags", ":Telescope help_tags<cr>"),
	db.button("SPC gg", "Git", ":LazyGit<cr>"),
}

alpha.setup(db.config)
