--- Adiciona os caminhos das configurações personalizadas ao package.path do Lua.
local function configurar_caminhos_modulos()
    local home = os.getenv("HOME")
    package.path = package.path .. ";" .. home .. "/.config/hypr/?.lua;" .. home .. "/.config/hypr/?/init.lua"
end

--- Carrega os ficheiros de configuração partilhados e específicos do portátil.
local function carregar_configuracoes()
    -- Ficheiros partilhados
    require("shared.shared_hypr")
    require("shared.dark_theme")

    -- Ficheiros específicos do Portátil
    require("laptop.input")
    require("laptop.monitors")
    require("laptop.startup")
    -- require("laptop.wallpaper")
end

configurar_caminhos_modulos()
carregar_configuracoes()
