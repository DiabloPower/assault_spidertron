data:extend({
    {
        type = "string-setting",
        name = "assault-spidertron-use-enhancements-settings",
        setting_type = "startup",
        allowed_values = {"enhancements", "mod-default"},
        default_value = "mod-default",
        order = "a-a"
    },
    {
        type = "string-setting",
        name = "enable-burner-engine",
        setting_type = "startup",
        allowed_values = {"void", "burner"},
        default_value = "void",
        order = "a-b"
    },
    {
        type = "string-setting",
        name = "spidertron-tech-option",
        setting_type = "startup",
        allowed_values = {"default", "early-assault-spidertron"},
        default_value = "default",
        order = "a-c"
    },
    {
        type = "bool-setting",
        name = "enable-gun-mortar",
        setting_type = "startup",
        default_value = true,
        order = "b-a"
    },
    {
        type = "bool-setting",
        name = "enable-gun-rocket-launcher",
        setting_type = "startup",
        default_value = true,
        order = "b-b"
    },
    {
        type = "bool-setting",
        name = "enable-gun-cannon",
        setting_type = "startup",
        default_value = true,
        order = "b-c"
    },
    {
        type = "bool-setting",
        name = "enable-gun-mg",
        setting_type = "startup",
        default_value = true,
        order = "b-d"
    },
    {
        type = "bool-setting",
        name = "enable-gun-flamer",
        setting_type = "startup",
        default_value = true,
        order = "b-e"
    },
})