{ settings, ... }:

{
  home-manager.users.${settings.account.name}.xdg.configFile = {
    "sketchybar/colors.sh".text = ''
      #!/usr/bin/env sh

      BLACK=0xff181926
      WHITE=0xffcad3f5
      RED=0xffed8796
      GREEN=0xffa6da95
      BLUE=0xff8aadf4
      YELLOW=0xffeed49f
      ORANGE=0xfff5a97f
      MAGENTA=0xffc6a0f6
      GREY=0xff939ab7
      TRANSPARENT=0x00000000

      BAR_COLOR=0x0a24273a
      ICON_COLOR=$WHITE
      LABEL_COLOR=$WHITE

      POPUP_BACKGROUND_COLOR=$BLACK
      POPUP_BORDER_COLOR=$WHITE

      SHADOW_COLOR=$BLACK

      SPOTIFY_GREEN=$GREEN
    '';

    "sketchybar/icons.sh".text = ''
      #!/usr/bin/env sh

      LOADING=􀖇
      APPLE=􀣺
      PREFERENCES=􀺽
      ACTIVITY=􀒓
      LOCK=􀒳
      MAIL=􀍜
      MAIL_OPEN=􀍜
      BELL=􀋚
      BELL_DOT=􀝗

      GIT_ISSUE=􀍷
      GIT_DISCUSSION=􀒤
      GIT_PULL_REQUEST=􀙡
      GIT_COMMIT=􀡚
      GIT_INDICATOR=􀂓

      SPOTIFY_BACK=􀊎
      SPOTIFY_PLAY_PAUSE=􀊈
      SPOTIFY_NEXT=􀊐
      SPOTIFY_SHUFFLE=􀊝
      SPOTIFY_REPEAT=􀊞

      YABAI_STACK=􀏭
      YABAI_FULLSCREEN_ZOOM=􀏜
      YABAI_PARENT_ZOOM=􀥃
      YABAI_FLOAT=􀢌
      YABAI_GRID=􀧍
    '';

    "sketchybar/sketchybarrc".text = ''
      #!/usr/bin/env sh

      source "$HOME/.config/sketchybar/colors.sh"
      source "$HOME/.config/sketchybar/icons.sh"

      ITEM_DIR="$HOME/.config/sketchybar/items"
      PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

      FONT="SF Pro"
      SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"

      PADDINGS=3

      POPUP_BORDER_WIDTH=2
      POPUP_CORNER_RADIUS=11

      SHADOW=on

      sketchybar --bar     height=50                                         \
                           color=$BAR_COLOR                                  \
                           shadow=$SHADOW                                    \
                           position=right                                     \
                           sticky=on                                         \
                           padding_right=18                                  \
                           padding_left=18                                   \
                           corner_radius=9                                   \
                           y_offset=10                                       \
                           margin=10                                         \
                           blur_radius=20                                    \
                                                                             \
                 --default updates=when_shown                                \
                           icon.font="$FONT:Bold:14.0"                       \
                           icon.color=$ICON_COLOR                            \
                           icon.padding_left=$PADDINGS                       \
                           icon.padding_right=$PADDINGS                      \
                           label.font="$FONT:Semibold:13.0"                  \
                           label.color=$LABEL_COLOR                          \
                           label.padding_left=$PADDINGS                      \
                           label.padding_right=$PADDINGS                     \
                           background.padding_right=$PADDINGS                \
                           background.padding_left=$PADDINGS                 \
                           popup.background.border_width=2                   \
                           popup.background.corner_radius=11                 \
                           popup.background.border_color=$POPUP_BORDER_COLOR \
                           popup.background.color=$POPUP_BACKGROUND_COLOR    \
                           popup.background.shadow.drawing=$SHADOW

      source "$ITEM_DIR/apple.sh"
      source "$ITEM_DIR/spaces.sh"
      source "$ITEM_DIR/aerospace.sh"
      source "$ITEM_DIR/calendar.sh"

      sketchybar --update

      echo "sketchybar configuation loaded.."
    '';

    "sketchybar/items/aerospace.sh".text = ''
      #!/usr/bin/env bash

      sketchybar --add event aerospace_workspace_change
      for sid in $(aerospace list-workspaces --all); do
          sketchybar --add item space."$sid" left \
              --subscribe space."$sid" aerospace_workspace_change \
              --set space."$sid" \
              background.color=0x44ffffff \
              background.corner_radius=5 \
              background.height=20 \
              background.drawing=off \
              label.font.size=14.0 \
              label="$sid" \
              click_script="aerospace workspace $sid" \
              script="$PLUGIN_DIR/aerospacer.sh $sid"
      done
    '';

    "sketchybar/items/apple.sh".text = ''
      #!/usr/bin/env sh

      POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
      POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

      sketchybar --add item           apple.logo left                             \
                                                                                  \
                 --set apple.logo     icon=$APPLE                                 \
                                      icon.font="$FONT:Black:16.0"                \
                                      icon.color=$GREEN                           \
                                      background.padding_right=15                 \
                                      label.drawing=off                           \
                                      click_script="$POPUP_CLICK_SCRIPT"          \
                                                                                  \
                 --add item           apple.prefs popup.apple.logo                \
                 --set apple.prefs    icon=$PREFERENCES                           \
                                      label="Preferences"                         \
                                      click_script="open -a 'System Preferences';
                                                    $POPUP_OFF"                   \
                                                                                  \
                 --add item           apple.activity popup.apple.logo             \
                 --set apple.activity icon=$ACTIVITY                              \
                                      label="Activity"                            \
                                      click_script="open -a 'Activity Monitor';
                                                    $POPUP_OFF"                   \
                                                                                  \
                 --add item           apple.lock popup.apple.logo                 \
                 --set apple.lock     icon=$LOCK                                  \
                                      label="Lock Screen"                         \
                                      click_script="pmset displaysleepnow;
                                                    $POPUP_OFF"
    '';

    "sketchybar/items/calendar.sh".text = ''
      #!/usr/bin/env sh

      sketchybar --add item     calendar right               \
                 --set calendar icon=cal                     \
                                icon.color=$BLACK            \
                                icon.font="$FONT:Black:12.0" \
                                icon.padding_left=5          \
                                icon.padding_right=5         \
                                icon.drawing=off             \
                                label.color=$BLACK           \
                                label.padding_left=5         \
                                label.padding_right=5        \
                                background.color=0xffb8c0e0  \
                                background.height=26         \
                                background.corner_radius=11
    '';

    "sketchybar/items/cpu.sh".text = ''
      #!/usr/bin/env sh

      sketchybar --add item        cpu.top right                  \
                 --set cpu.top     label.font="$FONT:Semibold:7"  \
                                   label=CPU                      \
                                   icon.drawing=off               \
                                   width=15                       \
                                   background.padding_right=23    \
                                   drawing=off                    \
                                                                  \
                 --add item        cpu.percent right              \
                 --set cpu.percent label.font="$FONT:Heavy:12"    \
                                   label=CPU                      \
                                   icon.drawing=off               \
                                   update_freq=2                  \
                                   mach_helper="$HELPER"          \
                                   background.padding_right=20    \
                                                                  \
                 --add graph       cpu.sys right 55               \
                 --set cpu.sys     width=0                        \
                                   graph.color=$RED               \
                                   graph.fill_color=$RED          \
                                   label.drawing=off              \
                                   icon.drawing=off               \
                                   background.padding_right=10    \
                                   background.padding_left=10     \
                                   background.height=30           \
                                   background.drawing=on          \
                                   background.color=$TRANSPARENT  \
                                                                  \
                 --add graph       cpu.user right 55              \
                 --set cpu.user    graph.color=$BLUE              \
                                   label.drawing=off              \
                                   icon.drawing=off               \
                                   background.padding_right=10    \
                                   background.padding_left=10     \
                                   background.height=30           \
                                   background.drawing=on          \
                                   background.color=$TRANSPARENT
    '';

    "sketchybar/items/spaces.sh".text = ''
      #!/usr/bin/env sh

      sketchybar --add event aerospace_workspace_change
      RED=0xffed8796
      for sid in $(aerospace list-workspaces --all); do
          sketchybar --add item "space.$sid" left                          \
              --subscribe "space.$sid" aerospace_workspace_change          \
              --set "space.$sid"                                           \
              icon="$sid"                                                  \
              icon.padding_left=22                                         \
              icon.padding_right=22                                        \
              label.padding_right=33                                       \
              icon.highlight_color=$RED                                    \
              background.color=0x44ffffff                                  \
              background.corner_radius=5                                   \
              background.height=30                                         \
              background.drawing=off                                       \
              label.font="sketchybar-app-font:Regular:16.0"                \
              label.background.height=30                                   \
              label.background.drawing=on                                  \
              label.background.color=0xff494d64                            \
              label.background.corner_radius=9                             \
              label.drawing=off                                            \
              click_script="aerospace workspace $sid"                      \
              script="$PLUGIN_DIR/aerospacer.sh $sid"
      done

      sketchybar --add item      separator left                            \
                 --set separator icon=                                    \
                                  icon.font="Hack Nerd Font:Regular:16.0" \
                                  background.padding_left=15              \
                                  background.padding_right=15             \
                                  label.drawing=off                       \
                                  associated_display=active               \
                                  icon.color=$WHITE
    '';

    "sketchybar/plugins/aerospacer.sh" = {
      executable = true;
      text = ''
        #!/bin/bash

        echo "called with $1"
        echo "$FOCUSED_WORKSPACE"

        if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
            sketchybar --set $NAME background.drawing=on
        else
            sketchybar --set $NAME background.drawing=off
        fi
      '';
    };

    "sketchybar/plugins/icon_map.sh" = {
      executable = true;
      text = ''
        case "$1" in
        "Brave Browser")
          icon_result=":brave_browser:"
          ;;
        "Keyboard Maestro")
          icon_result=":keyboard_maestro:"
          ;;
        "Min")
          icon_result=":min_browser:"
          ;;
        "Final Cut Pro")
          icon_result=":final_cut_pro:"
          ;;
        "FaceTime")
          icon_result=":face_time:"
          ;;
        "Affinity Publisher")
          icon_result=":affinity_publisher:"
          ;;
        "Messages" | "Nachrichten")
          icon_result=":messages:"
          ;;
        "Tweetbot" | "Twitter")
          icon_result=":twitter:"
          ;;
        "ClickUp")
          icon_result=":click_up:"
          ;;
        "KeePassXC")
          icon_result=":kee_pass_x_c:"
          ;;
        "Microsoft Edge")
          icon_result=":microsoft_edge:"
          ;;
        "VLC")
          icon_result=":vlc:"
          ;;
        "Emacs")
          icon_result=":emacs:"
          ;;
        "Thunderbird")
          icon_result=":thunderbird:"
          ;;
        "Notes")
          icon_result=":notes:"
          ;;
        "Caprine")
          icon_result=":caprine:"
          ;;
        "Zulip")
          icon_result=":zulip:"
          ;;
        "Spark")
          icon_result=":spark:"
          ;;
        "Microsoft To Do" | "Things")
          icon_result=":things:"
          ;;
        "DEVONthink 3")
          icon_result=":devonthink3:"
          ;;
        "GitHub Desktop")
          icon_result=":git_hub:"
          ;;
        "App Store")
          icon_result=":app_store:"
          ;;
        "Chromium" | "Google Chrome" | "Google Chrome Canary")
          icon_result=":google_chrome:"
          ;;
        "zoom.us")
          icon_result=":zoom:"
          ;;
        "MoneyMoney")
          icon_result=":bank:"
          ;;
        "Color Picker")
          icon_result=":color_picker:"
          ;;
        "Microsoft Word")
          icon_result=":microsoft_word:"
          ;;
        "Iris")
          icon_result=":iris:"
          ;;
        "WebStorm")
          icon_result=":web_storm:"
          ;;
        "Neovide" | "MacVim" | "Vim" | "VimR")
          icon_result=":vim:"
          ;;
        "Sublime Text")
          icon_result=":sublime_text:"
          ;;
        "PomoDone App")
          icon_result=":pomodone:"
          ;;
        "Setapp")
          icon_result=":setapp:"
          ;;
        "qutebrowser")
          icon_result=":qute_browser:"
          ;;
        "Mattermost")
          icon_result=":mattermost:"
          ;;
        "Notability")
          icon_result=":notability:"
          ;;
        "WhatsApp")
          icon_result=":whats_app:"
          ;;
        "OBS")
          icon_result=":obsstudio:"
          ;;
        "Parallels Desktop")
          icon_result=":parallels:"
          ;;
        "VMware Fusion")
          icon_result=":vmware_fusion:"
          ;;
        "Pine")
          icon_result=":pine:"
          ;;
        "Microsoft Excel")
          icon_result=":microsoft_excel:"
          ;;
        "Microsoft PowerPoint")
          icon_result=":microsoft_power_point:"
          ;;
        "Matlab")
          icon_result=":matlab:"
          ;;
        "Numbers")
          icon_result=":numbers:"
          ;;
        "Default")
          icon_result=":default:"
          ;;
        "Element")
          icon_result=":element:"
          ;;
        "Bear")
          icon_result=":bear:"
          ;;
        "TeamSpeak 3")
          icon_result=":team_speak:"
          ;;
        "Airmail")
          icon_result=":airmail:"
          ;;
        "Firefox Developer Edition" | "Firefox Nightly")
          icon_result=":firefox_developer_edition:"
          ;;
        "Trello")
          icon_result=":trello:"
          ;;
        "TickTick")
          icon_result=":tick_tick:"
          ;;
        "Notion")
          icon_result=":notion:"
          ;;
        "Live")
          icon_result=":ableton:"
          ;;
        "Evernote Legacy")
          icon_result=":evernote_legacy:"
          ;;
        "Calendar" | "Fantastical")
          icon_result=":calendar:"
          ;;
        "Android Studio")
          icon_result=":android_studio:"
          ;;
        "Xcode")
          icon_result=":xcode:"
          ;;
        "Slack")
          icon_result=":slack:"
          ;;
        "Sequel Pro")
          icon_result=":sequel_pro:"
          ;;
        "Bitwarden")
          icon_result=":bit_warden:"
          ;;
        "System Preferences")
          icon_result=":gear:"
          ;;
        "Discord" | "Discord Canary" | "Discord PTB")
          icon_result=":discord:"
          ;;
        "Vivaldi")
          icon_result=":vivaldi:"
          ;;
        "Firefox")
          icon_result=":firefox:"
          ;;
        "Skype")
          icon_result=":skype:"
          ;;
        "Dropbox")
          icon_result=":dropbox:"
          ;;
        "微信")
          icon_result=":wechat:"
          ;;
        "Typora")
          icon_result=":text:"
          ;;
        "Blender")
          icon_result=":blender:"
          ;;
        "Canary Mail" | "HEY" | "Mail" | "Mailspring" | "MailMate" | "邮件")
          icon_result=":mail:"
          ;;
        "Safari" | "Safari Technology Preview")
          icon_result=":safari:"
          ;;
        "Telegram")
          icon_result=":telegram:"
          ;;
        "Keynote")
          icon_result=":keynote:"
          ;;
        "Reeder")
          icon_result=":reeder5:"
          ;;
        "Spotify")
          icon_result=":spotify:"
          ;;
        "MAMP" | "MAMP PRO")
          icon_result=":mamp:"
          ;;
        "Figma")
          icon_result=":figma:"
          ;;
        "Joplin")
          icon_result=":joplin:"
          ;;
        "Spotlight")
          icon_result=":spotlight:"
          ;;
        "Music")
          icon_result=":music:"
          ;;
        "Insomnia")
          icon_result=":insomnia:"
          ;;
        "TIDAL")
          icon_result=":tidal:"
          ;;
        "Alfred")
          icon_result=":alfred:"
          ;;
        "Pages")
          icon_result=":pages:"
          ;;
        "Folx")
          icon_result=":folx:"
          ;;
        "Android Messages")
          icon_result=":android_messages:"
          ;;
        "mpv")
          icon_result=":mpv:"
          ;;
        "网易云音乐")
          icon_result=":netease_music:"
          ;;
        "Transmit")
          icon_result=":transmit:"
          ;;
        "Pi-hole Remote")
          icon_result=":pihole:"
          ;;
        "Nova")
          icon_result=":nova:"
          ;;
        "Affinity Designer")
          icon_result=":affinity_designer:"
          ;;
        "IntelliJ IDEA")
          icon_result=":idea:"
          ;;
        "Drafts")
          icon_result=":drafts:"
          ;;
        "Audacity")
          icon_result=":audacity:"
          ;;
        "Affinity Photo")
          icon_result=":affinity_photo:"
          ;;
        "Atom")
          icon_result=":atom:"
          ;;
        "Obsidian")
          icon_result=":obsidian:"
          ;;
        "CleanMyMac X")
          icon_result=":desktop:"
          ;;
        "Zotero")
          icon_result=":zotero:"
          ;;
        "Todoist")
          icon_result=":todoist:"
          ;;
        "LibreWolf")
          icon_result=":libre_wolf:"
          ;;
        "Grammarly Editor")
          icon_result=":grammarly:"
          ;;
        "OmniFocus")
          icon_result=":omni_focus:"
          ;;
        "Reminders")
          icon_result=":reminders:"
          ;;
        "Preview" | "Skim" | "zathura")
          icon_result=":pdf:"
          ;;
        "1Password 7")
          icon_result=":one_password:"
          ;;
        "Code" | "Code - Insiders")
          icon_result=":code:"
          ;;
        "VSCodium")
          icon_result=":vscodium:"
          ;;
        "Tower")
          icon_result=":tower:"
          ;;
        "Calibre")
          icon_result=":book:"
          ;;
        "Finder" | "访达")
          icon_result=":finder:"
          ;;
        "Linear")
          icon_result=":linear:"
          ;;
        "League of Legends")
          icon_result=":league_of_legends:"
          ;;
        "Zeplin")
          icon_result=":zeplin:"
          ;;
        "Signal")
          icon_result=":signal:"
          ;;
        "Podcasts")
          icon_result=":podcasts:"
          ;;
        "Alacritty" | "Hyper" | "iTerm2" | "kitty" | "Terminal" | "WezTerm")
          icon_result=":terminal:"
          ;;
        "Tor Browser")
          icon_result=":tor_browser:"
          ;;
        "Kakoune")
          icon_result=":kakoune:"
          ;;
        "GrandTotal" | "Receipts")
          icon_result=":dollar:"
          ;;
        "Sketch")
          icon_result=":sketch:"
          ;;
        "Sequel Ace")
          icon_result=":sequel_ace:"
          ;;
        *)
          icon_result=":default:"
          ;;
        esac
        echo $icon_result
      '';
    };

    "sketchybar/plugins/zen.sh" = {
      executable = true;
      text = ''
        #!/bin/sh

        if [ $1 = "on" ]; then
          sketchybar --set github.bell drawing=off \
                     --set apple.logo drawing=off \
                     --set '/cpu.*/' drawing=off \
                     --set calendar icon.drawing=off \
                     --set system.yabai drawing=off \
                     --set separator drawing=off \
                     --set front_app drawing=off \
                     --set spotify.play updates=off \
                     --set spotify.title drawing=off \
                     --set spotify.artist drawing=off
        else
          sketchybar --set github.bell drawing=on \
                     --set apple.logo drawing=on \
                     --set '/cpu.*/' drawing=on \
                     --set calendar icon.drawing=on \
                     --set separator drawing=on \
                     --set front_app drawing=on \
                     --set system.yabai drawing=on \
                     --set spotify.play updates=on
        fi
      '';
    };
  };
}
