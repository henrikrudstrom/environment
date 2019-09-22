local function isDown(event)
    return hs.eventtap.event.types.keyDown == event:getType()
end

function init(toggleKey, symbolMap)
    local mapEnabled = false
    function remapSymbols(remap, event)
    local mapping = symbolMap[event:getCharacters()]
    if mapping ~= nil then
        local flags = event:getFlags()
        if mapping[2] and flags['shift'] == nil then
        table.insert(flags, 'shift')
        end
        return true, {hs.eventtap.event.newKeyEvent(flags, mapping[1], isDown(event))}
    end
    return false, event
    end

    function processKeys(event)
        if event:getKeyCode() == hs.keycodes.map[toggleKey] then
            mapEnabled = isDown(event)
            return true
        end
        local res = false
        if mapEnabled then
        res, event = remapSymbols(res, event)
        end
        if res then
        return res, event
        end
        return false
    end
    local tap = hs.eventtap.new({hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp}, processKeys):start()
end

return init