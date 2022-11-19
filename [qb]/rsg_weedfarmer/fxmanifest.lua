fx_version 'adamant'
game 'gta5'

description 'Rexshack Gaming : Weed Farmer'

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/server.lua',
	'@oxmysql/lib/MySQL.lua',
}

shared_scripts { 
	'config.lua',
}