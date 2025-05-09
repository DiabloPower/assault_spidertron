-- Define the base path for the Assault Spidertron mod files
path = "__assault_spidertron_V2__"

-- Define the crafting recipe for the Assault Spidertron
data:extend({
    {
        type = "recipe",  -- Specifies that this is a crafting recipe
        name = "assault_spidertron",  -- Unique recipe name
        enabled = false,  -- The recipe is initially locked until researched
        energy_required = 10,  -- Time in seconds needed to craft one Assault Spidertron

        -- List of required ingredients to craft the Assault Spidertron
        ingredients =
        {
            {type = "item", name = "spidertron", amount = 1},  -- Requires 1 Spidertron
            {type = "item", name = "steel-plate", amount = 200},  -- Requires 200 steel plates
            {type = "item", name = "advanced-circuit", amount = 50}  -- Requires 50 advanced circuits
        },

        -- Defines the result of crafting—produces one Assault Spidertron
        results = {{type="item", name="assault_spidertron", amount=1}},

        -- Icon settings for the recipe
        icon = path .. "/graphics/icons/assault_spidertron_icon.png",
        icon_size = 64,
    }
})
