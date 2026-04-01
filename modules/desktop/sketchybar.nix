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
        #!/usr/bin/env bash

        FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

        if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
          sketchybar --set space."$1" background.drawing=on
        else
          sketchybar --set space."$1" background.drawing=off
        fi
      '';
    };
  };
}
