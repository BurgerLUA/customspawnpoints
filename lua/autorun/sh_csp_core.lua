CSPSpawnPoints = {}

CSPSpawnPoints["gm_construct"] = {
	{pos = Vector(1690,-2066,-78), ang = Angle(0,135,0)},
	{pos = Vector(800,-1923,-78), ang = Angle(0,0,0)},
	{pos = Vector(1132,-801,-78), ang = Angle(0,45,0)},
	{pos = Vector(1736,786,-78), ang = Angle(0,-135,0)},
	{pos = Vector(-1089,-1890,-78), ang = Angle(0,-135,0)},
	{pos = Vector(-1244,-2488,-190), ang = Angle(0,180,0)},
	{pos = Vector(-1244,-2488,-190), ang = Angle(0,180,0)},
	{pos = Vector(-2760,-60,-446), ang = Angle(0,45,0)},
	{pos = Vector(-2760,-60,-446), ang = Angle(0,45,0)},
	{pos = Vector(-5209,-1091,-78), ang = Angle(0,-45,0)},
	{pos = Vector(-5209,-1091,-78), ang = Angle(0,-45,0)},
	{pos = Vector(-5573,-3385,321), ang = Angle(0,0,0)},
	{pos = Vector(-1845,-2387,321), ang = Angle(0,-135,0)},
	{pos = Vector(-4093,4884,-30), ang = Angle(0,135,0)},
}

function CSP_HasMapData()
	if CSPSpawnPoints[game.GetMap()] then
		return true
	end
end

function CSP_GetMapData()
	return CSPSpawnPoints[game.GetMap()]
end