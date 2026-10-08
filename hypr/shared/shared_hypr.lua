--- Define as configurações gerais de aparência, janelas e comportamento do Hyprland.
local function aplicar_configuracoes()
    hl.config({
        misc = {
            vrr = 1
        },
        general = {
            gaps_in = 5,
            gaps_out = 12,
            border_size = 1,
            col = {
                active_border = "rgba(ffffff15)",
                inactive_border = "rgba(00000010)"
            },
            layout = "dwindle"
        },
        decoration = {
            rounding = 12,
            shadow = {
                enabled = true,
                range = 25,
                render_power = 4,
                color = "rgba(00000040)"
            },
            blur = {
                enabled = true,
                size = 5,
                passes = 3,
                brightness = 0.8,
                vibrancy = 0.16
            }
        },
        animations = {
            enabled = true
        }
    })
end


--- Registra as curvas bezier para as animações personalizadas (Inspirado em macOS/Windows 11).
local function configurar_curvas_animacao()
    -- macOS style: Smooth fast start with an extended soft deceleration
    hl.curve("macEase", {
        type = "bezier",
        points = {{0.16, 1.0}, {0.3, 1.0}}
    })

    -- Fluent Design (Windows 11): Subtle overshoot for responsive UI elements
    hl.curve("fluentDecel", {
        type = "bezier",
        points = {{0.05, 0.9}, {0.1, 1.05}}
    })

    -- Smooth linear-to-decelerate for subtle background/fade shifts
    hl.curve("subtleEase", {
        type = "bezier",
        points = {{0.25, 1.0}, {0.5, 1.0}}
    })
end

--- Define as regras de animação para elementos da interface.
local function aplicar_animacoes()
    -- Smooth window opening (macOS-style subtle zoom scale)
    hl.animation({
        leaf = "windows",
        enabled = true,
        speed = 5,
        bezier = "macEase",
        style = "popin 92%"
    })

    -- Graceful window closing
    hl.animation({
        leaf = "windowsOut",
        enabled = true,
        speed = 4,
        bezier = "subtleEase",
        style = "popin 88%"
    })

    -- Fluid window movement/tiling rearrangements
    hl.animation({
        leaf = "windowsMove",
        enabled = true,
        speed = 5,
        bezier = "macEase"
    })

    -- Desktop workspace switching (Windows 11 slide feel)
    hl.animation({
        leaf = "workspaces",
        enabled = true,
        speed = 6,
        bezier = "macEase",
        style = "slide"
    })

    -- Subtle border glow transitions on focus
    hl.animation({
        leaf = "border",
        enabled = true,
        speed = 4,
        bezier = "subtleEase"
    })

    -- Smooth crossfade for transparency changes
    hl.animation({
        leaf = "fade",
        enabled = true,
        speed = 4,
        bezier = "subtleEase"
    })
end

--- Regista as regras para janelas e camadas do sistema.
local function configurar_regras()
    hl.window_rule({
        name = "windowrule-1",
        float = true,
        size = { 450, 600 },
        move = { "((monitor_w*0.7))", "50" },
        match = { class = "pavucontrol" }
    })

    hl.window_rule({
        name = "windowrule-2",
        float = true,
        size = { 450, 600 },
        move = { "((monitor_w*0.65))", "50" },
        match = { class = "blueman-manager" }
    })

    hl.window_rule({
        name = "windowrule-3",
        float = true,
        size = { 450, 600 },
        move = { "((monitor_w*0.6))", "50" },
        match = { class = "nm-connection-editor" }
    })

    hl.window_rule({
        name = "windowrule-4",
        float = true,
        size = { 900, 600 },
        center = true,
        match = { class = "Alacritty" }
    })

    -- CORRIGIDO: opacity agora é uma String em vez de tabela
    hl.window_rule({
        name = "windowrule-5",
        opacity = "0.6 0.6",
        match = { class = "Nautilus" }
    })

    hl.window_rule({
        name = "windowrule-6",
        float = true,
        size = { 600, 450 },
        move = { "((monitor_w*0.68))", "((monitor_h*0.50))" },
        match = { title = "tui_menu" }
    })

    hl.window_rule({
        name = "gnome-calendar-scratchpad",
        float = true,
        size = { 800, 0 },
        move = { "((monitor_w*0.30))", "((monitor_h*0.69))" },
        animation = "slide bottom",
        match = { class = "^(org.gnome.Calendar)$" }
    })

    -- CORRIGIDO: move passa expressões válidas em formato de String pura de 2 elementos
    hl.window_rule({
        name = "windowrule-7",
        float = true,
        size = { 800, 500 },
        move = { "center", "center" },
        match = { title = "^(tui_calendar)$" }
    })

    hl.layer_rule({
        name = "layerrule-1",
        blur = true,
        ignore_alpha = 0,
        match = { namespace = "waybar" }
    })
end

--- Regista os atalhos de teclado e combinações de rato.
local function configurar_atalhos()
    -- Execuções e gestão de janelas
    hl.bind("SUPER + Z", hl.dsp.exec_cmd("alacritty"))
    hl.bind("SUPER + Q", hl.dsp.window.close())
    hl.bind("SUPER + M", hl.dsp.exit())
    hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
    hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
    hl.bind("SUPER + TAB", hl.dsp.exec_cmd("rofi -show drun"))
    hl.bind("SUPER + P", hl.dsp.window.pseudo({ action = "toggle" }))
    hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
    hl.bind("SUPER + SHIFT + M", hl.dsp.exit())
    hl.bind("SUPER + X", hl.dsp.exec_cmd("wlogout"))
    hl.bind("SUPER + PRINT", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

    -- Navegação de áreas de trabalho
    hl.bind("SUPER + RIGHT", hl.dsp.focus({ workspace = "r+1" }))
    hl.bind("SUPER + LEFT", hl.dsp.focus({ workspace = "r-1" }))
    hl.bind("SUPER + ALT + RIGHT", hl.dsp.window.move({ workspace = "r+1" }))
    hl.bind("SUPER + ALT + LEFT", hl.dsp.window.move({ workspace = "r-1" }))

    -- Interações de rato
    hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
    hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

    -- Controlos de brilho e áudio
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"))
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

    -- Teclas multimédia
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
    hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
    hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
    hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
end

aplicar_configuracoes()
configurar_curvas_animacao()
aplicar_animacoes()
configurar_regras()
configurar_atalhos()
