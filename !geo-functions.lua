if not _G.charSelectExists then return end

T = function (l) local t = {} for _, v in ipairs(l) do t[v] = true end return t end

local customAnims = T{
    "cr_anim_davy_idle"
}

--- @param node GraphNode
function davy_selective_corrective(node)
    local isCorrective = cast_graph_node(node).parameter == 1
    local scale = cast_graph_node(node.next)
    local o = geo_get_current_object()
    local gfx = o.header.gfx
    local isCustomAnim = customAnims[smlua_anim_util_get_current_animation_name(o)]

    --log_to_console((isCorrective and "corrective: " or "initial scale: ") .. scale.scale)

    scale.scale = (
        isCustomAnim and (
            isCorrective and 1 or 0.25
        ) or (
            isCorrective and 0.45747375488281 or 0.54647827148438
        )
    )

    geo_skip_interpolation(node.next, gfx)
end

function cr_j355_fludd_switch_func(node, matStackIndex)
    local asSwitchNode = cast_graph_node(node)
    local m = geo_get_mario_state()
    local s = gPlayerSyncTable[m.playerIndex]
    local toNode = 0
    if s.water > 0 then
        toNode = 1
    else
        toNode = 0
    end
    asSwitchNode.selectedCase = toNode
end
