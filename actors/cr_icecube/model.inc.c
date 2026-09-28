Gfx cr_icecube_ice_cube_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_icecube_ice_cube_rgba16[] = {
	#include "actors/cr_icecube/ice_cube.rgba16.inc.c"
};

Vtx cr_icecube_Icecube_DL_mesh_layer_7_vtx_0[24] = {
	{{ {-100, 0, 100}, 0, {1008, 1008}, {129, 0, 0, 255} }},
	{{ {-100, 200, 100}, 0, {1008, -16}, {129, 0, 0, 255} }},
	{{ {-100, 200, -100}, 0, {-16, -16}, {129, 0, 0, 255} }},
	{{ {-100, 0, -100}, 0, {-16, 1008}, {129, 0, 0, 255} }},
	{{ {100, 0, 100}, 0, {1008, 1008}, {0, 0, 127, 255} }},
	{{ {-100, 200, 100}, 0, {-16, -16}, {0, 0, 127, 255} }},
	{{ {-100, 0, 100}, 0, {-16, 1008}, {0, 0, 127, 255} }},
	{{ {100, 200, 100}, 0, {1008, -16}, {0, 0, 127, 255} }},
	{{ {-100, 0, -100}, 0, {-16, -16}, {0, 129, 0, 255} }},
	{{ {100, 0, 100}, 0, {1008, 1008}, {0, 129, 0, 255} }},
	{{ {-100, 0, 100}, 0, {1008, -16}, {0, 129, 0, 255} }},
	{{ {100, 0, -100}, 0, {-16, 1008}, {0, 129, 0, 255} }},
	{{ {100, 200, -100}, 0, {1008, 1008}, {0, 127, 0, 255} }},
	{{ {-100, 200, -100}, 0, {1008, -16}, {0, 127, 0, 255} }},
	{{ {-100, 200, 100}, 0, {-16, -16}, {0, 127, 0, 255} }},
	{{ {100, 200, 100}, 0, {-16, 1008}, {0, 127, 0, 255} }},
	{{ {-100, 0, -100}, 0, {1008, 1008}, {0, 0, 129, 255} }},
	{{ {-100, 200, -100}, 0, {1008, -16}, {0, 0, 129, 255} }},
	{{ {100, 200, -100}, 0, {-16, -16}, {0, 0, 129, 255} }},
	{{ {100, 0, -100}, 0, {-16, 1008}, {0, 0, 129, 255} }},
	{{ {100, 0, -100}, 0, {1008, 1008}, {127, 0, 0, 255} }},
	{{ {100, 200, 100}, 0, {-16, -16}, {127, 0, 0, 255} }},
	{{ {100, 0, 100}, 0, {-16, 1008}, {127, 0, 0, 255} }},
	{{ {100, 200, -100}, 0, {1008, -16}, {127, 0, 0, 255} }},
};

Gfx cr_icecube_Icecube_DL_mesh_layer_7_tri_0[] = {
	gsSPVertex(cr_icecube_Icecube_DL_mesh_layer_7_vtx_0 + 0, 24, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 7, 5, 0),
	gsSP2Triangles(8, 9, 10, 0, 8, 11, 9, 0),
	gsSP2Triangles(12, 13, 14, 0, 12, 14, 15, 0),
	gsSP2Triangles(16, 17, 18, 0, 16, 18, 19, 0),
	gsSP2Triangles(20, 21, 22, 0, 20, 23, 21, 0),
	gsSPEndDisplayList(),
};


Gfx mat_cr_icecube_Ice_Cube[] = {
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_icecube_ice_cube_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx cr_icecube_Icecube_DL_mesh_layer_7[] = {
	gsSPDisplayList(mat_cr_icecube_Ice_Cube),
	gsSPDisplayList(cr_icecube_Icecube_DL_mesh_layer_7_tri_0),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

