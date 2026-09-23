if not _G.charSelectExists then return end
--if _G.charSelectExists then return end

local ACT_SKATE_JUMP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
local ACT_ICE_SKATING = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_RIDING_SHELL)
local ACT_FLUDD_HOVER = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_CONTROL_JUMP_HEIGHT)
local ACT_SPRINGFLIP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
local ACT_GALAXY_SPIN = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING)
local ACT_SPINJUMP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
local ACT_FLUDD_BOOST = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)

local maxWater = 3000
local maxHover = 75
local ANGLE_QUEUE_SIZE = 9
local SPIN_TIMER_SUCCESSFUL_INPUT = 4
local rocketJumpCost = maxWater/10
local burstCost = maxWater/50

gJ355States = {}
for i = 0, MAX_PLAYERS - 1 do
    gJ355States[i] = {}
    local e = gJ355States[i]
    --e.water = 0
    e.hover = 0
    e.prevVel = 0
    e.prevPosY = 0
    e.gfxY = 0
    e.gfxZ = 0
    e.skateAngle = 0
    e.skateSpeed = 0
    e.run = 0
    e.sprintCheck = false
    e.hudOffsetX = 0
    e.fluddVelY = 0
    e.fluddLoop = -1
    -- spin
    e.stickLastAngle = 0
    e.spinDirection = 0
    e.spinBufferTimer = 0
    e.spinInput = 0
    e.lastStickMag = 0
    e.angleDeltaQueue = {}
    for j=0,(ANGLE_QUEUE_SIZE-1) do gJ355States[i].angleDeltaQueue[j] = 0 end
    -- sync table
    gPlayerSyncTable[i].water = 0
    --gPlayerSyncTable[i].hover = 0
end

local SOUND_FLUDD_PICKUP    = audio_sample_load("cr_sound_wett_pickup.ogg")
-- local SOUND_FLUDD_HOVER     = audio_sample_load("cr_sound_wett_hover.ogg")
-- local SOUND_FLUDD_HOVER_END = audio_sample_load("cr_sound_wett_hover_end.ogg")
-- local SOUND_FLUDD_CHARGE    = audio_sample_load("cr_sound_wett_charge.ogg")
-- local SOUND_FLUDD_LOOP      = audio_stream_load("cr_sound_wett_loop.ogg")

local TEX_CR_J355_TANK = get_texture_info("cr_hud_j355_tank")

local iceJumps = {
    "cr_anim_j355_ice_jump_1",
    "cr_anim_j355_ice_jump_2",
    "cr_anim_j355_ice_jump_3",
}
local noSkateActions = {
    [ACT_FALL_AFTER_STAR_GRAB]  = true,
    [ACT_STAR_DANCE_EXIT]       = true,
    [ACT_STAR_DANCE_NO_EXIT]    = true,
    [ACT_ICE_SKATING]           = true,
    [ACT_PUTTING_ON_CAP]        = true,
    [ACT_RIDING_SHELL_GROUND]   = true,
    [ACT_RIDING_SHELL_JUMP]     = true,
    [ACT_RIDING_SHELL_FALL]     = true,
}
local fluddActions = {
    [ACT_JUMP]              = true,
    [ACT_DOUBLE_JUMP]       = true,
    [ACT_TWIRLING]          = true,
    [ACT_SIDE_FLIP]         = true,
    [ACT_BACKFLIP]          = true,
    [ACT_FREEFALL]          = true,
    [ACT_WALL_KICK_AIR]     = true,
    [ACT_TOP_OF_POLE_JUMP]  = true,
    [ACT_FORWARD_ROLLOUT]   = true,
    [ACT_STEEP_JUMP]        = true,
    [ACT_TRIPLE_JUMP]       = true,
    [ACT_SPINJUMP]          = true,
}
local spinActions = {
    [ACT_LONG_JUMP]     = true,
    [ACT_BACKFLIP]      = true,
    [ACT_SKATE_JUMP]    = true,
}
local walkingActions = {
    [ACT_IDLE]                  = true,
    [ACT_WALKING]               = true,
    [ACT_DECELERATING]          = true,
    [ACT_BRAKING]               = true,
    [ACT_BRAKING_STOP]          = true,
    [ACT_TURNING_AROUND]        = true,
    [ACT_FINISH_TURNING_AROUND] = true,
}

local function pause_check()
    local m = gMarioStates[0]

    if m.action == ACT_START_SLEEPING or m.action == ACT_SLEEPING or m.actionTimer < 80 and
        (m.action == ACT_STAR_DANCE_EXIT or m.action == ACT_STAR_DANCE_NO_EXIT or m.action == ACT_STAR_DANCE_WATER) then
        return 0.2
    end

    if is_game_paused() or _G.charSelect.is_menu_open() then
        return 0
    end

    return 1
end

local function mario_update_spin_input(m) -- taken from extended moveset
    local e = gJ355States[m.playerIndex]
    local rawAngle = atan2s(-m.controller.stickY, m.controller.stickX)
    e.spinInput = 0

    -- prevent issues due to the frame going out of the dead zone registering the last angle as 0
    if e.lastStickMag > 60 and m.controller.stickMag > 60 then
        local angleOverFrames = 0
        local thisFrameDelta = 0
        local i = 0

        local newDirection = e.spinDirection
        local signedOverflow = 0

        if rawAngle < e.stickLastAngle then
            if e.stickLastAngle - rawAngle > 0x8000 then
                signedOverflow = 1
            end
            if signedOverflow ~= 0 then
                newDirection = 1
            else
                newDirection = -1
            end
        elseif rawAngle > e.stickLastAngle then
            if rawAngle - e.stickLastAngle > 0x8000 then
                signedOverflow = 1
            end
            if signedOverflow ~= 0 then
                newDirection = -1
            else
                newDirection = 1
            end
        end

        if e.spinDirection ~= newDirection then
            for i=0,(ANGLE_QUEUE_SIZE-1) do
                e.angleDeltaQueue[i] = 0
            end
            e.spinDirection = newDirection
        else
            for i=(ANGLE_QUEUE_SIZE-1),1,-1 do
                e.angleDeltaQueue[i] = e.angleDeltaQueue[i-1]
                angleOverFrames = angleOverFrames + e.angleDeltaQueue[i]
            end
        end

        if e.spinDirection < 0 then
            if signedOverflow ~= 0 then
                thisFrameDelta = math.floor((1.0*e.stickLastAngle + 0x10000) - rawAngle)
            else
                thisFrameDelta = e.stickLastAngle - rawAngle
            end
        elseif e.spinDirection > 0 then
            if signedOverflow ~= 0 then
                thisFrameDelta = math.floor(1.0*rawAngle + 0x10000 - e.stickLastAngle)
            else
                thisFrameDelta = rawAngle - e.stickLastAngle
            end
        end

        e.angleDeltaQueue[0] = thisFrameDelta
        angleOverFrames = angleOverFrames + thisFrameDelta

        if angleOverFrames >= 0xA000 then
            e.spinBufferTimer = SPIN_TIMER_SUCCESSFUL_INPUT
        end


        -- allow a buffer after a successful input so that you can switch directions
        if e.spinBufferTimer > 0 then
            e.spinInput = 1
            e.spinBufferTimer = e.spinBufferTimer - 1
        end
    else
        e.spinDirection = 0
        e.spinBufferTimer = 0
    end

    e.stickLastAngle = rawAngle
    e.lastStickMag = m.controller.stickMag
end


------------------
-- CUSTOM MOVES --
------------------

local function act_ice_skating(m)
    local e = gJ355States[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]

    local targetSpeed = m.input & INPUT_NONZERO_ANALOG ~= 0 and 50 or 30
    local accel = 0
    local lerpRate = 0.05
    local turnAngle = math.abs(e.skateSpeed*35)
    local dYaw = math.s16(e.skateAngle - m.intendedYaw)
    local max = 0x1000
    local val04 = math.clamp((dYaw * e.skateSpeed / 12), -max, max)
    local absAngleY = math.abs(e.gfxY)
    local angleZ = absAngleY < max and e.gfxZ * (1 - (absAngleY/max)) or 0

    set_mario_particle_flags(m, PARTICLE_DUST, 0)
    smlua_anim_util_set_animation(m.marioObj, "cr_anim_j355_skating")

    if m.actionState == 0 then
        if m.forwardVel > 0 then
            e.gfxY = -0x10000
        end
        if m.pos.y < (m.floorHeight + 5) and m.prevAction == ACT_LAVA_BOOST then
            play_character_sound(m, CHAR_SOUND_UH2_2)
        end
        if s.water > 0 then
            e.hover = maxHover
        end
        e.skateSpeed = m.forwardVel
        e.skateAngle = m.faceAngle.y
        e.gfxZ = 0
        m.actionState = 1
    elseif e.gfxY < 0 then
        e.gfxY = (e.gfxY + 1500) * 0.9
        m.marioObj.header.gfx.animInfo.animFrame = 15
        accel = 0
        if e.gfxY < -0x10000 then
            set_mario_particle_flags(m, PARTICLE_SPARKLES, 0)
        end
    else
        if m.input & INPUT_Z_DOWN == 0 then
            e.gfxY = math.lerp(e.gfxY, 0, 0.2)
            if math.abs(e.gfxY) < 15 then
                e.gfxY = 0
            end
            accel = 11000
        else
            accel = 8000
        end
    end

    if m.input & INPUT_Z_DOWN ~= 0 and e.gfxY >= 0 and e.gfxY < 0x7950 and m.forwardVel >= 30 then
        e.gfxY = e.gfxY + 0x700
    end

    set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING_UNUSED, m.forwardVel / 5 * accel)

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_LEFT_GROUND then
        m.vel.y = 5
        return set_mario_action(m, ACT_FREEFALL, 0)
    end

    e.skateSpeed = math.lerp(e.skateSpeed, targetSpeed, lerpRate)
    if m.forwardVel > 0 then
        update_walking_speed(m)
        e.skateAngle = approach_s16_symmetric(e.skateAngle, m.intendedYaw, turnAngle)
    end
    mario_set_forward_vel(m, e.skateSpeed)
    play_sound(SOUND_MOVING_SLIDE_DOWN_POLE, m.marioObj.header.gfx.cameraToObject)

    if m.pos.y > (m.waterLevel + 1) and m.floor.type ~= SURFACE_BURNING then
        set_mario_action(m, ACT_WALKING, 0)
    end
    -- skating jump
    if (m.input & INPUT_A_PRESSED) ~= 0 then
        m.forwardVel = m.forwardVel - 4
        m.vel.y = 55
        m.pos.y = m.pos.y + 1
        return set_mario_action(m, ACT_SKATE_JUMP, math.random(1, #iceJumps))
    end
    if m.input & INPUT_B_PRESSED ~= 0 and e.gfxY == 0 then
        play_character_sound(m, CHAR_SOUND_SPIN)
        e.skateSpeed = e.skateSpeed + 10
        e.gfxY = -0x20000
    end
    -- fall when ice cap ends
    if m.flags & MARIO_METAL_CAP == 0 then
        set_mario_action(m, ACT_FREEFALL, 0)
    end

    e.gfxZ = approach_s16_symmetric(e.gfxZ, val04, 0x200)

    m.faceAngle.y = e.skateAngle
    m.marioObj.header.gfx.angle.y = m.faceAngle.y + e.gfxY
    m.marioObj.header.gfx.angle.x = 0
    m.marioObj.header.gfx.angle.z = angleZ


    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_ICE_SKATING, act_ice_skating)

local function act_skate_jump(m)
    local e = gJ355States[m.playerIndex]

    smlua_anim_util_set_animation(m.marioObj, iceJumps[m.actionArg])
    set_mario_particle_flags(m, PARTICLE_SPARKLES, 0)
    m.marioBodyState.handState = MARIO_HAND_OPEN

    if m.actionState == 0 then
        play_character_sound(m, CHAR_SOUND_HAHA)
        m.actionState = 1
    end

    local stepResult = common_air_action_step(m, ACT_DOUBLE_JUMP_LAND, MARIO_ANIM_TWIRL, AIR_STEP_NONE)

    if stepResult == AIR_STEP_LANDED and m.floor ~= nil then
        play_sound(SOUND_ACTION_TERRAIN_LANDING, m.marioObj.header.gfx.cameraToObject)
        if m.floor.type ~= nil and m.floor.type == SURFACE_BURNING then
            return set_mario_action(m, ACT_ICE_SKATING, 0)
        end
    end

    if m.pos.y < (m.waterLevel + 2) and m.flags & MARIO_METAL_CAP ~= 0 then
        return set_mario_action(m, ACT_ICE_SKATING, 0)
    end

    e.gfxY = e.gfxY + 0x1800
    m.marioObj.header.gfx.angle.y = e.gfxY

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_SKATE_JUMP, act_skate_jump)

local function act_fludd_hover(m)
    local e = gJ355States[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]
    local target = 3

    if m.actionState == 0 then
        e.prevPosY = m.pos.y + 10
        e.fluddVelY = m.vel.y
        play_character_sound(m, CHAR_SOUND_WETT_HOVER)
        m.actionState = 1
    end

    if m.pos.y < e.prevPosY then
        target = 10
    end

    local stepResult = common_air_action_step(m, ACT_FREEFALL, MARIO_ANIM_RUNNING_UNUSED, AIR_STEP_NONE)
    smlua_anim_util_set_animation(m.marioObj, "cr_anim_j355_fludd_hover")
    m.faceAngle.y = approach_s16_symmetric(m.faceAngle.y, m.intendedYaw, 0x300)
    set_mario_particle_flags(m, PARTICLE_SNOW, 0)
    e.fluddVelY = math.lerp(e.fluddVelY, target, 0.15)
    m.vel.y = e.fluddVelY

    if m.forwardVel > 25 then
        m.forwardVel = m.forwardVel - 1
    end
    if stepResult == AIR_STEP_LANDED then
        play_character_sound(m, CHAR_SOUND_WETT_HOVER_END)
        set_mario_action(m, ACT_FREEFALL_LAND, 0)
    end
    if m.controller.buttonDown & L_TRIG == 0 or e.hover == 0 or s.water == 0 then
        set_mario_action(m, ACT_FREEFALL, 0)
    end
    if m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_GROUND_POUND, 0)
    end

    s.water = s.water - 2
    e.hover = e.hover - 1

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_FLUDD_HOVER, act_fludd_hover)

local function act_springflip(m)

    set_mario_animation(m, MARIO_ANIM_TRIPLE_JUMP_GROUND_POUND)
    smlua_anim_util_set_animation(m.marioObj, "cr_anim_j355_springflip")

    if m.actionTimer == 4 then
        set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, 0)
        m.vel.y = 48
        m.forwardVel = m.forwardVel + 4
        play_character_sound(m, CHAR_SOUND_YAHOO)
        m.actionState = 1
    end
    if m.actionState == 1 then
        if m.vel.y < 1 then
            m.vel.y = m.vel.y + 2
        end
        if m.actionTimer > 20 then
            m.marioBodyState.handState = MARIO_HAND_OPEN
        elseif m.forwardVel > 50 then
            set_mario_particle_flags(m, PARTICLE_DUST, 0)
        end
    end

    local stepResult = m.actionState == 1 and common_air_action_step(m, ACT_TRIPLE_JUMP_LAND, MARIO_ANIM_TRIPLE_JUMP_GROUND_POUND, AIR_STEP_NONE) or 0
    if stepResult == AIR_STEP_LANDED then
        play_sound(SOUND_ACTION_TERRAIN_LANDING, m.marioObj.header.gfx.cameraToObject)
    elseif stepResult == AIR_STEP_HIT_WALL then
        set_mario_action(m, ACT_AIR_HIT_WALL, 0)
    end

    if m.actionTimer == 6 or m.actionTimer == 15 then -- spin sound
        play_sound(SOUND_ACTION_TWIRL, m.marioObj.header.gfx.cameraToObject)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_SPRINGFLIP, act_springflip)

local function act_galaxy_spin(m)

    if m.actionState == 0 then
        play_character_sound(m, CHAR_SOUND_SPIN)
        m.vel.y = 30
        m.actionState = 1
    end
    local stepResult = common_air_action_step(m, ACT_FREEFALL_LAND, MARIO_ANIM_RUNNING_UNUSED, AIR_STEP_CHECK_LEDGE_GRAB)
    if stepResult == AIR_STEP_GRABBED_LEDGE then
        m.marioObj.header.gfx.animInfo.animID = -1
    end
    smlua_anim_util_set_animation(m.marioObj, "cr_anim_j355_galaxy_spin")
    m.vel.y = m.vel.y + 1

    if m.forwardVel > 25 then
        m.forwardVel = m.forwardVel * 0.8
    end
    if m.actionState == 1 and m.actionTimer < 10 then
        set_mario_particle_flags(m, PARTICLE_SPARKLES, 0)
    end

    if m.input & INPUT_Z_PRESSED ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_GALAXY_SPIN, act_galaxy_spin)

local function act_spinjump(m)
    local e = gJ355States[m.playerIndex]
    smlua_anim_util_set_animation(m.marioObj, "cr_anim_j355_ice_jump_2")
    m.marioBodyState.handState = MARIO_HAND_OPEN

    if m.actionState == 0 then
        play_character_sound(m, CHAR_SOUND_YAHOO_WAHA_YIPPEE)
        e.gfxY = 0
        m.vel.y = 55
        m.actionState = 1
    end

    if m.actionTimer <= 12 then
        for i=0, m.actionTimer do
            if m.actionTimer % 3 == 0 then
                play_sound_with_freq_scale(SOUND_ACTION_TWIRL, m.marioObj.header.gfx.cameraToObject, 1 + (i/12)*1.5)
            end
        end
    elseif m.input & INPUT_Z_PRESSED ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0)
    elseif m.input & INPUT_B_PRESSED ~= 0 then
        if m.input & INPUT_NONZERO_ANALOG ~= 0 then
            set_mario_action(m, ACT_DIVE, 0)
        else
            return set_mario_action(m, ACT_GALAXY_SPIN, 0)
        end
    end

    local stepResult = common_air_action_step(m, ACT_FREEFALL_LAND, MARIO_ANIM_START_TWIRL, AIR_STEP_CHECK_LEDGE_GRAB)
    if stepResult == AIR_STEP_HIT_WALL then
        set_mario_action(m, ACT_AIR_HIT_WALL, 0)
    elseif stepResult == AIR_STEP_GRABBED_LEDGE then
        m.marioObj.header.gfx.animInfo.animID = -1
    end

    e.gfxY = e.gfxY + 0x4000
    m.vel.y = m.vel.y + 1
    m.marioObj.header.gfx.angle.y = m.faceAngle.y + e.gfxY

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_SPINJUMP, act_spinjump)

local function act_fludd_boost(m)
    local s = gPlayerSyncTable[m.playerIndex]
    local subtract = m.actionArg == 0 and rocketJumpCost or burstCost

    if m.actionState == 0 then
        if m.actionArg == 0 then
            play_sound(SOUND_OBJ_CANNON4, m.marioObj.header.gfx.cameraToObject)
            play_character_sound(m, CHAR_SOUND_YAHOO_WAHA_YIPPEE)
            m.vel.y = 120
        elseif m.actionArg == 1 then
            play_character_sound(m, CHAR_SOUND_WETT_BURST)
            m.vel.y = 50
        end
        if m.playerIndex == 0 then
            s.water = s.water - subtract
        end
        --audio_sample_play(SOUND_FLUDD_HOVER_END, m.pos, pause_check())
        set_mario_particle_flags(m, PARTICLE_SNOW | PARTICLE_MIST_CIRCLE, 0)
        m.actionState = 1
    end

    local stepResult = common_air_action_step(m, ACT_FREEFALL_LAND, MARIO_ANIM_DOUBLE_JUMP_FALL, AIR_STEP_CHECK_LEDGE_GRAB)

    if m.actionArg == 0 then
        if m.vel.y > 60 then
            set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, 0)
        end
        m.peakHeight = m.pos.y
    end
    if m.actionArg == 1 or m.vel.y < 30 then
        if m.input & INPUT_B_PRESSED ~= 0 then
            set_mario_action(m, ACT_DIVE, 0)
        end
    end

    if m.vel.y > 15 then
        set_mario_particle_flags(m, PARTICLE_DUST, 0)
    end

    if m.input & INPUT_Z_PRESSED ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_FLUDD_BOOST, act_fludd_boost)



----------
-- J355 --
----------

local function j355_set_action(m)
    local e = gJ355States[m.playerIndex]

    -- extra height on backflip
    if m.action == ACT_BACKFLIP then
        m.vel.y = m.vel.y + 7
    end
    -- spinjump
    if (m.action == ACT_JUMP or m.action == ACT_SIDE_FLIP or m.action == ACT_STEEP_JUMP) and e.spinInput ~= 0 then
        m.faceAngle.y = m.intendedYaw
        set_mario_action(m, ACT_SPINJUMP, 0)
    end
end

local function j355_before_set_action(m, act)
    local e = gJ355States[m.playerIndex]
    -- derpy crouch
    if act == ACT_START_CROUCHING then
        return ACT_CROUCHING
    elseif act == ACT_STOP_CROUCHING then
        return ACT_IDLE
    end
    -- twirl landing momentum
    if act == ACT_TWIRL_LAND and m.input & INPUT_NONZERO_ANALOG ~= 0 then
        return ACT_WALKING
    -- flying & gp fix
    elseif act == ACT_FLYING or act == ACT_GROUND_POUND then
        m.marioObj.header.gfx.angle.y = m.faceAngle.y
    -- galaxy spin
    elseif ((act == ACT_JUMP_KICK and m.pos.y > (m.floorHeight + 45))
    or (act == ACT_DIVE and ((m.input & INPUT_NONZERO_ANALOG == 0 or m.forwardVel < 15) and m.vel.y < 15 and (m.action ~= ACT_GROUND_POUND and m.action ~= ACT_WALKING and m.action ~= ACT_ICE_SKATING and m.action ~= ACT_FORWARD_ROLLOUT)))) then
        return ACT_GALAXY_SPIN
    elseif act == ACT_JUMP_LAND and m.actionArg == 1 then
        return ACT_FREEFALL_LAND
    end

    if (walkingActions[m.action] and not walkingActions[act]) or (m.action == ACT_DIVE_SLIDE and m.actionArg == 1) then
        play_character_sound(m, CHAR_SOUND_UH2_2)
    end
    if m.action == ACT_DIVE_SLIDE then
        e.fluddLoop = -1
    end
end

local function j355_before_phys_step(m)
    local hScale = 1.0
    local vScale = 1.0

    -- faster swimming
    if (m.action & ACT_FLAG_SWIMMING) ~= 0 then
        hScale = hScale * 1.5
        if m.action ~= ACT_WATER_PLUNGE and m.action ~= ACT_FORWARD_WATER_KB and m.action ~= ACT_BACKWARD_WATER_KB then
            vScale = vScale * 1.5
        end
    end

    m.vel.x = m.vel.x * hScale
    m.vel.y = m.vel.y * vScale
    m.vel.z = m.vel.z * hScale
end

local function j355_update(m)
    local e = gJ355States[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]

    mario_update_spin_input(m)

    -- sprinting
    --if m.action == ACT_WALKING then
    --    if m.forwardVel > 30 then
    --        m.forwardVel = m.forwardVel + 0.9
    --        if m.forwardVel >= 40 then
    --            --smlua_anim_util_set_animation(m.marioObj, "cr_anim_j355_sprint")
    --            e.sprintCheck = true
    --        end
    --    end
    --    if m.forwardVel < 40 and e.sprintCheck then
    --        e.sprintCheck = false
    --        m.marioObj.header.gfx.animInfo.animID = -1
    --    end
    --end
    -- GP cancel
    if m.action == ACT_GROUND_POUND and m.input & INPUT_B_PRESSED ~= 0 then
        m.faceAngle.y = m.intendedYaw
        if m.prevAction ~= ACT_GALAXY_SPIN then
            if m.input & INPUT_NONZERO_ANALOG == 0 then
                return set_mario_action(m, ACT_GALAXY_SPIN, 0)
            else
                set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, 0)
                set_mario_action(m, ACT_DIVE, 0)
                m.vel.y = 15
                m.forwardVel = 40
            end
        else
            set_mario_action(m, ACT_DIVE, 0)
            m.vel.y = 0
            m.forwardVel = 20
        end
    end
    -- twirl GP
    if m.action == ACT_TWIRLING and m.input & INPUT_Z_PRESSED ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0)
    end
    -- ice cap
    if m.flags & MARIO_METAL_CAP ~= 0 then
        local floorDist = m.floor.type == SURFACE_BURNING and m.floorHeight or m.waterLevel
        if m.pos.y < (floorDist + 1)
        and not noSkateActions[m.action] then
            if m.action == ACT_DIVE or m.action == ACT_DIVE_SLIDE or m.action == ACT_STOMACH_SLIDE then
                if m.forwardVel >= 0 then
                    set_mario_action(m, ACT_FORWARD_ROLLOUT, 0)
                else
                    set_mario_action(m, ACT_BACKWARD_ROLLOUT, 0)
                end
                m.forwardVel = m.forwardVel * 0.9
            else
                set_mario_action(m, ACT_ICE_SKATING, 0)
            end
        end
    end
    -- GP jump
    if m.action == ACT_GROUND_POUND_LAND and m.input & INPUT_A_PRESSED ~= 0 then
        set_mario_action(m, ACT_JUMP, 1)
        m.vel.y = m.vel.y + 20
    end
    if s.water > 0 and m.action == ACT_DOUBLE_JUMP and m.vel.y > 30 and m.actionArg == 1 then
        set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, 0)
        m.vel.x = 0
        m.vel.z = 0
        m.forwardVel = 0
    end
    if m.action == ACT_JUMP and m.actionArg == 1 then
        if m.marioObj.header.gfx.animInfo.animFrame == -1 then
	        play_character_sound(m, CHAR_SOUND_YAHOO_WAHA_YIPPEE)
        end
        if m.vel.y > 20 then
            set_mario_particle_flags(m, PARTICLE_DUST, 0)
        end
        smlua_anim_util_set_animation(m.marioObj, "cr_anim_j355_gp_jump")
        m.marioBodyState.handState = MARIO_HAND_OPEN
    end
    -- dont get stuck in water
    if m.flags & MARIO_METAL_CAP ~= 0 and m.pos.y < (m.waterLevel + 1) then
        m.pos.y = m.waterLevel + 4
    end
    -- backflip mobility
    if m.action == ACT_BACKFLIP and m.forwardVel > -25 and m.forwardVel < 0 then
        m.forwardVel = m.forwardVel * 1.1
    end

    -- fludd physics
    s.water = math.clamp(s.water, 0, maxWater)
    e.hover = math.clamp(e.hover, 0, maxHover)
    if s.water > 0 then
        local canFludd = fluddActions[m.action] and m.vel.y < 25

        if canFludd and m.controller.buttonPressed & L_TRIG ~= 0 and e.hover > 0 then
            set_mario_action(m, ACT_FLUDD_HOVER, 0)
        end
        if m.action == ACT_DIVE_SLIDE and m.controller.buttonPressed & L_TRIG ~= 0 then
            m.actionArg = 1
            e.fluddLoop = 0
        end

        if m.pos.y < m.waterLevel and s.water < maxWater then
            if s.water > (maxWater - 15) then
                s.water = maxWater
            else
                s.water = s.water + 15
            end
            if e.hover ~= maxHover then
                e.hover = maxHover
            end
        end

        if m.action == ACT_GALAXY_SPIN and m.controller.buttonPressed & L_TRIG ~= 0 and e.hover == maxHover and s.water >= burstCost then
            e.hover = 0
            set_mario_action(m, ACT_FLUDD_BOOST, 1)
        end

        if walkingActions[m.action] and s.water >= rocketJumpCost and m.controller.buttonDown & L_TRIG ~= 0 then
            if e.hover > 0 then
                e.hover = e.hover - 2
            else
                set_mario_action(m, ACT_FLUDD_BOOST, 0)
            end
            if e.hover == maxHover - 2 then
                play_character_sound(m, CHAR_SOUND_WETT_CHARGE)
                --audio_sample_play(SOUND_FLUDD_CHARGE, m.pos, pause_check())
            end
        else
            if m.pos.y == m.floorHeight then
                e.hover = maxHover
            end
            if m.controller.buttonReleased & L_TRIG ~= 0 and walkingActions[m.action] then
                play_character_sound(m, CHAR_SOUND_UH2_2)
                --audio_sample_stop(SOUND_FLUDD_CHARGE)
            end
        end
    else
        e.hover = 0
    end

    if m.action == ACT_DIVE_SLIDE then
        if m.actionArg == 1 then
            if m.forwardVel < 60 and m.forwardVel > 0 then
                m.slideVelZ = m.vel.z * 1.1
                m.slideVelX = m.vel.x * 1.1
            end
            set_mario_particle_flags(m, PARTICLE_SNOW, 0)
            if m.pos.y > m.waterLevel then
                s.water = s.water - 2
            end
            --audio_stream_play(SOUND_FLUDD_LOOP, false, 0.8 * pause_check())
            if m.controller.buttonReleased & L_TRIG ~= 0 then
                m.actionArg = 0
            end
            if e.fluddLoop == 1 then
                play_character_sound(m, CHAR_SOUND_WETT_LOOP)
            elseif e.fluddLoop > 318 then
                e.fluddLoop = 0
            end
            e.fluddLoop = e.fluddLoop + 1
        elseif m.actionArg == 0 and e.fluddLoop >= 0 then
            --audio_stream_stop(SOUND_FLUDD_LOOP)
            play_character_sound(m, CHAR_SOUND_UH2_2)
            e.fluddLoop = -1
        end
    end
    -- fludd hover sound
    if m.prevAction == ACT_FLUDD_HOVER and m.marioObj.header.gfx.animInfo.animFrame == -1 and e.hover > 3 then
        play_character_sound(m, CHAR_SOUND_WETT_HOVER_END)
    end

    -- springflip
    if m.action == ACT_DIVE_SLIDE and m.input & INPUT_Z_PRESSED ~= 0 and m.forwardVel > 30 then
        return set_mario_action(m, ACT_SPRINGFLIP, 0)
    end
    -- twirl cancel
    if m.action == ACT_TWIRLING and (m.input & INPUT_B_PRESSED) ~= 0 then
        if m.input & INPUT_NONZERO_ANALOG ~= 0 then
            m.faceAngle.y = m.intendedYaw
            m.particleFlags = m.particleFlags | PARTICLE_HORIZONTAL_STAR
            set_mario_action(m, ACT_DIVE, 0)
            m.forwardVel = 40
            m.vel.y = 20
        elseif m.input & INPUT_NONZERO_ANALOG == 0 then
            return set_mario_action(m, ACT_GALAXY_SPIN, 0)
        end
    end
    -- galaxy spin extra conditions
    if m.input & INPUT_B_PRESSED ~= 0 and (spinActions[m.action] or (m.action == ACT_SPRINGFLIP and m.actionTimer > 20)) then
        set_mario_action(m, ACT_GALAXY_SPIN, 0)
    end
end

local function j355_level_init()
    local m = gMarioStates[0]
    --local e = gJ355States[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]

    s.water = 0
end

local function j355_sound(sound, pos)
    local m = gMarioStates[0]
    local e = gJ355States[m.playerIndex]
    local s = gPlayerSyncTable[m.playerIndex]

    if sound == SOUND_GENERAL_COLLECT_1UP then
        audio_sample_play(SOUND_FLUDD_PICKUP, m.pos, pause_check())
        if m.playerIndex == 0 then
            spawn_sync_object(id_bhvMistCircParticleSpawner,E_MODEL_NONE, m.pos.x, m.pos.y, m.pos.z, nil)
        end
        s.water = maxWater
        e.hover = maxHover
        return NO_SOUND
    end
end

local function j355_hazard(m, type)
    if type == SURFACE_BURNING and m.flags & MARIO_METAL_CAP ~= 0 then
        return false
    end
end

---------
-- HUD --
---------

local function j355_hud()
    if gNetworkPlayers[0].currActNum == 99 or gMarioStates[0].action == ACT_INTRO_CUTSCENE or hud_is_hidden() or obj_get_first_with_behavior_id(id_bhvActSelector) then return end

    local m = gMarioStates[0]
    local e = gJ355States[0]
    local s = gPlayerSyncTable[m.playerIndex]
    local targetX = s.water > 0 and 10 or - 40

    e.hudOffsetX = math.lerp(e.hudOffsetX, targetX, 0.2)

    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(FONT_RECOLOR_HUD)

    local waterScale = (s.water/maxWater)
    local hoverScale = (e.hover/maxHover)
    local waterText = string.format("%.0f", math.ceil(s.water/30))

    djui_hud_render_texture_tile(TEX_CR_J355_TANK, e.hudOffsetX, 222, 0.25, 1, 32, 8, 32, 8)
    djui_hud_set_color(84, 151, 254, 200)
    djui_hud_render_rect(e.hudOffsetX + 2, 222 - (112*waterScale), 21, (112*waterScale))
    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_render_texture_tile(TEX_CR_J355_TANK, e.hudOffsetX, (218 - (112*waterScale)), 0.25, 1, 32, 0, 32, 8)
    djui_hud_set_color(255, 0, 0, 255)
    djui_hud_render_rect(e.hudOffsetX + 27, 160 - (48*hoverScale), 3, (48*hoverScale))
    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_render_texture_tile(TEX_CR_J355_TANK, e.hudOffsetX, 100, 4, 1, 0, 0, 32, 128)
    djui_hud_print_text(waterText, e.hudOffsetX + 11 - (#waterText * 6), 175, 1, 1)
end

_G.charSelect.character_hook_moveset(CT_CR_J355, HOOK_MARIO_UPDATE, j355_update)
_G.charSelect.character_hook_moveset(CT_CR_J355, HOOK_ON_SET_MARIO_ACTION, j355_set_action)
_G.charSelect.character_hook_moveset(CT_CR_J355, HOOK_BEFORE_PHYS_STEP, j355_before_phys_step)
_G.charSelect.character_hook_moveset(CT_CR_J355, HOOK_ON_LEVEL_INIT, j355_level_init)
_G.charSelect.character_hook_moveset(CT_CR_J355, HOOK_ON_PLAY_SOUND, j355_sound)
_G.charSelect.character_hook_moveset(CT_CR_J355, HOOK_ALLOW_HAZARD_SURFACE, j355_hazard)
_G.charSelect.character_hook_moveset(CT_CR_J355, HOOK_BEFORE_SET_MARIO_ACTION, j355_before_set_action)
_G.charSelect.character_hook_moveset(CT_CR_J355, HOOK_ON_HUD_RENDER_BEHIND, j355_hud)