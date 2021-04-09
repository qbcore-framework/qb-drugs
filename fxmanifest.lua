fx_version 'cerulean'
game 'gta5'

description 'QB-Drugs'
version '1.0.0'

client_scripts {
    'client/main.lua',
    'client/deliveries.lua',
    'client/cornerselling.lua',
    'config.lua',
}

server_scripts {
    'server/main.lua',
    'server/deliveries.lua',
    'server/cornerselling.lua',
    'config.lua',
}

server_exports {
    'GetDealers'
}