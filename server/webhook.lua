function createWebhook(url)
    local self = {}

    self.sendMessage = function(name, message, color)
        format = os.date('%H:%M:%S', os.time()) 
        local date_local = format

        local embeds = {
            {
                ["title"]=name,
                ["description"] = message,
                ["type"]="rich",
                ["color"] =color,
                ["footer"]=  {
                    ["text"]= "© Realistic - Heure: " ..date_local.. "",
               },
            }
        }

        if message == nil or message == '' then return FALSE end
        PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end

    return self
end