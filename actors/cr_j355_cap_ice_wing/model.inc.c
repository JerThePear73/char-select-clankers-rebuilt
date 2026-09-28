Gfx cr_j355_cap_ice_wing_j355_arm_segment_ice_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_j355_cap_ice_wing_j355_arm_segment_ice_rgba16[] = {
	#include "actors/cr_j355_cap_ice_wing/j355_arm_segment_ice.rgba16.inc.c"
};

Gfx cr_j355_cap_ice_wing_jess_ice_new_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_j355_cap_ice_wing_jess_ice_new_rgba16[] = {
	#include "actors/cr_j355_cap_ice_wing/jess_ice_new.rgba16.inc.c"
};

Gfx cr_j355_cap_ice_wing_wing_ice_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_j355_cap_ice_wing_wing_ice_rgba16[] = {
	#include "actors/cr_j355_cap_ice_wing/wing_ice.rgba16.inc.c"
};

Vtx cr_j355_cap_ice_wing_Bulb_DL_mesh_layer_7_vtx_0[4] = {
	{{ {5, 5, 1}, 0, {1000, -8}, {0, 0, 127, 255} }},
	{{ {-5, 5, 1}, 0, {-8, -8}, {0, 0, 127, 255} }},
	{{ {-5, -5, 1}, 0, {-8, 1000}, {0, 0, 127, 255} }},
	{{ {5, -5, 1}, 0, {1000, 1000}, {0, 0, 127, 255} }},
};

Gfx cr_j355_cap_ice_wing_Bulb_DL_mesh_layer_7_tri_0[] = {
	gsSPVertex(cr_j355_cap_ice_wing_Bulb_DL_mesh_layer_7_vtx_0 + 0, 4, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSPEndDisplayList(),
};

Vtx cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_vtx_0[61] = {
	{{ {-61, 7, 53}, 0, {508, 1788}, {160, 206, 67, 255} }},
	{{ {-42, 25, 60}, 0, {764, 1788}, {186, 254, 106, 255} }},
	{{ {-61, 23, 0}, 0, {764, 1532}, {134, 35, 0, 255} }},
	{{ {-78, 5, 0}, 0, {508, 1532}, {140, 204, 0, 255} }},
	{{ {-61, 7, -53}, 0, {508, 1788}, {160, 206, 189, 255} }},
	{{ {-42, 25, -60}, 0, {764, 1788}, {186, 254, 150, 255} }},
	{{ {-42, 25, 60}, 0, {636, -132}, {186, 254, 106, 255} }},
	{{ {-61, 7, 53}, 0, {508, -260}, {160, 206, 67, 255} }},
	{{ {21, 9, 75}, 0, {508, -4}, {30, 183, 99, 255} }},
	{{ {1, 49, 75}, 0, {764, -4}, {5, 43, 119, 255} }},
	{{ {62, 5, 47}, 0, {508, 252}, {53, 155, 56, 255} }},
	{{ {72, 34, 57}, 0, {764, 252}, {92, 6, 88, 255} }},
	{{ {83, 36, 0}, 0, {764, 508}, {123, 31, 0, 255} }},
	{{ {75, 1, 0}, 0, {508, 508}, {73, 152, 0, 255} }},
	{{ {16, 16, 0}, 0, {252, 508}, {248, 129, 0, 255} }},
	{{ {21, 9, 75}, 0, {252, 252}, {30, 183, 99, 255} }},
	{{ {-61, 7, 53}, 0, {-4, 252}, {160, 206, 67, 255} }},
	{{ {-78, 5, 0}, 0, {-4, 508}, {140, 204, 0, 255} }},
	{{ {-61, 7, -53}, 0, {-4, 252}, {160, 206, 189, 255} }},
	{{ {21, 9, -75}, 0, {252, 252}, {30, 183, 157, 255} }},
	{{ {62, 5, -47}, 0, {508, 252}, {53, 155, 200, 255} }},
	{{ {72, 34, -57}, 0, {764, 252}, {92, 6, 168, 255} }},
	{{ {1, 49, -75}, 0, {764, -4}, {5, 43, 137, 255} }},
	{{ {21, 9, -75}, 0, {508, -4}, {30, 183, 157, 255} }},
	{{ {-42, 25, -60}, 0, {636, -132}, {186, 254, 150, 255} }},
	{{ {-61, 7, -53}, 0, {508, -260}, {160, 206, 189, 255} }},
	{{ {63, 53, -46}, 0, {1020, 252}, {66, 97, 208, 255} }},
	{{ {63, 53, 46}, 0, {1020, 252}, {66, 97, 48, 255} }},
	{{ {37, 65, 0}, 0, {1020, 508}, {38, 121, 0, 255} }},
	{{ {-36, 82, 0}, 0, {1276, 508}, {245, 127, 0, 255} }},
	{{ {-13, 69, -55}, 0, {1276, 252}, {6, 112, 197, 255} }},
	{{ {-56, 61, -57}, 0, {1532, 252}, {171, 49, 176, 255} }},
	{{ {-36, 82, 0}, 0, {1276, 508}, {245, 127, 0, 255} }},
	{{ {-56, 61, -57}, 0, {1532, 252}, {171, 49, 176, 255} }},
	{{ {-73, 69, 0}, 0, {1532, 508}, {144, 60, 0, 255} }},
	{{ {-56, 61, 57}, 0, {1532, 252}, {171, 49, 80, 255} }},
	{{ {-13, 69, 55}, 0, {1276, 252}, {6, 112, 59, 255} }},
	{{ {63, 53, 46}, 0, {1020, 252}, {66, 97, 48, 255} }},
	{{ {37, 65, 0}, 0, {1020, 508}, {38, 121, 0, 255} }},
	{{ {83, 36, 0}, 0, {764, 508}, {123, 31, 0, 255} }},
	{{ {72, 34, 57}, 0, {764, 252}, {92, 6, 88, 255} }},
	{{ {1, 49, 75}, 0, {764, -4}, {5, 43, 119, 255} }},
	{{ {-13, 69, 55}, 0, {1020, -4}, {6, 112, 59, 255} }},
	{{ {-56, 61, 57}, 0, {1020, -260}, {171, 49, 80, 255} }},
	{{ {-42, 25, 60}, 0, {764, -260}, {186, 254, 106, 255} }},
	{{ {-56, 61, 57}, 0, {4873, 32}, {171, 49, 80, 255} }},
	{{ {-61, 23, 0}, 0, {-260, 1713}, {134, 35, 0, 255} }},
	{{ {-42, 25, 60}, 0, {5130, 1643}, {186, 254, 106, 255} }},
	{{ {-73, 69, 0}, 0, {-260, -364}, {144, 60, 0, 255} }},
	{{ {-56, 61, -57}, 0, {4873, 32}, {171, 49, 176, 255} }},
	{{ {-42, 25, -60}, 0, {5130, 1643}, {186, 254, 150, 255} }},
	{{ {1, 49, -75}, 0, {764, -4}, {5, 43, 137, 255} }},
	{{ {-42, 25, -60}, 0, {764, -260}, {186, 254, 150, 255} }},
	{{ {-56, 61, -57}, 0, {1020, -260}, {171, 49, 176, 255} }},
	{{ {-13, 69, -55}, 0, {1020, -4}, {6, 112, 197, 255} }},
	{{ {63, 53, -46}, 0, {1020, 252}, {66, 97, 208, 255} }},
	{{ {44, 60, 8}, 0, {764, 3043}, {12, 26, 124, 255} }},
	{{ {59, 93, 0}, 0, {764, 20}, {52, 116, 0, 255} }},
	{{ {37, 64, 0}, 0, {16, 3043}, {155, 77, 0, 255} }},
	{{ {52, 57, 0}, 0, {1511, 3043}, {124, 231, 0, 255} }},
	{{ {44, 60, -8}, 0, {764, 3043}, {12, 26, 132, 255} }},
};

Gfx cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_tri_0[] = {
	gsSPVertex(cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_vtx_0 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 3, 2, 0, 4, 2, 5, 0),
	gsSP2Triangles(6, 7, 8, 0, 6, 8, 9, 0),
	gsSP2Triangles(10, 9, 8, 0, 10, 11, 9, 0),
	gsSP2Triangles(12, 11, 10, 0, 12, 10, 13, 0),
	gsSP2Triangles(14, 13, 10, 0, 14, 10, 15, 0),
	gsSP2Triangles(14, 15, 16, 0, 14, 16, 17, 0),
	gsSP2Triangles(14, 17, 18, 0, 14, 18, 19, 0),
	gsSP2Triangles(14, 19, 20, 0, 14, 20, 13, 0),
	gsSP2Triangles(12, 13, 20, 0, 12, 20, 21, 0),
	gsSP2Triangles(20, 22, 21, 0, 20, 23, 22, 0),
	gsSP2Triangles(23, 24, 22, 0, 23, 25, 24, 0),
	gsSP2Triangles(26, 21, 22, 0, 12, 21, 26, 0),
	gsSP2Triangles(12, 26, 27, 0, 27, 26, 28, 0),
	gsSP2Triangles(29, 28, 26, 0, 29, 26, 30, 0),
	gsSP1Triangle(29, 30, 31, 0),
	gsSPVertex(cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_vtx_0 + 32, 29, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(0, 3, 4, 0, 0, 4, 5, 0),
	gsSP2Triangles(0, 5, 6, 0, 7, 5, 8, 0),
	gsSP2Triangles(5, 9, 8, 0, 5, 10, 9, 0),
	gsSP2Triangles(9, 10, 11, 0, 9, 11, 12, 0),
	gsSP2Triangles(13, 14, 15, 0, 13, 16, 14, 0),
	gsSP2Triangles(17, 14, 16, 0, 17, 18, 14, 0),
	gsSP2Triangles(19, 20, 21, 0, 19, 21, 22, 0),
	gsSP2Triangles(23, 19, 22, 0, 24, 25, 26, 0),
	gsSP2Triangles(27, 25, 24, 0, 28, 25, 27, 0),
	gsSP1Triangle(26, 25, 28, 0),
	gsSPEndDisplayList(),
};

Vtx cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_vtx_1[8] = {
	{{ {-14, 100, 96}, 0, {-16, -16}, {227, 183, 100, 255} }},
	{{ {7, 39, 48}, 0, {-16, 1008}, {218, 173, 88, 255} }},
	{{ {102, 20, 71}, 0, {2032, 1008}, {227, 183, 100, 255} }},
	{{ {89, 133, 132}, 0, {2032, -16}, {238, 195, 110, 255} }},
	{{ {-14, 100, -96}, 0, {-16, -16}, {227, 183, 156, 255} }},
	{{ {102, 20, -71}, 0, {2032, 1008}, {227, 183, 156, 255} }},
	{{ {7, 39, -48}, 0, {-16, 1008}, {218, 173, 168, 255} }},
	{{ {89, 133, -132}, 0, {2032, -16}, {238, 195, 146, 255} }},
};

Gfx cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_tri_1[] = {
	gsSPVertex(cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_vtx_1 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 7, 5, 0),
	gsSPEndDisplayList(),
};


Gfx mat_cr_j355_cap_ice_wing_Ice_Cutout[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_j355_cap_ice_wing_j355_arm_segment_ice_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_cr_j355_cap_ice_wing_Ice_Cutout[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_cr_j355_cap_ice_wing_Ice_Env_Map[] = {
	gsSPGeometryMode(G_SHADE, G_TEXTURE_GEN),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0),
	gsSPTexture(4032, 4032, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_j355_cap_ice_wing_jess_ice_new_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_cr_j355_cap_ice_wing_Ice_Env_Map[] = {
	gsSPGeometryMode(G_TEXTURE_GEN, G_SHADE),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_cr_j355_cap_ice_wing_Ice_Wing[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0, 0, 0, 0, TEXEL0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_j355_cap_ice_wing_wing_ice_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 2047, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_cr_j355_cap_ice_wing_Ice_Wing[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx cr_j355_cap_ice_wing_Bulb_DL_mesh_layer_7[] = {
	gsSPDisplayList(mat_cr_j355_cap_ice_wing_Ice_Cutout),
	gsSPDisplayList(cr_j355_cap_ice_wing_Bulb_DL_mesh_layer_7_tri_0),
	gsSPDisplayList(mat_revert_cr_j355_cap_ice_wing_Ice_Cutout),
	gsSPEndDisplayList(),
};

Gfx cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7[] = {
	gsSPDisplayList(mat_cr_j355_cap_ice_wing_Ice_Env_Map),
	gsSPDisplayList(cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_tri_0),
	gsSPDisplayList(mat_revert_cr_j355_cap_ice_wing_Ice_Env_Map),
	gsSPDisplayList(mat_cr_j355_cap_ice_wing_Ice_Wing),
	gsSPDisplayList(cr_j355_cap_ice_wing_Ice_Wing_Cap_DL_mesh_layer_7_tri_1),
	gsSPDisplayList(mat_revert_cr_j355_cap_ice_wing_Ice_Wing),
	gsSPEndDisplayList(),
};

Gfx cr_j355_cap_ice_wing_material_revert_render_settings[] = {
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, 0),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP  | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, 0),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 256, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 256, 1, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(1, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

