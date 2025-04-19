local sounds = require("__base__.prototypes.entity.sounds")
data:extend({
{
    type = "gun",
    name = "assault_spidertron-flamer",
    icon = "__base__/graphics/icons/flamethrower.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "b[flamethrower]-b[tank-flamethrower]",
    attack_parameters =
    {
      type = "stream",
      ammo_category = "flamethrower",
      cooldown = 1,
      range = 12,
      min_range = 3,
	  gun_barrel_length = 1.05,
      gun_center_shift = { 0, -0.65 },
      cyclic_sound =
      {
        begin_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-start.ogg",
            volume = 1
          }
        },
        middle_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-mid.ogg",
            volume = 1
          }
        },
        end_sound =
        {
          {
            filename = "__base__/sound/fight/flamethrower-end.ogg",
            volume = 1
          }
        }
      }
    },
    stack_size = 1
},
{
    type = "gun",
    name = "assault_spidertron-mortar",
    icon = "__base__/graphics/icons/artillery-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-b[vehicle-machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "artillery-shell",
      cooldown = 250,
      movement_slow_down_factor = 0.6,
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
      range = 80,
	  min_range = 20,
      sound = sounds.tank_gunshot
    },
    stack_size = 1
},
{
    type = "gun",
    name = "assault_spidertron-mg",
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "a[basic-clips]-b[vehicle-machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 15,
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
      range = 25,
      damage_modifier = 2,
      sound = sounds.gun_turret_gunshot
    },
    stack_size = 1
}
})

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
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 60,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.0,
      projectile_center = {0, 0.5},
      range = 60,
      min_range = 5,
      damage_modifier = 1.5,
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
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = 200,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 1.0,
      projectile_center = {0, 0.5},
      range = 40,
      damage_modifier = 1.5,
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
      sound = sounds.tank_gunshot,
    },
    stack_size = 1
  }
})
