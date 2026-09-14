--- Configura a disposição física e parâmetros de cada monitor ligado.
local function configurar_monitores()
    hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@75",
        position = "0x0",
        scale = 1
    })

    hl.monitor({
        output = "DP-1",
        mode = "preferred",
        position = "-1280x0",
        scale = 1
    })
end

--- Mapeia sequências de áreas de trabalho a monitores específicos.
local function atribuir_workspaces()
    for i = 1, 10 do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = "HDMI-A-1"
        })
    end

    for i = 11, 20 do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = "DP-1"
        })
    end
end

configurar_monitores()
atribuir_workspaces()
