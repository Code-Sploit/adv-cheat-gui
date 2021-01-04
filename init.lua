gui = {}

local entity_esp_color
local player_esp_color
local fastplace_interval
local tool_range

local old_entity_esp_color 		= core.settings:get("entity_esp_color")
local old_player_esp_color 		= core.settings:get("player_esp_color")
local old_fastplace_interval	= core.settings:get("fastplace_interval")
local old_tool_range			= core.settings:get("tool_range")

-- Ugly hack to update old values everytime
-- TODO: Make this better
minetest.register_globalstep(function()
	old_entity_esp_color 		= core.settings:get("entity_esp_color")
	old_player_esp_color 		= core.settings:get("player_esp_color")
	old_fastplace_interval		= core.settings:get("fastplace_interval")
	old_tool_range				= core.settings:get("tool_range")
end)

function gui.display_cheat_menu()
	local formspec = 'size[20.25,15]' ..
			 'label[0,0;Cheats]' ..
			 'label[0.7,0.7;Combat]' ..
			 'button[1.0,0.0;2.0,4.0;antiknockback;AntiKnockback]' ..
			 'button[3.0,0.0;2.0,4.0;attachmentfloat;AttachmentFloat]' ..
			 'label[0.7,2.3;Interact]' ..
			 'button[1.0,1.6;2.0,4.0;autodig;AutoDig]' ..
			 'button[3.0,1.6;2.0,4.0;autoplace;AutoPlace]' ..
			 'button[5.0,1.6;2.0,4.0;autohit;AutoHit]' ..
			 'button[7.0,1.6;2.0,4.0;fastdig;FastDig]' ..
			 'button[9.0,1.6;2.0,4.0;fastplace;FastPlace]' ..
			 'button[11.0,1.6;2.0,4.0;fasthit;FastHit]' ..
			 'button[13.0,1.6;2.0,4.0;instant_break;InstantBreak]' ..
			 'label[0.7,3.9;Movement]' ..
			 'button[1.0,3.2;2.0,4.0;autoforward;AutoForward]' ..
			 'button[3.0,3.2;2.0,4.0;autojump;AutoJump]' ..
			 'button[5.0,3.2;2.0,4.0;freecam;FreeCam]' ..
			 'button[7.0,3.2;2.0,4.0;pitch_move;PitchMove]' ..
			 'button[9.0,3.2;2.0,4.0;no_slow;NoSlow]' ..
			 'button[11.0,3.2;2.0,4.0;antislip;AntiSlip]' ..
			 'button[13.0,3.2;2.0,4.0;jesus;Jesus]' ..
			 'button[15.0,3.2;2.0,4.0;jetpack;JetPack]' ..
			 'label[0.7,5.5;Exploit]' ..
			 'button[1.0,4.8;2.0,4.0;entity_speed;EntitySpeed]' ..
			 'label[0.7,6.9;Player]' ..
			 'button[1.0,6.2;2.0,4.0;prevent_natural_damage;NoFallDamage]' ..
			 'button[3.0,6.2;2.0,4.0;no_force_rotate;NoForceRotate]' ..
			 'button[5.0,6.2;2.0,4.0;reach;Reach]' ..
			 'button[7.0,6.2;2.0,4.0;point_liquids;PointLiquids]' ..
			 'button[9.0,6.2;2.0,4.0;priv_bypass;PrivBypass]' ..
			 'button[11.0,6.2;2.0,4.0;autorespawn;AutoRespawn]' ..
			 'button[13.0,6.2;2.0,4.0;dont_point_nodes;ThroughWalls]' ..
			 'label[0.7,8.4;Render]' ..
			 'button[1.0,7.6;2.0,4.0;xray;Xray]' ..
			 'button[3.0,7.6;2.0,4.0;fullbright;FullBright]' ..
			 'button[5.0,7.6;2.0,4.0;hud_flags_bypass;HUDBypass]' ..
			 'button[7.0,7.6;2.0,4.0;no_hurt_cam;NoHurtCam]' ..
			 'button[9.0,7.6;2.0,4.0;no_night;BrightNight]' ..
			 'button[11.0,7.6;2.0,4.0;coords;Coords]' ..
			 'button[13.0,7.6;2.0,4.0;cheat_hud;CheatHUD]' ..
			 'button[15.0,7.6;2.0,4.0;entity_esp;EntityESP]' ..
			 'button[1.0,8.6;2.0,4.0;entity_tracers;EntityTracers]' ..
			 'button[3.0,8.6;2.0,4.0;player_esp;PlayerESP]' ..
			 'button[5.0,8.6;2.0,4.0;player_tracers;PlayerTracers]' ..
			 'button[7.0,8.6;2.0,4.0;node_esp;NodeESP]' ..
			 'button[9.0,8.6;2.0,4.0;node_tracers;NodeTracers]' ..
			 'button[1.0,13;2.0,4.0;settings;Settings]'

	minetest.show_formspec('df-gui', formspec)
end

function gui.display_settings_menu()
	local text = "test"
	local formspec = 'size[20.25,15]' ..
			'label[0,0;Settings]' ..
			'field[fastplac_interval;FastPlace;' .. old_fastplace_interval .. ']' ..
			'field[reach_value;ToolRange;' .. old_tool_range .. ']' ..
			'field[entity_esp_color;EntityESP;' .. old_entity_esp_color .. ']' ..
			'field[player_esp_color;PlayerESP;' .. old_player_esp_color .. ']' ..
			'button[14,13;2.0,4.0;set_edited;Set]' ..
			'button[16,13;2.0,4.0;cheats;Cheats]'
			

	minetest.show_formspec('set-df-gui', formspec)
end

function gui.set_cheat(cheat)
	local tf = not core.settings:get_bool(cheat)
	core.settings:set_bool(cheat, tf)
end

minetest.register_on_formspec_input(function(formname, fields)
	-- Combat

	if fields.antiknockback then
		gui.set_cheat("antiknockback")
	end

	if fields.attachmentfloat then
		gui.set_cheat("float_above_parent")
	end
	
	-- Movement

	if fields.autoforward then
		gui.set_cheat("continuous_forward")
	end

	if fields.autojump then
		gui.set_cheat("autojump")
	end

	if fields.freecam then
		gui.set_cheat("freecam")
	end

	if fields.pitch_move then
		gui.set_cheat("pitch_move")
	end

	if fields.jesus then
		gui.set_cheat("jesus")
	end

	if fields.no_slow then
		gui.set_cheat("no_slow")
	end

	if fields.jetpack then
		gui.set_cheat("jetpack")
	end

	if fields.antislip then
		gui.set_cheat("antislip")
	end

	-- Interact

	if fields.autodig then
		gui.set_cheat("autodig")
	end

	if fields.autoplace then
		gui.set_cheat("autoplace")
	end

	if fields.autohit then
		gui.set_cheat("autohit")
	end

	if fields.fastdig then
		gui.set_cheat("fastdig")
	end

	if fields.fastplace then
		gui.set_cheat("fastplace")
	end

	if fields.fasthit then
		gui.set_cheat("spamclick")
	end

	if fields.instant_break then
		gui.set_cheat("instant_break")
	end

	-- Exploit

	if fields.entity_speed then
		gui.set_cheat("entity_speed")
	end

	-- Player

	if fields.autorespawn then
		gui.set_cheat("autorespawn")
	end

	if fields.prevent_natural_damage then
		gui.set_cheat("prevent_natural_damage")
	end

	if fields.no_force_rotate then
		gui.set_cheat("no_force_rotate")
	end

	if fields.reach then
		gui.set_cheat("reach")
	end

	if fields.point_liquids then
		gui.set_cheat("point_liquids")
	end

	if fields.priv_bypass then
		gui.set_cheat("priv_bypass")
	end

	if fields.dont_point_nodes then
		gui.set_cheat("dont_point_nodes")
	end

	-- Render

	if fields.no_night then
		gui.set_cheat("no_night")
	end

	if fields.coords then
		gui.set_cheat("coords")
	end

	if fields.cheat_hud then
		gui.set_cheat("cheat_hud")
	end

	if fields.entity_esp then
		gui.set_cheat("enable_entity_esp")
	end

	if fields.entity_tracers then
		gui.set_cheat("enable_entity_tracers")
	end

	if fields.player_esp then
		gui.set_cheat("enable_player_esp")
	end

	if fields.player_tracers then
		gui.set_cheat("enable_player_tracers")
	end

	if fields.xray then
		gui.set_cheat("xray")
	end

	if fields.fullbright then
		gui.set_cheat("fullbright")
	end

	if fields.hud_flags_bypass then
		gui.set_cheat("hud_flags_bypass")
	end

	if fields.node_esp then
		gui.set_cheat("enable_node_esp")
	end

	if fields.node_tracers then
		gui.set_cheat("enable_node_tracers")
	end

	if fields.no_hurt_cam then
		gui.set_cheat("no_hurt_cam")
	end

	-- Switch section

	if fields.settings then
		gui.display_settings_menu()
	end
	
	if fields.cheats then
		gui.display_cheat_menu()
	end

	-- Settings section

	if fields.set_edited then
		entity_esp_color   = fields.entity_esp_color
		player_esp_color   = fields.player_esp_color
		tool_range		   = fields.reach_value
		fastplace_interval = fields.fastplac_interval

		core.settings:set("entity_esp_color", entity_esp_color)
		core.settings:set("player_esp_color", player_esp_color)
		core.settings:set("tool_range", tool_range)
		core.settings:set("fastplace_interval", fastplace_interval)
	end
end)

minetest.register_chatcommand("gui", {
	description = "Shows and advanced formspec of hacks in DF!",

	func = function()
		gui.display_cheat_menu()
	end
})