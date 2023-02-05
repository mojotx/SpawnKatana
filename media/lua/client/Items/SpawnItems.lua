-- I want to always spawn with a katana

local SpawnItems = {};

function SpawnItems.OnNewGame(playerObj, square)
    -- playerObj:getInventory():AddItem("Base.Katana");
    playerObj:getInventory():AddItem("Michonne.Katana");

	if isClient() then
		if getServerOptions():getOption("SpawnKatana") and getServerOptions():getOption("SpawnKatana")~= "" then
			local items = luautils.split(getServerOptions():getOption("SpawnKatana"), ",");
			for i,v in pairs(items) do
				playerObj:getInventory():AddItem(v);
			end;
		end;
	end;
end

Events.OnNewGame.Add(SpawnItems.OnNewGame);
