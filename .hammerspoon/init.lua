local open = require("open")
local remapper = require("remapper")
local toggleKeyboard = require("toggleKeyboard")

require("hs.ipc")
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
local Install = spoon.SpoonInstall


local hyper = {"shift", "ctrl", "alt", "cmd"}

hs.hotkey.bind(hyper, "f1", "hammerspoon reloaded", nil, hs.reload)
hs.hotkey.bind(hyper, "f2", nil, nil, hs.toggleConsole)
-- hs.hotkey.bind(hyper, "f4", toggleKeyboard.setVanilla)
hs.hotkey.bind(hyper, "c", open.application("Google Chrome"))
hs.hotkey.bind(hyper, "o", open.application("Visual Studio Code"))
hs.hotkey.bind(hyper, "t", open.application("com.googlecode.iterm2"))
hs.hotkey.bind(hyper, "s", open.application("Slack"))
hs.hotkey.bind(hyper, "f", open.application("Finder"))
hs.hotkey.bind(hyper, "g", open.application("MailPlane"))
hs.hotkey.bind(hyper, "r", open.application("Trello"))
hs.hotkey.bind(hyper, "p", open.application("Pocket"))
hs.hotkey.bind(hyper, "n", function() hs.notify.show("hello", "close me", "this is just a test") end)

Install:andUse("MiroWindowsManager")
hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "f8"},
  right = {hyper, "f19"},
  down = {hyper, "f18"},
  left = {hyper, "f17"},
  fullscreen = {hyper, "f"}
})


hs.spoons.use("FnMate", { config = {
  keys = {
      up = "u",
      down = "e",
      left = "n",
      right = "i",
      scrollUp = "j",
      scrollDown = "k",
      scrollLeft = "l",
      scrollRight = "y"
  },
  scrollStep = 1
}})


-- get bundle id with command: osascript -e 'id of app "Name of App"'
local Chrome="com.google.Chrome"
local Trello="com.atlassian.trello"


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

remapper("f20", {
  q = { '`', true },
  w = { '2', true },
  f = { '[', false },
  p = { ']', false},
  b = { ';', true },
  j = { '`', false },
  l = { '\'', true },
  u = { '\'', false },
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
  m = {'-', false},
  h = {',', true},
  [','] = {'.', true},
  ['.'] = {'/', true},
  ['/'] = {'\\', false}
})


Install:andUse("FadeLogo",
               {
                 config = {
                   default_run = 0.1,
                   run_time = 0.2,
                   fade_out_time = 0.2,
                   zoom_scale_factor = 1.05
                 },
                 start = true
               }
)