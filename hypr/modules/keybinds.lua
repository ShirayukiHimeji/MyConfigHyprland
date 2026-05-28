---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "qs ipc -c noctalia-shell --any-display call launcher toggle"

---------------------
---- KEYBINDINGS ----
---------------------

-- Definisikan variabel IPC menggunakan sintaks string multi-line Lua [[]] agar aman dari escape character
local ipc = [[ qs -c noctalia-shell ipc call ]]

-- Core binds
-- Format 0.55: hl.bind("MODIFIER + KEY", hl.dsp.dispatcher_name("argument"))
hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd(ipc .. "launcher toggle"))
hl.bind("SUPER + A", hl.dsp.exec_cmd(ipc .. "controlCenter toggle"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd(ipc .. "wallpaper toggle"))
hl.bind("SUPER + comma", hl.dsp.exec_cmd(ipc .. "settings toggle"))
hl.bind("SUPER + period", hl.dsp.exec_cmd(ipc .. "launcher emoji"))
hl.bind("SUPER + V", hl.dsp.exec_cmd(ipc .. "launcher clipboard"))
hl.bind("SUPER + L", hl.dsp.exec_cmd(ipc .. "lockScreen lock"))
hl.bind("SUPER + I", hl.dsp.exec_cmd(ipc .. "settings toggle"))
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd(ipc .. "systemMonitor toggle"))
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd(ipc .. "sessionMenu toggle"))
hl.bind("SUPER + TAB", hl.dsp.exec_cmd(ipc .. "launcher windows"))
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "plugin:screen-shot-and-record screenshot"))

-- Virtual Machine
--##! Virtual machines
hl.define_submap("virtual-machine", function()
    hl.bind("SUPER + ALT + F1", function()
        local currentsubmap = hl.get_current_submap()
        if currentsubmap == "virtual-machine" then
            hl.dispatch(hl.dsp.exec_cmd(
                "notify-send 'Exited Virtual Machine submap' 'Keybinds re-enabled' -a 'Hyprland'"))
            hl.dispatch(hl.dsp.submap("reset"))
        elseif currentsubmap == "" then
            hl.dispatch(hl.dsp.exec_cmd(
                "notify-send 'Entered Virtual Machine submap' 'Keybinds disabled. hit SUPER+ALT+F1 to escape' -a 'Hyprland'"))
            hl.dispatch(hl.dsp.submap("virtual-machine"))
        end
    end, { submap_universal = true })
end)

-- Media keys 
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. "volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. "volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(ipc .. "volume muteOutput"), { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd(ipc .. "volume muteInput"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. "brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness decrease"),{ locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(ipc .. "media next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(ipc .. "media playPause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(ipc .. "media playPause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(ipc .. "media previous"), { locked = true })

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + W", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + C", hl.dsp.exec_cmd("code"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + CTRL + P", hl.dsp.exec_cmd("code ~/.config/hypr"))
hl.bind("SUPER + CTRL + mouse:272", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i })) -- Hide
end

for i = 1, 2 do
    local keys = { "Left", "Right" }
    local prefix = { "r-", "r+" }
    local descdir = { "left", "right" }
    hl.bind("CTRL + SUPER + " .. keys[i], hl.dsp.focus({ workspace = prefix[i] .. "1" }), {description = "Workspace: Focus " .. descdir[i]})
end

for i = 1, 4 do
    local key = { "SUPER + ALT + Page_", "CTRL + SUPER + SHIFT + " }
    local keycombos = { key[1] .. "down", key[1] .. "up", key[2] .. "Right", key[2] .. "Left" }
    local prefix = { "r+", "r-", "r+", "r-" }
    hl.bind(keycombos[i], hl.dsp.window.move({ workspace = prefix[i] .. "1" })) 
end

--#/# bind = SUPER, Scroll ↑/↓,, -- Focus left/right
for i = 1, 4 do
    local key = { "SUPER + mouse_up", "SUPER + mouse_down" }
    local keycombos = { key[1], key[2], "CTRL + " .. key[1], "CTRL + " .. key[2] }
    local prefix = { "+", "-", "r+", "r-" }
    hl.bind(keycombos[i], hl.dsp.focus({ workspace = prefix[i] .. "1" }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

