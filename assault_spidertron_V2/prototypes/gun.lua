-- Load sound effects from the base game
local sounds = require("__base__.prototypes.entity.sounds")

-- Define new weapons for the Assault Spidertron
data:extend({
  {
    type = "gun",  -- Defines the weapon as a gun
    name = "assault_spidertron-flamer",  -- Unique name for the flamer gun
    icon = "__base__/graphics/icons/flamethrower.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "b[flamethrower]-b[tank-flamethrower]",  -- Determines placement in UI

    -- Attack parameters for the flamethrower
    attack_parameters =
    {
      type = "stream",  -- Uses a continuous stream attack type
      ammo_category = "flamethrower",  -- Uses flamethrower-specific ammo
      cooldown = 1,  -- Fast attack rate (every tick)
      range = 12,  -- Maximum range of attack
      min_range = 3,  -- Minimum range before activation
      gun_barrel_length = 1.05,  -- Barrel extension distance
      gun_center_shift = { 0, -0.65 },  -- Adjusts barrel position

      -- Defines sound effects for firing cycles
      cyclic_sound =
      {
        begin_sound =
        {
          { filename = "__base__/sound/fight/flamethrower-start.ogg", volume = 1 }
        },
        middle_sound =
        {
          { filename = "__base__/sound/fight/flamethrower-mid.ogg", volume = 1 }
        },
        end_sound =
        {
          { filename = "__base__/sound/fight/flamethrower-end.ogg", volume = 1 }
        }
      }
    },
    stack_size = 1  -- Max stack size (only one can be held at a time)
  },

  -- Define the Assault Spidertron Mortar weapon
  {
    type = "gun",
    name = "assault_spidertron-mortar",
    icon = "__base__/graphics/icons/artillery-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-b[vehicle-machine-gun]",

    -- Attack parameters for the mortar weapon
    attack_parameters =
    {
      type = "projectile",  -- Fires a projectile
      ammo_category = "artillery-shell",  -- Uses artillery shells as ammo
      cooldown = 250,  -- Slow fire rate (every 250 ticks)
      movement_slow_down_factor = 0.6,  -- Slight movement penalty when firing

      -- Defines visual effects for the projectile
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 1.7},
        creation_distance = 1.0,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },

      projectile_creation_distance = 1.0,
      projectile_center = {0, 0.5},
      range = 80,  -- Long firing range
      min_range = 20,  -- Minimum firing distance
      sound = sounds.tank_gunshot  -- Uses tank cannon sound effect
    },
    stack_size = 1
  },

  -- Define the Assault Spidertron Machine Gun (MG)
  {
    type = "gun",
    name = "assault_spidertron-mg",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-b[vehicle-machine-gun]",

    attack_parameters =
    {
      type = "projectile",  -- Fires bullets
      ammo_category = "bullet",  -- Uses bullets as ammo
      cooldown = 15,  -- Moderate fire rate (every 15 ticks)
      movement_slow_down_factor = 0,

      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 1.7},
        creation_distance = 1.0,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },

      projectile_creation_distance = 1.0,
      projectile_center = {0, 1.7},
      range = 25,  -- Medium-range attack
      damage_modifier = 2,  -- Increased damage output
      sound = sounds.gun_turret_gunshot  -- Uses turret firing sound
    },
    stack_size = 1
  }
})

-- Create a modified version of the Spidertron's rocket launcher
local assault_spidertron_rocket_launcher = table.deepcopy(data.raw["gun"]["spidertron-rocket-launcher-1"])
data:extend({
  {
    type = "gun",
    name = "assault_spidertron_rocket_launcher",
    icon = "__base__/graphics/icons/rocket-launcher.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[spidertron]-b[assault_spidertron_rocket_launcher]",

    attack_parameters =
    {
      type = "projectile",  -- Fires a rocket projectile
      ammo_category = "rocket",  -- Uses rockets as ammo
      cooldown = 60,  -- Moderate fire rate
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.0,
      projectile_center = {0, 0.5},
      range = 60,  -- Long attack range
      min_range = 5,  -- Minimum firing distance
      damage_modifier = 1.5,  -- Increased damage

      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 1.7},
        creation_distance = 1.0,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },

      sound = { filename = "__base__/sound/fight/rocket-launcher.ogg", volume = 1 },
    },
    stack_size = 1
  }
})

-- Create a modified version of the tank's cannon for Assault Spidertron
local assault_spidertron_cannon = table.deepcopy(data.raw["gun"]["tank-cannon"])
data:extend({
  {
    type = "gun",
    name = "assault_spidertron_cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[spidertron]-c[assault-spidertron-cannon]",

    attack_parameters =
    {
      type = "projectile",  -- Fires cannon shells
      ammo_category = "cannon-shell",  -- Uses cannon shells as ammo
      cooldown = 200,  -- Slow fire rate (every 200 ticks)
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.0,
      projectile_center = {0, 0.5},
      range = 40,  -- Medium attack range
      damage_modifier = 1.5,  -- Increased damage

      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 1.7},
        creation_distance = 1.0,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },

      sound = sounds.tank_gunshot,  -- Uses tank cannon sound effect
    },
    stack_size = 1
  }
})
