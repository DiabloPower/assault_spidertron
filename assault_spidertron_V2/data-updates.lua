-- Check if the "SpidertronEnhancements" mod is active and the original Spidertron entity exists
if mods["SpidertronEnhancements"] and data.raw["spider-vehicle"]["spidertron"] then
    -- Retrieve the original Spidertron data
    local original_spidertron = data.raw["spider-vehicle"]["spidertron"]
    -- Retrieve the Assault Spidertron entity
    local assault_spidertron = data.raw["spider-vehicle"]["assault_spidertron"]

    -- If Assault Spidertron exists, apply energy source properties from the original Spidertron
    if assault_spidertron then
        -- Set the fuel inventory size based on the original Spidertron
        assault_spidertron.energy_source.fuel_inventory_size = original_spidertron.energy_source.fuel_inventory_size
        -- Match movement energy consumption with the original Spidertron
        assault_spidertron.movement_energy_consumption = original_spidertron.movement_energy_consumption
    end
end