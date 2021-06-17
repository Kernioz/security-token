playerToken = {}
local webhookSecurity = createWebhook("https://discord.com/api/webhooks/842796604724478013/Jroj5eCW0k0rKStZXubiQHLxLtgWtaqTLZj9S5D-7YHO59ny7sTWSNu-t2cwXe2ERdQS")

function haveToken(id) 
    if playerToken[id] ~= nil then 
        return true
    end 
    return false
end 

function checkToken(id, token)
    if not haveToken(id) then
        if id ~= nil or id ~= "" then
            webhookSecurity.sendMessage("Anti Trigger Realistic 🔒", "Le joueur **" .. GetPlayerName(id) .. "** a essayé d'utilisé un trigger (sans token)", 3066993)
        end
        DropPlayer(id, Config.serverName .. " 🔒 Merci de venir en NEED Help pour régler le soucis ! ")
        return false
    else
        if playerToken[id] == token then 
            return true
        else
            if id ~= nil then
                webhookSecurity.sendMessage("Anti Trigger" .. Config.serverName .. " 🔒", "Le joueur **" .. GetPlayerName(id) .. "** a essayé d'utilisé un trigger (sans token)", 3066993)
            end
            DropPlayer(id, Config.serverName .. " 🔒 Si vous pensez que c'est une erreur, vous pouvez vous reconnecter !")
            return false
        end 
    end
    return false
end

function setToken(source)
    local source = source
    if not haveToken(source) then
        playerToken[source] = generateTokenPlayer() 
        return playerToken[source]
    else
        return
    end 
end 

function removeToken(source)
    local source = source 
    if not haveToken(source) then return end 
    playerToken[source] = nil
end

local char = {"/","*","-","+","*","ù","%"}
function generateTokenPlayer()
	local res = ""
    for i = 1, 20 do
        if math.random(1,10) > 5 then
            res = res .. string.upper(string.char(math.random(97, 122))) .. math.random(1,20) .. char[math.random(1,#char)]
        else
            res = res .. string.char(math.random(97, 122)) .. math.random(1,20)
        end
	end
	return res
end

RegisterNetEvent("maisweshcuntokenca")
AddEventHandler("maisweshcuntokenca", function()
    local source = source
    local token = setToken(source)
    Wait(10)
    TriggerClientEvent("ᓚᘏᗢ:zebi", source, token)
end)

AddEventHandler("playerDropped", function(reason) 
    local source = source
    removeToken(source)
end)