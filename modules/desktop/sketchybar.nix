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
      source "$ITEM_DIR/calendar.sh"

      sketchybar --update

      echo "sketchybar configuation loaded.."
    '';
  };
}
