--- Configura as opções de entrada do utilizador para o portátil.
local function configurar_entrada()
    hl.config({
        input = {
            kb_layout = "pt",
            follow_mouse = 1,
            sensitivity = 0,
            touchpad = {
                natural_scroll = true
            }
        }
    })
end

configurar_entrada()
