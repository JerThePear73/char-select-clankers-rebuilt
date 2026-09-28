#include "src/game/envfx_snow.h"

const GeoLayout cr_particle_snowflake_Anim_Switch_opt1[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_ALPHA, cr_particle_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow2_0),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout cr_particle_snowflake_Anim_Switch_opt2[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_ALPHA, cr_particle_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow3_1),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout cr_particle_snowflake_Anim_Switch_opt3[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_ALPHA, cr_particle_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow4_2),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout cr_particle_snowflake_Anim_Switch_opt4[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_ALPHA, cr_particle_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow5_3),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout cr_particle_snowflake_Anim_Switch_opt5[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_ALPHA, cr_particle_snowflake_Snowflake_DL_mesh_layer_4_mat_override_snow6_4),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout cr_particle_snowflake_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_SWITCH_CASE(9, geo_switch_anim_state),
		GEO_OPEN_NODE(),
			GEO_NODE_START(),
			GEO_OPEN_NODE(),
				GEO_DISPLAY_LIST(LAYER_ALPHA, cr_particle_snowflake_Snowflake_DL_mesh_layer_4),
			GEO_CLOSE_NODE(),
			GEO_BRANCH(1, cr_particle_snowflake_Anim_Switch_opt1),
			GEO_BRANCH(1, cr_particle_snowflake_Anim_Switch_opt2),
			GEO_BRANCH(1, cr_particle_snowflake_Anim_Switch_opt3),
			GEO_BRANCH(1, cr_particle_snowflake_Anim_Switch_opt4),
			GEO_BRANCH(1, cr_particle_snowflake_Anim_Switch_opt5),
		GEO_CLOSE_NODE(),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
