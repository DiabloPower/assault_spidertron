local sounds = require("__base__.prototypes.entity.sounds")
local assaultron_animations = require(path .. "/assault_spidertron-animations.lua")

local function get_spidertron_legs()
    local arachnophobia_enabled = settings.startup["assault-spidertron-enable-arachnophobia-mode"].value == "active"

    local legs -- Definiere `legs` zuerst global in der Funktion

    if arachnophobia_enabled then
        legs = {
            { leg = "assault_spidertron-leg-1", mount_position = util.by_pixel(15, -20), ground_position = {2, -2}, blocking_legs = {3}, walking_group = 1 },
            { leg = "assault_spidertron-leg-3", mount_position = util.by_pixel(15, 18), ground_position = {2, 2}, blocking_legs = {1}, walking_group = 2 },
            { leg = "assault_spidertron-leg-4", mount_position = util.by_pixel(-15, -20), ground_position = {-2, -2}, blocking_legs = {6}, walking_group = 3 },
            { leg = "assault_spidertron-leg-6", mount_position = util.by_pixel(-15, 18), ground_position = {-2, 2}, blocking_legs = {4}, walking_group = 4 }
        }
    else
        legs = {
            { leg = "assault_spidertron-leg-1", mount_position = util.by_pixel(15, -20), ground_position = {2.25, -3}, blocking_legs = {2}, walking_group = 1, leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger() },
            { leg = "assault_spidertron-leg-2", mount_position = util.by_pixel(25, 0), ground_position = {3, 0}, blocking_legs = {1, 3}, walking_group = 2, leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger() },
            { leg = "assault_spidertron-leg-3", mount_position = util.by_pixel(15, 18), ground_position = {2.25, 3}, blocking_legs = {2}, walking_group = 3, leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger() },
            { leg = "assault_spidertron-leg-4", mount_position = util.by_pixel(-15, -20), ground_position = {-2.25, -3}, blocking_legs = {5}, walking_group = 4, leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger() },
            { leg = "assault_spidertron-leg-5", mount_position = util.by_pixel(-25, 0), ground_position = {-3, 0}, blocking_legs = {4, 6}, walking_group = 5, leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger() },
            { leg = "assault_spidertron-leg-6", mount_position = util.by_pixel(-15, 18), ground_position = {-2.25, 3}, blocking_legs = {5}, walking_group = 6, leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger() }
        }
    end

    return legs
end

return {
    get_spidertron_legs = get_spidertron_legs
}
