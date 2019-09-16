--- === FnMate ===
---
--- Use Fn + `h/l/j/k` as arrow keys, `y/u/i/o` as mouse wheel, `,/.` as left/right click.
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/FnMate.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/FnMate.spoon.zip)

local obj={}
obj.__index = obj

-- Metadata
obj.name = "FnMate"
obj.version = "1.0"
obj.author = "ashfinal <ashfinal@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.keys = {
    up = "i",
    down = "k",
    left = "j",
    right = "l",
    scrollUp = "y",
    scrollDown = "h",
    scrollLeft = "u",
    scrollRight = "o"
}
obj.scrollStep = 1

function obj:init()
    local function isDown(event)
        return hs.eventtap.event.types.keyDown == event:getType()
    end

    local function isKeyWithFn(event, key, down)
        local downIfRequired = down and isDown(event) or true

        return event:getFlags()['fn'] and string.lower(event:getCharacters(true)) == key and downIfRequired
    end

    local function sendKeyEventWithoutFn(event, key)
        local flags = event:getFlags()
        flags['fn'] = nil

        local modifiers={}
        local n=0

        for k,v in pairs(flags) do
            n=n+1
            modifiers[n]=k
        end

        return true, {hs.eventtap.event.newKeyEvent(modifiers, key, isDown(event))}
    end
    local function catcher(event)
        if isKeyWithFn(event, obj.keys.left) then
            return sendKeyEventWithoutFn(event, "left")
        elseif isKeyWithFn(event, obj.keys.right) then
            return sendKeyEventWithoutFn(event, "right")
        elseif isKeyWithFn(event, obj.keys.down) then
            return sendKeyEventWithoutFn(event, "down")
        elseif isKeyWithFn(event, obj.keys.up) then
            return sendKeyEventWithoutFn(event, "up")
        elseif isKeyWithFn(event, obj.keys.scrollLeft, true) then
            return true, {hs.eventtap.event.newScrollEvent({obj.scrollStep, 0}, {}, "line")}
        elseif isKeyWithFn(event, obj.keys.scrollRight, true) then
            return true, {hs.eventtap.event.newScrollEvent({-obj.scrollStep, 0}, {}, "line")}
        elseif isKeyWithFn(event, obj.keys.scrollDown, true) then
            return true, {hs.eventtap.event.newScrollEvent({0, -obj.scrollStep}, {}, "line")}
        elseif isKeyWithFn(event, obj.keys.scrollUp, true) then
            return true, {hs.eventtap.event.newScrollEvent({0, obj.scrollStep}, {}, "line")}
        end
    end
    print("Initializing fn arrow keys")
    fn_tapper = hs.eventtap.new({hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp}, catcher):start()
end

return obj
