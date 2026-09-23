-- name: [CS] \\#f70\\Clankers: \\#ff0\\Rebuilt
-- description: [CS] \\#f70\\Clankers: \\#ff0\\Rebuilt\n\\#ffffff\\By \\#008800\\JerThePear\n\n\\#ffffff\\The skeleman strikes again! Now with a more polished moveset. Along with a... friend? Foe? Companion???\n\nPerchance.\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!

local TEXT_MOD_NAME = "Clankers: Rebuilt"

-- Stops mod from loading if Character Select isn't on
if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

-- Models --
local E_MODEL_CR_DAVY = smlua_model_util_get_id('cr_davy_geo')
local E_MODEL_CR_J355 = smlua_model_util_get_id('cr_j355_geo')

-- Credits --
_G.charSelect.credit_add(TEXT_MOD_NAME, "JerThePear", "Creator")
_G.charSelect.credit_add(TEXT_MOD_NAME, "DavyDaBest", "Character")
_G.charSelect.credit_add(TEXT_MOD_NAME, "cooliokid956", "Selective Corrective")

-- Textures --
local TEX_CR_DAVY = get_texture_info('cr_icon_davy')
local TEX_CR_J355 = get_texture_info('cr_icon_j355')
local TEX_ART_CR_DAVY = get_texture_info('cr_graffiti_davy')
--local TEX_ART_CR_J355 = get_texture_info('cr_graffiti_j355')
local TEX_HEALTH_CR_DAVY = get_texture_info('cr_hud_health_davy')
local TEX_HEALTH_CR_J355 = get_texture_info('cr_hud_health_j355')
local TEX_HEALTH_PIE = get_texture_info('cr_hud_health_pie')

-- Sound --
local SOUND_MENU_THEME_CR_DAVY = audio_stream_load('cr_davy_menu_theme.ogg')
--local SOUND_MENU_THEME_CR_J355 = audio_stream_load('cr_j355_menu_theme.ogg')

CHAR_SOUND_SPIN             = CHAR_SOUND_MAX + 1
CHAR_SOUND_WETT_HOVER       = CHAR_SOUND_MAX + 2
CHAR_SOUND_WETT_HOVER_END   = CHAR_SOUND_MAX + 3
CHAR_SOUND_WETT_BURST       = CHAR_SOUND_MAX + 4
CHAR_SOUND_WETT_CHARGE      = CHAR_SOUND_MAX + 5
CHAR_SOUND_WETT_LOOP        = CHAR_SOUND_MAX + 6

VOICETABLE_CR_DAVY = { -- Voices from Skeleton character from Lego Racers (1999)
    [CHAR_SOUND_ATTACKED] = {'cr_davy_ouch.ogg', 'cr_davy_ahh.ogg'},
    [CHAR_SOUND_COUGHING1] = nil,
    [CHAR_SOUND_COUGHING2] = nil,
    [CHAR_SOUND_COUGHING3] = nil,
    [CHAR_SOUND_DOH] = 'cr_davy_ouch.ogg', -- long jump bump
    [CHAR_SOUND_DROWNING] = nil,
    [CHAR_SOUND_DYING] = 'cr_davy_ohno.ogg',
    [CHAR_SOUND_EEUH] = nil, -- climbing ledge
    [CHAR_SOUND_GROUND_POUND_WAH] = 'cr_davy_huehue.ogg',
    [CHAR_SOUND_HAHA] = 'cr_davy_tada.ogg',
    [CHAR_SOUND_HAHA_2] = 'cr_davy_tada.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'cr_davy_laugh.ogg', -- getting star/power up
    [CHAR_SOUND_HOOHOO] = {'cr_davy_huehue.ogg', 'cr_davy_wohee.ogg'},
    [CHAR_SOUND_HRMM] = nil, -- lifting
    [CHAR_SOUND_IMA_TIRED] = nil,
    [CHAR_SOUND_MAMA_MIA] = 'cr_davy_ohno.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'cr_davy_heehee.ogg', -- starting level
    [CHAR_SOUND_ON_FIRE] = {'cr_davy_ahoey.ogg', 'cr_davy_yeow.ogg'},
    [CHAR_SOUND_OOOF] = 'cr_davy_ouch.ogg',
    [CHAR_SOUND_OOOF2] = 'cr_davy_ouch.ogg', -- thrown out of painting
    [CHAR_SOUND_PANTING] = nil,
    [CHAR_SOUND_PANTING_COLD] = nil,
    [CHAR_SOUND_PUNCH_HOO] = 'cr_davy_wohee.ogg', -- kick
    [CHAR_SOUND_PUNCH_WAH] = 'cr_davy_huehue.ogg', -- punch 2
    [CHAR_SOUND_PUNCH_YAH] = 'cr_davy_ya.ogg', -- punch 1
    [CHAR_SOUND_SO_LONGA_BOWSER] = {'cr_davy_laugh.ogg', 'cr_davy_hohoyeahah.ogg'},
    [CHAR_SOUND_SNORING1] = 'r_davy_snore1.ogg',
    [CHAR_SOUND_SNORING2] = 'r_davy_snore2.ogg',
    [CHAR_SOUND_SNORING3] = nil,
    [CHAR_SOUND_TWIRL_BOUNCE] = 'cr_davy_hohoyeahah.ogg',
    [CHAR_SOUND_UH] = 'cr_davy_ouch.ogg', -- wall bonk
    [CHAR_SOUND_UH2] = nil, -- landing long jump
    [CHAR_SOUND_UH2_2] = nil, -- same as uh2 maybe??
    [CHAR_SOUND_WAAAOOOW] = 'cr_davy_ahoey.ogg',
    [CHAR_SOUND_WAH2] = 'cr_davy_haha.ogg', -- throw
    [CHAR_SOUND_WHOA] = 'cr_davy_ahoey.ogg',
    [CHAR_SOUND_YAHOO] = {'cr_davy_heehee.ogg', 'cr_davy_yeawohee.ogg'},
    [CHAR_SOUND_YAWNING] = nil,
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'cr_davy_yeawohee.ogg', 'cr_davy_hohoyeahah.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'cr_davy_haha.ogg', 'cr_davy_ya.ogg'},
    [CHAR_SOUND_HELLO] = nil,
    [CHAR_SOUND_PRESS_START_TO_PLAY] = nil,
    [CHAR_SOUND_OKEY_DOKEY] = 'cr_davy_hohoyeahah.ogg',
}
VOICETABLE_CR_J355 = { -- Voices from Veronica Voltage and other female characters from Lego Racers (1999)
    [CHAR_SOUND_ATTACKED] = 'cr_robo_jess_ow.ogg',
    [CHAR_SOUND_COUGHING1] = nil,
    [CHAR_SOUND_COUGHING2] = nil,
    [CHAR_SOUND_COUGHING3] = nil,
    [CHAR_SOUND_DOH] = 'cr_robo_jess_ow.ogg',
    [CHAR_SOUND_DROWNING] = nil,
    [CHAR_SOUND_DYING] = 'cr_robo_jess_ohno.ogg',
    [CHAR_SOUND_EEUH] = 'cr_robo_jess_heh.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'cr_robo_jess_hiya.ogg',
    [CHAR_SOUND_HAHA] = 'cr_robo_jess_yeah_jazzy.ogg',
    [CHAR_SOUND_HAHA_2] = 'cr_robo_jess_oh_yeah.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'cr_robo_jess_yeah_jazzy.ogg',
    [CHAR_SOUND_HOOHOO] = 'cr_robo_jess_woo.ogg',
    [CHAR_SOUND_HRMM] = 'cr_robo_jess_heh.ogg',
    [CHAR_SOUND_IMA_TIRED] = nil,
    [CHAR_SOUND_MAMA_MIA] = 'cr_robo_jess_ohno.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'cr_robo_jess_oh_yeah.ogg',
    [CHAR_SOUND_ON_FIRE] = 'cr_robo_jess_ohno.ogg',
    [CHAR_SOUND_OOOF] = 'cr_robo_jess_ouch.ogg',
    [CHAR_SOUND_OOOF2] = 'cr_robo_jess_ouch.ogg',
    [CHAR_SOUND_PANTING] = nil,
    [CHAR_SOUND_PANTING_COLD] = nil,
    [CHAR_SOUND_PUNCH_HOO] = 'cr_robo_jess_yeah.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'cr_robo_jess_ya.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'cr_robo_jess_ha.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'cr_robo_jess_hiya.ogg',
    [CHAR_SOUND_SNORING1] = nil,
    [CHAR_SOUND_SNORING2] = nil,
    [CHAR_SOUND_SNORING3] = nil,
    [CHAR_SOUND_TWIRL_BOUNCE] = 'cr_robo_jess_yahoo.ogg',
    [CHAR_SOUND_UH] = 'cr_robo_jess_ow.ogg',
    [CHAR_SOUND_UH2] = 'cr_robo_jess_heh.ogg',
    [CHAR_SOUND_UH2_2] = nil,
    [CHAR_SOUND_WAAAOOOW] = 'cr_robo_jess_ohno.ogg',
    [CHAR_SOUND_WAH2] = 'cr_robo_jess_ya.ogg',
    [CHAR_SOUND_WHOA] = 'cr_robo_jess_uh_oh.ogg',
    [CHAR_SOUND_YAHOO] = { 'cr_robo_jess_yahoo.ogg', 'cr_robo_jess_woohoo.ogg' },
    [CHAR_SOUND_YAWNING] = nil,
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'cr_robo_jess_yahoo.ogg', 'cr_robo_jess_woohoo.ogg' },
    [CHAR_SOUND_YAH_WAH_HOO] = {'cr_robo_jess_ha.ogg', 'cr_robo_jess_ya.ogg', 'cr_robo_jess_yeah.ogg' },
    [CHAR_SOUND_OKEY_DOKEY] = 'cr_robo_jess_oh_yeah.ogg',
    --CHAR_SOUND_MAX
    [CHAR_SOUND_SPIN] = 'cr_robo_jess_spin.ogg',
    [CHAR_SOUND_WETT_HOVER] = 'cr_sound_wett_hover.ogg',
    [CHAR_SOUND_WETT_HOVER_END] = 'cr_sound_wett_hover_end.ogg',
    [CHAR_SOUND_WETT_BURST] = {'cr_robo_jess_burst_ha.ogg', 'cr_robo_jess_burst_ya.ogg'},
    [CHAR_SOUND_WETT_CHARGE] = 'cr_sound_wett_charge.ogg',
    [CHAR_SOUND_WETT_LOOP] = 'cr_sound_wett_loop.ogg',
}

local PALETTES_CR_DAVY = {
    {
        name = "Default",
        [PANTS]  = "303030",
        [SHIRT]  = "bbbbbb",
        [GLOVES] = "888888",
        [SHOES]  = "303030",
        [HAIR]   = "bbbbbb",
        [SKIN]   = "ffffff",
        [CAP]    = "ff8200",
        [EMBLEM] = "ffffff",
    },
    {
        name = "Legacy",
        [PANTS]  = "ff8000",
        [SHIRT]  = "222222",
        [GLOVES] = "552945",
        [SHOES]  = "552945",
        [HAIR]   = "bbbbbb",
        [SKIN]   = "ffffff",
        [CAP]    = "ff8000",
        [EMBLEM] = "222222",
    },
    {
        name = "VirtualGuy",
        [PANTS]  = "300000",
        [SHIRT]  = "bb0000",
        [GLOVES] = "880000",
        [SHOES]  = "300000",
        [HAIR]   = "bb0000",
        [SKIN]   = "ff0000",
        [CAP]    = "ff0000",
        [EMBLEM] = "ff0000",
    },
    {
        name = "Cotton Candy",
        [PANTS]  = "5bcefa",
        [SHIRT]  = "f5a9b8",
        [GLOVES] = "5bcefa",
        [SHOES]  = "5bcefa",
        [HAIR]   = "f5a9b8",
        [SKIN]   = "ffffff",
        [CAP]    = "ffffff",
        [EMBLEM] = "f5a9b8",
    },
    {
        name = "Pissboy",
        [PANTS]  = "1f2f34",
        [SHIRT]  = "006080",
        [GLOVES] = "ffff00",
        [SHOES]  = "1f2f34",
        [HAIR]   = "ffab00",
        [SKIN]   = "ffffff",
        [CAP]    = "ffff00",
        [EMBLEM] = "006080",
    },
    {
        name = "Manhattan",
        [PANTS]  = "301a22",
        [SHIRT]  = "008eff",
        [GLOVES] = "59ffb2",
        [SHOES]  = "301a22",
        [HAIR]   = "99ffff",
        [SKIN]   = "ffffff",
        [CAP]    = "df1a10",
        [EMBLEM] = "008eff",
    },
    {
        name = "Cantaloupe",
        [PANTS]  = "30251b",
        [SHIRT]  = "009d4d",
        [GLOVES] = "9b623c",
        [SHOES]  = "30251b",
        [HAIR]   = "85502c",
        [SKIN]   = "ffffff",
        [CAP]    = "a00040",
        [EMBLEM] = "009d4d",
    },
    {
        name = "Parchment",
        [PANTS]  = "4782c9",
        [SHIRT]  = "ffffff",
        [GLOVES] = "ffe467",
        [SHOES]  = "ff4711",
        [HAIR]   = "bbbbbb",
        [SKIN]   = "ffffff",
        [CAP]    = "ff4711",
        [EMBLEM] = "ffe467",
    },
    {
        name = "Decayed",
        [PANTS]  = "101010",
        [SHIRT]  = "a6a6a6",
        [GLOVES] = "595959",
        [SHOES]  = "101010",
        [HAIR]   = "d9d79e",
        [SKIN]   = "8c8b62",
        [CAP]    = "5c3b1b",
        [EMBLEM] = "a6a6a6",
    },
}
local PALETTES_CR_J355 = {
    {
        name = "Default",
        [PANTS]  = "333333",
        [SHIRT]  = "333333",
        [GLOVES] = "ffffff",
        [SHOES]  = "ffc000",
        [HAIR]   = "a3b3bf",
        [SKIN]   = "bcbcbc",
        [CAP]    = "333333",
        [EMBLEM] = "0000ff",
    },
    {
        name = "Bone Malone",
        [PANTS]  = "222222",
        [SHIRT]  = "ff8900",
        [GLOVES] = "ff8900",
        [SHOES]  = "c30000",
        [HAIR]   = "888888",
        [SKIN]   = "ffffff",
        [CAP]    = "ff8900",
        [EMBLEM] = "222222",
    },
    {
        name = "Old Times' Sake",
        [PANTS]  = "8cc6ff",
        [SHIRT]  = "563421",
        [GLOVES] = "8cc6ff",
        [SHOES]  = "99d149",
        [HAIR]   = "6a808d",
        [SKIN]   = "93a9b1",
        [CAP]    = "8cc6ff",
        [EMBLEM] = "8cc6ff",
    },
    {
        name = "Touch of Midas",
        [PANTS]  = "ffd176",
        [SHIRT]  = "770000",
        [GLOVES] = "770000",
        [SHOES]  = "ffd176",
        [HAIR]   = "ffb400",
        [SKIN]   = "ffb400",
        [CAP]    = "770000",
        [EMBLEM] = "af7d00",
    },
}

--local CAP_CR_DAVY = {
--    normal = smlua_model_util_get_id("jj_cap_davy_scarf_geo"),
--    wing = smlua_model_util_get_id("jj_cap_davy_star_geo"),
--    metal = smlua_model_util_get_id("jj_cap_davy_magma_geo"),
--    metalWing = smlua_model_util_get_id("jj_cap_davy_magmastar_geo"),
--}

local ANIMTABLE_CR_DAVY = {
    [_G.charSelect.CS_ANIM_MENU]                        = "cr_anim_davy_menu",
    [CHAR_ANIM_SINGLE_JUMP]                             = function(m, frame)
                                                            if frame > 3 and frame < 11 then
                                                                m.marioBodyState.punchState = 4
                                                            end
                                                            return "cr_anim_davy_single_jump"
                                                        end,
    [CHAR_ANIM_IDLE_HEAD_LEFT]                          = "cr_anim_davy_idle",
    [CHAR_ANIM_IDLE_HEAD_RIGHT]                         = "cr_anim_davy_idle",
    [CHAR_ANIM_IDLE_HEAD_CENTER]                        = "cr_anim_davy_idle",
    [CHAR_ANIM_FIRST_PERSON]                            = "cr_anim_davy_idle",
    [CHAR_ANIM_RUNNING]                                 = function(m, frame)
                                                            m.marioBodyState.torsoAngle.x = (m.forwardVel - 15) * -100
                                                            m.marioBodyState.torsoAngle.z = 0
                                                            if get_global_timer() % 5 == 0 then
                                                                set_mario_particle_flags(m, PARTICLE_DUST, 0)
                                                            end
                                                            return "cr_anim_davy_run"
                                                        end,
    [CHAR_ANIM_WALK_WITH_LIGHT_OBJ]                     = "cr_anim_davy_hold_run",
    [CHAR_ANIM_RUN_WITH_LIGHT_OBJ]                      = "cr_anim_davy_hold_run",
    [CHAR_ANIM_SLOW_WALK_WITH_LIGHT_OBJ]                = "cr_anim_davy_hold_run",
    [CHAR_ANIM_JUMP_WITH_LIGHT_OBJ]                     = "cr_anim_davy_hold_jump",
    [CHAR_ANIM_FALL_WITH_LIGHT_OBJ]                     = "cr_anim_davy_hold_fall",
    [CHAR_ANIM_FALL_FROM_SLIDING_WITH_LIGHT_OBJ]        = "cr_anim_davy_hold_fall_from_slide",
    [CHAR_ANIM_IDLE_WITH_LIGHT_OBJ]                     = "cr_anim_davy_hold_idle",
    [CHAR_ANIM_JUMP_LAND_WITH_LIGHT_OBJ]                = "cr_anim_davy_hold_land",
    [CHAR_ANIM_FALL_LAND_WITH_LIGHT_OBJ]                = "cr_anim_davy_hold_land",
    [CHAR_ANIM_PICK_UP_LIGHT_OBJ]                       = "cr_anim_davy_hold_pickup",
    [CHAR_ANIM_PLACE_LIGHT_OBJ]                         = "cr_anim_davy_hold_place",
    [CHAR_ANIM_STAND_UP_FROM_SLIDING_WITH_LIGHT_OBJ]    = "cr_anim_davy_hold_getup",
    [CHAR_ANIM_STOP_SLIDE_LIGHT_OBJ]                    = "cr_anim_davy_hold_getup2",
    [CHAR_ANIM_SLIDE_KICK]                              = function(m, frame)
                                                            if frame == 2 then
                                                                m.marioBodyState.punchState = (2 << 6) | 6
                                                            end
                                                        end,
}
local EYETABLE_CR_DAVY = {
    [_G.charSelect.CS_ANIM_MENU] = MARIO_EYES_LOOK_RIGHT,
}
local ANIMTABLE_CR_J355 = {
    [_G.charSelect.CS_ANIM_MENU]        = "cr_anim_j355_menu",
    [CHAR_ANIM_IDLE_HEAD_LEFT]          = "cr_anim_j355_idle",
    [CHAR_ANIM_IDLE_HEAD_RIGHT]         = "cr_anim_j355_idle",
    [CHAR_ANIM_IDLE_HEAD_CENTER]        = "cr_anim_j355_idle",
    [CHAR_ANIM_FIRST_PERSON]            = "cr_anim_j355_idle_alt",
    [CHAR_ANIM_RUNNING]                 = function(m, frame)
                                            if get_global_timer() % 5 == 0 then
                                                set_mario_particle_flags(m, PARTICLE_DUST, 0)
                                            end
                                        end,
   [CHAR_ANIM_SLIDEFLIP]                = "cr_anim_j355_slideflip",
   [CHAR_ANIM_TRIPLE_JUMP_LAND]         = "cr_anim_j355_tada",
   [CHAR_ANIM_SINGLE_JUMP]              = function(m, frame)
                                            if frame > 1 and frame < 5 and m.actionArg == 0 then
                                                m.marioBodyState.punchState = 4
                                            end
                                            return "cr_anim_j355_single_jump"
                                        end,
   [CHAR_ANIM_START_GROUND_POUND]       = "cr_anim_j355_gp_start",
   [CHAR_ANIM_GROUND_POUND]             = "cr_anim_j355_gp",
   [CHAR_ANIM_GROUND_POUND_LANDING]     = "cr_anim_j355_gp_land",
   [CHAR_ANIM_SLIDE_KICK]               = function(m, frame)
                                            if frame == 2 then
                                                m.marioBodyState.punchState = (2 << 6) | 6
                                            end
                                        end,
}
local HANDTABLE_CR_DAVY = {
   [CHAR_ANIM_DOUBLE_JUMP_RISE]         = MARIO_HAND_OPEN,
   [CHAR_ANIM_DOUBLE_JUMP_FALL]         = MARIO_HAND_OPEN,
   [CHAR_ANIM_BACKFLIP]                 = MARIO_HAND_OPEN,
   [CHAR_ANIM_SLIDE_KICK]               = MARIO_HAND_RIGHT_OPEN,
   [CHAR_ANIM_THROW_LIGHT_OBJECT]       = MARIO_HAND_RIGHT_OPEN,
   [CHAR_ANIM_GROUND_THROW]             = function(m, frame) if frame < 10 then return MARIO_HAND_RIGHT_OPEN end end,
   [CHAR_ANIM_SLIDEJUMP]                = function(m, frame) if frame > 10 then return MARIO_HAND_RIGHT_OPEN end end,
   [CHAR_ANIM_TRIPLE_JUMP_LAND]         = function(m, frame) if frame < 20 then return MARIO_HAND_OPEN end end,
}

local EYETABLE_CR_J355 = {
    [_G.charSelect.CS_ANIM_MENU] = MARIO_EYES_OPEN,
}
local HANDTABLE_CR_JESS = {
   [CHAR_ANIM_DOUBLE_JUMP_RISE]         = MARIO_HAND_OPEN,
   [CHAR_ANIM_DOUBLE_JUMP_FALL]         = MARIO_HAND_OPEN,
   [CHAR_ANIM_BACKFLIP]                 = MARIO_HAND_OPEN,
   [CHAR_ANIM_SLIDEFLIP]                = MARIO_HAND_OPEN,
   [CHAR_ANIM_SLIDE_KICK]               = MARIO_HAND_RIGHT_OPEN,
   [CHAR_ANIM_THROW_LIGHT_OBJECT]       = MARIO_HAND_RIGHT_OPEN,
   [CHAR_ANIM_GROUND_THROW]             = function(m, frame) if frame < 10 then return MARIO_HAND_RIGHT_OPEN end end,
   [CHAR_ANIM_SLIDEJUMP]                = function(m, frame) if frame > 10 then return MARIO_HAND_RIGHT_OPEN end end,
   [CHAR_ANIM_TRIPLE_JUMP_LAND]         = function(m, frame) if frame < 20 then return MARIO_HAND_OPEN end end,
   [CHAR_ANIM_TRIPLE_JUMP_GROUND_POUND] = function(m, frame) if frame < 7 then return MARIO_HAND_OPEN end end,
   [CHAR_ANIM_START_GROUND_POUND]       = function(m, frame) if frame < 7 then return MARIO_HAND_OPEN end end,
}

if _G.charSelectExists then
    CT_CR_DAVY = _G.charSelect.character_add("Davy", { "The skeleman. Nefarious and unpredictable in nature."},
        "DavyDaBest",
        {r = 255, g = 119, b = 000},
        E_MODEL_CR_DAVY,
        CT_MARIO,
        TEX_CR_DAVY,
        1.25
    )
    CT_CR_J355 = _G.charSelect.character_add("J-355", { "A robotic clone of a familiar face. Built for combat without any emotions... unless..."},
       "JerThePear",
       {r = 255, g = 255, b = 0},
       E_MODEL_CR_J355,
       CT_MARIO,
       TEX_CR_J355,
       1.25
    )
end

local CSloaded = false
local function on_character_select_load()
    for i = 1, #PALETTES_CR_DAVY do
        _G.charSelect.character_add_palette_preset(E_MODEL_CR_DAVY, PALETTES_CR_DAVY[i], PALETTES_CR_DAVY[i].name)
    end
    for i = 1, #PALETTES_CR_J355 do
       _G.charSelect.character_add_palette_preset(E_MODEL_CR_J355, PALETTES_CR_J355[i], PALETTES_CR_J355[i].name)
    end

    _G.charSelect.character_add_animations(E_MODEL_CR_DAVY, ANIMTABLE_CR_DAVY, EYETABLE_CR_DAVY, HANDTABLE_CR_DAVY)
    --_G.charSelect.character_add_caps(E_MODEL_CR_DAVY, CAP_CR_DAVY)
    _G.charSelect.character_add_voice(E_MODEL_CR_DAVY, VOICETABLE_CR_DAVY)
    _G.charSelect.character_add_graffiti(CT_CR_DAVY, TEX_ART_CR_DAVY)
    _G.charSelect.character_add_menu_instrumental(CT_CR_DAVY, SOUND_MENU_THEME_CR_DAVY)
    _G.charSelect.character_add_health_meter(CT_CR_DAVY, function (localIndex, health, prevX, prevY, prevScaleX, prevScaleY, x, y, scaleX, scaleY)
        local segments = health >> 8

        djui_hud_render_texture(TEX_HEALTH_CR_DAVY, x, y, 1, 1)
        if segments > 0 then
            djui_hud_render_texture_tile(TEX_HEALTH_PIE, x + 16, y + 16, 1, 1, (32 * (segments - 1)), 0, 32, 32)
        end
    end)

    _G.charSelect.character_add_animations(E_MODEL_CR_J355, ANIMTABLE_CR_J355, EYETABLE_CR_J355, HANDTABLE_CR_JESS)
    --_G.charSelect.character_add_caps(E_MODEL_CR_J355, CAP_CR_J355)
    _G.charSelect.character_add_voice(E_MODEL_CR_J355, VOICETABLE_CR_J355)
    --_G.charSelect.character_add_graffiti(CT_CR_J355, TEX_ART_CR_J355)
    --_G.charSelect.character_add_menu_instrumental(CT_CR_J355, SOUND_MENU_THEME_CR_J355)
    _G.charSelect.character_add_health_meter(CT_CR_J355, function (localIndex, health, prevX, prevY, prevScaleX, prevScaleY, x, y, scaleX, scaleY)
        local segments = health >> 8
        djui_hud_render_texture(TEX_HEALTH_CR_J355, x, y, 1, 1)
        if segments > 0 then
            djui_hud_render_texture_tile(TEX_HEALTH_PIE, x + 16, y + 16, 1, 1, (32 * (segments - 1)), 0, 32, 32)
        end
    end)

    -- Categories
    _G.charSelect.character_set_category(CT_CR_DAVY, "Clankers: Rebuilt")
    _G.charSelect.character_set_category(CT_CR_DAVY, "Squishy Workshop")
    _G.charSelect.character_set_category(CT_CR_J355, "Clankers: Rebuilt")
    _G.charSelect.character_set_category(CT_CR_J355, "Squishy Workshop")

    CSloaded = true
end

local function on_character_sound(m, sound)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_CR_DAVY then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_CR_J355 then return _G.charSelect.voice.sound(m, sound) end
end

local function on_character_snore(m)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_CR_DAVY then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_CR_J355 then return _G.charSelect.voice.snore(m) end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
hook_event(HOOK_MARIO_UPDATE, on_character_snore)

local gExtraStates = {}
for i = 0, MAX_PLAYERS - 1 do
    gExtraStates[i] = {}
    local e = gExtraStates[i]
    e.davyHasWing = 0
end

local function davy_flying_star(m)
    local np = gNetworkPlayers[m.playerIndex]
    local e = gExtraStates[m.playerIndex]

    if CT_CR_DAVY == _G.charSelect.character_get_current_number(m.playerIndex) then
        if m.flags & MARIO_WING_CAP ~= 0 then
            network_player_set_override_palette_color(np, EMBLEM,   {r = 192, g = 0, b = 0})
            network_player_set_override_palette_color(np, CAP,      {r = 192, g = 0, b = 0})
            network_player_set_override_palette_color(np, GLOVES,   {r = 192, g = 0, b = 0})
            network_player_set_override_palette_color(np, SHIRT,    {r = 34, g = 34, b = 34})
            network_player_set_override_palette_color(np, PANTS,    {r = 34, g = 34, b = 34})
            network_player_set_override_palette_color(np, SHOES,    {r = 48, g = 48, b = 48})

            e.davyHasWing = true
        elseif m.flags & MARIO_WING_CAP == 0 and e.davyHasWing then
            network_player_reset_override_palette(np)
            e.davyHasWing = false
        end
    end
end

hook_event(HOOK_MARIO_UPDATE, davy_flying_star)