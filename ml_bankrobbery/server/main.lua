data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("mlpayout")
AddEventHandler("mlpayout", function()
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
            
			user.addGold(1)		--change amount you want
			user.addMoney(100)  --change amount you want
    end)
    TriggerClientEvent("redemrp_notification:start",source, "You found $100 and 1 gold! ", 5)

end)


RegisterServerEvent('lockpick')
AddEventHandler('lockpick', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local count = data.checkItem(_source, "lockpick")

        if count >= 1 then
         
            data.delItem(_source,"lockpick", 1)
            TriggerClientEvent('StartRobbing', _source)
        else
            TriggerClientEvent("redemrp_notification:start", _source, ' You dont have enough lock picks', 5)
        end     
    end)
end)
 
