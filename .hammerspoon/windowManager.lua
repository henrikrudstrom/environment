local meh = {"ctrl", "alt", "shift"}
local hyper = {"shift", "ctrl", "alt", "cmd"}

local n1 = "7"
local n2 = "8"
local n3 = "9"
local n4 = "f17"
local n5 = "f18"
local n6 = "f19"
local n7 = "f7"
local n8 = "f8"
local n9 = "f9"
local n0 = "f20"
local np = "f16"
local duration = 0.03

function left(div)
    return function()
        -- size focused window to left half of display
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w * div
        f.h = max.h
        win:setFrame(f, duration)
    end
end

function right(div)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w * (1 - div))
        f.y = max.y
        f.w = max.w * div
        f.h = max.h
        win:setFrame(f, duration)
    end
end

function middle(div)
    return function()
        -- size focused window to middle third of display
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w * (1 - div) / 2)
        f.y = max.y
        f.w = max.w * div
        f.h = max.h
        win:setFrame(f, duration)
    end
end

function rightTop(divH, divV)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w * (1 - divH))
        f.w = max.w * divH
        f.h = max.h * divV
        f.y = max.y
        win:setFrame(f, duration)
    end
end

function rightBtm(divH, divV)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w * (1 - divH))
        f.w = max.w * divH
        f.h = max.h * divV
        f.y = max.y + (max.h * divV)
        win:setFrame(f, duration)
    end
end


function full()
  -- size focused window to size of desktop
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f, duration)
end

function displayRight()
  -- move the focused window one display to the right
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local east = screen:toNorth()
  win:moveToScreen(east, true, true, duration)
end

function displayLeft()
  -- move the focused window one display to the right
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local west = screen:toWest()
  win:moveToScreen(west, true, true, duration)
end

hs.hotkey.bind(meh, n4, left(0.6667))
hs.hotkey.bind(meh, n5, middle(0.3333))
hs.hotkey.bind(meh, n6, right(0.3333))
hs.hotkey.bind(meh, n9, rightTop(0.3333, 0.5))
hs.hotkey.bind(meh, n3, rightBtm(0.3333, 0.5))
hs.hotkey.bind(meh, n5, full)
hs.hotkey.bind(hyper, n4, left(0.5))
hs.hotkey.bind(hyper, n5, middle(0.5))
hs.hotkey.bind(hyper, n6, right(0.5))
hs.hotkey.bind(meh, np, displayLeft)
hs.hotkey.bind(meh, n0, displayRight)


-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
--   -- toggle the focused window to full screen (workspace)
--   local win = hs.window.focusedWindow()
--   win:setFullScreen(not win:isFullScreen())
-- end)