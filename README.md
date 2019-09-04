# esx_betterhud
My ESX version for vrp_betterhud @DoubleT74

**Credits: マーモット#2533**

**Screenshots:**


![Screenshot](https://i.imgur.com/d2eruQL.png)
![Screenshot](https://i.imgur.com/0QROv7F.jpg)


**How to install:**

 - Go into esx_status/client/main.lua:
 
```lua
RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(status)
	for i=1, #Status, 1 do
		for j=1, #status, 1 do
			if Status[i].name == status[j].name then
				Status[i].set(status[j].val)
			end
		end
	end
	Citizen.CreateThread(function()
		while true do
			for i=1, #Status, 1 do
				Status[i].onTick()
			end
			SendNUIMessage({
				update = true,
				status = GetStatusData()
			})
			TriggerEvent('esx_status:onTick', GetStatusData(true))
			Citizen.Wait(Config.TickTime)
		end
	end)
end)
```
- And Replace it with this:
```lua
RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(status)
	for i=1, #Status, 1 do
		for j=1, #status, 1 do
			if Status[i].name == status[j].name then
				Status[i].set(status[j].val)
			end
		end
	end
	Citizen.CreateThread(function()
		while true do
			for i=1, #Status, 1 do
				Status[i].onTick()
			end
			SendNUIMessage({
				update = true,
				status = GetStatusData()
			})
			TriggerEvent('esx_betterhud:updateBasics', GetStatusData(true))
			Citizen.Wait(Config.TickTime)
		end
	end)
end)
```

- Start esx_betterhud in your Server.cfg
