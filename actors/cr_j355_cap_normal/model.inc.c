Lights1 cr_j355_cap_normal_Robo_Eyes_Closed__SHOES__lights = gdSPDefLights1(
	0xFF, 0xD8, 0x0,
	0x0, 0x0, 0x0, 0x28, 0x28, 0x28);

Lights1 cr_j355_cap_normal_Cap_Bottom__CAP__lights = gdSPDefLights1(
	0x14, 0x14, 0x14,
	0x33, 0x33, 0x33, 0x28, 0x28, 0x28);

Lights1 cr_j355_cap_normal_Cap__CAP__lights = gdSPDefLights1(
	0x14, 0x14, 0x14,
	0x33, 0x33, 0x33, 0x28, 0x28, 0x28);

Lights1 cr_j355_cap_normal_Logo__CAP__lights = gdSPDefLights1(
	0x14, 0x14, 0x14,
	0x33, 0x33, 0x33, 0x28, 0x28, 0x28);

Lights1 cr_j355_cap_normal_Skin__SKIN__lights = gdSPDefLights1(
	0xBC, 0xBC, 0xBC,
	0x0, 0x0, 0x0, 0x28, 0x28, 0x28);

Lights1 cr_j355_cap_normal_Evil_Logo__EMBLEM__layer2_lights = gdSPDefLights1(
	0x0, 0x0, 0xFF,
	0x0, 0x0, 0x0, 0x28, 0x28, 0x28);

Gfx cr_j355_cap_normal_j355_eyes_closed_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_j355_cap_normal_j355_eyes_closed_rgba16[] = {
	#include "actors/cr_j355_cap_normal/j355_eyes_closed.rgba16.inc.c"
};

Gfx cr_j355_cap_normal_j355_logo_cutout_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_j355_cap_normal_j355_logo_cutout_rgba16[] = {
	#include "actors/cr_j355_cap_normal/j355_logo_cutout.rgba16.inc.c"
};

Gfx cr_j355_cap_normal_j355_rough_base_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_j355_cap_normal_j355_rough_base_rgba16[] = {
	#include "actors/cr_j355_cap_normal/j355_rough_base.rgba16.inc.c"
};

Gfx cr_j355_cap_normal_j355_rough_shine_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 cr_j355_cap_normal_j355_rough_shine_rgba16[] = {
	#include "actors/cr_j355_cap_normal/j355_rough_shine.rgba16.inc.c"
};

Gfx cr_j355_cap_normal_j355_logo_i8_aligner[] = {gsSPEndDisplayList()};
u8 cr_j355_cap_normal_j355_logo_i8[] = {
	#include "actors/cr_j355_cap_normal/j355_logo.i8.inc.c"
};

Vtx cr_j355_cap_normal_Bulb_DL_mesh_layer_4_vtx_0[4] = {
	{{ {5, 5, 1}, 0, {941, 1139}, {0, 0, 127, 255} }},
	{{ {-5, 5, 1}, 0, {55, 1139}, {0, 0, 127, 255} }},
	{{ {-5, -5, 1}, 0, {55, 2025}, {0, 0, 127, 255} }},
	{{ {5, -5, 1}, 0, {941, 2025}, {0, 0, 127, 255} }},
};

Gfx cr_j355_cap_normal_Bulb_DL_mesh_layer_4_tri_0[] = {
	gsSPVertex(cr_j355_cap_normal_Bulb_DL_mesh_layer_4_vtx_0 + 0, 4, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSPEndDisplayList(),
};

Vtx cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_0[9] = {
	{{ {16, 16, 0}, 0, {240, 368}, {248, 129, 0, 255} }},
	{{ {-61, 7, 53}, 0, {112, 240}, {160, 206, 67, 255} }},
	{{ {-78, 5, 0}, 0, {112, 368}, {140, 204, 0, 255} }},
	{{ {21, 9, 75}, 0, {240, 240}, {30, 183, 99, 255} }},
	{{ {62, 5, 47}, 0, {368, 240}, {53, 155, 56, 255} }},
	{{ {75, 1, 0}, 0, {368, 368}, {73, 152, 0, 255} }},
	{{ {62, 5, -47}, 0, {368, 240}, {53, 155, 200, 255} }},
	{{ {21, 9, -75}, 0, {240, 240}, {30, 183, 157, 255} }},
	{{ {-61, 7, -53}, 0, {112, 240}, {160, 206, 189, 255} }},
};

Gfx cr_j355_cap_normal_Cap_DL_mesh_layer_1_tri_0[] = {
	gsSPVertex(cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_0 + 0, 9, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(0, 4, 3, 0, 0, 5, 4, 0),
	gsSP2Triangles(0, 6, 5, 0, 0, 7, 6, 0),
	gsSP2Triangles(0, 8, 7, 0, 0, 2, 8, 0),
	gsSPEndDisplayList(),
};

Vtx cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_1[37] = {
	{{ {-61, 7, 53}, 0, {368, 1008}, {160, 206, 67, 255} }},
	{{ {-42, 25, 60}, 0, {496, 1008}, {186, 254, 106, 255} }},
	{{ {-61, 23, 0}, 0, {496, 880}, {134, 35, 0, 255} }},
	{{ {-78, 5, 0}, 0, {368, 880}, {140, 204, 0, 255} }},
	{{ {-61, 7, -53}, 0, {368, 1008}, {160, 206, 189, 255} }},
	{{ {-42, 25, -60}, 0, {496, 1008}, {186, 254, 150, 255} }},
	{{ {-42, 25, 60}, 0, {432, 48}, {186, 254, 106, 255} }},
	{{ {-61, 7, 53}, 0, {368, -16}, {160, 206, 67, 255} }},
	{{ {21, 9, 75}, 0, {368, 112}, {30, 183, 99, 255} }},
	{{ {1, 49, 75}, 0, {496, 112}, {5, 43, 119, 255} }},
	{{ {62, 5, 47}, 0, {368, 240}, {53, 155, 56, 255} }},
	{{ {72, 34, 57}, 0, {496, 240}, {92, 6, 88, 255} }},
	{{ {83, 36, 0}, 0, {496, 368}, {123, 31, 0, 255} }},
	{{ {75, 1, 0}, 0, {368, 368}, {73, 152, 0, 255} }},
	{{ {62, 5, -47}, 0, {368, 240}, {53, 155, 200, 255} }},
	{{ {72, 34, -57}, 0, {496, 240}, {92, 6, 168, 255} }},
	{{ {1, 49, -75}, 0, {496, 112}, {5, 43, 137, 255} }},
	{{ {21, 9, -75}, 0, {368, 112}, {30, 183, 157, 255} }},
	{{ {-42, 25, -60}, 0, {432, 48}, {186, 254, 150, 255} }},
	{{ {-61, 7, -53}, 0, {368, -16}, {160, 206, 189, 255} }},
	{{ {63, 53, -46}, 0, {624, 240}, {66, 97, 208, 255} }},
	{{ {63, 53, 46}, 0, {624, 240}, {66, 97, 48, 255} }},
	{{ {37, 65, 0}, 0, {624, 368}, {38, 121, 0, 255} }},
	{{ {-36, 82, 0}, 0, {752, 368}, {245, 127, 0, 255} }},
	{{ {-13, 69, -55}, 0, {752, 240}, {6, 112, 197, 255} }},
	{{ {-56, 61, -57}, 0, {880, 240}, {171, 49, 176, 255} }},
	{{ {-73, 69, 0}, 0, {880, 368}, {144, 60, 0, 255} }},
	{{ {-56, 61, 57}, 0, {880, 240}, {171, 49, 80, 255} }},
	{{ {-13, 69, 55}, 0, {752, 240}, {6, 112, 59, 255} }},
	{{ {-13, 69, 55}, 0, {624, 112}, {6, 112, 59, 255} }},
	{{ {-56, 61, 57}, 0, {624, -16}, {171, 49, 80, 255} }},
	{{ {-42, 25, 60}, 0, {496, -16}, {186, 254, 106, 255} }},
	{{ {1, 49, -75}, 0, {496, 112}, {5, 43, 137, 255} }},
	{{ {-42, 25, -60}, 0, {496, -16}, {186, 254, 150, 255} }},
	{{ {-56, 61, -57}, 0, {624, -16}, {171, 49, 176, 255} }},
	{{ {-13, 69, -55}, 0, {624, 112}, {6, 112, 197, 255} }},
	{{ {63, 53, -46}, 0, {624, 240}, {66, 97, 208, 255} }},
};

Gfx cr_j355_cap_normal_Cap_DL_mesh_layer_1_tri_1[] = {
	gsSPVertex(cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_1 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 3, 2, 0, 4, 2, 5, 0),
	gsSP2Triangles(6, 7, 8, 0, 6, 8, 9, 0),
	gsSP2Triangles(10, 9, 8, 0, 10, 11, 9, 0),
	gsSP2Triangles(12, 11, 10, 0, 12, 10, 13, 0),
	gsSP2Triangles(12, 13, 14, 0, 12, 14, 15, 0),
	gsSP2Triangles(14, 16, 15, 0, 14, 17, 16, 0),
	gsSP2Triangles(17, 18, 16, 0, 17, 19, 18, 0),
	gsSP2Triangles(20, 15, 16, 0, 12, 15, 20, 0),
	gsSP2Triangles(12, 20, 21, 0, 21, 20, 22, 0),
	gsSP2Triangles(23, 22, 20, 0, 23, 20, 24, 0),
	gsSP2Triangles(23, 24, 25, 0, 23, 25, 26, 0),
	gsSP2Triangles(23, 26, 27, 0, 23, 27, 28, 0),
	gsSP2Triangles(23, 28, 21, 0, 23, 21, 22, 0),
	gsSP2Triangles(12, 21, 11, 0, 21, 9, 11, 0),
	gsSP2Triangles(21, 29, 9, 0, 9, 29, 30, 0),
	gsSP1Triangle(9, 30, 31, 0),
	gsSPVertex(cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_1 + 32, 5, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP1Triangle(4, 0, 3, 0),
	gsSPEndDisplayList(),
};

Vtx cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_2[6] = {
	{{ {-56, 61, 57}, 0, {1267, 130}, {171, 49, 80, 255} }},
	{{ {-61, 23, 0}, 0, {-16, 971}, {134, 35, 0, 255} }},
	{{ {-42, 25, 60}, 0, {1332, 935}, {186, 254, 106, 255} }},
	{{ {-73, 69, 0}, 0, {-16, -68}, {144, 60, 0, 255} }},
	{{ {-56, 61, -57}, 0, {1267, 130}, {171, 49, 176, 255} }},
	{{ {-42, 25, -60}, 0, {1332, 935}, {186, 254, 150, 255} }},
};

Gfx cr_j355_cap_normal_Cap_DL_mesh_layer_1_tri_2[] = {
	gsSPVertex(cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_2 + 0, 6, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(4, 1, 3, 0, 4, 5, 1, 0),
	gsSPEndDisplayList(),
};

Vtx cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_3[5] = {
	{{ {44, 60, 8}, 0, {-17, 1123}, {12, 26, 124, 255} }},
	{{ {59, 93, 0}, 0, {-17, -389}, {52, 116, 0, 255} }},
	{{ {37, 64, 0}, 0, {-390, 1123}, {155, 77, 0, 255} }},
	{{ {52, 57, 0}, 0, {357, 1123}, {124, 231, 0, 255} }},
	{{ {44, 60, -8}, 0, {-17, 1123}, {12, 26, 132, 255} }},
};

Gfx cr_j355_cap_normal_Cap_DL_mesh_layer_1_tri_3[] = {
	gsSPVertex(cr_j355_cap_normal_Cap_DL_mesh_layer_1_vtx_3 + 0, 5, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 1, 0, 0),
	gsSP2Triangles(4, 1, 3, 0, 2, 1, 4, 0),
	gsSPEndDisplayList(),
};

Vtx cr_j355_cap_normal_Cap_DL_mesh_layer_2_vtx_0[6] = {
	{{ {-56, 61, 57}, 0, {1267, 130}, {139, 220, 35, 255} }},
	{{ {-62, 23, 0}, 0, {-16, 971}, {134, 221, 0, 255} }},
	{{ {-42, 25, 60}, 0, {1332, 935}, {142, 216, 38, 255} }},
	{{ {-73, 69, 0}, 0, {-16, -68}, {133, 225, 0, 255} }},
	{{ {-56, 61, -57}, 0, {1267, 130}, {139, 220, 221, 255} }},
	{{ {-42, 25, -60}, 0, {1332, 935}, {142, 216, 218, 255} }},
};

Gfx cr_j355_cap_normal_Cap_DL_mesh_layer_2_tri_0[] = {
	gsSPVertex(cr_j355_cap_normal_Cap_DL_mesh_layer_2_vtx_0 + 0, 6, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(4, 1, 3, 0, 4, 5, 1, 0),
	gsSPEndDisplayList(),
};


Gfx mat_cr_j355_cap_normal_Robo_Eyes_Closed__SHOES_[] = {
	gsSPLight(&cr_j355_cap_normal_Robo_Eyes_Closed__SHOES__lights.l, 1),
    gsSPLight(&cr_j355_cap_normal_Robo_Eyes_Closed__SHOES__lights.a, 2),
    gsSPCopyLightEXT(2, 9),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, 0, SHADE, 0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_j355_cap_normal_j355_eyes_closed_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 2047, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 252),
	gsSPEndDisplayList(),
};

Gfx mat_cr_j355_cap_normal_Cap_Bottom__CAP_[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(SHADE, 0, PRIMITIVE, 0, 0, 0, 0, ENVIRONMENT, SHADE, 0, PRIMITIVE, 0, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 137, 137, 137, 255),
	gsSPEndDisplayList(),
};

Gfx mat_cr_j355_cap_normal_Cap__CAP_[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_cr_j355_cap_normal_Logo__CAP_[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, SHADE, TEXEL0_ALPHA, SHADE, 0, 0, 0, ENVIRONMENT, TEXEL0, SHADE, TEXEL0_ALPHA, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_j355_cap_normal_j355_logo_cutout_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 511, 512),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, 0),
	gsDPSetTileSize(0, 0, 0, 60, 124),
	gsSPEndDisplayList(),
};

Gfx mat_cr_j355_cap_normal_Skin__SKIN_[] = {
	gsSPGeometryMode(0, G_TEXTURE_GEN),
	gsSPLight(&cr_j355_cap_normal_Skin__SKIN__lights.l, 1),
    gsSPLight(&cr_j355_cap_normal_Skin__SKIN__lights.a, 2),
    gsSPCopyLightEXT(2, 13),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, TEXEL1, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, TEXEL1, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(1984, 1984, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_j355_cap_normal_j355_rough_base_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, cr_j355_cap_normal_j355_rough_shine_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 256, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 256, 1, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(1, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_cr_j355_cap_normal_Skin__SKIN_[] = {
	gsSPGeometryMode(G_TEXTURE_GEN, 0),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_cr_j355_cap_normal_Evil_Logo__EMBLEM__layer2[] = {
	gsSPLight(&cr_j355_cap_normal_Evil_Logo__EMBLEM__layer2_lights.l, 1),
    gsSPLight(&cr_j355_cap_normal_Evil_Logo__EMBLEM__layer2_lights.a, 2),
    gsSPCopyLightEXT(2, 17),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, SHADE, 0, SHADE, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, SHADE, 0, SHADE, TEXEL0, 0, ENVIRONMENT, 0),
	gsDPSetRenderMode(G_RM_AA_ZB_XLU_DECAL, G_RM_AA_ZB_XLU_DECAL2),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 1, cr_j355_cap_normal_j355_logo_i8),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 255, 1024),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b, 2, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, 0),
	gsDPSetTileSize(0, 0, 0, 60, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_cr_j355_cap_normal_Evil_Logo__EMBLEM__layer2[] = {
	gsDPPipeSync(),
	gsDPSetRenderMode(G_RM_AA_ZB_OPA_DECAL, G_RM_AA_ZB_OPA_DECAL2),
	gsSPEndDisplayList(),
};

Gfx cr_j355_cap_normal_Bulb_DL_mesh_layer_4[] = {
	gsSPDisplayList(mat_cr_j355_cap_normal_Robo_Eyes_Closed__SHOES_),
	gsSPDisplayList(cr_j355_cap_normal_Bulb_DL_mesh_layer_4_tri_0),
	gsSPEndDisplayList(),
};

Gfx cr_j355_cap_normal_Cap_DL_mesh_layer_1[] = {
	gsSPDisplayList(mat_cr_j355_cap_normal_Cap_Bottom__CAP_),
	gsSPDisplayList(cr_j355_cap_normal_Cap_DL_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_cr_j355_cap_normal_Cap__CAP_),
	gsSPDisplayList(cr_j355_cap_normal_Cap_DL_mesh_layer_1_tri_1),
	gsSPDisplayList(mat_cr_j355_cap_normal_Logo__CAP_),
	gsSPDisplayList(cr_j355_cap_normal_Cap_DL_mesh_layer_1_tri_2),
	gsSPDisplayList(mat_cr_j355_cap_normal_Skin__SKIN_),
	gsSPDisplayList(cr_j355_cap_normal_Cap_DL_mesh_layer_1_tri_3),
	gsSPDisplayList(mat_revert_cr_j355_cap_normal_Skin__SKIN_),
	gsSPEndDisplayList(),
};

Gfx cr_j355_cap_normal_Cap_DL_mesh_layer_2[] = {
	gsSPDisplayList(mat_cr_j355_cap_normal_Evil_Logo__EMBLEM__layer2),
	gsSPDisplayList(cr_j355_cap_normal_Cap_DL_mesh_layer_2_tri_0),
	gsSPDisplayList(mat_revert_cr_j355_cap_normal_Evil_Logo__EMBLEM__layer2),
	gsSPEndDisplayList(),
};

Gfx cr_j355_cap_normal_material_revert_render_settings[] = {
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

