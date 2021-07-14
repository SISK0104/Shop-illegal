ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('sisko:test')
AddEventHandler('sisko:test', function(price, item, nombre) 
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= price then
	xPlayer.removeMoney(price)
    	xPlayer.addInventoryItem(item, nombre) 
        TriggerClientEvent('esx:showNotification', source, "~g~Merci pour votre achat. L'endroit va changer. Attention de ~b~la police", "", 1)
     else 
         TriggerClientEvent('esx:showNotification', source, "Il n'y a pas ~r~d'argent, ~y~partez avant que je vous explose la tête")  
        end
end)  

  