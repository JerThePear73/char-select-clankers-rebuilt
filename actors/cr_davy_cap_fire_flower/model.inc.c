Lights1 cr_davy_cap_fire_flower_Magma_Flower_Stem_lights = gdSPDefLights1(
	0x2E, 0x12, 0x9,
	0x64, 0x2F, 0x1E, 0x28, 0x28, 0x28);

Lights1 cr_davy_cap_fire_flower_Magma_Flower_Leaf_lights = gdSPDefLights1(
	0x2E, 0x12, 0x9,
	0x64, 0x2F, 0x1E, 0x28, 0x28, 0x28);

Gfx cr_davy_cap_fire_flower_DavyMagma_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_davy_cap_fire_flower_DavyMagma_rgba16[] = {
	#include "actors/cr_davy_cap_fire_flower/DavyMagma.rgba16.inc.c"
};

Gfx cr_davy_cap_fire_flower_fiyahflowereyes_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_davy_cap_fire_flower_fiyahflowereyes_rgba16[] = {
	#include "actors/cr_davy_cap_fire_flower/fiyahflowereyes.rgba16.inc.c"
};

Gfx cr_davy_cap_fire_flower_FlowerLeaves_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_davy_cap_fire_flower_FlowerLeaves_rgba16[] = {
	#include "actors/cr_davy_cap_fire_flower/FlowerLeaves.rgba16.inc.c"
};

Vtx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_vtx_0[21] = {
	{{ {0, 0, -55}, 0, {112, 368}, {253, 210, 138, 255} }},
	{{ {0, 0, 42}, 0, {368, 368}, {9, 206, 116, 255} }},
	{{ {-48, 0, -6}, 0, {240, 496}, {175, 96, 239, 255} }},
	{{ {48, 0, -6}, 0, {624, 752}, {55, 145, 228, 255} }},
	{{ {0, 0, -55}, 0, {624, 880}, {253, 210, 138, 255} }},
	{{ {0, 73, -27}, 0, {624, 880}, {255, 40, 136, 255} }},
	{{ {-48, 0, -6}, 0, {624, 752}, {175, 96, 239, 255} }},
	{{ {-21, 73, -6}, 0, {624, 752}, {152, 20, 186, 255} }},
	{{ {0, 166, -20}, 0, {624, 880}, {4, 170, 162, 255} }},
	{{ {-13, 166, -6}, 0, {624, 752}, {186, 150, 5, 255} }},
	{{ {21, 73, -6}, 0, {624, 752}, {102, 26, 70, 255} }},
	{{ {13, 166, -6}, 0, {624, 752}, {74, 154, 16, 255} }},
	{{ {0, 0, 42}, 0, {624, 368}, {9, 206, 116, 255} }},
	{{ {48, 0, -6}, 0, {624, 496}, {55, 145, 228, 255} }},
	{{ {21, 73, -6}, 0, {624, 496}, {102, 26, 70, 255} }},
	{{ {0, 73, 15}, 0, {624, 368}, {255, 40, 120, 255} }},
	{{ {13, 166, -6}, 0, {624, 496}, {74, 154, 16, 255} }},
	{{ {0, 166, 7}, 0, {624, 368}, {0, 169, 92, 255} }},
	{{ {-13, 166, -6}, 0, {624, 496}, {186, 150, 5, 255} }},
	{{ {-21, 73, -6}, 0, {624, 496}, {152, 20, 186, 255} }},
	{{ {-48, 0, -6}, 0, {624, 496}, {175, 96, 239, 255} }},
};

Gfx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_tri_0[] = {
	gsSPVertex(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_vtx_0 + 0, 21, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 1, 4, 0),
	gsSP2Triangles(3, 4, 5, 0, 6, 5, 4, 0),
	gsSP2Triangles(6, 7, 5, 0, 7, 8, 5, 0),
	gsSP2Triangles(7, 9, 8, 0, 10, 5, 8, 0),
	gsSP2Triangles(3, 5, 10, 0, 10, 8, 11, 0),
	gsSP2Triangles(12, 13, 14, 0, 12, 14, 15, 0),
	gsSP2Triangles(15, 14, 16, 0, 15, 16, 17, 0),
	gsSP2Triangles(15, 17, 18, 0, 15, 18, 19, 0),
	gsSP2Triangles(12, 15, 19, 0, 12, 19, 20, 0),
	gsSPEndDisplayList(),
};

Vtx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_vtx_1[45] = {
	{{ {13, 166, -6}, 0, {1532, 764}, {74, 154, 16, 255} }},
	{{ {68, 208, -71}, 0, {1532, 764}, {70, 171, 192, 255} }},
	{{ {93, 208, -6}, 0, {1276, 764}, {93, 169, 0, 255} }},
	{{ {103, 321, -113}, 0, {1532, 764}, {87, 20, 166, 255} }},
	{{ {153, 321, -6}, 0, {1276, 764}, {124, 228, 0, 255} }},
	{{ {68, 208, 58}, 0, {1020, 764}, {64, 171, 69, 255} }},
	{{ {103, 321, 100}, 0, {1020, 764}, {87, 20, 90, 255} }},
	{{ {0, 208, 84}, 0, {1020, 508}, {0, 166, 89, 255} }},
	{{ {0, 321, 143}, 0, {1020, 508}, {0, 228, 124, 255} }},
	{{ {-103, 321, 100}, 0, {1020, 764}, {169, 20, 90, 255} }},
	{{ {-68, 208, 58}, 0, {1020, 764}, {190, 169, 65, 255} }},
	{{ {-153, 321, -6}, 0, {1276, 764}, {132, 228, 0, 255} }},
	{{ {-93, 208, -6}, 0, {1276, 764}, {162, 171, 254, 255} }},
	{{ {-103, 321, -113}, 0, {1532, 764}, {169, 20, 166, 255} }},
	{{ {-68, 208, -71}, 0, {1532, 764}, {190, 169, 191, 255} }},
	{{ {-13, 166, -6}, 0, {1276, 764}, {186, 150, 5, 255} }},
	{{ {-13, 166, -6}, 0, {1020, 764}, {186, 150, 5, 255} }},
	{{ {0, 166, 7}, 0, {1020, 508}, {0, 169, 92, 255} }},
	{{ {13, 166, -6}, 0, {1020, 764}, {74, 154, 16, 255} }},
	{{ {13, 166, -6}, 0, {1276, 764}, {74, 154, 16, 255} }},
	{{ {68, 208, -71}, 0, {1020, 1276}, {70, 171, 192, 255} }},
	{{ {0, 321, -156}, 0, {1020, 1532}, {0, 228, 132, 255} }},
	{{ {103, 321, -113}, 0, {1020, 1276}, {87, 20, 166, 255} }},
	{{ {0, 208, -97}, 0, {1020, 1532}, {6, 169, 164, 255} }},
	{{ {13, 166, -6}, 0, {1020, 1276}, {74, 154, 16, 255} }},
	{{ {0, 166, -20}, 0, {1020, 1532}, {4, 170, 162, 255} }},
	{{ {-13, 166, -6}, 0, {1020, 1276}, {186, 150, 5, 255} }},
	{{ {-68, 208, -71}, 0, {1020, 1276}, {190, 169, 191, 255} }},
	{{ {-103, 321, -113}, 0, {1020, 1276}, {169, 20, 166, 255} }},
	{{ {0, 321, -156}, 0, {-260, 1788}, {0, 228, 132, 255} }},
	{{ {0, 437, -156}, 0, {-260, 1788}, {0, 115, 203, 255} }},
	{{ {103, 321, -113}, 0, {-260, 1788}, {87, 20, 166, 255} }},
	{{ {0, 321, -156}, 0, {-260, 1788}, {0, 228, 132, 255} }},
	{{ {-103, 321, -113}, 0, {-260, 1788}, {169, 20, 166, 255} }},
	{{ {0, 437, -156}, 0, {-260, 1788}, {0, 115, 203, 255} }},
	{{ {0, 321, -6}, 0, {-260, 1788}, {0, 127, 0, 255} }},
	{{ {-153, 437, -6}, 0, {-260, 1788}, {201, 114, 0, 255} }},
	{{ {-153, 321, -6}, 0, {-260, 1788}, {132, 228, 0, 255} }},
	{{ {-103, 321, 100}, 0, {-260, 1788}, {169, 20, 90, 255} }},
	{{ {0, 437, 143}, 0, {-260, 1788}, {0, 115, 53, 255} }},
	{{ {0, 321, 143}, 0, {-260, 1788}, {0, 228, 124, 255} }},
	{{ {103, 321, 100}, 0, {-260, 1788}, {87, 20, 90, 255} }},
	{{ {153, 437, -6}, 0, {-260, 1788}, {55, 114, 0, 255} }},
	{{ {153, 321, -6}, 0, {-260, 1788}, {124, 228, 0, 255} }},
	{{ {103, 321, -113}, 0, {-260, 1788}, {87, 20, 166, 255} }},
};

Gfx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_tri_1[] = {
	gsSPVertex(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_vtx_1 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 2, 1, 3, 0),
	gsSP2Triangles(2, 3, 4, 0, 5, 2, 4, 0),
	gsSP2Triangles(5, 4, 6, 0, 7, 5, 6, 0),
	gsSP2Triangles(7, 6, 8, 0, 7, 8, 9, 0),
	gsSP2Triangles(7, 9, 10, 0, 10, 9, 11, 0),
	gsSP2Triangles(10, 11, 12, 0, 12, 11, 13, 0),
	gsSP2Triangles(12, 13, 14, 0, 15, 12, 14, 0),
	gsSP2Triangles(16, 10, 12, 0, 17, 10, 16, 0),
	gsSP2Triangles(17, 7, 10, 0, 17, 5, 7, 0),
	gsSP2Triangles(17, 18, 5, 0, 19, 2, 5, 0),
	gsSP2Triangles(20, 21, 22, 0, 20, 23, 21, 0),
	gsSP2Triangles(24, 23, 20, 0, 24, 25, 23, 0),
	gsSP2Triangles(26, 23, 25, 0, 26, 27, 23, 0),
	gsSP2Triangles(27, 21, 23, 0, 27, 28, 21, 0),
	gsSP1Triangle(29, 30, 31, 0),
	gsSPVertex(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_vtx_1 + 32, 13, 0),
	gsSP2Triangles(0, 1, 2, 0, 1, 3, 2, 0),
	gsSP2Triangles(1, 4, 3, 0, 1, 5, 4, 0),
	gsSP2Triangles(5, 6, 4, 0, 4, 6, 3, 0),
	gsSP2Triangles(6, 7, 3, 0, 8, 7, 6, 0),
	gsSP2Triangles(8, 9, 7, 0, 9, 3, 7, 0),
	gsSP2Triangles(10, 3, 9, 0, 11, 10, 9, 0),
	gsSP2Triangles(12, 10, 11, 0, 12, 3, 10, 0),
	gsSP1Triangle(12, 2, 3, 0),
	gsSPEndDisplayList(),
};

Vtx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_5_vtx_0[8] = {
	{{ {0, 208, 85}, 0, {508, 524}, {255, 255, 255, 255} }},
	{{ {119, 321, 98}, 0, {969, 66}, {255, 255, 255, 255} }},
	{{ {0, 321, 144}, 0, {508, 66}, {255, 255, 255, 255} }},
	{{ {85, 208, 56}, 0, {889, 524}, {255, 255, 255, 255} }},
	{{ {0, 208, 85}, 0, {470, 524}, {255, 255, 255, 255} }},
	{{ {0, 321, 144}, 0, {470, 66}, {255, 255, 255, 255} }},
	{{ {-119, 321, 98}, 0, {9, 66}, {255, 255, 255, 255} }},
	{{ {-85, 208, 56}, 0, {89, 524}, {255, 255, 255, 255} }},
};

Gfx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_5_tri_0[] = {
	gsSPVertex(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_5_vtx_0 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 6, 7, 0),
	gsSPEndDisplayList(),
};

Vtx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_4_vtx_0[15] = {
	{{ {201, 107, 0}, 0, {6, -32}, {219, 121, 0, 255} }},
	{{ {201, 107, -83}, 0, {171, -32}, {219, 121, 0, 255} }},
	{{ {125, 83, -83}, 0, {171, 216}, {203, 115, 0, 255} }},
	{{ {125, 83, 0}, 0, {6, 216}, {203, 115, 0, 255} }},
	{{ {0, 4, -83}, 0, {171, 612}, {255, 127, 255, 255} }},
	{{ {0, 4, 0}, 0, {6, 612}, {1, 127, 0, 255} }},
	{{ {-125, 83, -83}, 0, {171, 216}, {54, 115, 255, 255} }},
	{{ {-125, 83, 0}, 0, {6, 216}, {54, 115, 0, 255} }},
	{{ {-201, 107, -83}, 0, {171, -32}, {37, 121, 0, 255} }},
	{{ {-201, 107, 0}, 0, {6, -32}, {37, 121, 0, 255} }},
	{{ {-125, 83, 83}, 0, {171, 216}, {54, 115, 1, 255} }},
	{{ {-201, 107, 83}, 0, {171, -32}, {37, 121, 0, 255} }},
	{{ {0, 4, 83}, 0, {171, 612}, {1, 127, 1, 255} }},
	{{ {125, 83, 83}, 0, {171, 216}, {203, 115, 0, 255} }},
	{{ {201, 107, 83}, 0, {171, -32}, {219, 121, 0, 255} }},
};

Gfx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_4_tri_0[] = {
	gsSPVertex(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_4_vtx_0 + 0, 15, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(3, 2, 4, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 5, 4, 0, 6, 7, 5, 0),
	gsSP2Triangles(8, 7, 6, 0, 8, 9, 7, 0),
	gsSP2Triangles(9, 10, 7, 0, 9, 11, 10, 0),
	gsSP2Triangles(7, 10, 12, 0, 7, 12, 5, 0),
	gsSP2Triangles(13, 5, 12, 0, 13, 3, 5, 0),
	gsSP2Triangles(14, 3, 13, 0, 14, 0, 3, 0),
	gsSPEndDisplayList(),
};


Gfx mat_cr_davy_cap_fire_flower_Magma_Flower_Stem[] = {
	gsSPSetLights1(cr_davy_cap_fire_flower_Magma_Flower_Stem_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_cr_davy_cap_fire_flower_Magma[] = {
	gsSPGeometryMode(0, G_TEXTURE_GEN),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, 0, 0, 0, ENVIRONMENT, 0, 0, 0, TEXEL0, 0, 0, 0, ENVIRONMENT),
	gsDPSetAlphaCompare(G_AC_THRESHOLD),
	gsSPTexture(4032, 4032, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_davy_cap_fire_flower_DavyMagma_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_cr_davy_cap_fire_flower_Magma[] = {
	gsSPGeometryMode(G_TEXTURE_GEN, 0),
	gsDPPipeSync(),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

Gfx mat_cr_davy_cap_fire_flower_Magma_Flower_Eyes[] = {
	gsSPGeometryMode(G_SHADE | G_LIGHTING, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, TEXEL0_ALPHA, 0, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, 0, TEXEL0_ALPHA, 0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_davy_cap_fire_flower_fiyahflowereyes_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 511, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 60),
	gsSPEndDisplayList(),
};

Gfx mat_revert_cr_davy_cap_fire_flower_Magma_Flower_Eyes[] = {
	gsSPGeometryMode(0, G_SHADE | G_LIGHTING),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_cr_davy_cap_fire_flower_Magma_Flower_Leaf[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsSPSetLights1(cr_davy_cap_fire_flower_Magma_Flower_Leaf_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_davy_cap_fire_flower_FlowerLeaves_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 127, 1024),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 2, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, 0, G_TX_CLAMP | G_TX_NOMIRROR, 3, 0),
	gsDPSetTileSize(0, 0, 0, 28, 60),
	gsSPEndDisplayList(),
};

Gfx mat_revert_cr_davy_cap_fire_flower_Magma_Flower_Leaf[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1[] = {
	gsSPDisplayList(mat_cr_davy_cap_fire_flower_Magma_Flower_Stem),
	gsSPDisplayList(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_cr_davy_cap_fire_flower_Magma),
	gsSPDisplayList(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_1_tri_1),
	gsSPDisplayList(mat_revert_cr_davy_cap_fire_flower_Magma),
	gsSPEndDisplayList(),
};

Gfx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_5[] = {
	gsSPDisplayList(mat_cr_davy_cap_fire_flower_Magma_Flower_Eyes),
	gsSPDisplayList(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_5_tri_0),
	gsSPDisplayList(mat_revert_cr_davy_cap_fire_flower_Magma_Flower_Eyes),
	gsSPEndDisplayList(),
};

Gfx cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_4[] = {
	gsSPDisplayList(mat_cr_davy_cap_fire_flower_Magma_Flower_Leaf),
	gsSPDisplayList(cr_davy_cap_fire_flower_Metal_Cap_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_cr_davy_cap_fire_flower_Magma_Flower_Leaf),
	gsSPEndDisplayList(),
};

Gfx cr_davy_cap_fire_flower_material_revert_render_settings[] = {
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

