{ pkgs, settings, ... }:

{
  home-manager.users.${settings.account.name}.programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;

    extensions = [
      "nix"
      "toml"
      "elixir"
      "make"
      "haskell"
      "assembly"
      "latex"
    ];

    userSettings = {
      autosave = "on_focus_change";

      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };

      hour_format = "hour24";
      auto_update = false;

      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [ ".env" "env" ".venv" "venv" ];
            activate_script = "default";
          };
        };
        env = {
          TERM = "foot";
        };
        font_family = "FiraCode Nerd Font Mono";
        font_features = {
          calt = true;
          liga = true;
        };
        font_size = null;
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = "system";
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
      };

      lsp = {
        rust-analyzer = {
          binary = {
            path_lookup = true;
          };
        };
        nix = {
          binary = {
            path_lookup = true;
          };
        };
        haskell = {
          binary = {
            path_lookup = true;
          };
        };
      };

      load_direnv = "shell_hook";
      base_keymap = "VSCode";
      theme = {
        mode = "system";
        light = "One Light";
        dark = "Catppuccin Espresso (Blur) [Heavy]";
      };
      buffer_font_family = "FiraCode Nerd Font Mono";
      buffer_font_features = {
        calt = true;
        liga = true;
      };
      show_whitespaces = "all";
      ui_font_size = 16;
      buffer_font_size = 14;
    };
  };
}
