-- Utility function to check if an entity is an Assault Spidertron
local function is_assault_spidertron(entity)
    return entity and entity.valid and entity.name == "assault-spidertron"
end

-- Updates the global friendly fire setting based on mod startup configuration
local function update_assault_friendly_fire()
    game.forces["player"].friendly_fire = settings.startup["assault-spidertron-enable-friendly-fire"].value
end

-- Setup function called on mod initialization and configuration change
local function setup()
    if settings.startup["assault-spidertron-enable-friendly-fire"] then
        update_assault_friendly_fire()
    end
end

-- Register setup logic for mod initialization and configuration changes
script.on_init(setup)
script.on_configuration_changed(setup)

-- Optional: Update friendly fire setting when an Assault Spidertron is built
script.on_event(defines.events.on_built_entity, function(event)
    if is_assault_spidertron(event.created_entity) then
        update_assault_friendly_fire()
    end
end, {
    { filter = "name", name = "assault-spidertron" }
})

-- Prevents friendly fire damage between Assault Spidertrons of the same force
script.on_event(defines.events.on_entity_damaged, function(event)
  local entity = event.entity
  local cause = event.cause

  -- only proceed if the damaged entity is an Assault Spidertron
  if entity and entity.valid and entity.name == "assault_spidertron" then
    -- check if the cause of damage is another Assault Spidertron from the same force
    if cause and cause.valid and cause.name == "assault_spidertron" and cause.force == entity.force then
      -- negate the damage by restoring health
      entity.health = entity.health + event.final_damage_amount
    end
  end
end)