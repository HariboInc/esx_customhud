fx_version "adamant"
game "gta5"

name "dnz_hud"
description "dnz_hud"
author "dnz"
version "1.0.0"





client_scripts {
	"client/*.lua"
}

server_scripts {
	"server/*.lua"
}

ui_page 'html/ui.html'


files {
	"html/ui.*",
	"html/img/*.png"
}
