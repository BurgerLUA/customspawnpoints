if not CSP_CachedModels then
	CSP_CachedModels = {}
end

local RenderedModels = false

local SpawnMaterial = Material("sprites/animglow02")

function CSP_DrawSpawns()
	
	local ply = LocalPlayer()
	local MapData = CSP_GetMapData()
	
	if MapData then
		for k,v in pairs(MapData) do
		
			local ScreenTable = (v.pos - Vector(0,0,20)):ToScreen()
			
			local PosX = ScreenTable.x
			local PosY = ScreenTable.y
			local IsVisible = ScreenTable.visible and ply:IsLineOfSightClear( v.pos )
			
			if IsVisible then
			
				local Base = 500
			
				local DistanceMul = math.Clamp( (Base - EyePos():Distance(v.pos)),0,Base )
			
				surface.SetDrawColor( Color(255,255,255,255) )
				surface.SetMaterial( SpawnMaterial	) -- If you use Material, cache it!
				surface.DrawTexturedRectRotated( PosX, PosY, DistanceMul, DistanceMul ,CurTime()*10 )
			end

		end
	end

end

hook.Add("HUDPaint","CSP_DrawSpawns",CSP_DrawSpawns)

function CSP_DrawLight()

	local MapData = CSP_GetMapData()
	
	if MapData then
	
		for k,v in pairs(MapData) do
		
			local FlashLight = DynamicLight( k + 1000 )
			
			local Base = 500
			local DistanceMul = math.Clamp( (Base - EyePos():Distance(v.pos)),0,Base )

			if FlashLight then
				local FadeOutTime = FrameTime()*2
				FlashLight.Pos = v.pos - Vector(0,0,20)
				FlashLight.Size = DistanceMul
				FlashLight.DieTime = CurTime() + FadeOutTime*10
				FlashLight.Decay = 1000 / FadeOutTime
				FlashLight.MinLight = 0
				FlashLight.r = 255
				FlashLight.g = 255
				FlashLight.b = 255
			end
			
		end

	end
	
end

hook.Add("Think","CSP_DrawLight",CSP_DrawLight)


function CSP_CreateSpawns()

	if RenderedModels == false then
	
		if CSP_HasMapData() then
		
			local MapData = CSP_GetMapData()

			for k,v in pairs(CSP_CachedModels) do
				if v:IsValid() then
					v:Remove()
				end
				table.remove(CSP_CachedModels,k)
			end
			
			RenderedModels = true
			
		end

	end
	

end

hook.Add("Think","CSP_CreateSpawns",CSP_CreateSpawns)