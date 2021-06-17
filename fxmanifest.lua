fx_version 'adamant'
games { 'gta5' };


client_scripts {
    "client/client.lua"
}

server_scripts {
    "config.lua",
    "server/webhook.lua",
    "server/server.lua"
}


server_exports {
    "checkToken"
}
