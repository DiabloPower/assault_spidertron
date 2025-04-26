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

  local tech_option = settings.startup["spidertron-tech-option"].value
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

local burner_enabled = settings.startup["enable-burner-engine"].value

if burner_enabled == "burner" then
    data.raw["spider-vehicle"]["assault_spidertron"].energy_source = {
        type = "burner",
        fuel_categories = {"chemical"},
        effectivity = 1,
        fuel_inventory_size = 2,
        burnt_inventory_size = 0,
        emissions_per_minute = {
          pollution = 10
        },
        smoke =
        {
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
    }
    data.raw["spider-vehicle"]["assault_spidertron"].movement_energy_consumption = "250kW"
else
    data.raw["spider-vehicle"]["assault_spidertron"].energy_source = {
        type = "void"
    }
    data.raw["spider-vehicle"]["assault_spidertron"].movement_energy_consumption = "25kW"
end


local function generate_gun_list()
  local guns = {}
  if settings.startup["enable-gun-mortar"].value then
      table.insert(guns, "assault_spidertron-mortar")
  end
  if settings.startup["enable-gun-rocket-launcher"].value then
      table.insert(guns, "assault_spidertron_rocket_launcher")
  end
  if settings.startup["enable-gun-cannon"].value then
      table.insert(guns, "assault_spidertron_cannon")
  end
  if settings.startup["enable-gun-mg"].value then
      table.insert(guns, "assault_spidertron-mg")
  end
  if settings.startup["enable-gun-flamer"].value then
      table.insert(guns, "assault_spidertron-flamer")
  end
  return guns
end

local assault_spidertron = data.raw["spider-vehicle"]["assault_spidertron"]

if assault_spidertron then
  assault_spidertron.guns = generate_gun_list()
end

if settings.startup["spidertron-tech-option"].value == "early-assault-spidertron" then
  data.raw.recipe["assault_spidertron"].ingredients = {
      {type = "item", name = "tank", amount = 1},
      {type = "item", name = "steel-plate", amount = 200},
      {type = "item", name = "advanced-circuit", amount = 100},
      {type = "item", name = "engine-unit", amount = 60},
      {type = "item", name = "radar", amount = 1}
  }
end

if settings.startup["spidertron-tech-option"].value == "early-assault-spidertron" then
  if data.raw["spider-vehicle"]["assault_spidertron"] then
      data.raw["spider-vehicle"]["assault_spidertron"].max_health = 2000
  end
end
