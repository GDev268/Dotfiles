--- Configura as opções de entrada do utilizador como layout de teclado e sensibilidade do rato.
local function configurar_entrada()
    hl.config({
        input = {
            kb_layout = "pt",
            follow_mouse = 1,
            sensitivity = -0.5,
            accel_profile = "flat"
        }
    })
end

configurar_entrada()
