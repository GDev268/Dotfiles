--- Adiciona os caminhos das configurações personalizadas ao package.path do Lua.
local function configurar_caminhos_modulos()
    local home = os.getenv("HOME")
    package.path = package.path .. ";" .. home .. "/.config/hypr/?.lua;" .. home .. "/.config/hypr/?/init.lua"
end

--- Carrega os ficheiros de configuração partilhados e específicos do ambiente de trabalho.
local function carregar_configuracoes()
    -- Ficheiros partilhados
    require("shared.shared_hypr")
    require("shared.dark_theme")

    -- Ficheiros específicos do Desktop
    require("desktop.input")
    require("desktop.monitors")
    require("desktop.startup")
    require("desktop.wallpaper")
end

configurar_caminhos_modulos()
carregar_configuracoes()
