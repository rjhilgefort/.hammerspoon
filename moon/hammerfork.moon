commonLaunch = {
    'iterm', 'chrome', 'finder', 'sonos',
    'messages', 'spotify', 'simplify',
    'onePassMini', 'clear', 'sunrise',
    'airmail', 'dash', 'blink',
    'hammerspoon', 'hipChat', 'dropbox',
    'battleNet'
}
commonKill = {
    'systemPrefs', 'onePass',
    'xcode', 'cobook', 'preview'
}

return {

    ---------------------------------------------------------------------------
    -- Layouts
    ---------------------------------------------------------------------------
    layouts: {

        playground: {
            launch: {}
            kill: commonKill
        }

        work: {
            kill: {
                'battleNet', 'hearthstone', 'preview'
            }
        }

        laptop: {
            launch: commonLaunch
            kill: commonKill
        }

        home: {
            launch: commonLaunch
            kill: commonKill
        }

    }


    ---------------------------------------------------------------------------
    -- Apps Lib
    ---------------------------------------------------------------------------
    apps: {
        iterm: 'iTerm'
        chrome: 'Google Chrome'
        finder: 'Finder'
        sonos: 'Sonos'
        messages: 'Messages'
        spotify: 'Spotify'
        simplify: 'Simplify'
        onePass: '1Password'
        onePassMini: '1Password mini'
        clear: 'Clear'
        sunrise: 'Sunrise'
        dash: 'Dash'
        hammerspoon: 'Hammerspoon'
        hipChat: 'HipChat'
        hearthstone: 'Hearthstone'
        dropbox: 'Dropbox'
        iTunes: 'iTunes'
        systemPrefs: 'System Preferences'
        xcode: 'Xcode'
        cobook: 'Cobook'
        blink: 'Blink1Control'
        battleNet: 'Battle.net'
        airmail: { title: 'Airmail Beta', name: 'Airmail' }
        preview: 'Preview'
    }
}
