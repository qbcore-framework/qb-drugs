fx_version 'cerulean'
game 'gta5'

description 'QB-Drugs'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua'
}

client_scripts {
    'config.lua',
    'locales/*.lua',
    'client/main.lua',
    'client/deliveries.lua',
    'client/cornerselling.lua'
}

server_scripts {
    'config.lua',
    'locales/*.lua',
    'server/deliveries.lua',
    'server/cornerselling.lua'
}

server_exports {
    'GetDealers'
}
