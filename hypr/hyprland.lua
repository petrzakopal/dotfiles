-- Hyprland Lua configuration migrated from Hyprland 0.56.2 hyprland.conf
-- Original configuration preserved where possible.
-- https://wiki.hypr.land/configuring/core/

-----------------
-- MONITORS
-----------------
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-----------------
-- PROGRAMS
-----------------
local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "hyprlauncher"
local mainMod = "SUPER"

-----------------
-- AUTOSTART
-----------------
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("dunst")
    hl.exec_cmd("flameshot")

    -- These GTK preferences only need to be applied once per session.
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'")
end)

-----------------
-- ENVIRONMENT
-----------------
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Original permission rules were commented out, so no policy is enabled here.
-- On versions that support it, permission setup belongs to the Lua permissions API.

-----------------
-- LOOK AND FEEL
-----------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 1,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = { enabled = true },
    dwindle = { preserve_split = true },
    master = { new_status = "master" },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})

-----------------
-- ANIMATIONS
-----------------
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1} } })

local animations = {
    { "global",        1.0,  "default" },
    { "border",        1.0,  "easeOutQuint" },
    { "windows",       0.5,  "easeOutQuint" },
    { "windowsIn",     0.5,  "easeOutQuint", "popin 87%" },
    { "windowsOut",    0.5,  "linear",       "popin 87%" },
    { "fadeIn",        0.15, "almostLinear" },
    { "fadeOut",       0.15, "almostLinear" },
    { "fade",          0.15, "quick" },
    { "layers",        1.0,  "easeOutQuint" },
    { "layersIn",      1.0,  "easeOutQuint", "fade" },
    { "layersOut",     1.0,  "linear",       "fade" },
    { "fadeLayersIn",  1.0,  "almostLinear" },
    { "fadeLayersOut", 1.0,  "almostLinear" },
    { "workspaces",    0.1,  "almostLinear", "fade" },
    { "workspacesIn",  0.1,  "almostLinear", "fade" },
    { "workspacesOut", 0.1,  "almostLinear", "fade" },
    { "zoomFactor",    1.0,  "quick" },
}
for _, a in ipairs(animations) do
    hl.animation({ leaf = a[1], enabled = true, speed = a[2], bezier = a[3], style = a[4] })
end

-- Optional smart-gap rules from the original config remained commented out.
-- To enable later, use hl.workspace_rule() and hl.window_rule().

-----------------
-- INPUT
-----------------
hl.config({
    input = {
        kb_layout = "pz",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        repeat_rate = 200,
        repeat_delay = 250,
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = { natural_scroll = true },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

-----------------
-- KEYBINDINGS
-----------------
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

for _, pair in ipairs({
    { "left", "left" }, { "right", "right" },
    { "up", "up" },   { "down", "down" },
}) do
    hl.bind(mainMod .. " + " .. pair[1], hl.dsp.focus({ direction = pair[2] }))
end

-- Preserve physical keycodes; important for your custom 'pz' layout.
for i = 1, 10 do
    local key = "code:" .. (i + 9)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Workspace scrolling
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Window drag and resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume and brightness (legacy 'bindel': repeating + locked)
for _, b in ipairs({
    { "XF86AudioRaiseVolume", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+" },
    { "XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-" },
    { "XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" },
    { "XF86AudioMicMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle" },
    { "XF86MonBrightnessUp", "brightnessctl -e4 -n2 set 5%+" },
    { "XF86MonBrightnessDown", "brightnessctl -e4 -n2 set 5%-" },
}) do
    hl.bind(b[1], hl.dsp.exec_cmd(b[2]), { repeating = true, locked = true })
end

-- Media keys (legacy 'bindl': locked)
for _, b in ipairs({
    { "XF86AudioNext", "playerctl next" },
    { "XF86AudioPause", "playerctl play-pause" },
    { "XF86AudioPlay", "playerctl play-pause" },
    { "XF86AudioPrev", "playerctl previous" },
}) do
    hl.bind(b[1], hl.dsp.exec_cmd(b[2]), { locked = true })
end

hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))

-----------------
-- WINDOW RULES
-----------------
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "flameshot-multi-display-fix",
    match = { class = "flameshot" },
    animation = "fade",
    rounding = 0,
    border_size = 0,
    float = true,
    monitor = "eDP-1",
})
