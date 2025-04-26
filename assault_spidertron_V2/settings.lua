data:extend({
    {
        type = "string-setting",
        name = "spidertron-tech-option",
        setting_type = "startup",
        default_value = "default",
        allowed_values = {"default", "early-assault-spidertron"},
    },
    {
        type = "string-setting",
        name = "enable-burner-engine",
        setting_type = "startup",
        default_value = "void",
        allowed_values = {"void", "burner"},
    },
    {
        type = "bool-setting",
        name = "enable-gun-mortar",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "enable-gun-rocket-launcher",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "enable-gun-cannon",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "enable-gun-mg",
        setting_type = "startup",
        default_value = true,
    },
    {
        type = "bool-setting",
        name = "enable-gun-flamer",
        setting_type = "startup",
        default_value = true,
    },
})