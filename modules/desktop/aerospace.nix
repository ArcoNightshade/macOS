{ settings, ... }:

{
  home-manager.users.${settings.account.name}.xdg.configFile."aerospace/aerospace.toml".text = ''
    after-startup-command = ['exec-and-forget sketchybar', 'exec-and-forget borders active_color=0xffc7adf6 inactive_color=0xff4f60b2 width=5.0' ]

    exec-on-workspace-change = ['/bin/bash', '-c',
      'sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE',
      'exec-and-forget borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=0'
    ]

    start-at-login = true

    enable-normalization-flatten-containers = true
    enable-normalization-opposite-orientation-for-nested-containers = true

    accordion-padding = 300
    default-root-container-layout = 'tiles'
    default-root-container-orientation = 'auto'

    on-focused-monitor-changed = ['move-mouse monitor-lazy-center']
    automatically-unhide-macos-hidden-apps = false

    [[on-window-detected]]
    if.app-name-regex-substring = 'telegram'
    run = 'layout floating'

    [[on-window-detected]]
    if.app-name-regex-substring = 'finder'
    run = 'layout floating'

    [[on-window-detected]]
    if.app-name-regex-substring = 'safari'
    run = 'layout floating'

    [[on-window-detected]]
    if.app-name-regex-substring = 'discord'
    run = 'layout floating'

    [[on-window-detected]]
    if.app-name-regex-substring = 'mail'
    run = 'layout floating'

    [[on-window-detected]]
    if.app-name-regex-substring = 'trello'
    run = 'layout floating'

    [[on-window-detected]]
    if.app-name-regex-substring = 'quicktime'
    run = 'layout floating'

    [key-mapping]
    preset = 'qwerty'

    [gaps]
    inner.horizontal = [{ monitor.main = 15 }, 10]
    outer.left =       [{ monitor.main = 10 }, 20]
    outer.right =      [{ monitor.main = 80 }, 20]
    outer.bottom =     [{ monitor.main = 10 }, 10]
    outer.top =        [{ monitor.main = 10 }, 10]

    [mode.main.binding]
    cmd-enter = 'exec-and-forget open -n -a /Applications/Ghostty.app'

    alt-ctrl-shift-f = 'fullscreen'
    alt-ctrl-f = 'layout floating tiling'

    alt-shift-left = 'join-with left'
    alt-shift-down = 'join-with down'
    alt-shift-up = 'join-with up'
    alt-shift-right = 'join-with right'

    alt-slash = 'layout tiles horizontal vertical'
    alt-comma = 'layout accordion horizontal vertical'

    alt-h = 'focus left'
    alt-j = 'focus down'
    alt-k = 'focus up'
    alt-l = 'focus right'

    alt-shift-h = 'move left'
    alt-shift-j = 'move down'
    alt-shift-k = 'move up'
    alt-shift-l = 'move right'

    alt-shift-minus = 'resize smart -50'
    alt-shift-equal = 'resize smart +50'

    alt-1 = 'workspace 1'
    alt-2 = 'workspace 2'
    alt-3 = 'workspace 3'
    alt-4 = 'workspace 4'

    alt-shift-1 = 'move-node-to-workspace 1 --focus-follows-window'
    alt-shift-2 = 'move-node-to-workspace 2 --focus-follows-window'
    alt-shift-3 = 'move-node-to-workspace 3 --focus-follows-window'
    alt-shift-4 = 'move-node-to-workspace 4 --focus-follows-window'

    alt-tab = 'workspace-back-and-forth'
    alt-shift-tab = 'move-workspace-to-monitor --wrap-around next'

    alt-shift-semicolon = 'mode service'
    alt-shift-enter = 'mode apps'

    alt-o = 'exec-and-forget open -a /Applications/Obsidian.app'
    alt-b = 'exec-and-forget open -a /Applications/Brain.fm.app'
    alt-s = 'exec-and-forget open -a /Applications/Slack.app'
    alt-q = 'exec-and-forget open -a "/System/Applications/QuickTime Player.app"'
    alt-f = 'exec-and-forget open -a /System/Library/CoreServices/Finder.app'
    alt-e = 'exec-and-forget open -a "/Applications/Final Cut Pro.app"'
    alt-z = 'exec-and-forget open -a /Applications/Zen.app'

    [mode.service.binding]
    esc = ['reload-config', 'mode main']
    r = ['flatten-workspace-tree', 'mode main']
    f = ['layout floating tiling', 'mode main']
    backspace = ['close-all-windows-but-current', 'mode main']

    [mode.apps.binding]
    alt-w = ['exec-and-forget open -a /Applications/WezTerm.app', 'mode main']

    [workspace-to-monitor-force-assignment]
    1 = '^Built-in.*$'
    2 = '^DELL U.*$'
    3 = '^DELL S.*$'
  '';
}
