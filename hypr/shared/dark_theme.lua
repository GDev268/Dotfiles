--- Configura o tema escuro para aplicações GTK3 e GTK4 fora do arranque inicial.
local function aplicar_temas_gerais()
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"')
end

--- Configura as preferências de tema e esquema de cores no evento de arranque do Hyprland.
local function inicializar_temas_arranque()
    hl.on("hyprland.start", function()
        hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "MacTahoe-Dark-alt"')
        hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    end)
end

aplicar_temas_gerais()
inicializar_temas_arranque()
