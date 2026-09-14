--- Configura e executa as aplicações de sistema no arranque inicial da sessão do portátil.
local function inicializar_apps_sistema()
    hl.on("hyprland.start", function()
        hl.exec_cmd("swaync")
        -- hl.exec_cmd("flatpak run com.github.wwmm.easyeffects")
        hl.exec_cmd("nm-applet --indicator")
        hl.exec_cmd("blueman-applet")
        hl.exec_cmd("systemctl --user start hyprpolkitagent")
        hl.exec_cmd("steam")
        hl.exec_cmd("sleep 1 && waybar")
    end)
end

inicializar_apps_sistema()
