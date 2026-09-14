--- Adiciona o caminho das configurações personalizadas ao package.path do Lua.
local function configurar_caminhos_modulos()
    local home = os.getenv("HOME")
    package.path = package.path .. ";" .. home .. "/.config/hypr/?.lua;" .. home .. "/.config/hypr/?/main.lua"
end

--- Configura e executa as aplicações e serviços do arranque inicial da sessão.
local function inicializar_ambiente()
    hl.on("hyprland.start", function()
        hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
        hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
        hl.exec_cmd("systemctl --user start hyprpolkitagent")
    end)
end

--- Carrega os ficheiros de configuração modulares localizados em ~/.config/hypr/.
local function carregar_configuracoes()
    local dispositivo = "desktop"

    if dispositivo == "desktop" then
        require("desktop.main")
    elseif dispositivo == "laptop" then
        require("laptop.main")
    end
end

configurar_caminhos_modulos()
inicializar_ambiente()
carregar_configuracoes()
