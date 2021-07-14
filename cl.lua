ESX = nil


local Shop = {   
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_Green}, HeaderColor = {0,340, 30}, --[[R, G, B   R = red G = Green B = Blue ]]Title = 'Moro'},
	Data = { currentMenu = "Moro Shop :", GetPlayerName()},
    Events = { 
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
      PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
      local btn = btn.name
          if btn == "Bat  >" then  
 TriggerServerEvent('sisko:test', 2500, 'weapon_bat', 1)
             elseif btn == "Gold Skin  >" then  
    TriggerServerEvent('sisko:test',25000, 'yusuf', 1)
  elseif btn == "Menottes  >" then  
    TriggerServerEvent('sisko:test', 9000, 'handcuff', 1)
    CloseMenu(Shop)
  elseif btn == "Bouteille cassée  >" then  
    TriggerServerEvent('sisko:test', 4000, 'weapon_bottle', 1)
  elseif btn == "Petit couteau  >" then  
    TriggerServerEvent('sisko:test', 6000, 'weapon_switchblade', 1)
  elseif btn == "Machete  >" then  
    TriggerServerEvent('sisko:test', 10000, 'weapon_machete', 1)
    elseif btn == "Petit pistolet  >" then  
    TriggerServerEvent('sisko:test', 12000, 'weapon_snspistol', 1)
  elseif btn == "~r~Sortir" then 
    CloseMenu(Shop)
    RenderScriptCams(0, 1, 1000, 1, 1)
                DestroyAllCams(true)
    elseif btn == "178" then 
                CloseMenu(Shop)
                RenderScriptCams(0, 1, 1000, 1, 1)
                            DestroyAllCams(true)
                end 
             end,
             
	},    
	Menu = {  
		["Moro Shop :"] = { 
			b = { 
        {name = "Bat  >", ask = "~r~$2500", askX = true},   
        {name = "Menottes  >", ask = "~r~$9000", askX = true},
        {name = "Bouteille cassée  >", ask = "~r~$4000", askX = true},
        {name = "Petit couteau  >", ask = "~r~$6000", askX = true},
        {name = "Machete  >", ask = "~r~$10000", askX = true},
        {name = "Petit pistolet  >", ask = "~r~$12000", askX = true},  
        {name = "Gold Skin  >", ask = "~r~$25000", askX = true},
        {name = "~r~Sortir", ask = ">", askX = true},
			}  
		}

	}
}    


local Sisko = {
  {x =  699.38366699219, y= -303.84515380859, z=58.22}
} 
Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0) 
      for k in pairs(Sisko) do
          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Sisko[k].x, Sisko[k].y, Sisko[k].z)
          if dist <= 2.6 then 
              ESX.ShowHelpNotification("Appuyez sur ~g~~INPUT_PICKUP~ discuter")
              if IsControlJustPressed(1,38) then
                cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, 699.60693359375,-302.53840332031,60.010825653076)
    SetCamFov(cam, 30.0)
    PointCamAtCoord(cam, 699.42760009766,-303.7846679688,60.01680145264)
    SetCamShakeAmplitude(cam, 13.0)
    RenderScriptCams(1, 1, 1500, 1, 1)
               CreateMenu(Shop) 
                  end
              end 
          end
      end
  end)
  Citizen.CreateThread(function()
    local hash = GetHashKey("ig_benny")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "ig_benny", 699.38366699219,-303.84515380859,58.22, 223, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)
local v1 = vector3(config.z)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 26

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), true), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Moro")
        end
    end
end)