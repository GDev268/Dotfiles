--- Configura a disposição física do ecrã do portátil e o espelhamento de monitores externos.
local function configurar_monitores()
    hl.monitor({
        output = "eDP-1",
        mode = "preferred",
        position = "0x0",
        scale = 1
    })

    hl.monitor({
        output = "",
        mode = "preferred",
        position = "auto",
        scale = 1,
        mirror = "eDP-1"
    })
end

--- Mapeia as áreas de trabalho ao ecrã principal do portátil.
local function atribuir_workspaces()
    for i = 1, 10 do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = "eDP-1"
        })
    end
end

configurar_monitores()
atribuir_workspaces()
