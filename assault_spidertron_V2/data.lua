path = "__assault_spidertron_V2__"
require("__assault_spidertron_V2__.prototypes.gun")
require("__assault_spidertron_V2__.prototypes.entity")
require("__assault_spidertron_V2__.prototypes.item")
require("__assault_spidertron_V2__.prototypes.equipment_grid")
require("__assault_spidertron_V2__.prototypes.recipe")


if data.raw.technology['spidertron'] then
  local tech = table.deepcopy(data.raw.technology['spidertron'])
  tech.name = "assault_spidertron_tech"
  tech.icon = path .. "/graphics/technology/assault_spidertron_tech.png"
  tech.effects = {{type = "unlock-recipe", recipe = "assault_spidertron"}}
  tech.prerequisites = {"spidertron"}
  data:extend({tech})
  data.raw.recipe["assault_spidertron"].enabled = false
end