

function application(name)
    return function()
        print("open", name)
        if not hs.application.launchOrFocus(name) then
          hs.application.launchOrFocusByBundleID(name)
        end
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end
function tabNamed(name)
  return function()
        hs.osascript.javascript([[
            // below is javascript code
            var chrome = Application('Google Chrome');
            //chrome.activate();
            var wins = chrome.windows;

            // loop tabs to find a web page with a title of <name>
            function main() {
                for (var i = 0; i < wins.length; i++) {
                    var win = wins.at(i);
                    var tabs = win.tabs;
                    for (var j = 0; j < tabs.length; j++) {
                    var tab = tabs.at(j);
                    tab.title(); j;
                    if (tab.title().indexOf(']] .. name .. [[') > -1) {
                            //win.focus();
                            win.activeTabIndex = j + 1;
                            return;
                        }
                    }
                }
            }
            main();
            // end of javascript
        ]])
    end
end
return {
    application = application,
    tabNamed = tabName
}