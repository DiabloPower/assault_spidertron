if mods["SpidertronEnhancements"] and data.raw["spider-vehicle"]["spidertron"] then
    local original_spidertron = data.raw["spider-vehicle"]["spidertron"]
    local assault_spidertron = data.raw["spider-vehicle"]["assault_spidertron"]

    if assault_spidertron then
        assault_spidertron.energy_source.fuel_inventory_size = original_spidertron.energy_source.fuel_inventory_size
        assault_spidertron.movement_energy_consumption = original_spidertron.movement_energy_consumption
    end
end