function setVanilla()
    local script = [[
    ignoring application responses
        tell application "System Events"
           click menu bar item "Vanilla" of menu bar 1 of application process "Karabiner-Menu"
        end tell
    end ignoring

    do shell script "killall System\\ Events"
    delay 0.1
    tell application "System Events"
        click menu item "Pimped modifiers" of menu 1 of menu bar item "Vanilla" of menu bar 1 of application process "Karabiner-Menu"
    end tell ]]
    hs.osascript.applescript(script)
end

return {
    setVanilla = setVanilla
}