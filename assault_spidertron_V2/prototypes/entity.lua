path = "__assault_spidertron_V2__"
local sounds = require("__base__.prototypes.entity.sounds")
local assaultron_animations = require(path .. "/assault_spidertron-animations.lua")


-- Leg
local function make_assaultron_leg(number, base_sprite, ending_sprite)
  return
  {
    type = "spider-leg",
    name = "assault_spidertron-leg-" .. number,
    localised_name = {"entity-name.assault_spidertron-leg"},
    collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    icon = path .. "/graphics/icons/assault_spidertron_icon.png",
    icon_size = 64,
    walking_sound_volume_modifier = 0.2,
    target_position_randomisation_distance = 0.25,
    minimal_step_size = 1,
    knee_height = 2.0,
    knee_distance_factor = 0.5,
    base_position_selection_distance = 2.0,
    working_sound = 
    {
      match_progress_to_activity = true,
      sound = sounds.spidertron_leg,
      audible_distance_modifier = 0.2,
    },
    part_length = 3.5,
    initial_movement_speed = 0.05,
    movement_acceleration = 0.5,
    max_health = 100,
    resistances =
    {
      {
        type = "physical",
        decrease = 10,
        percent = 100
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 100
      },
      {
        type = "acid",
        decrease = 10,
        percent = 100
      },
      {
        type = "fire",
        decrease = 10,
        percent = 100
      },
      {
        type = "impact",
        decrease = 10,
        percent = 100
      },
      {
        type = "electric",
        decrease = 10,
        percent = 100
      },
      {
        type = "laser",
        decrease = 10,
        percent = 100
      }      
    },
    movement_based_position_selection_distance = 3,
    selectable_in_game = false,
    graphics_set = assaultron_animations.legs[number],
  }
end

-- Capsule
data:extend({
{
    type = "spider-vehicle",
    name = "assault_spidertron",
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    icon = path .. "/graphics/icons/assault_spidertron_icon.png",
    mined_sound = { filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8 },
    open_sound = { filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume= 0.35 },
    close_sound = { filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4 },
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.6,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/spidertron/spidertron-vox.ogg",
        volume = 0.15,
      speed = 0.6
      },
      activate_sound =
      {
        filename = "__base__/sound/spidertron/spidertron-activate.ogg",
        volume = 0.8
      },
      deactivate_sound =
      {
        filename = "__base__/sound/spidertron/spidertron-deactivate.ogg",
        volume = 0.8
      },
      match_speed_to_activity = true,
    },
    icon_size = 64,
    weight = 1,
    braking_force = 1,
    friction_force = 1,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true, meltable=true}},
    minable = {mining_time = 1, result = "assault_spidertron"},
    max_health = 4000,  
    resistances =
    {
      {
        type = "acid",
        decrease = 15,
        percent = 70
      },
      {
        type = "electric",
        decrease = 15,
        percent = 70
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 80
      },
      {
        type = "fire",
        decrease = 15,
        percent = 90
      },
      {
        type = "impact",
        decrease = 100,
        percent = 80
      },
      {
        type = "laser",
        decrease = 15,
        percent = 70
      },
      {
        type = "physical",
        decrease = 15,
        percent = 70
      }           
    },
    minimap_representation =
    {
      filename = path .. "/graphics/entity/assault_spidertron/assault_spidertron-map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.5
    },
    corpse = "assault_spidertron-remnants",
    dying_explosion = "spidertron-explosion",
    energy_per_hit_point = 1,
    guns = { "assault_spidertron-mortar", "assault_spidertron_rocket_launcher", "assault_spidertron_cannon", "assault_spidertron-mg", "assault_spidertron-flamer" },
    inventory_size = 80,
    trash_inventory_size = 20,
    logistic_slot_count = 10,
    equipment_grid = "assault_spidertron-equipment-grid",
    height = 1.25,
    torso_rotation_speed = 0.02,
    chunk_exploration_radius = 2,
    selection_priority = 51,
    graphics_set = assaultron_animations.torso,
    energy_source = {
      type = "void"
    },
    movement_energy_consumption = "250kW",
    automatic_weapon_cycling = false,
    chain_shooting_cooldown_modifier = 0.5,
    spider_engine =
    {
      legs =
      {
        { -- 1: RU
          leg = "assault_spidertron-leg-1",
          mount_position = util.by_pixel(15, -20),--{0.5, -0.75},
          ground_position = {2.25, -2.5},
          blocking_legs = {2},
          walking_group = 1,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 2: R
          leg = "assault_spidertron-leg-2",
          mount_position = util.by_pixel(25, 0),--{0.75, -0.25},
          ground_position = {3, 0},
          blocking_legs = {1, 3},
          walking_group = 2,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 3: RD
          leg = "assault_spidertron-leg-3",
          mount_position = util.by_pixel(15, 18),--{0.75, 0.25},
          ground_position = {2.25, 2.5},
          blocking_legs = {2},
          walking_group = 3,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 4: LU
          leg = "assault_spidertron-leg-4",
          mount_position = util.by_pixel(-15, -20),--{0.5, 0.75},
          ground_position = {-2.25, -2.5},
          blocking_legs = {5},
          walking_group = 4,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 5: L
          leg = "assault_spidertron-leg-5",
          mount_position = util.by_pixel(-25, 0),--{-0.5, -0.75},
          ground_position = {-3, 0},
          blocking_legs = {4, 6},
          walking_group = 5,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 6: LD
          leg = "assault_spidertron-leg-6",
          mount_position = util.by_pixel(-15, 18),--{-0.75, -0.25},
          ground_position = {-2.25, 2.5},
          blocking_legs = {5},
          walking_group = 6,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        }
      },
      military_target = "spidertron-military-target",
      remote_type = "spidertron-remote",
    }
  },


  make_assaultron_leg(1),
  make_assaultron_leg(2),
  make_assaultron_leg(3),
  make_assaultron_leg(4),
  make_assaultron_leg(5),
  make_assaultron_leg(6),
  -- turret_animation =
  -- {
    -- layers =
    -- {
      -- {
        -- width = 66,
        -- height = 70,
    -- frame_count = 1,
        -- line_length = 8,
        -- direction_count = 64,
        -- shift = util.by_pixel(0, -19),
        -- animation_speed = 8,
        -- max_advance = 0.2,
        -- stripes =
        -- {
          -- {
           -- filename = path .. "/graphics/entity/assault_spidertron/torso/assault_spidertron-body.png",
           -- width_in_frames = 8,
           -- height_in_frames = 8,
          -- }
        -- },
        -- hr_version = {
          -- width = 132,
          -- height = 138,
          -- frame_count = 1,
      -- line_length = 8,
          -- direction_count = 64,
          -- scale = 0.5,
          -- shift = util.by_pixel(0, -19),
          -- animation_speed = 8,
          -- max_advance = 0.2,
          -- stripes =
          -- {
            -- {
             -- filename = path .. "/graphics/entity/assault_spidertron/torso/assault_spidertron-body.png",
             -- width_in_frames = 8,
             -- height_in_frames = 8,
            -- }
          -- }
        -- }
      -- }
    -- }
  -- },
  -- turret_rotation_speed = 0.5 / 60,
  -- turret_return_timeout = 300

  {
    type = "corpse",
    name = "assault_spidertron-remnants",
    icon = path .. "/graphics/icons/assault_spidertron_icon.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "transport-remnants",
    order = "a-l-a",
    selection_box = {{-3, -3}, {3, 3}},
    collision_box = {{-2, -2}, {2, 2}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = true,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      layers =
      {
        {
          filename = path .. "/graphics/entity/assault_spidertron/remnants/assault_spidertron-remnants.png",
          line_length = 1,
          width = 448,
          height = 448,
          direction_count = 1,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },      }
    })
  },

})