-- Extend the game's data to define a new equipment grid
data:extend({
    {
        type = "equipment-grid",  -- Specifies that this entity is an equipment grid
        name = "assault_spidertron-equipment-grid",  -- Unique name for the equipment grid

        -- Set the size of the grid (width x height)
        width = 10,  -- Defines 10 grid columns
        height = 6,  -- Defines 6 grid rows

        -- Equipment categories that can be placed in the grid
        equipment_categories = {"armor"}  -- Allows armor-related equipment only
    }
})
