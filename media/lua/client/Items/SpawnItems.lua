-- I want to always spawn with a kitana

local SpawnItems = {};

function SpawnItems.OnNewGame(playerObj, square)
    playerObj:getInventory():AddItem("Base.Kitana");
 
	if isClient() then
		if getServerOptions():getOption("SpawnKitana") and getServerOptions():getOption("SpawnKitana")~= "" then
			local items = luautils.split(getServerOptions():getOption("SpawnKitana"), ",");
			for i,v in pairs(items) do
				playerObj:getInventory():AddItem(v);
			end;
		end;
	end;
end

Events.OnNewGame.Add(SpawnItems.OnNewGame);
