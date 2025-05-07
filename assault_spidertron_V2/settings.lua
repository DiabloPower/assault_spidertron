data:extend({
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-friendly-fire",
        setting_type = "startup",
        default_value = true,
        order = "a-a"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-use-enhancements-settings",
        setting_type = "startup",
        allowed_values = {"enhancements", "mod-default"},
        default_value = "mod-default",
        order = "a-b"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-enable-burner-engine",
        setting_type = "startup",
        allowed_values = {"void", "burner"},
        default_value = "void",
        order = "a-c"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-enable-burner-engine-smoke",
        setting_type = "startup",
        allowed_values = {"yes", "no"},
        default_value = "yes",
        order = "a-d"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-tech-option",
        setting_type = "startup",
        allowed_values = {"default", "early-assault-spidertron"},
        default_value = "default",
        order = "a-f"
    },  
    {
        type = "string-setting",
        name = "assault-spidertron-cycle-weapons",
        setting_type = "startup",
        allowed_values = {"no", "yes"},
        default_value = "no",
        order = "a-g"
    },
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-mortar",
        setting_type = "startup",
        default_value = true,
        order = "b-aa"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-mortar-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-ab"
    },
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-rocket-launcher",
        setting_type = "startup",
        default_value = true,
        order = "b-ba"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-rocket-launcher-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-bb"
    },
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-cannon",
        setting_type = "startup",
        default_value = true,
        order = "b-ca"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-cannon-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-cb"
    },
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-mg",
        setting_type = "startup",
        default_value = true,
        order = "b-da"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-mg-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-db"
    },
    {
        type = "bool-setting",
        name = "assault-spidertron-enable-gun-flamer",
        setting_type = "startup",
        default_value = true,
        order = "b-ea"
    },
    {
        type = "string-setting",
        name = "assault-spidertron-flamer-amount",
        setting_type = "startup",
        allowed_values = {"1", "2", "3", "4"},
        default_value = "1",
        order = "b-eb"
    },
})