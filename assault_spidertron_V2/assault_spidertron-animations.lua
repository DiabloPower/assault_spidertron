-- Load the utility module
local util = require("util")
-- Define the base path for assets
path = "__assault_spidertron_V2__"

-- Function to create leg sprite layers with adjustments
local function create_leg_sprite_layer_definition(column, row, additions, sprite_definition)
  local tab = util.table.deepcopy(sprite_definition)
  -- Adjust the sprite position based on variations
  tab.x = (tab.variation_count >= 8) and (tab.width * (column - 1)) or tab.x
  tab.y = tab.height * (row - 1)
  -- Apply additional properties
  tab.draw_as_shadow = additions.draw_as_shadow
  tab.apply_runtime_tint = additions.apply_runtime_tint
  tab.variation_count = nil
  return tab
end

-- Generalized function to create specialized leg graphics based on key criteria
local function create_leg_part_special(key, leg_index, graphics_definitions, part_base)
  local special = util.table.deepcopy(part_base)
  -- Iterate over each graphical layer
  for layer_name, layer_definitions in pairs(graphics_definitions.layers) do
    for _, v in pairs(layer_definitions) do
      if v[key] then
        -- Assign specific graphical properties
        special[layer_name] = create_leg_sprite_layer_definition(leg_index, v.row, v, graphics_definitions[v.key])
      end
    end
  end
  return special
end

-- Function to create shadow graphics for leg parts
local function create_leg_part_shadow_graphics(leg_index, graphics_definitions, part_base)
  return create_leg_part_special("draw_as_shadow", leg_index, graphics_definitions, part_base)
end

-- Function to create water reflection graphics for leg parts
local function create_leg_part_water_reflection_graphics(leg_index, graphics_definitions, part_base)
  return create_leg_part_special("draw_as_water_reflection", leg_index, graphics_definitions, part_base)
end

local function create_leg_part_graphics(leg_index, graphics_definitions, part_base)
  local tab = util.table.deepcopy(part_base)
  for layer_name, layer_definitions in pairs(graphics_definitions.layers) do
    for _, v in pairs(layer_definitions) do
      -- Exclude shadow and water reflection layers
      if (not v.draw_as_shadow) and (not v.draw_as_water_reflection) then
        tab[layer_name] = tab[layer_name] or { layers = {} }
        -- Add new graphical layer to the definition
        table.insert(tab[layer_name].layers, create_leg_sprite_layer_definition(leg_index, v.row, v, graphics_definitions[v.key]))
      end
    end
  end
  return tab
end

-- Function to create the light cone effect for the spidertron
local function create_spidertron_light_cone(orientation, intensity, size, shift_adder)
  local shift = { x = 0, y = -14 + shift_adder}
  return
  {
    type = "oriented",
    minimum_darkness = 0.3,
    picture =
    {
      filename = "__core__/graphics/light-cone.png",
      priority = "extra-high",
      flags = { "light" },
      scale = 2,
      width = 200,
      height = 200
    },
    source_orientation_offset = orientation,
    shift = shift,
    size = 2 * size,
    intensity = 0.6 * intensity,
    color = {r = 0.92, g = 0.77, b = 0.3}
  }
end

-- Default graphics properties for spidertron leg segments
local leg_graphics_properties_default =
{
  upper_part =
  {
    middle_offset_from_top = 0.35,  -- offset length in tiles (= px / 32)
    middle_offset_from_bottom = 0.45,

    -- if sum of top_end_length and bottom_end_length is greater than length of leg segment, sprites will start to get squashed
    top_end_length = 0.75,
    bottom_end_length = 0.75,
  },

  lower_part =
  {
    middle_offset_from_top = 0.45,
    middle_offset_from_bottom = 0.65,

    top_end_length = 1,
    bottom_end_length = 1
  },

  -- upper_part_shadow = {},  -- when not defined, upper_part definition is used
  -- lower_part_shadow = {},  -- when not defined, lower_part definition is used

  -- upper_part_water_reflection = {}, -- when not defined, upper_part definition is used
  -- lower_part_water_reflection = {}  -- when not defined, lower_part definition is used
}

-- Assign default graphics properties to different legs
local leg_graphics_properties =
{
  [1] = leg_graphics_properties_default,
  [2] = leg_graphics_properties_default,
  [3] = leg_graphics_properties_default,
  [4] = leg_graphics_properties_default,
  [5] = leg_graphics_properties_default,
  [6] = leg_graphics_properties_default,
}

-- Define rotation offsets for spidertron joints
local spidertron_leg_joint_rotation_offsets =
{
  [1] = 0.25,
  [2] = 0.25,
  [3] = 0.25,
  [4] = -0.25,
  [5] = -0.25,
  [6] = -0.25,
}

-- Template for leg graphics layers
local leg_part_template_layers =
{
  top_end =
  {
    { key = "top_end", row = 1 },
    { key = "top_end", row = 2, draw_as_shadow = true },
    { key = "top_end", row = 3, apply_runtime_tint = true },
    { key = "reflection_top_end", row = 1, draw_as_water_reflection = true },
  },
  middle =
  {
    { key = "middle", row = 1 },
    { key = "middle", row = 2, draw_as_shadow = true },
    { key = "reflection_middle", row = 1, draw_as_water_reflection = true },
  },
  bottom_end =
  {
    { key = "bottom_end", row = 1 },
    { key = "bottom_end", row = 2, draw_as_shadow = true },
    { key = "bottom_end", row = 3, apply_runtime_tint = true },
    { key = "reflection_bottom_end", row = 1, draw_as_water_reflection = true }
  },
}

-- Definitions for graphical properties of lower leg parts
local leg_lower_part_graphics_definitions =
{
  layers = leg_part_template_layers,

  top_end =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-lower-end-A.png",
    width = 40,
    height = 98,
    variation_count = 8,
    scale = 0.5,
    shift = util.by_pixel(0.5, 19.5),
    direction_count = 2
  },

  middle =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-lower-stretchable.png",
    width = 50,
    height = 384,
    variation_count = 8,
    scale = 0.25,
    shift = util.by_pixel(0.5, 0),
    direction_count = 2
  },

  bottom_end =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-lower-end-B.png",
    width = 34,
    height = 92,
    variation_count = 8,
    scale = 0.5,
    shift = util.by_pixel(0, -21),
    direction_count = 2
  },

  reflection_top_end =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-lower-end-A-water-reflection.png",
    width = 56,
    height = 110,
    variation_count = 1,
    scale = 0.5,
    shift = util.by_pixel(1 * 0.5, 34 * 0.5),
    direction_count = 1
  },

  reflection_middle =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-lower-stretchable-water-reflection.png",
    width = 72,
    height = 384,
    variation_count = 1,
    scale = 0.25,
    shift = util.by_pixel(1 * 0.5, 0),
    direction_count = 1
  },

  reflection_bottom_end =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-lower-end-B-water-reflection.png",
    width = 52,
    height = 104,
    variation_count = 1,
    scale = 0.5,
    shift = util.by_pixel(0, -38 * 0.5),
    direction_count = 1
  }
}

-- Assign graphical properties for the upper leg parts
local leg_upper_part_graphics_definitions =
{
  layers = leg_part_template_layers,

  top_end =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-upper-end-A.png",
    width = 42,
    height = 86,
    variation_count = 8,
    scale = 0.5,
    shift = util.by_pixel(0, 18),
    direction_count = 2
  },

  middle =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-upper-stretchable.png",
    width = 60,
    height = 256,
    variation_count = 8,
    scale = 0.25,
    shift = util.by_pixel(-1.5, 0),
    direction_count = 2
  },

  bottom_end =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-upper-end-B.png",
    width = 38,
    height = 58,
    variation_count = 8,
    scale = 0.5,
    shift = util.by_pixel(0.5, -9),
    direction_count = 2
  },

  reflection_top_end =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-upper-end-A-water-reflection.png",
    width = 64,
    height = 96,
    variation_count = 1,
    scale = 0.5,
    shift = util.by_pixel(1 * 0.5, 31 * 0.5),
    direction_count = 1
  },

  reflection_middle =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-upper-stretchable-water-reflection.png",
    width = 80,
    height = 256,
    variation_count = 1,
    scale = 0.25,
    shift = util.by_pixel(-4 * 0.5, 0),
    direction_count = 1
  },

  reflection_bottom_end =
  {
    filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-upper-end-B-water-reflection.png",
    width = 56,
    height = 74,
    variation_count = 1,
    scale = 0.5,
    shift = util.by_pixel(1 * 0.5, -14 * 0.5),
    direction_count = 1
  }
}

-- Define the joint graphics for spidertron legs
local leg_joint_graphics_definitions =
{
  filename = path .. "/graphics/entity/assault_spidertron/legs/assault_spidertron-legs-knee.png",
  width = 22,
  height = 28,
  variation_count = 8,
  scale = 0.5,
  shift = util.by_pixel(0.5, 0),
  direction_count = 2
}

-- Define graphics set for spidertron torso
local spidertron_torso_graphics_set =
{
  base_animation =
  {
    layers =
    {
      {
        filename = path .. "/graphics/entity/assault_spidertron/torso/assault_spidertron-body-bottom.png",
        width = 126,
        height = 106,
        line_length = 1,
        direction_count = 1,
        scale = 0.5,
        shift = util.by_pixel(0, 0)
      }
    }
  },
  -- Define shadow graphics for spidertron torso
  shadow_base_animation =
  {
    filename = path .. "/graphics/entity/assault_spidertron/torso/assault_spidertron-body-bottom-shadow.png",
    width = 144,
    height = 96,
    line_length = 1,
    direction_count = 1,
    scale = 0.5,
    draw_as_shadow = true,
    shift = util.by_pixel(-1, -1)
  },
  -- Define main animation graphics for torso
  animation =
  {
    layers =
    {
      {
        filename = path .. "/graphics/entity/assault_spidertron/torso/assault_spidertron-body.png",
        width = 132,
        height = 138,
        line_length = 8,
        direction_count = 64,
        scale = 0.5,
        shift = util.by_pixel(0, -19)
      },
      {
        filename = path .. "/graphics/entity/assault_spidertron/torso/assault_spidertron-body-mask.png",
        width = 132,
        height = 138,
        line_length = 8,
        direction_count = 64,
        scale = 0.5,
        apply_runtime_tint = true,
        shift = util.by_pixel(0, -19)
      }
    }
  },
  -- Define shadow animation graphics for torso
  shadow_animation =
  {
    filename = path .. "/graphics/entity/assault_spidertron/torso/assault_spidertron-body-shadow.png",
    width = 192,
    height = 94,
    line_length = 8,
    direction_count = 64,
    scale = 0.5,
    draw_as_shadow = true,
    shift = util.by_pixel(26, 0.5)
  },
  -- Define water reflection graphics for torso
  water_reflection =
  {
    pictures =
    {
      filename = path .. "/graphics/entity/assault_spidertron/torso/assault_spidertron-body-water-reflection.png",
      width = 45,
      height = 45,
      variation_count = 1,
      scale = 5,
      shift = util.by_pixel(0, 0)
    }
  },
  -- Define light effects for spidertron
  light =
  {
    {
      minimum_darkness = 0.3,
      intensity = 0.4,
      size = 25,
      color = {r=1.0, g=1.0, b=1.0}
    },
    create_spidertron_light_cone(0,     1,    1   , -1),
    create_spidertron_light_cone(-0.05, 0.7,  0.7  , 2.5),
    create_spidertron_light_cone(0.04,  0.5,  0.45 , 5.5),
    create_spidertron_light_cone(0.06,  0.6,  0.35 , 6.5),
  },

  light_positions = require("__base__.prototypes.entity.spidertron-light-positions"),

  eye_light = {intensity = 1, size = 1, color = {r=1.0, g=1.0, b=1.0}},-- {r=1.0, g=0.0, b=0.0}},

  render_layer = "wires-above",
  base_render_layer = "higher-object-above",

  -- Define the render layer for the autopilot destination visualisation
  autopilot_destination_on_map_visualisation =
  {
    filename = "__core__/graphics/spidertron-target-map-visualization.png",
    priority = "extra-high-no-scale",
    scale = 0.5,
    flags = {"icon"},
    width = 64,
    height = 64,
    line_length = 8,
    frame_count = 24,
    animation_speed = 0.5,
    run_mode = "backward",
    apply_runtime_tint = true
  },

  autopilot_destination_visualisation_render_layer = "object",
  autopilot_destination_visualisation =
  {
    filename = "__core__/graphics/spidertron-target-map-visualization.png",
    priority = "extra-high-no-scale",
    scale = 0.5,
    flags = {"icon"},
    width = 64,
    height = 64,
    line_length = 8,
    frame_count = 24,
    animation_speed = 0.5,
    run_mode = "backward",
    apply_runtime_tint = true
  },
}
-- Function to create spidertron leg graphics for a given leg index
local function create_spidertron_leg_graphics_set(leg_index)
  local function get_leg_properties(part_name, suffix)
    return leg_graphics_properties[leg_index][part_name .. "_" .. suffix] or leg_graphics_properties[leg_index][part_name]
  end

  return
  {
    upper_part = create_leg_part_graphics(leg_index, leg_upper_part_graphics_definitions, leg_graphics_properties[leg_index].upper_part),
    lower_part = create_leg_part_graphics(leg_index, leg_lower_part_graphics_definitions, leg_graphics_properties[leg_index].lower_part),
    upper_part_shadow = create_leg_part_shadow_graphics(leg_index, leg_upper_part_graphics_definitions, get_leg_properties("upper_part", "shadow")),
    lower_part_shadow = create_leg_part_shadow_graphics(leg_index, leg_lower_part_graphics_definitions, get_leg_properties("lower_part", "shadow")),
    upper_part_water_reflection = create_leg_part_water_reflection_graphics(leg_index, leg_upper_part_graphics_definitions, get_leg_properties("upper_part", "water_reflection")),
    lower_part_water_reflection = create_leg_part_water_reflection_graphics(leg_index, leg_lower_part_graphics_definitions, get_leg_properties("lower_part", "water_reflection")),

    joint =
    {
      layers =
      {
        create_leg_sprite_layer_definition(leg_index, 1, {}, leg_joint_graphics_definitions),
        create_leg_sprite_layer_definition(leg_index, 3, { apply_runtime_tint = true }, leg_joint_graphics_definitions)
      }
    },

    joint_shadow = create_leg_sprite_layer_definition(leg_index, 2, { draw_as_shadow = true }, leg_joint_graphics_definitions),

    joint_turn_offset = spidertron_leg_joint_rotation_offsets[leg_index]
  }
end
-- Return final graphics set definitions
return
{
  legs = { create_spidertron_leg_graphics_set(1),
           create_spidertron_leg_graphics_set(2),
           create_spidertron_leg_graphics_set(3),
           create_spidertron_leg_graphics_set(4),
           create_spidertron_leg_graphics_set(5),
           create_spidertron_leg_graphics_set(6) },

  torso = spidertron_torso_graphics_set
}