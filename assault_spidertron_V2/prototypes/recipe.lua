path = "__assault_spidertron_V2__"

data:extend({
    {
    type = "recipe",
    name = "assault_spidertron",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
        {type = "item", name = "spidertron", amount = 1},
        {type = "item", name = "steel-plate", amount = 200},
        {type = "item", name = "advanced-circuit", amount = 50}
    },
    results = {{type="item", name="assault_spidertron", amount=1}},
    icon = path .. "/graphics/icons/assault_spidertron.png",
    icon_size = 64, icon_mipmaps = 4
}
})