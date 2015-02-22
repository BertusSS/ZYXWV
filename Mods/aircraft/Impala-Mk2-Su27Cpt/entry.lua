local self_ID  = "The Impala-Mk2 with Su27 Cockpit by Anubis"

declare_plugin(self_ID,
{
image     	 = "A-10C.bmp",
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,

version		 = "1.2.8",		 
state		 = "installed",
info		 = _("The Impala-Mk2 with Su27 Cockpit."),

InputProfiles =
{
    ["Impala-Su27Cpt"]      = current_mod_path .. '/Input',
},


-- Skins	= 
	-- {
		-- {
			-- name	= _("A-10C"),
			-- dir		= "Skins/1"
		-- },
	-- },
	
-- Missions =
	-- {
		-- {
			-- name		= _("A-10C"),
			-- dir			= "Missions",	
		-- },
	-- },	

	--[[
Options = 
	{
		{
			name		= "A-10C",
			dir			= "Options"
		},
	},	]]
LogBook =
	{
		{
			name		= _("Impala-Mk2"),
			type		= "Impala-Mk2",
		},
	},	
})

--mount_vfs_liveries_path(current_mod_path .. "/Liveries")
--mount_vfs_texture_path(current_mod_path ..  "/Skins/1/ME")--for simulator loading window
mount_vfs_model_path	(current_mod_path.."/Models/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Models/Textures/Impala-Mk2_Textures.zip");

dofile(current_mod_path..'/Impala_Mk2_Su27Cpt.lua')

-- local cfg_path = current_mod_path ..  "/FM/Impala-Mk1/config.lua"
-- dofile(cfg_path)

local support_cockpit = current_mod_path..'/Cockpit/KneeboardLeft/'
----------------------------------------------------------------------------------------
make_flyable('Impala-Mk2',support_cockpit,{nil, old = 3},current_mod_path..'/comm.lua')--make_flyable(obj_name,optional_cockpit path,optional_fm = {mod_of_fm_origin,dll_with_fm})
----------------------------------------------------------------------------------------

-- dofile(current_mod_path..'/Station-Pylons.lua')

plugin_done()