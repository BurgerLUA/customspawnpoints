local TeamMode = false

function CSP_PlaceSpawns()

	if TeamMode then return end
	if not CSP_HasMapData() then return end

	local GAMEMODE = gmod.GetGamemode()
	local ValidSpawns = GAMEMODE.SpawnPoints

	for k,v in pairs(ValidSpawns) do
		SafeRemoveEntity(v)
	end
	
	local MapData = CSP_GetMapData() 
	
	for l,b in pairs(MapData) do
		local SpawnPoint = ents.Create("info_player_start")
		SpawnPoint:SetPos(b.pos - Vector(0,0,20))
		SpawnPoint:SetAngles(b.ang)
		SpawnPoint:Spawn()
		table.Add(GAMEMODE.SpawnPoints,{SpawnPoint})
	end

end

hook.Add("PostCleanupMap","CSP PostCleanupMap",CSP_PlaceSpawns)
--hook.Add("Initialize","CSP OnGamemodeLoaded",CSP_PlaceSpawns)


local NextThink = 0
local HasGeneratedSpawnpoints = false


function CSP_Think()
	
	if not HasGeneratedSpawnpoints then
		if NextThink <= CurTime() then
			local GAMEMODE = gmod.GetGamemode()

			if GAMEMODE.SpawnPoints then
				CSP_PlaceSpawns()
				HasGeneratedSpawnpoints = true
			end
			
			NextThink = CurTime() + 10
			
		end
	end

end

hook.Add("Think","CSP_Think",CSP_Think)



function CSP_Command(ply,cmd,args,argStr)
	if ply:IsSuperAdmin() then
		CSP_PlaceSpawns()
	end
end
concommand.Add("refreshspawns", CSP_Command, nil, nil, FCVAR_SERVER_CAN_EXECUTE )
concommand.Add("replacespawns", CSP_Command, nil, nil, FCVAR_SERVER_CAN_EXECUTE )
