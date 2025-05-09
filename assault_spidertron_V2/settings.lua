-- Define various startup settings for the Assault Spidertron mod
data:extend({
    -- Setting to enable or disable friendly fire
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-friendly-fire",
        setting_type = "startup",
        default_value = true,
        order = "a-a"
    },

    -- Setting to choose whether to use SpidertronEnhancements mod settings or default settings
    {
        type = "string-setting",
        name = "assault-spidertron-use-enhancements-settings",
        setting_type = "startup",
        allowed_values = {"enhancements", "mod-default"},
        default_value = "mod-default",
        order = "a-b"
    },

    -- Setting to determine the energy source type for the Assault Spidertron
    {
        type = "string-setting",
        name = "assault-spidertron-enable-burner-engine",
        setting_type = "startup",
        allowed_values = {"void", "burner"},
        default_value = "void",
        order = "a-c"
    },

    -- Setting to enable or disable burner engine smoke effects
    {
        type = "string-setting",
        name = "assault-spidertron-enable-burner-engine-smoke",
        setting_type = "startup",
        allowed_values = {"yes", "no"},
        default_value = "yes",
        order = "a-d"
    },

    -- Setting to define when Assault Spidertron technology is unlocked
    {
        type = "string-setting",
        name = "assault-spidertron-tech-option",
        setting_type = "startup",
        allowed_values = {"default", "early-assault-spidertron"},
        default_value = "default",
        order = "a-f"
    },

    -- Setting to enable or disable automatic weapon cycling
    {
        type = "string-setting",
        name = "assault-spidertron-cycle-weapons",
        setting_type = "startup",
        allowed_values = {"no", "yes"},
        default_value = "no",
        order = "a-g"
    },

    -- Settings for enabling specific weapons and determining their amount
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-mortar",
        setting_type = "startup",
        default_value = true,
        order = "b-aa"
    },-- Set the number of mortar guns allowed
    {
        type = "string-setting",
        name = "assault-spidertron-mortar-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-ab"
    },

    -- Enable or disable the rocket launcher
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-rocket-launcher",
        setting_type = "startup",
        default_value = true,
        order = "b-ba"
    },
    -- Set the number of rocket launchers allowed
    {
        type = "string-setting",
        name = "assault-spidertron-rocket-launcher-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-bb"
    },

    -- Enable or disable the cannon
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-cannon",
        setting_type = "startup",
        default_value = true,
        order = "b-ca"
    },
    -- Set the number of cannons allowed
    {
        type = "string-setting",
        name = "assault-spidertron-cannon-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-cb"
    },

    -- Enable or disable the machine gun
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-mg",
        setting_type = "startup",
        default_value = true,
        order = "b-da"
    },
    -- Set the number of machine guns allowed
    {
        type = "string-setting",
        name = "assault-spidertron-mg-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-db"
    },

    -- Enable or disable the flamer gun
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-flamer",
        setting_type = "startup",
        default_value = true,
        order = "b-ea"
    },
    -- Set the number of flamer guns allowed
    {
        type = "string-setting",
        name = "assault-spidertron-flamer-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-eb"
    },
})