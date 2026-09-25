local E_MODEL_CR_FIREBALL = smlua_model_util_get_id('cr_fireball_geo')

local fireballLifetime = 100
local fireballHitSound = SOUND_ACTION_HIT

---@param fireball Object -- fireball obj
---@param target Object -- the obj fireball hit
local function fireHitGeneric(fireball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED | INT_STATUS_TOUCHED_BOB_OMB-- | ATTACK_FROM_ABOVE
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fireHitSnowman(fireball, target)
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

local function fireHitHeaveHo(fireball, target)
    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    play_sound(SOUND_GENERAL_BREAK_BOX, target.header.gfx.cameraToObject)
    spawn_triangle_break_particles(30, 138, 3.0, 4)
    obj_mark_for_deletion(target)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fireHitEyeball(fireball, target)
    spawn_non_sync_object(id_bhvMrIBlueCoin, E_MODEL_BLUE_COIN, target.oPosX, target.oPosY, target.oPosZ, nil)
    play_sound(SOUND_OBJ_MRI_DEATH, target.header.gfx.cameraToObject)
    obj_mark_for_deletion(target)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fireHitBully(fireball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
    target.oMoveAngleYaw = fireball.oMoveAngleYaw
    target.oForwardVel = 30
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fireHitBox(fireball, target)
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

local function fireHitTwirlEnemy(fireball, target)
    target.oInteractStatus = target.oInteractStatus | ATTACK_FAST_ATTACK | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
        spawn_non_sync_object(id_bhvMetalCap, E_MODEL_MARIOS_METAL_CAP, target.oPosX, target.oPosY + 100, target.oPosZ, function(cap)
            cap.oVelY = 20
        end)
    spawn_mist_particles_with_sound(fireballHitSound)
    obj_mark_for_deletion(fireball)
end

local function fireHitBowser(fireball, target)
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

local fireHitInteracts = {
    [id_bhvGoomba]              = fireHitGeneric,
    [id_bhvBobomb]              = fireHitGeneric,
    [id_bhvKoopa]               = fireHitGeneric,
    [id_bhvMontyMole]           = fireHitGeneric,
    [id_bhvBoo]                 = fireHitGeneric,
    [id_bhvFlyingBookend]       = fireHitGeneric,
    [id_bhvSkeeter]             = fireHitGeneric,
    [id_bhvMoneybag]            = fireHitGeneric,
    [id_bhvSnufit]              = fireHitGeneric,
    [id_bhvSwoop]               = fireHitGeneric,
    [id_bhvFirePiranhaPlant]    = fireHitGeneric,
    [id_bhvEnemyLakitu]         = fireHitGeneric,
    [id_bhvPokey]               = fireHitGeneric,
    [id_bhvPokeyBodyPart]       = fireHitGeneric,
    [id_bhvSkeeter]             = fireHitGeneric,
    [id_bhvEyerokHand]          = fireHitGeneric,
    [id_bhvScuttlebug]          = fireHitGeneric,
    [id_bhvBreakableBox]        = fireHitGeneric,

    [id_bhvSmallBully]          = fireHitBully,
    [id_bhvBigBully]            = fireHitBully,
    [id_bhvBigBullyWithMinions] = fireHitBully,
    [id_bhvSmallChillBully]     = fireHitBully,
    [id_bhvBigChillBully]       = fireHitBully,
    
    [id_bhvSpindrift]           = fireHitTwirlEnemy,
    [id_bhvFlyGuy]              = fireHitTwirlEnemy,

    [id_bhvMrBlizzard]          = fireHitSnowman,

    [id_bhvHeaveHo]             = fireHitHeaveHo,

    [id_bhvMrI]                 = fireHitEyeball,

    [id_bhvBreakableBoxSmall]   = fireHitBox,

    [id_bhvHauntedChair]        = fireHitGeneric,

    [id_bhvBowserBodyAnchor]    = fireHitBowser,
}

---@param o Object
local function bhv_fireball_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.activeFlags = o.activeFlags | ACTIVE_FLAG_UNK9
    o.oGraphYOffset         = 40
    o.oGravity              = 4
    o.oBounciness           = 0
    o.oDragStrength         = 0
    o.oFriction             = 1
    o.oBuoyancy             = -2
    o.oWallHitboxRadius     = 10
    o.hitboxDownOffset      = 0
    o.hitboxRadius          = 120
    o.hitboxHeight          = 300
    o.hurtboxRadius         = 120
    o.hurtboxHeight         = 300
    o.oDamageOrCoinValue    = 0
    o.oForwardVel           = 65
    o.oTimer                = 0
    --obj.oInteractType       = INTERACT_FLAME
    cur_obj_become_tangible()

    --network thing
    --network_init_object(o, true, {'oTimer'})

    -- object specific fields
    --o.oTimer = fireballLifetime
end

---@param o Object
local function bhv_fireball_loop(o)
    local step = object_step_without_floor_orient()
    if step & (OBJ_COL_FLAGS_LANDED) ~= 0 then
        o.oVelY = 30
    end
    local targetDist = 0x20000
    for key, hit_effect in pairs(fireHitInteracts) do
        local hitObj = cur_obj_nearest_object_with_behavior(get_behavior_from_id(key))
        if hitObj ~= nil then
            if fireHitInteracts[key] ~= nil then
                local dist = dist_between_objects(o, hitObj)
                if dist < targetDist then
                    targetDist = dist
                end
                if obj_check_hitbox_overlap(o, hitObj) then
                    hit_effect(o, hitObj)
                end
            end
        end
    end
    local range = 20
    local offsetX = math.random(-range, range)
    local offsetY = math.random(-range, range) + o.oGraphYOffset/2
    local offsetZ = math.random(-range, range)
    spawn_non_sync_object(id_bhvCoinSparkles, E_MODEL_RED_FLAME, o.oPosX + offsetX, o.oPosY + offsetY, o.oPosZ + offsetZ, function(flame)
        obj_scale(flame, 1)
    end)
    o.oFaceAnglePitch = o.oFaceAnglePitch + 0x1200
    o.oFaceAngleYaw = o.oMoveAngleYaw
    if step & OBJ_COL_FLAG_UNDERWATER ~= 0 then
        spawn_mist_particles_with_sound(SOUND_GENERAL_FLAME_OUT)
        obj_mark_for_deletion(o)
        return
    elseif o.oTimer >= fireballLifetime  then
        spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH)
        obj_mark_for_deletion(o)
        return
    end
end
id_bhvDavyFireball = hook_behavior(nil, OBJ_LIST_GENACTOR, true, bhv_fireball_init, bhv_fireball_loop, "bhvDavyFireball")

---@param m MarioState
function spawn_fireball(m)
    if m.playerIndex ~= 0 then return end
    play_sound(SOUND_OBJ_FLAME_BLOWN, m.marioObj.header.gfx.cameraToObject)
    spawn_sync_object(id_bhvDavyFireball, E_MODEL_CR_FIREBALL, m.pos.x, m.pos.y + 100, m.pos.z, function(o)
        o.oMoveAngleYaw = m.faceAngle.y
        o.oVelY = 15
    end)
end