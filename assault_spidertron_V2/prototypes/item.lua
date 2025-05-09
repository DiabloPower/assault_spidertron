-- Define the base path for the Assault Spidertron mod files
path = "__assault_spidertron_V2__"

-- Define the item entity for the Assault Spidertron
data:extend({
    {
        type = "item-with-entity-data",  -- Defines an item that spawns an entity upon placement
        name = "assault_spidertron",  -- Unique name for the item

        -- Icon settings for the item
        icon = path .. "/graphics/icons/assault_spidertron_icon.png",
        icon_size = 64,

        -- Assigns the item to the 'transport' subgroup in the game menu
        subgroup = "transport",

        -- Determines the item's placement order within its subgroup
        order = "b[personal-transport]-b[vehicle-tier]",

        -- Specifies that placing this item creates an Assault Spidertron entity
        place_result = "assault_spidertron",

        -- Limits the maximum stack size to 1 (only one can be carried at a time)
        stack_size = 1,
    }
})
