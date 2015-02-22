mount_vfs_model_path	(current_mod_path.."/Models/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_sound_path    (current_mod_path.."/Sounds")
mount_vfs_texture_path  (current_mod_path.."/Models/Textures");
mount_vfs_texture_path  (current_mod_path.."/Models/Textures/Impala-Mk2_Textures.zip");
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Resources/Model/Textures/SU-27S-CPT-TEXTURES");

dofile(current_mod_path.."/Views.lua")

local tracer_on_time = 0.02


function DEFA552(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "DEFA552-30"
	tbl.display_name	= "DEFA552-30"
	tbl.supply 	 = 
	{
		shells = {"DEFA552_30", "GSH301_30_HE"},
		mixes  = {{1,1,1,2}}, --  Calculated by weight (55 kg)
		count  = 125,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 25,
		rates 			 = {1800},
		recoil_coeff 	 = 0.7*1.3,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= {0,0,-1}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	-- tbl.drop_cartridge 			= 203		-- cartridge_30mm
	-- tbl.ejector_pos_connector = "EJECT_POINT_PORT",
	tbl.muzzle_pos				= {0,0,0}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end


Impala_Mk2_Su27Cpt = {

	Name 				=   'Impala-Mk2',
	DisplayName			= _('Impala-Mk2'),
	

	Picture 			= "Impala-Mk2.png",
	Rate 				= 20, -- RewardPoint in Multiplayer
	
	
	Shape 				= "Impala-Mk2",
	shape_table_data 	= 
	{
		{
			file  	 	= 'Impala-Mk2';
			life  	 	= 18; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'f-16-oblomok'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username	= 'Impala-Su27Cpt';
			index    	=  WSTYPE_PLACEHOLDER;
		},
		{
			name  = "f-16-oblomok";
			file  = "f-16-oblomok";
			fire  = { 240, 2};
		},
	},
	
	mapclasskey = "P0091000025",
	attribute = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Battleplanes"},
	CanopyGeometry = makeAirplaneCanopyGeometry(LOOK_AVERAGE, LOOK_AVERAGE, LOOK_AVERAGE),
	Sensors = {
		RADAR = "N-001",
		IRST = "OLS-27",
		RWR = "Abstract RWR"
	},
	Failures = {
		-- { id = 'asc', 		label = _('Su27 ASC'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'autopilot', label = _('Su27 AUTOPILOT'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'hydro',  	label = _('HYDRO'), 			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'l_engine',  label = _('L-ENGINE'), 			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'r_engine',  label = _('R-ENGINE'), 			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'radar',  	label = _('RADAR'), 			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'eos',  		label = _('EOS'), 				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'helmet',  	label = _('HELMET'), 			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'rws',  		label = _('RWS'), 				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'ecm',   	label = _('ECM'), 				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'hud',  		label = _('HUD'), 				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- { id = 'mfd',  		label = _('MFD'), 				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },		
	},
	
	
	--zero fuel weight 3090 kg (6812 lb) + crew weight: 80 kg (130 lb) + fuel weight: 1279 kg (2818 lb) = 4449 kg (-- lb) + external stores 1001 kg (--- lb) = 5450 kg (12000 lb)
	M_empty	=	3090,-- should be zero fuel weight 3090 kg (6812 lb)
	M_nominal	=	3170,-- 3090 kg (6812 lb) + crew weight: 80 kg (130 lb) --(zero fuel)
	M_max	=	5450,-- 5450 kg (12000 lb) max take-off weapon training full fuel
	M_fuel_max	=	1279,--  1279 kg (2818 lb)
	H_max	=	12000,-- m
	average_fuel_consumption	=	0.302,--kg/s -- at 20000 ft 1.5 hrs 350 nm 680 kg fuel
	CAS_min	=	58,
	V_opt	=	180,-- cruise m/s (for AI) 350 knts at 20000 ft
	V_take_off	=	46,-- Take off speed in m/s (for AI) 90 knts
	V_land	=	52,-- Landing speed in m/s (for AI) 100 knts
	has_afteburner	=	false,
	has_speedbrake	=	true,
	has_differential_stabilizer = false,
	radar_can_see_ground	=	true,
	AOA_take_off	=	0.19,
	stores_number	=	7,
	bank_angle_max	=	60,
	Ny_min	=	-2,
	Ny_max	=	6.0,
	V_max_sea_level	=	272.0,
	V_max_h	=	300.0,
	tanker_type	=	1,
	wing_area	=	19.0,
	wing_span	=	10.56,
	thrust_sum_max	=	1542.2,--2,700 lb (12 kN) MkI and 3400lb MkII (15.123 kN)
	thrust_sum_ab	=	1542.2,
	Vy_max	=	30,
	length	=	10.65,
	height	=	3.72,
	flaps_maneuver	=	0.35,
	Mach_max	=	0.75,
	range	=	1500,
	crew_size	=	1,
	RCS	=	10,
	Ny_max_e	=	7.0,
	detection_range_max	=	0,
	IR_emission_coeff	=	0.53,
	IR_emission_coeff_ab	=	0,
	engines_count	=	1,
	wing_tip_pos 				=  {-1.7327795029,	-0.0811055303, 3.1946589947}, -- wingtip coords for visual effects
	
----------------- SUSPENSION CODE
	nose_gear_pos 				= {3.5691142082, -1.1750620604,	0},   -- nosegear coord 
	nose_gear_amortizer_direct_stroke   		=  0,  -- down from nose_gear_pos !!!
	nose_gear_amortizer_reversal_stroke  		= -0.1954704523,  -- up 
	nose_gear_amortizer_normal_weight_stroke 	= -0.0266996622,   -- up 
	
	main_gear_pos 						 	 = {-0.7076835632  ,-1.3286322355 , 1.155880928}, -- main gear coords 
	main_gear_amortizer_direct_stroke	 	 =   0, --  down from main_gear_pos !!!
	main_gear_amortizer_reversal_stroke  	 = 	-0.3204455376, --  up 
	main_gear_amortizer_normal_weight_stroke =  -0.1674115658,-- down from main_gear_pos
	
	nose_gear_wheel_diameter 	= 0.36, -- in m
	main_gear_wheel_diameter 	= 0.53, -- in m
	
	tand_gear_max	=	0.577,
----------------- SUSPENSION CODE


	
	engines_nozzles = {
		[1] = 
		{
			pos 		=  {-5.9917421341,	0.0665695071,	0.0000000076}, -- nozzle coords
			elevation   =  0, -- AFB cone elevation
			diameter	 = 0.112, -- AFB cone diameter
			exhaust_length_ab   = 7, -- lenght in m
			exhaust_length_ab_K = 0.76, -- AB animation
			smokiness_level     = 	0.01, 
		}, -- end of [1]
	}, -- end of engines_nozzles
	crew_size	 = 1,
	crew_members = 
	{
		[1] = 
		{
			ejection_seat_name = "Imp_Pilot+Ejectionseat",
			drop_canopy_name   = "Impala-Mk2_canopy",
			pilot_name		   = "Imp_Pilot",




			pos =  {2.1672549248, 0.3370463252,0},
			canopy_ejection_dir = {0.0,0.5,0}

		}, -- end of [1]
	}, -- end of crew_members
	
	fires_pos = 
		{

			[1] = 	{-2.117,	-0.9,	0},
			[2] = 	{-1.584,	0.176,	2.693},

			[3] = 	{-1.645,	0.213,	-2.182},
			[4] = 	{-0.82,	0.265,	2.774},
			[5] = 	{-0.82,	0.265,	-2.774},
			[6] = 	{-0.82,	0.255,	4.274},
			[7] = 	{-0.82,	0.255,	-4.274},
			[8] = 	{-6.548,	-0.248,	0},
			[9] = 	{-6.548,	-0.248,	0},
			[10] = 	{0.304,	-0.748,	0.442},
			[11] = 	{0.304,	-0.748,	-0.442},
		}, -- end of fires_pos
	
	-- net_animation = { 420 --[[external_model_throttle_arg]]},
	
	-- Countermeasures
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 4,
	ChaffDefault 			= 0, 
	ChaffChargeSize 		= 1,
	FlareDefault 			= 0, 
	FlareChargeSize 		= 1,
	CMDS_Edit 				= true,
	chaff_flare_dispenser 	= {
		[1] = 
		{
			dir =  {0, -1, -1},
			pos =  {-3, -1, 2},
		}, -- end of [1]
		[2] = 
		{
			dir =  {0, -1, 1},
			pos =  {-3, -1, -2},
		}, -- end of [2]
	}, -- end of chaff_flare_dispenser
	
	detection_range_max		 = 0,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	
	HumanRadio = {
			frequency = 124.0,
			editable = true,
			minFrequency = 100.000,
			maxFrequency = 156.000,
			modulation = MODULATION_AM
	},

	Guns = {
			DEFA552({muzzle_pos_connector = "GUN_POINT_PORT",	  effect_arg_number = 350,						azimuth_initial = 0, elevation_initial = 0, supply_position = {0.812681675, -0.5199159384, 0.0}, ejector_pos = {0.812681675, -0.5199159384, 0.343829751}}),--{-1.67, -0.07, -0.07}}),
			DEFA552({muzzle_pos_connector = "GUN_POINT_STARBOARD",	  effect_arg_number = 350,						azimuth_initial = 0, elevation_initial = 0, supply_position = {0.812681675, -0.5199159384, 0.0}, ejector_pos = {0.812681675, -0.5199159384, -0.343829751}}),--{-1.67, -0.07, -0.07}}),
			-- nr23({muzzle_pos_connector = "Gun_point_3",	  effect_arg_number = 433, mixes = {{2,1,1,1}},	azimuth_initial = 0, elevation_initial = 0, supply_position = {2.436, -0.4, 0.0}, ejector_pos = {0.0, 0.0 ,0.0}}),	-- FRONT
			-- nr23({muzzle_pos_connector = "Gun_point_007", effect_arg_number = 432, mixes = {{1,1,2,1}},	azimuth_initial = 0, elevation_initial = 0, supply_position = {1.866, -0.47, 0.0}, ejector_pos = {0.0, 0.0 ,0.0}}),	-- REAR
			},
	
	Pylons =     {
        pylon(1, 0, 0, 0, 0,
			{
				use_full_connector_position=true,
				connector = "PYLON_1",
				arg = 310 ,arg_value = 0,
			},
			{
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" }, --    LAU-61 - 19 2.75' rockets MK151 HE
				{ CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}" },--FAB-250
				{ CLSID = "{0511E528-EA28-4caf-A212-00D1408DF10A}" },--SAB-100
            }
        ),
        pylon(2, 0, 0, 0, 0,
			{
				use_full_connector_position=true,
				connector = "PYLON_2",
				arg = 311 ,arg_value = 0,
			},
			{
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" }, --    LAU-61 - 19 2.75' rockets MK151 HE
				{ CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}" },--FAB-250
				{ CLSID = "{0511E528-EA28-4caf-A212-00D1408DF10A}" },--SAB-100
            }
        ),
        pylon(3, 0, 0, 0, 0,
			{
				use_full_connector_position=true,
				connector = "PYLON_3",
				arg = 312 ,arg_value = 0,
			},
			{
				{ CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}" }, --    UPK-23-250 Gun Pod
				{ CLSID = "{3DFB7320-AB0E-11d7-9897-000476191836}" },--B-8M1 - 20 S-8TsM
				{ CLSID = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}" },--B-8M1 - 20 S-8KOM
            }
        ),
        pylon(4, 0, 0.000000, 0, 0.000000,
            {
				use_full_connector_position=true,
				connector = "PYLON_4",
				arg = 316,
				arg_value = -1.0
            },
            {
				-- { CLSID = "{Station-Pylons}" }, -- Station-Pylons
				{ CLSID	= "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}" }, --	Red Smoke
				{ CLSID	= "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}" }, --	White Smoke 
				{ CLSID	= "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}" }, --	Blue Smoke
				{ CLSID	= "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}" }, --	green Smoke
				{ CLSID	= "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}" }, --	yellow Smoke
				{ CLSID	= "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}" }, --	orange Smoke
            }
        ),
        pylon(5, 0, 0, 0, 0,
            {
				use_full_connector_position=true,
				connector = "PYLON_5",
				arg = 313 ,arg_value = 0,
            },
            {
				{ CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}" }, --    UPK-23-250 Gun Pod
				{ CLSID = "{3DFB7320-AB0E-11d7-9897-000476191836}" },--B-8M1 - 20 S-8TsM
				{ CLSID = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}" },--B-8M1 - 20 S-8KOM
            }
        ),
        pylon(6, 0, 0, 0, 0,
			{
				use_full_connector_position=true,
				connector = "PYLON_6",
				arg = 314 ,arg_value = 0,
			},
			{
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" }, --    LAU-61 - 19 2.75' rockets MK151 HE
				{ CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}" },--FAB-250
				{ CLSID = "{0511E528-EA28-4caf-A212-00D1408DF10A}" },--SAB-100
            }
        ),
        pylon(7, 0, 0, 0, 0,
            {
				use_full_connector_position=true,
				connector = "PYLON_7",
				arg = 315 ,arg_value = 0,
            },
            {
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" }, --    LAU-61 - 19 2.75' rockets MK151 HE
				{ CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}" },--FAB-250
				{ CLSID = "{0511E528-EA28-4caf-A212-00D1408DF10A}" },--SAB-100
            }
        ),
	},
	
	Tasks = {
        aircraft_task(CAS),
        aircraft_task(CAP),
        aircraft_task(Intercept),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(AFAC),
        aircraft_task(GroundAttack),
        aircraft_task(RunwayAttack),
    },	
	DefaultTask = aircraft_task(CAS),
	
	SFM_Data = {
		aerodynamics = 
		{
			Cy0	=	0,
			Mzalfa	=	4.355,
			Mzalfadt	=	0.8,
			kjx = 2.25,
			kjz = 0.00125,
			Czbe = -0.016,
			cx_gear = 0.12,
			cx_flap = 0.1,
			cy_flap = 0.31,
			cx_brk = 0.08,
			table_data = {
			--      M		Cx0		 Cya		 B		 B4	      Omxmax	Aldop	Cymax

					{0.0,	0.0224,	0.05,		0.1079,	0.07,		3.0,	40,		1.33,	},
					{0.1,	0.0214,	0.075,		0.1079,	0.07,		3.0,	35,		1.33,   },
					{0.2,	0.0209,	0.075,		0.1079,	0.07,		3.0,	30,		1.3,    },
					{0.3,	0.0204,	0.078,		0.1079,	0.07,		3.0,	30,		1.3,    },
					{0.4,	0.0204,	0.079,		0.1079,	0.07,		3.1,	30,		1.3,    },
					{0.5,	0.0204,	0.08,		0.1079,	0.07,		3.2,	30,		1.3,    },
					{0.6,	0.0204,	0.082,		0.1079,	0.07,		3.2,	30,		1.2,    },
					{0.7,	0.0204,	0.085,		0.1079,	0.07,		3.5,	25,		1.1,    },
					{0.8,	0.0206,	0.085,		0.1089,	0.018,		3.5,	20,  	1.0,    },
					{0.9,	0.0313,	0.085,		0.11,	0.02,		3.5,	20,  	1.0,    },
					{0.95,	0.0400,	0.07,		0.107,	0.03,		3.5,	18,	    1.0,	},
					{1.0,	0.0472,	0.085,		0.12,	0.034,		3.5,	20,  	1.0,    },
					{1.1,	0.0489,	0.085,		0.2772,	0.134,		3.5,	20,  	1.0,    },
					{1.2,	0.0460,	0.085,		0.5,	0.28,		3.5,	20,  	1.0,    },
					{1.3,	0.0423,	0.085,		0.44,	0.3,		3.5,	15,		1.0		},
					{2.5,	0.0268,	0.085,		0.5,	0.32,		3.5,	20,  	1.0,    },
					{3.9,	0.027,	0.085,		0.56,	0.4,		3.5,	20,  	1.0,    },
			}
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	55.0, -- 67.5
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	1,
			ForsRUD	=	1,
			typeng	=	0,
			hMaxEng	=	15.5, -- 30.5
			dcx_eng	=	0.0015,
			cemax	=	0.37,
			cefor	=	0.37,
			dpdh_m	=	1800,
			dpdh_f	=	1800,
			table_data = 
			{
			--   M			Pmax
				{0.0,		21750.0}, --16000
				{0.1,		21000.0}, --21000
				{0.2,		20000.0}, --25000
				{0.3,		19430.0}, --28000
				{0.4,		18760.0}, --29700
				{0.5,		18080.0}, --30500
				{0.6,		17500.0}, --31000
				{0.7,		17110.0}, --30000
				{0.8,		16920.0}, --25000
				{0.90,		15570.0}, --23000
				{0.95,		15000.0}, --23000
				{1.0,		14410.0}, --42000
				{1.1,		13250.0}, --38000
				{1.2,		11510.0}, --30000
				{1.3,		8500.0}, --10000
				{2.5,		5700.0}, --10000
				{3.9,		3000.0}, --10000
			}, -- end of table_data
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	},
	
	Damage = {
	},
	
	DamageParts = 
	{  
	},
	
	Failures = {
	},
	
	lights_data = {
		typename = "collection",
		lights = {
			[1] = { typename = "collection", -- nav lights
				lights = {
							{typename = "omnilight",connector = "BANO_1",color = {0.99, 0.0, 0.22},pos_correction = {0, 0, 0},argument = 202}, -- left nav
						 }
					},
			[2] = { typename = "collection", -- nav lights
				lights = {
							{typename = "omnilight",connector = "BANO_2",color = {0.0, 0.99, 0.75},pos_correction = {0, 0, 0},argument = 203}, -- right nav
						 }
					},
			[3] = { typename = "collection", -- nav lights
				lights = {
							{typename = "omnilight",connector = "BANO_3",color = {0.95, 0.95, 0.95},pos_correction = {0, 0, 0},argument = 211}, -- tail nav
						 }
					},
			[4] = { typename = "collection", -- red strobe
				lights = {
							{typename = "natostrobelight",connector = "RED_BEACON",argument_1 = 204,period = 1.0,color = {1.0, 0.0, 0.0},phase_shift = 0.0},
						 }
					},
			[5] = { typename = "collection", -- land light -- left
				lights = {
							{typename = "spotlight",connector = "MAIN_SPOT_PTR_01",argument = 212,color = {1.0, 1.0, 0.7},dir_correction = {elevation = math.rad(25)}}, -- 10 looks ok
						 }
					},
			[6] = { typename = "collection", -- land light
				lights = {
							{typename = "spotlight",connector = "MAIN_SPOT_PTR_02",argument = 213,color = {1.0, 1.0, 0.7},dir_correction = {elevation = math.rad(25)}}, -- 10 looks ok
						 }
					},
			[7] = { typename = "collection", -- taxi light -- left
				lights = {
							{typename = "spotlight",connector = "MAIN_SPOT_PTR_01",argument = 212,color = {0.3, 0.3, 0.2},dir_correction = {elevation = math.rad(25)}}, -- 10 looks ok
						 }
					},
			[8] = { typename = "collection", -- taxi light
				lights = {
							{typename = "spotlight",connector = "MAIN_SPOT_PTR_02",argument = 213,color = {0.3, 0.3, 0.2},dir_correction = {elevation = math.rad(25)}}, -- 10 looks ok
						 }
					},
		}
	}, -- end lights_data

	
	ViewSettings = ViewSettings,
	SnapViews	 = SnapViews,
	
	Countries = {"Russia","Ukraine","Germany","USA","Italy",
	"UK","Turkey","Canada","France","Spain","Belgium","The Netherlands","Norway",
	"Denmark","Georgia","Israel","Australia","Abkhazia"}
}

add_aircraft(Impala_Mk2_Su27Cpt)


