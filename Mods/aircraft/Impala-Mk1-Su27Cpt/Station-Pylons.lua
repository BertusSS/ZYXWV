local Station_Pylons = {
category = CAT_PODS
}

declare_weapon(Station_Pylons)

declare_loadout (
		{
			category = CAT_PODS,
			CLSID = "{Station-Pylons}",
			Picture = "Station-Pylons.png",
			Count = 1,
			Weight_Empty = 20,
			Weight = 20,
			Cx_pil = 0.0015,
			attribute = { wsType_Air , wsType_Free_Fall , wsType_FuelTank , WSTYPE_PLACEHOLDER },
			shape_table_data = {
				{
					name = "Imp_Station_Pylons";
					file = "Station-Pylons";
					life = 60;
					fire = { 0, 1 };
					username = "Station Pylons";
					index = WSTYPE_PLACEHOLDER;
				},
			},
			Elements = {
				{
					Position = { 0, 0, 0 },
					ShapeName = "Station-Pylons",
				},
			},
			displayName = "Station Pylons",
		}
	)

