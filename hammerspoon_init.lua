hs.alert.show("Config loaded")

-- auto reload config
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()

-- 入力ソースをleft commandで英数、right commandでかなにする
local simpleCmd = false
local map = hs.keycodes.map

local function kanaSwitchEvent(event)
    local c = event:getKeyCode()
    local f = event:getFlags()
    if event:getType() == hs.eventtap.event.types.keyDown then
        if f['cmd'] then
            simpleCmd = true
        end
    elseif event:getType() == hs.eventtap.event.types.flagsChanged then
        if not f['cmd'] then
            if simpleCmd == false then
                if c == map['cmd'] then
                    hs.keycodes.setMethod('Romaji')
                elseif c == map['rightcmd'] then
                    hs.keycodes.setMethod('Hiragana')
                end
            end
            simpleCmd = false
        end
    end
end

kanaSwitcher = hs.eventtap.new(
  {hs.eventtap.event.types.keyDown, hs.eventtap.event.types.flagsChanged},
  kanaSwitchEvent
)
kanaSwitcher:start()


-- hjklでウィンドウを操作
hs.window.animationDuration = 0
units = {
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 }
}

mash = { 'shift', 'command', 'option' }
hs.hotkey.bind(mash, 'l', function() hs.window.focusedWindow():move(units.right50, nil, true) end)
hs.hotkey.bind(mash, 'h', function() hs.window.focusedWindow():move(units.left50, nil, true) end)
hs.hotkey.bind(mash, 'k', function() hs.window.focusedWindow():move(units.top50, nil, true) end)
hs.hotkey.bind(mash, 'f', function() hs.window.focusedWindow():move(units.bot50, nil, true) end)

local function remap(mods, key, fn)
    return hs.hotkey.bind(mods, key, fn, nil, fn)
end

-- ctr + [ を押した時に入力ソースを英数に変換し、escapeする
remap({ 'control' }, '[', function()
    hs.eventtap.event.newKeyEvent(modifiers, string.lower('escape'), true):post()
    hs.timer.usleep(1000)
    hs.eventtap.event.newKeyEvent(modifiers, string.lower('escape'), false):post()
    hs.keycodes.setMethod('Romaji')
end)

