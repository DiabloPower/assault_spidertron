-- Check if the setting to enable friendly fire for "Tarantulator" exists
if settings.startup["tarantulator-enable-friendly-fire"] then
    -- Do nothing if the setting is present
else
    -- If the setting is NOT present, execute friendly fire updates every 60 ticks
    script.on_event(defines.events.on_tick, function(event)  
        if math.fmod(event.tick, 60) == 0 then  -- Every second (60 ticks)
            -- Retrieve friendly fire setting for the Assault Spidertron
            local friendly_fire_setting = settings.startup["assault-spidertron-enable-friendly-fire"].value
            -- Apply the friendly fire setting to the player's force
            game.forces["player"].friendly_fire = friendly_fire_setting
        end
    end)
end