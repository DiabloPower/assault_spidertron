path = "__assault_spidertron_V2__"
require("__assault_spidertron_V2__.prototypes.gun")
require("__assault_spidertron_V2__.prototypes.entity")
require("__assault_spidertron_V2__.prototypes.item")
require("__assault_spidertron_V2__.prototypes.equipment_grid")
require("__assault_spidertron_V2__.prototypes.recipe")

if data.raw.technology["spidertron"] then
  local tech = table.deepcopy(data.raw.technology["spidertron"])
  tech.name = "assault_spidertron_tech"
  tech.icon = path .. "/graphics/technology/assault_spidertron_tech.png"
  tech.effects = {{type = "unlock-recipe", recipe = "assault_spidertron"}}
  tech.prerequisites = {"spidertron"}

  local tech_option = settings.startup["assault-spidertron-tech-option"].value
  if tech_option == "early-assault-spidertron" then
      tech.prerequisites = {"tank"}
      tech.unit = {
          count = 1000,
          ingredients = {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1},
              {"military-science-pack", 1},
              {"chemical-science-pack", 1}
          },
          time = 60
      }
  else

    tech.unit = table.deepcopy(data.raw.technology["spidertron"].unit)
  end

  data:extend({tech})
  data.raw.recipe["assault_spidertron"].enabled = false
end

local use_enhancements_settings = settings.startup["assault-spidertron-use-enhancements-settings"].value

local smoke_table = nil
if settings.startup["assault-spidertron-enable-burner-engine-smoke"] and settings.startup["assault-spidertron-enable-burner-engine-smoke"].value == "yes" then
    smoke_table = {
        {
            name = "tank-smoke",
            deviation = {0.5, 0.5},
            frequency = 100,
            position = {0, 0},
            starting_frame = 0,
            starting_frame_deviation = 60
        },
        {
            name = "tank-smoke",
            deviation = {0.5, 0.5},
            frequency = 150,
            position = {0, 0},
            starting_frame = 0,
            starting_frame_deviation = 60
        }
    }
end

if mods["SpidertronEnhancements"] and use_enhancements_settings == "enhancements" then
    local spidertron_requires_fuel = settings.startup["spidertron-enhancements-spiderton-requires-fuel"] and settings.startup["spidertron-enhancements-spiderton-requires-fuel"].value
  
    if spidertron_requires_fuel == "Yes" then
        data.raw["spider-vehicle"]["assault_spidertron"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            effectivity = 1,
            emissions_per_minute = {
                pollution = 10
            },
            smoke = smoke_table,
        }
    elseif spidertron_requires_fuel == "No" then
        data.raw["spider-vehicle"]["assault_spidertron"].energy_source = {
            type = "void"
        }
        data.raw["spider-vehicle"]["assault_spidertron"].movement_energy_consumption = "25kW"
    end
else
    -- my Logic
    local burner_enabled = settings.startup["assault-spidertron-enable-burner-engine"].value

    if burner_enabled == "burner" then
        data.raw["spider-vehicle"]["assault_spidertron"].energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            effectivity = 1,
            fuel_inventory_size = 2,
            emissions_per_minute = {
                pollution = 10
            },
            smoke = smoke_table,
        }
        data.raw["spider-vehicle"]["assault_spidertron"].movement_energy_consumption = "250kW"
    else
        data.raw["spider-vehicle"]["assault_spidertron"].energy_source = {
            type = "void"
        }
        data.raw["spider-vehicle"]["assault_spidertron"].movement_energy_consumption = "25kW"
    end
end

if settings.startup["assault-spidertron-cycle-weapons"].value == "yes" then
    data.raw["spider-vehicle"]["assault_spidertron"].automatic_weapon_cycling = true
end

local function generate_gun_list()
    local guns = {}

    local function add_guns(setting_enable, setting_amount, gun_name)
        if settings.startup[setting_enable].value then
            local amount = tonumber(settings.startup[setting_amount].value) or 1
            for i = 1, amount do
                table.insert(guns, gun_name)
            end
        end
    end

    add_guns("assault-spidertron-enable-gun-mortar", "assault-spidertron-mortar-amount", "assault_spidertron-mortar")
    add_guns("assault-spidertron-enable-gun-rocket-launcher", "assault-spidertron-rocket-launcher-amount", "assault_spidertron_rocket_launcher")
    add_guns("assault-spidertron-enable-gun-cannon", "assault-spidertron-cannon-amount", "assault_spidertron_cannon")
    add_guns("assault-spidertron-enable-gun-mg", "assault-spidertron-mg-amount", "assault_spidertron-mg")
    add_guns("assault-spidertron-enable-gun-flamer", "assault-spidertron-flamer-amount", "assault_spidertron-flamer")

    return guns
end

local assault_spidertron = data.raw["spider-vehicle"]["assault_spidertron"]

if assault_spidertron then
  assault_spidertron.guns = generate_gun_list()
end

if settings.startup["assault-spidertron-tech-option"].value == "assault-spidertron-early-assault-spidertron" then
  data.raw.recipe["assault_spidertron"].ingredients = {
      {type = "item", name = "tank", amount = 1},
      {type = "item", name = "steel-plate", amount = 200},
      {type = "item", name = "advanced-circuit", amount = 100},
      {type = "item", name = "engine-unit", amount = 60},
      {type = "item", name = "radar", amount = 1}
  }
end

if settings.startup["assault-spidertron-tech-option"].value == "early-assault-spidertron" then
  if data.raw["spider-vehicle"]["assault_spidertron"] then
      data.raw["spider-vehicle"]["assault_spidertron"].max_health = 2000
  end
end
