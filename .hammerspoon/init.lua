local hyper = {"shift", "ctrl", "alt", "cmd"}

hs.loadSpoon("MiroWindowsManager")
hs.loadSpoon("FnMate")
-- hs.loadSpoon("ModTap")
hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})
-- symbolLayer = hs.hotkey.modal.new( {}, 'f20' );
-- symbolLayer:bind( '', 'n', function() hs.eventtap.keyStroke( { }, '=' ) end )
-- function symbolLayer:entered()
--   hs.alert("entered")
-- end
-- function symbolLayer:exited()
--   hs.alert("exited")
-- end
local function isDown(event)
    return hs.eventtap.event.types.keyDown == event:getType()
end
symbolLayerMap = {
  q = { '`', true },
  w = { '2', true },
  f = { '[', false },
  p = { ']', false},
  b = { ';', true },
  j = { '`', false },
  l = { '\'', false },
  u = { '\'', true },
  y = { '8', true },
  [';'] = { '6', true },
  a = {'7', true},
  r = {'\\', true},
  s = {'9', true},
  t = {'0', true},
  g = {';', false},
  k = {'-', true},
  n = { '=', true },
  e = { '=', false },
  i = { '1', true },
  o = { '/', false },
  z = {'5', true},
  x = {'4', true},
  c = {'[', true},
  d = {']', true},
  v = {'3', true},
  m = {'-', true},
  h = {',', true},
  [','] = {'.', true},
  ['.'] = {'/', true}
}
mapEnabled = true
function processKeys(event)
    if event:getKeyCode() == hs.keycodes.map["f20"] then
        mapEnabled = isDown(event)
        return true
    end
    if mapEnabled then
      local mapping = symbolLayerMap[event:getCharacters()]
      if mapping ~= nil then
        local flags = event:getFlags()
        if mapping[2] and flags['shift'] == nil then
          table.insert(flags, 'shift')
        end
        return true, {hs.eventtap.event.newKeyEvent(flags, mapping[1], isDown(event))}
      end
    end

    return false
end
tap = hs.eventtap.new({hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp}, processKeys):start()