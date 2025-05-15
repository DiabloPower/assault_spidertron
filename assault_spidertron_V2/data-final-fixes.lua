-- Retrieve the "assault_spidertron" entity from the game data
local assault_spidertron = data.raw["spider-vehicle"]["assault_spidertron"]

-- If the entity exists, enable remote driving for it
if assault_spidertron then
  assault_spidertron.allow_remote_driving = true
end