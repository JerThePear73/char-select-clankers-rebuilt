local E_MODEL_CR_FIREBALL = smlua_model_util_get_id('cr_fireball_geo')
local E_MODEL_CR_ICEBALL = smlua_model_util_get_id('cr_iceball_geo')
local E_MODEL_CR_ICECUBE = smlua_model_util_get_id('cr_icecube_geo')
E_MODEL_CR_SNOWFLAKE = smlua_model_util_get_id('cr_particle_snowflake_geo')

local fireballHitSound = SOUND_ACTION_HIT
local fireballLifetime = 100
local iceballLifetime = 60

local spawnFlowerBhvs = {
    id_bhvSpindrift,
    id_bhvFlyGuy,
}

local function checkSpawnFlowerBhvs(o)
    for i = 1, #spawnFlowerBhvs do
        if obj_has_behavior_id(o, spawnFlowerBhvs[i]) ~= 0 then
            return true
        end
    end
    return false
end

---@param fireball Object -- fireball obj
---@param target Object -- the obj fireball hit
local function fire_hit_generic(fireball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED | INT_STATUS_TOUCHED_BOB_OMB-- | ATTACK_FROM_ABOVE
    if checkSpawnFlowerBhvs(target) then
        spawn_non_sync_object(id_bhvMetalCap, E_MODEL_MARIOS_METAL_CAP, target.oPosX, target.oPosY, target.oPosZ, function(cap)
            cap.oVelY = 30
        end)
    end
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_snowman(fireball, target)
    for i=0, 2 do
        spawn_non_sync_object(id_bhvSingleCoinGetsSpawned, E_MODEL_YELLOW_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    end
    target.oFaceAngleRoll = 0x3000
    target.oMrBlizzardHeldObj = nil
    target.prevObj = target.oMrBlizzardHeldObj
    if target.oAnimState ~= 0 then
        save_file_clear_flags(SAVE_FLAG_CAP_ON_MR_BLIZZARD);

        spawn_non_sync_object(id_bhvNormalCap, E_MODEL_MARIOS_CAP, target.oPosX, target.oPosY, target.oPosZ, function(cap)
            cap.oFaceAngleYaw = target.oFaceAngleYaw
            cap.oForwardVel = 0
            cap.oVelY = 30
        end)

        -- Mr. Blizzard no longer spawns with Mario's cap on.
        target.oAnimState = 0
    end
    obj_mark_for_deletion(target)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_heaveho(fireball, target)
    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    play_sound(SOUND_GENERAL_BREAK_BOX, target.header.gfx.cameraToObject)
    spawn_triangle_break_particles(30, 138, 3.0, 4)
    obj_mark_for_deletion(target)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_eyeball(fireball, target)
    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    play_sound(SOUND_OBJ_MRI_DEATH, target.header.gfx.cameraToObject)
    obj_mark_for_deletion(target)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_bully(fireball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    target.oMoveAngleYaw = fireball.oMoveAngleYaw
    target.oForwardVel = 30
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_box(fireball, target)
    for i=0, 2 do
        spawn_non_sync_object(id_bhvSingleCoinGetsSpawned, E_MODEL_YELLOW_COIN, target.oPosX, target.oPosY, target.oPosZ, function(coin)
        coin.oMoveAngleYaw = math.random(0, 0x10000)
        end)
    end
    play_sound(SOUND_GENERAL_BREAK_BOX, target.header.gfx.cameraToObject)
    obj_mark_for_deletion(target)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fire_hit_bowser(fireball, target)
    local oBowser = target.parentObj
    if oBowser.oAction ~= 19 and oBowser.oAction ~= 4 and oBowser.oAction ~= 12 then
        oBowser.oMoveFlags = 0
        oBowser.oSubAction = 0
        oBowser.oMoveAngleYaw = fireball.oMoveAngleYaw + 0x8000
        oBowser.oFaceAngleYaw = oBowser.oMoveAngleYaw + 0x8000
        oBowser.oAction = 1
        oBowser.oForwardVel = -15
        oBowser.oVelY = 30
        spawn_mist_particles_with_sound(fireballHitSound)
    else
        spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH)
    end
    obj_mark_for_deletion(fireball)
end

local function fire_hit_stop(fireball, target)
    spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH)
    obj_mark_for_deletion(fireball)
end
local function fire_hit_none(fireball, target)
    return
end

---@param iceball Object -- iceball obj
---@param target Object -- the obj iceball hit
local function ice_hit_genertic_freeze(iceball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    obj_mark_for_deletion(iceball)
    spawn_sync_object(id_bhvIceCube, E_MODEL_CR_ICECUBE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
        cube.oMoveAngleYaw = target.oMoveAngleYaw
        if checkSpawnFlowerBhvs(target) then
            spawn_non_sync_object(id_bhvMetalCap, E_MODEL_MARIOS_METAL_CAP, target.oPosX, target.oPosY, target.oPosZ, function(cap)
                cube.parentObj = cap
            end)
        end
    end)
end
local function ice_hit_goomba_freeze(iceball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    obj_mark_for_deletion(iceball)
    spawn_sync_object(id_bhvIceCube, E_MODEL_CR_ICECUBE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
        cube.oMoveAngleYaw = target.oMoveAngleYaw
        obj_scale(cube, target.header.gfx.scale.y*0.5)
    end)

    spawn_non_sync_object(id_bhvSingleCoinGetsSpawned, E_MODEL_YELLOW_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    obj_mark_for_deletion(target)
end
local function ice_hit_bobomb_freeze(iceball, target)
    obj_mark_for_deletion(iceball)
    if target.oBehParams ~= 0x100 then -- bobomb has coin
        obj_spawn_yellow_coins(target, 1)
    end
    spawn_sync_object(id_bhvIceCube, E_MODEL_CR_ICECUBE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
        cube.oMoveAngleYaw = target.oMoveAngleYaw
    end)
    obj_mark_for_deletion(target)
end
local function ice_hit_bluecoin_freeze(iceball, target)
    target.oInteractStatus = target.oInteractStatus | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    obj_mark_for_deletion(iceball)
    spawn_sync_object(id_bhvIceCube, E_MODEL_CR_ICECUBE, target.oPosX, target.oPosY, target.oPosZ, function(cube)
        cube.oMoveAngleYaw = target.oMoveAngleYaw
    end)

    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    obj_mark_for_deletion(target)
end

local projectileHitInteracts = {
    [id_bhvGoomba]              = {fire = fire_hit_generic,     ice = ice_hit_goomba_freeze},
    [id_bhvBobomb]              = {fire = fire_hit_generic,     ice = ice_hit_bobomb_freeze},
    [id_bhvKoopa]               = {fire = fire_hit_generic,     ice = ice_hit_bluecoin_freeze},
    [id_bhvMontyMole]           = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvBoo]                 = {fire = fire_hit_generic,     ice = fire_hit_none},
    [id_bhvGhostHuntBoo]        = {fire = fire_hit_generic,     ice = fire_hit_none},
    [id_bhvMerryGoRoundBoo]     = {fire = fire_hit_generic,     ice = fire_hit_none},
    [id_bhvGhostHuntBigBoo]     = {fire = fire_hit_generic,     ice = fire_hit_none},
    [id_bhvBalconyBigBoo]       = {fire = fire_hit_generic,     ice = fire_hit_none},
    [id_bhvMerryGoRoundBigBoo]  = {fire = fire_hit_generic,     ice = fire_hit_none},
    [id_bhvFlyingBookend]       = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvSkeeter]             = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvMoneybag]            = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvSnufit]              = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvSwoop]               = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvFirePiranhaPlant]    = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvEnemyLakitu]         = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvPokey]               = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvPokeyBodyPart]       = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvSkeeter]             = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvEyerokHand]          = {fire = fire_hit_generic,     ice = fire_hit_generic},
    [id_bhvScuttlebug]          = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvSmallBully]          = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvBigBully]            = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvBigBullyWithMinions] = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvSmallChillBully]     = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvBigChillBully]       = {fire = fire_hit_bully,       ice = fire_hit_stop},
    [id_bhvSpindrift]           = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvFlyGuy]              = {fire = fire_hit_generic,     ice = ice_hit_genertic_freeze},
    [id_bhvMrBlizzard]          = {fire = fire_hit_snowman,     ice = fire_hit_stop},
    [id_bhvHeaveHo]             = {fire = fire_hit_heaveho,     ice = ice_hit_bluecoin_freeze},
    [id_bhvMrI]                 = {fire = fire_hit_eyeball,     ice = fire_hit_stop},
    [id_bhvBreakableBox]        = {fire = fire_hit_generic,     ice = fire_hit_none},
    [id_bhvBreakableBoxSmall]   = {fire = fire_hit_box,         ice = fire_hit_none},
    [id_bhvHauntedChair]        = {fire = fire_hit_generic,     ice = ice_hit_bluecoin_freeze},
    [id_bhvBowserBodyAnchor]    = {fire = fire_hit_bowser,      ice = fire_hit_stop},
    [id_bhvChuckya]             = {fire = fire_hit_stop,        ice = fire_hit_stop},
}

---@param o Object
local function bhv_projectile_init(o)
    local hitboxSize = 300
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.activeFlags = o.activeFlags | ACTIVE_FLAG_UNK9
    o.oGraphYOffset         = 40
    o.oGravity              = 4
    o.oBounciness           = 0
    o.oDragStrength         = 0
    o.oFriction             = 1
    o.oBuoyancy             = -2
    o.oWallHitboxRadius     = 10
    o.hitboxDownOffset      = hitboxSize/2
    o.hitboxRadius          = hitboxSize/4
    o.hitboxHeight          = hitboxSize
    o.hurtboxRadius         = hitboxSize/4
    o.hurtboxHeight         = hitboxSize
    o.oDamageOrCoinValue    = 0
    o.oForwardVel           = 65
    o.oTimer                = 0
    cur_obj_become_tangible()
end
---@param o Object
local function bhv_fireball_loop(o)
    local isIceball = obj_get_model_id_extended(o) == E_MODEL_CR_ICEBALL and true or false
    local projectileLifetime = isIceball and iceballLifetime or fireballLifetime
    local particleType = isIceball and E_MODEL_CR_SNOWFLAKE or E_MODEL_RED_FLAME

    local step = object_step_without_floor_orient()
    if step & (OBJ_COL_FLAGS_LANDED) ~= 0 then
        o.oVelY = 30
    end
    local targetDist = 0x20000
    for key, hit_effect in pairs(projectileHitInteracts) do
        local hitObj = cur_obj_nearest_object_with_behavior(get_behavior_from_id(key))
        if hitObj ~= nil then
            if projectileHitInteracts[key] ~= nil then
                local dist = dist_between_objects(o, hitObj)
                if dist < targetDist then
                    targetDist = dist
                end
                if obj_check_hitbox_overlap(o, hitObj) then
                    if isIceball then
                        hit_effect.ice(o, hitObj)
                    else
                        hit_effect.fire(o, hitObj)
                    end
                end
            end
        -- else
        --     spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH)
        --     obj_mark_for_deletion(o)
        end
    end
    local range = 20
    local offsetX = math.random(-range, range)
    local offsetY = math.random(-range, range) + o.oGraphYOffset/2
    local offsetZ = math.random(-range, range)
    spawn_non_sync_object(id_bhvCoinSparkles, particleType, o.oPosX + offsetX, o.oPosY + offsetY, o.oPosZ + offsetZ, function(trail)
        obj_scale(trail, 1)
    end)
    o.oFaceAnglePitch = o.oFaceAnglePitch + 0x1200
    o.oFaceAngleYaw = o.oMoveAngleYaw
    if step & OBJ_COL_FLAG_UNDERWATER ~= 0 then
        if not isIceball then
        spawn_mist_particles_with_sound(SOUND_GENERAL_FLAME_OUT)
        obj_mark_for_deletion(o)
        return
        else
            o.oVelY = 30
            o.oForwardVel = 65
        end
    elseif o.oTimer >= projectileLifetime  then
        spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH)
        obj_mark_for_deletion(o)
        return
    end
end
id_bhvFireOrIceball = hook_behavior(nil, OBJ_LIST_GENACTOR, true, bhv_projectile_init, bhv_fireball_loop, "bhvFireOrIceball")

local function bhv_icecube_init(o)
    local scaleOffset = o.header.gfx.scale.y * 0.9
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    --o.activeFlags = o.activeFlags | ACTIVE_FLAG_UNK9
    o.oGraphYOffset         = 0
    o.oGravity              = 0
    o.oBounciness           = 0
    o.oDragStrength         = 0
    o.oFriction             = 0
    o.oBuoyancy             = 0
    o.oDamageOrCoinValue    = 0
    o.oTimer                = 0
    o.collisionData         = gGlobalObjectCollisionData.breakable_box_seg8_collision_08012D70
    o.oCollisionDistance    = 600
    o.oMoveAngleRoll        = 0
    o.oMoveAnglePitch       = 0
    o.header.gfx.scale.x    = scaleOffset
    o.header.gfx.scale.y    = scaleOffset
    o.header.gfx.scale.z    = scaleOffset
    cur_obj_become_tangible()
    spawn_mist_particles_with_sound(SOUND_OBJ_BIG_PENGUIN_WALK)
    spawn_mist_particles_with_sound(SOUND_OBJ_BIG_PENGUIN_WALK)
end
local function bhv_icecube_loop(o)
    local icecubeDurr = iceballLifetime * 3
    load_object_collision_model()

    if cur_obj_was_attacked_or_ground_pounded() ~= 0 or o.oTimer >= icecubeDurr then
        play_sound(SOUND_GENERAL_BREAK_BOX, o.header.gfx.cameraToObject)
        spawn_triangle_break_particles(10, 139, 0.3, 2)
        if cur_obj_was_attacked_or_ground_pounded() ~= 0 then
            obj_spawn_yellow_coins(o, 3)
        end
        obj_mark_for_deletion(o)
    end
    if o.parentObj ~= nil then
        o.parentObj.oPosX = o.oPosX
        o.parentObj.oPosY = o.oPosY
        o.parentObj.oPosZ = o.oPosZ
        o.parentObj.oVelX = 0
        o.parentObj.oVelY = 0
        o.parentObj.oVelZ = 0
        o.parentObj.oMoveAnglePitch = 0
        o.parentObj.oMoveAngleYaw = 0
        o.parentObj.oMoveAngleRoll = 0
    end
    if o.oTimer > icecubeDurr - 30 then
        if o.oTimer % 3 == 0 then
            cur_obj_hide()
        else
            cur_obj_unhide()
        end
    end
end
id_bhvIceCube = hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_icecube_init, bhv_icecube_loop, "bhvIceCube")

---@param m MarioState
function spawn_fire_or_ice_ball(m, type)
    local model = type == 0 and E_MODEL_CR_FIREBALL or E_MODEL_CR_ICEBALL
    local sound = type == 0 and SOUND_OBJ_FLAME_BLOWN or SOUND_OBJ_SNOW_SAND2
    if m.playerIndex ~= 0 then return end
    play_sound(sound, m.marioObj.header.gfx.cameraToObject)
    spawn_sync_object(id_bhvFireOrIceball, model, m.pos.x, m.pos.y + 100, m.pos.z, function(o)
        o.oMoveAngleYaw = m.faceAngle.y
        o.oVelY = 15
    end)
end