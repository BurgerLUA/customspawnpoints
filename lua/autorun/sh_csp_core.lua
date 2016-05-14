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


CSPSpawnPoints["fightspace3b"] = {
	-- Ramp Hanger
	{pos = Vector(13816,-14526,-13104), ang = Angle(0,-180,0)},
	{pos = Vector(8683,-14576,-13104), ang = Angle(0,0,0)},
	{pos = Vector(14526,-11319,-13108), ang = Angle(0,-180,0)},
	{pos = Vector(13520,-8923,-13108), ang = Angle(0,-180,0)},
	
	-- Red Barn
	{pos = Vector(10458,13852,-13108), ang = Angle(0,-90,0)},
	{pos = Vector(15087,14948,-13038), ang = Angle(0,-135,0)},
	{pos = Vector(6530,14396,-13108), ang = Angle(0,-90,0)},
	
	-- City Entrance
	{pos = Vector(210,6139,-13136), ang = Angle(0,-90,0)},
	
	-- Gas Station
	{pos = Vector(-393,312,-13106), ang = Angle(0,0,0)},
	
	-- Hydro Base
	{pos = Vector(-11120,11609,-13108), ang = Angle(0,0,0)},
	
	-- Shacks
	{pos = Vector(-4002,14221,-13162), ang = Angle(0,-135,0)},
	
	-- Garage
	{pos = Vector(-14485,5689,-13108), ang = Angle(0,0,0)},
	{pos = Vector(-14508,-802,-13114), ang = Angle(0,0,0)},
	
	-- Water Temple
	{pos = Vector(-15228,-7174,-13017), ang = Angle(0,45,0)},
	{pos = Vector(-6759,-14737,-1310), ang = Angle(0,90,0)},
	
	-- Big hole
	{pos = Vector(-5987,-2207,-13108), ang = Angle(0,90,0)},
	

}



function CSP_HasMapData()
	if CSPSpawnPoints[game.GetMap()] then
		return true
	end
end

function CSP_GetMapData()
	return CSPSpawnPoints[game.GetMap()]
end