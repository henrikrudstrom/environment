local hyper = {"shift", "ctrl", "alt", "cmd"}
hs.hotkey.bind(hyper, "f1", "hammerspoon reloaded", nil, hs.reload)
hs.hotkey.bind(hyper, "f2", nil, nil, function() hs.openConsole(true) end)
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall
Install:andUse("MiroWindowsManager")
-- hs.loadSpoon("MiroWindowsManager")
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
-- get bundle id with command: osascript -e 'id of app "Name of App"'
Chrome="com.google.Chrome"
Trello="com.atlassian.trello"

function openUrlInTrello(url)
  hs.application.launchOrFocusByBundleID(Trello)
  local trello = hs.application.applicationsForBundleID(Trello)[1]
  print("app", trello)
  hs.pasteboard.setContents(url)
  hs.eventtap.event.newKeyEvent({"alt", "cmd"}, "v", true):post()
  hs.eventtap.event.newKeyEvent({"alt", "cmd"}, "v", false):post()
end
-- openUrlInTrello("https://trello.com/c/HdGMA1Cp/247-finne-ut-av-hvorfor-p%C3%A5loggede-brukere-av-og-til-f%C3%A5r-logg-inn-for-%C3%A5-stemme-n%C3%A5r-de-g%C3%A5r-inn-p%C3%A5-en-artikkel-med-avstemning")
Install:andUse("URLDispatcher",
               {
                 config = {
                   url_patterns = {
                     { "https?://trello.com", nil, openUrlInTrello },
                   },
                   default_handler = Chrome
                 },
                 start = true
               }
)

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
mapEnabled = false
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