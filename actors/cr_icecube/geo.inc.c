#include "src/game/envfx_snow.h"

const GeoLayout cr_icecube_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_SCALE(LAYER_OPAQUE, 65536),
		GEO_OPEN_NODE(),
			GEO_SHADOW(11, 128, 200),
			GEO_OPEN_NODE(),
				GEO_ANIMATED_PART(LAYER_TRANSPARENT_INTER, 0, 0, 0, cr_icecube_Icecube_DL_mesh_layer_7),
			GEO_CLOSE_NODE(),
		GEO_CLOSE_NODE(),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
