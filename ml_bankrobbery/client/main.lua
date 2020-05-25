StartRobbing = {}
local robbing = false

RegisterNetEvent('StartRobbing')
AddEventHandler('StartRobbing', function()	
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
		if robbing == false then
			
            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), -1, true, false, false, false)
			robbing = true
           TriggerEvent("redemrp_notification:start", "You have started to rob this bank!", 5)
            Citizen.Wait(35000)
            ClearPedTasksImmediately(PlayerPedId())
			ClearPedSecondaryTask(PlayerPedId())
			robbing = false

                TriggerServerEvent("mlpayout") -- add gold/money

		end
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

-- bank 1
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, -308.85, 765.11, 118.7, true) --val
		if betweencoords < 2.0 then
			DrawTxt(Config.Robbank1, 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then		
			TriggerServerEvent("lockpick", function()  --check/del lockpick
			end)		
			end
		end
	end
end)

-- bank 2
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, -820.85, -1274.33, 43.65, true) --blackwater
		if betweencoords < 2.0 then
			DrawTxt(Config.Robbank2, 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
			TriggerServerEvent("lockpick", function() --check/del lockpick
				end) 
				
			end
		end
	end
end)

-- bank 3

--[[
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local betweencoords = GetDistanceBetweenCoords(coords, -813.12, -1277.52, 43.64, true)
		if betweencoords < 2.0 then
			DrawTxt(Config.Robbank3, 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			if IsControlJustReleased(0, 0xC7B5340A) then
			TriggerServerEvent("lockpick", function()   --check/del lockpick
				end) 
				
			end
		end
	end
end)

--]]