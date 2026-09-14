--- Configura e inicializa o hyprpaper com definições de fundo de ecrã por monitor.
local function inicializar_hyprpaper()
    hl.on("hyprland.start", function()
        hl.exec_cmd("hyprpaper")
        hl.exec_cmd("sleep 0.5 && hyprctl hyprpaper splash false")
        hl.exec_cmd("sleep 1 && hyprctl hyprpaper wallpaper \"DP-1,/home/gpc/Imagens/Wallpapers/Wall2.png\"")
        hl.exec_cmd("sleep 1 && hyprctl hyprpaper wallpaper \"HDMI-A-1,/home/gpc/Imagens/Wallpapers/Wall1.png\"")
    end)
end

inicializar_hyprpaper()
