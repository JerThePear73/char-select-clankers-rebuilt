if not _G.charSelectExists then return end

local ACT_DAVY_FLUTTER = allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_GROUP_AIRBORNE) -- this is just taken from extra chars cuz i dont feel like coding this from scratch rn
local ACT_DAVY_MISSILE = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_ATTACKING)
local ACT_DAVY_DASH = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_ATTACKING)
local ACT_DAVY_THROW_FIREBALL = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
local ACT_DAVY_CARRY = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING)
local ACT_DAVY_CREATE_BOMB = allocate_mario_action(ACT_GROUP_STATIONARY | ACT_FLAG_STATIONARY)

gDavyStates = {}
for i = 0, MAX_PLAYERS - 1 do
    gDavyStates[i] = {}
    local e = gDavyStates[i]
    e.gfxY = 0
    e.gfxZ = 0
    e.bombCharge = 0
    e.canGPCancel = true
    e.canFlutter = false
    e.canDash = true
    e.hasWing = false
    e.flySpeed = 0
    e.flyBoostCooldown = 0
    e.fireballsThrown = 0
end

local flyBoostCooldownMax = 45
local ARG_FIREBALL = 10
local maxFireballThrows = 2
local bombTable = {
    E_MODEL_BLACK_BOBOMB,
    E_MODEL_BLACK_BOBOMB,
    E_MODEL_BLACK_BOBOMB,
    E_MODEL_BOBOMB_BUDDY,
}
local flutterActions = {
    [ACT_JUMP] = true,
    [ACT_DOUBLE_JUMP] = true,
    [ACT_TRIPLE_JUMP] = true,
    [ACT_LONG_JUMP] = true,
    [ACT_FREEFALL] = true,
    [ACT_SIDE_FLIP] = true,
    [ACT_WALL_KICK_AIR] = true,
    [ACT_DAVY_THROW_FIREBALL] = true,
}
local TEX_CR_DAVY_BOMB_METER = get_texture_info("cr_hud_davy_bomb_meter")
local TEX_CR_DAVY_BOMB_BAR = get_texture_info("cr_hud_davy_bomb_bar")

--local E_MODEL_CR_SKELEBOMB = smlua_model_util_get_id('cr_skelebomb_geo')

------------------
-- CUSTOM MOVES --
------------------

local function act_davy_missile(m)
    local e = gDavyStates[m.playerIndex]

    if m.actionState == 0 then
        set_camera_shake_from_hit(SHAKE_ENV_BOWSER_JUMP)
        play_sound(SOUND_GENERAL_BOWSER_BOMB_EXPLOSION, m.marioObj.header.gfx.cameraToObject)
        m.faceAngle.y = m.intendedYaw
        m.forwardVel = (m.flags & MARIO_METAL_CAP ~= 0) and 15 or 85
        m.vel.y = (m.flags & MARIO_METAL_CAP ~= 0) and 90 or 50
        m.actionState = 1
    end

    smlua_anim_util_set_animation(m.marioObj, "cr_anim_davy_missile")
    m.particleFlags = m.particleFlags | PARTICLE_FIRE
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_UP

    local stepResult = common_air_action_step(m, ACT_DIVE, MARIO_ANIM_GROUND_POUND, AIR_STEP_NONE)
    if stepResult == AIR_STEP_LANDED then
        if should_get_stuck_in_ground(m) ~= 0 then
            play_character_sound(m, CHAR_SOUND_OOOF2)
            set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, 0)
            set_mario_action(m, ACT_HEAD_STUCK_IN_GROUND, 0)
        else
            play_sound(SOUND_ACTION_TERRAIN_LANDING, m.marioObj.header.gfx.cameraToObject)
            set_mario_action(m, ACT_DIVE_SLIDE, 0)
        end
    elseif stepResult == AIR_STEP_HIT_WALL then
        spawn_non_sync_object(id_bhvExplosion, E_MODEL_EXPLOSION, m.pos.x, m.pos.y, m.pos.z,
            function (o)
                o.oDamageOrCoinValue = 0
                obj_scale(o, 2)
            end)
        set_mario_particle_flags(m, PARTICLE_VERTICAL_STAR, 0)
        if m.flags & MARIO_METAL_CAP ~= 0 then
            m.faceAngle.y = m.faceAngle.y - 0x8000
            m.pos.y = m.pos.y + 50
            return set_mario_action(m, ACT_JUMP, 0)
        else
            return set_mario_action(m, ACT_BACKWARD_AIR_KB, 0)
        end
    end

    if m.flags & MARIO_METAL_CAP ~= 0 then
        m.peakHeight = m.pos.y
        if m.input & INPUT_B_PRESSED ~= 0 then
            return set_mario_action(m, ACT_DAVY_DASH, 0)
        end
    end

    m.vel.y = m.vel.y + 1
    e.gfxZ = e.gfxZ + 0x3000
    m.marioObj.header.gfx.angle.z = e.gfxZ
    m.marioObj.header.gfx.angle.x = degrees_to_sm64(m.vel.y * -1)

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_DAVY_MISSILE, act_davy_missile)

local function act_davy_dash(m)
    local e = gDavyStates[m.playerIndex]
    local durr = (m.flags & MARIO_METAL_CAP ~= 0) and 30 or 20
    local speed = 65

    if m.actionState == 0 then
        m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
        m.actionState = 1
        e.canDash = false
        e.flySpeed = speed
    end

    if m.actionTimer > durr then
        if m.flags & MARIO_WING_CAP ~= 0 then
            m.faceAngle.z = m.marioObj.header.gfx.angle.z
            m.faceAngle.x = 0
            e.gfxZ = e.gfxZ * -1
            set_mario_action(m, ACT_FLYING, 0)
        else
            set_mario_action(m, ACT_FREEFALL, 0)
        end
    else
        play_sound(SOUND_AIR_BOWSER_SPIT_FIRE, m.marioObj.header.gfx.cameraToObject)
    end

    m.faceAngle.y = m.intendedYaw - approach_s32(math.s16(m.intendedYaw - m.faceAngle.y), 0, 0x200, 0x200)
    m.forwardVel = speed
    m.vel.y = 0

    local stepResult = common_air_action_step(m, ACT_DIVE_SLIDE, MARIO_ANIM_TRIPLE_JUMP_FLY, AIR_STEP_NONE)
    if stepResult == AIR_STEP_HIT_WALL then
        spawn_non_sync_object(id_bhvExplosion, E_MODEL_EXPLOSION, m.pos.x, m.pos.y, m.pos.z,
            function (o)
                o.oDamageOrCoinValue = 0
                obj_scale(o, 2)
            end)
        set_mario_particle_flags(m, PARTICLE_VERTICAL_STAR, 0)
        if m.flags & MARIO_METAL_CAP ~= 0 then
            m.faceAngle.y = m.faceAngle.y - 0x8000
            m.pos.y = m.pos.y + 50
            return set_mario_action(m, ACT_JUMP, 0)
        else
            set_mario_action(m, ACT_BACKWARD_AIR_KB, 0)
        end
    end

    if m.input & INPUT_Z_PRESSED ~= 0 then
        m.marioObj.header.gfx.angle.z = 0
        return set_mario_action(m, ACT_GROUND_POUND, 0)
    else
        e.gfxZ = e.gfxZ + 0x2000
        m.marioObj.header.gfx.angle.z = e.gfxZ
    end

    smlua_anim_util_set_animation(m.marioObj, "cr_anim_davy_missile")
    set_mario_particle_flags(m, PARTICLE_FIRE, 0)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_UP
    m.marioBodyState.handState = MARIO_HAND_OPEN

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_DAVY_DASH, act_davy_dash)

local function act_davy_flutter(m) -- redo this

    -- End flutter after 1 second
    if m.actionTimer >= 30 or (m.input & INPUT_A_DOWN) == 0 then
        return set_mario_action(m, ACT_FREEFALL, 0)
    end

    local ended = common_air_action_step(m, ACT_JUMP_LAND, CHAR_ANIM_RUNNING_UNUSED, 0) ~= 0 -- Checks if the action ended earlier due to forced actions like bonking or landing

    if m.actionTimer == 0 and not ended then
        play_character_sound(m, CHAR_SOUND_TWIRL_BOUNCE) -- Play audio sample
    end

    smlua_anim_util_set_animation(m.marioObj, "cr_anim_davy_flutter") -- Sets the animation

    m.marioBodyState.eyeState = MARIO_EYES_LOOK_DOWN ---@type MarioEyesGSCId Eye State
    m.marioBodyState.handState = MARIO_HAND_OPEN
    m.vel.y = approach_f32(m.vel.y, m.actionTimer / 1.25, 8, 8) -- Height increases faster as the 1 second passes
    m.marioObj.header.gfx.animInfo.animAccel = 32768 * 4 -- Animation Speed
    
    if m.forwardVel > 25 then
        m.forwardVel = m.forwardVel - 2 -- nerf velocity cuz this shit busted
    end
    if m.input & INPUT_B_PRESSED ~= 0 then
        set_mario_action(m, ACT_DAVY_DASH, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return false
end
hook_mario_action(ACT_DAVY_FLUTTER, act_davy_flutter)

local function act_davy_carry(m)

    if should_begin_sliding(m) ~= 0 then
        return set_mario_action(m, ACT_HOLD_BEGIN_SLIDING, 0);
    end

    if (m.input & INPUT_A_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_HOLD_JUMP, 0);
    end

    if (m.input & INPUT_NONZERO_ANALOG) == 0 then
        m.forwardVel = m.forwardVel * 0.95;
        if m.forwardVel < 1 then
            return set_mario_action(m, ACT_HOLD_IDLE, 0)
        end
    end

    if (m.input & INPUT_Z_PRESSED) ~= 0 then
        mario_drop_held_object(m)
        return set_mario_action(m, ACT_CROUCH_SLIDE, 0);
    end

    if m.input & INPUT_B_PRESSED ~= 0 then
        m.faceAngle.y = m.intendedYaw
        return set_mario_action(m, ACT_THROWING, 0)
    end

    update_walking_speed(m);

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_LEFT_GROUND then
        set_mario_action(m, ACT_HOLD_FREEFALL, 0)
    elseif stepResult == GROUND_STEP_NONE then
        local val04 = m.intendedMag > m.forwardVel and m.intendedMag or m.forwardVel
        if val04 < 4 then
            val04 = 4
        end
        set_mario_anim_with_accel(m, CHAR_ANIM_RUN_WITH_LIGHT_OBJ, (val04 / 4.0 * 0x10000))
        play_step_sound(m, 9, 45)
        if (m.intendedMag - m.forwardVel > 16.0) then
            set_mario_particle_flags(m, PARTICLE_DUST, 0)
        end
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_DAVY_CARRY, act_davy_carry)

local function act_davy_create_bomb(m)
    local e = gDavyStates[m.playerIndex]
    local exitFrame = (m.input & INPUT_NONZERO_ANALOG ~= 0) and 20 or 30

    set_mario_anim_with_accel(m, CHAR_ANIM_THROW_CATCH_KEY, 0x20000)
    stationary_ground_step(m)

    if m.marioObj.header.gfx.animInfo.animFrame == 30 then
        if m.playerIndex == 0 then
            spawn_sync_object(id_bhvBobomb, bombTable[math.random(1, #bombTable)], m.pos.x, m.pos.y, m.pos.z, function(o)
                obj_scale(o, 0.75)
                m.usedObj = o
                m.heldObj = o
                o.oHeldState = HELD_HELD
                o.oBobombFuseTimer = -300
                m.heldObj.oBehParams = 0x100 -- no coin
                mario_grab_used_object(m)
            end)
            play_sound(SOUND_ACTION_UNSTUCK_FROM_GROUND, m.marioObj.header.gfx.cameraToObject)
            e.bombCharge = e.bombCharge - 500
        end
    end

    if m.actionTimer >= exitFrame then
        return set_mario_action(m, ACT_HOLD_IDLE, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_DAVY_CREATE_BOMB, act_davy_create_bomb)

local function act_davy_throw_fireball(m)
    local e = gDavyStates[m.playerIndex]

    if m.actionState == 0 then
        m.faceAngle.y = m.intendedYaw
        m.actionTimer = 0
        m.vel.y = 20
        e.fireballsThrown = e.fireballsThrown + 1
        play_character_sound(m, CHAR_SOUND_YAH_WAH_HOO)
        set_anim_to_frame(m, 0)
        spawn_fireball(m)
        m.actionState = 1
    end

    local stepResult = common_air_action_step(m, ACT_FREEFALL_LAND, MARIO_ANIM_THROW_LIGHT_OBJECT, AIR_STEP_NONE)
    if stepResult == AIR_STEP_LANDED then
        play_sound(SOUND_ACTION_TERRAIN_LANDING, m.marioObj.header.gfx.cameraToObject)
    elseif stepResult == AIR_STEP_HIT_WALL then
        return set_mario_action(m, ACT_AIR_HIT_WALL, 0)
    end

    if m.actionTimer > 10 and m.input & INPUT_B_PRESSED ~= 0 and m.flags & MARIO_METAL_CAP ~= 0 and e.fireballsThrown < maxFireballThrows then
        m.actionState = 0
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_DAVY_THROW_FIREBALL, act_davy_throw_fireball)

----------
-- DAVY --
----------

local function davy_set_action(m)
    local e = gDavyStates[m.playerIndex]

    if m.pos.y == m.floorHeight then
        e.canGPCancel = true
        e.canDash = true
        e.canFlutter = true
        e.fireballsThrown = 0
    end

    -- juiced single jump
    if m.action == ACT_JUMP or m.action == ACT_HOLD_JUMP then
        m.vel.y = m.vel.y + 10
    end
    -- twirl landing momentum
    if m.action == ACT_TWIRL_LAND and m.input & INPUT_NONZERO_ANALOG ~= 0 then
        set_mario_action(m, ACT_WALKING, 0)
    end
    -- dash
    if m.action == ACT_DIVE and m.input & INPUT_A_DOWN ~= 0 and e.canDash and m.pos.y > (m.floorHeight + 20) then
       set_mario_action(m, ACT_DAVY_DASH, 0)
    end
    -- throw hop
    if m.action == ACT_AIR_THROW then
        m.faceAngle.y = m.intendedYaw
        m.vel.y = 25
    end
end

local function davy_before_set_action(m, act)
    local e = gDavyStates[m.playerIndex]
    -- derpy crouch
    if act == ACT_START_CROUCHING then
        return ACT_CROUCHING
    elseif act == ACT_STOP_CROUCHING then
        return ACT_IDLE
    -- wario bros
    elseif act == ACT_HOLD_WALKING then
        return ACT_DAVY_CARRY
    elseif act == ACT_THROWING then
        m.pos.y = m.pos.y + 30
        return ACT_AIR_THROW
    end

    -- fire
    if m.flags & MARIO_METAL_CAP ~= 0 and e.fireballsThrown < maxFireballThrows then
        if (act == ACT_DIVE and m.input & INPUT_A_DOWN == 0)
        or act == ACT_MOVE_PUNCHING
        or act == ACT_JUMP_KICK then
            return ACT_DAVY_THROW_FIREBALL
        end
    end
end

local function davy_update(m)
    local e = gDavyStates[m.playerIndex]

    -- skeletal missile
    if m.action == ACT_GROUND_POUND_LAND and m.input & INPUT_A_PRESSED ~= 0 then
        set_mario_action(m, ACT_DAVY_MISSILE, 0)
    end
    -- GP cancel kick
    if m.action == ACT_GROUND_POUND and m.input & INPUT_B_PRESSED ~= 0 and e.canGPCancel then
        m.faceAngle.y = m.intendedYaw
        m.forwardVel = 50
        m.vel.y = 10
        e.canGPCancel = false
        return set_mario_action(m, ACT_SLIDE_KICK, 0)
    end
    -- bomb
    e.bombCharge = math.clamp(e.bombCharge + 1, 0, 1500)
    -- flutter
    if flutterActions[m.action] and m.input & INPUT_A_PRESSED ~= 0 and m.vel.y < 0 and e.canFlutter then
        set_mario_action(m, ACT_DAVY_FLUTTER, 0)
        e.canFlutter = false
    end

    -- flying
    if m.action == ACT_FLYING then
        local x0 = get_hand_foot_pos_x(m, 0)
        local y0 = get_hand_foot_pos_y(m, 0) - 25
        local z0 = get_hand_foot_pos_z(m, 0)
        local x1 = get_hand_foot_pos_x(m, 1)
        local y1 = get_hand_foot_pos_y(m, 1) - 25
        local z1 = get_hand_foot_pos_z(m, 1)

        spawn_non_sync_object(
            id_bhvCoinSparkles,
            E_MODEL_RED_FLAME,
            x0,
            y0,
            z0,
            nil
        )
        spawn_non_sync_object(
            id_bhvCoinSparkles,
            E_MODEL_RED_FLAME,
            x1,
            y1,
            z1,
            nil
        )
        local maxSpeed = (m.flags & MARIO_METAL_CAP ~= 0) and 45 or 30
        if e.flySpeed < maxSpeed then
            e.flySpeed = maxSpeed
        else
            e.flySpeed = math.lerp(e.flySpeed, maxSpeed, 0.05)
        end

        if m.input & INPUT_B_PRESSED ~= 0 and e.flyBoostCooldown == 0 then
            play_character_sound(m, CHAR_SOUND_YAHOO_WAHA_YIPPEE)
            e.gfxZ = -0x10000
            e.flySpeed = maxSpeed + 25
            e.flyBoostCooldown = flyBoostCooldownMax
        end

        e.flyBoostCooldown = math.clamp(e.flyBoostCooldown - 1, 0, flyBoostCooldownMax)
        e.gfxZ = math.lerp(e.gfxZ, 0, 0.1)
        m.marioObj.header.gfx.angle.z = m.marioObj.header.gfx.angle.z + e.gfxZ
        m.forwardVel = e.flySpeed
    end

    if m.flags & MARIO_METAL_CAP ~= 0 then
        if m.pos.y > m.waterLevel then
            local headPos = gVec3fZero{}
            get_mario_anim_part_pos(m, MARIO_ANIM_PART_HEAD, headPos)
            local range = 10
            local offsetX = math.random(0 - range, range)
            local offsetY = math.random(0 - range, range) + 10
            local offsetZ = math.random(0 - range, range)
            if m.playerIndex == 0 then
                spawn_non_sync_object(id_bhvCoinSparkles, E_MODEL_RED_FLAME, headPos.x + offsetX, headPos.y + offsetY, headPos.z + offsetZ, function(o)
                    obj_scale(o, 3)
                end)
            end
        else
            if get_global_timer() % 10 == 0 then
                play_sound(SOUND_GENERAL_FLAME_OUT, m.marioObj.header.gfx.cameraToObject)
            end
            set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, 0)
            if m.capTimer > 5 then
                m.capTimer = m.capTimer - 2
            end
        end
        m.marioBodyState.eyeState = MARIO_EYES_DEAD
    end

    -- bomb stashing
    if (m.action == ACT_IDLE or m.action == ACT_PANTING) and e.bombCharge >= 500 then
        if m.controller.buttonDown & L_TRIG ~= 0 then
            return set_mario_action(m, ACT_DAVY_CREATE_BOMB, 1)
        end
    end

    -- better throwing
    if (m.action == ACT_AIR_THROW and m.actionTimer == 5) and m.usedObj ~= nil then
        m.usedObj.oForwardVel = 30 + m.forwardVel
        m.usedObj.oVelY = 20
    end
end

local function davy_interact(m, o, type)
    local e = gDavyStates[m.playerIndex]
    if m.playerIndex == 0 and type == INTERACT_COIN then
        e.bombCharge = e.bombCharge + (25 * o.oDamageOrCoinValue)
    end
    if obj_has_behavior_id(o, id_bhvSpindrift) ~= 0 or obj_has_behavior_id(o, id_bhvFlyGuy) ~= 0 then
        local oTwirlEnemy = nil
        if obj_has_behavior_id(o, id_bhvSpindrift) ~= 0 then
            oTwirlEnemy = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvSpindrift)
        elseif obj_has_behavior_id(o, id_bhvFlyGuy) ~= 0 then
            oTwirlEnemy = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvFlyGuy)
        end
        if oTwirlEnemy ~= nil and oTwirlEnemy.oInteractStatus & INT_STATUS_WAS_ATTACKED ~= 0 and m.action ~= ACT_TWIRLING and m.flags & MARIO_METAL_CAP == 0 then
            spawn_non_sync_object(id_bhvMetalCap, E_MODEL_MARIOS_METAL_CAP, o.oPosX, o.oPosY + 100, o.oPosZ, function(cap)
                cap.oVelY = 20
            end)
        end
    end
end

local function davy_sound(sound, pos)
    local m = gMarioStates[0]
    local e = gDavyStates[m.playerIndex]
    if m.playerIndex ~= 0 then return end
    if sound == 70746241 then
        e.bombCharge = e.bombCharge + 15
    end
    --djui_chat_message_create(tostring(sound))
end

local function davy_hazard(m, type)
    if m.flags & MARIO_METAL_CAP ~= 0 and type == SURFACE_BURNING then
        spawn_non_sync_object(id_bhvKoopaShellFlame, E_MODEL_RED_FLAME, m.pos.x, m.floorHeight, m.pos.z, nil)
        return false
    end
end

---------
-- HUD --
---------

function davy_hud()
    local m = gMarioStates[0]
    local e = gDavyStates[0]

    if gNetworkPlayers[0].currActNum == 99 or gMarioStates[0].action == ACT_INTRO_CUTSCENE or hud_is_hidden() or obj_get_first_with_behavior_id(id_bhvActSelector) then return end
        local davyBombCount = 0
        local davyBombMeterScale = ((e.bombCharge / 500) * 10)

        djui_hud_set_color(255, 255, 255, 255)
        djui_hud_set_resolution(RESOLUTION_N64)

        davyBombCount = math.floor(e.bombCharge/500)

        if davyBombMeterScale > 10 then
            davyBombMeterScale = (((e.bombCharge / 500) * 10) - (10 * davyBombCount))
        end

        djui_hud_render_texture_tile(TEX_CR_DAVY_BOMB_METER, 15, 50, 4, 1, 32 * davyBombCount, 0, 32, 128)
        djui_hud_render_texture_tile(TEX_CR_DAVY_BOMB_BAR, 15, (169 - (8 * davyBombMeterScale)), 1/4, davyBombMeterScale, 32 * davyBombCount, 0, 32, 8)

        --djui_hud_set_font(FONT_HUD)
        --djui_hud_print_text(string.format("BOMBS ;%.0f", davyBombCount) , 25, 205, 1)
end

_G.charSelect.character_hook_moveset(CT_CR_DAVY, HOOK_MARIO_UPDATE, davy_update)
_G.charSelect.character_hook_moveset(CT_CR_DAVY, HOOK_ON_SET_MARIO_ACTION, davy_set_action)
_G.charSelect.character_hook_moveset(CT_CR_DAVY, HOOK_ON_INTERACT, davy_interact)
_G.charSelect.character_hook_moveset(CT_CR_DAVY, HOOK_ON_PLAY_SOUND, davy_sound)
_G.charSelect.character_hook_moveset(CT_CR_DAVY, HOOK_BEFORE_SET_MARIO_ACTION, davy_before_set_action)
_G.charSelect.character_hook_moveset(CT_CR_DAVY, HOOK_ALLOW_HAZARD_SURFACE, davy_hazard)
_G.charSelect.character_hook_moveset(CT_CR_DAVY, HOOK_ON_HUD_RENDER_BEHIND, davy_hud)