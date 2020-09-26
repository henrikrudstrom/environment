local open = require("open")
require("windowManager")

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
hs.hotkey.bind(hyper, "r", open.application("Trello"))
hs.hotkey.bind(hyper, "p", open.application("Pocket"))
hs.hotkey.bind(hyper, "g", open.application("Gmail Desktop"))
hs.hotkey.bind(hyper, "i", open.application("Todoist"))
hs.hotkey.bind(hyper, ",", function() hs.notify.show("hello", "close me", "this is just a test") end)

hs.spoons.use("FnMate", { config = {
  keys = {
      up = "i",
      down = "k",
      left = "j",
      right = "l",
      scrollUp = "y",
      scrollDown = "h",
      scrollLeft = "u",
      scrollRight = "o"
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