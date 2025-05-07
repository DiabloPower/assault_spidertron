if settings.startup["tarantulator-enable-friendly-fire"] then
else
    script.on_event(defines.events.on_tick, function(event)  
        if math.fmod(event.tick, 60) == 0 then
            local friendly_fire_setting = settings.startup["assault-spidertron-enable-friendly-fire"].value
            game.forces["player"].friendly_fire = friendly_fire_setting
        end
    end)
end