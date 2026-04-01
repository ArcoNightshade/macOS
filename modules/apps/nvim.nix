{ settings, ... }:

{
  home-manager.users.${settings.account.name}.xdg.configFile = {
    "nvim/init.lua".text = ''
      -- bootstrap lazy.nvim, LazyVim and your plugins
      require("config.lazy")
      vim.g.codeium_platform_override = "mac-arm64"
    '';

    "nvim/stylua.toml".text = ''
      indent_type = "Spaces"
      indent_width = 2
      column_width = 120
    '';

    "nvim/lazyvim.json".text = builtins.toJSON {
      extras = [
        "lazyvim.plugins.extras.coding.mini-surround"
        "lazyvim.plugins.extras.dap.core"
        "lazyvim.plugins.extras.editor.harpoon2"
        "lazyvim.plugins.extras.editor.mini-files"
        "lazyvim.plugins.extras.lang.docker"
        "lazyvim.plugins.extras.lang.go"
        "lazyvim.plugins.extras.lang.helm"
        "lazyvim.plugins.extras.lang.json"
        "lazyvim.plugins.extras.lang.markdown"
        "lazyvim.plugins.extras.lang.terraform"
        "lazyvim.plugins.extras.lang.typescript"
        "lazyvim.plugins.extras.lang.yaml"
      ];
      install_version = 7;
      news = { "NEWS.md" = "10960"; };
      version = 8;
    };

    "nvim/lua/config/lazy.lua".text = ''
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
          vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
          }, true, {})
          vim.fn.getchar()
          os.exit(1)
        end
      end
      vim.opt.rtp:prepend(lazypath)

      require("lazy").setup({
        spec = {
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
          { import = "plugins" },
        },
        defaults = {
          lazy = false,
          version = false,
        },
        install = { colorscheme = { "tokyonight", "habamax" } },
        checker = {
          enabled = true,
          notify = false,
        },
        performance = {
          rtp = {
            disabled_plugins = {
              "gzip",
              "tarPlugin",
              "tohtml",
              "tutor",
              "zipPlugin",
            },
          },
        },
      })
    '';

    "nvim/lua/config/options.lua".text = ''
      -- Options are automatically loaded before lazy.nvim startup
      vim.opt.wrap = true
      vim.g.codeium_os = "Darwin"
      vim.g.codeium_arch = "arm64"
    '';

    "nvim/lua/config/keymaps.lua".text = ''
      -- Keymaps are automatically loaded on the VeryLazy event
      vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
      vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
    '';

    "nvim/lua/config/autocmds.lua".text = ''
      -- Autocmds are automatically loaded on the VeryLazy event
    '';

    "nvim/lua/plugins/conform.lua".text = ''
      return {
        "stevearc/conform.nvim",
        opts = {
          formatters_by_ft = {
            yaml = { "yamlfmt" },
          },
          formatters = {
            yamlfmt = {
              command = "yamlfmt",
              args = { "-formatter", "basic", "-indentless_arrays=true" },
            },
          },
        },
      }
    '';

    "nvim/lua/plugins/go.lua".text = ''
      return {
        {
          "neovim/nvim-lspconfig",
          opts = function(_, opts)
            if not opts.servers then
              opts.servers = {}
            end
            opts.servers.gopls = {
              settings = {
                gopls = {
                  analyses = { unusedparams = true },
                  staticcheck = true,
                  usePlaceholders = true,
                  completeUnimported = true,
                  gofumpt = true,
                },
              },
            }
            return opts
          end,
        },
      }
    '';

    "nvim/lua/plugins/surround.lua".text = ''
      return {
        "echasnovski/mini.surround",
        opts = {
          mappings = {
            add = "sa",
            delete = "sd",
            find = "gsf",
            find_left = "gsF",
            highlight = "gsh",
            replace = "gsr",
            update_n_lines = "gsn",
          },
        },
      }
    '';

    "nvim/lua/plugins/windsurf.lua".text = ''
      return {
        "Exafunction/windsurf.vim",
        event = "BufEnter",
      }
    '';

    "nvim/lua/plugins/opencode.lua".text = ''
      return {
        "NickvanDyke/opencode.nvim",
        dependencies = {
          { "folke/snacks.nvim", opts = { input = { enabled = true } } },
        },
        config = function()
          vim.g.opencode_opts = {}
          vim.opt.autoread = true

          vim.keymap.set("n", "<leader>ot", function() require("opencode").toggle() end, { desc = "Toggle embedded" })
          vim.keymap.set("n", "<leader>oa", function() require("opencode").ask("@cursor: ") end, { desc = "Ask about this" })
          vim.keymap.set("v", "<leader>oa", function() require("opencode").ask("@selection: ") end, { desc = "Ask about selection" })
          vim.keymap.set("n", "<leader>o+", function() require("opencode").prompt("@buffer", { append = true }) end, { desc = "Add buffer to prompt" })
          vim.keymap.set("v", "<leader>o+", function() require("opencode").prompt("@selection", { append = true }) end, { desc = "Add selection to prompt" })
          vim.keymap.set("n", "<leader>oe", function() require("opencode").prompt("Explain @cursor and its context") end, { desc = "Explain this code" })
          vim.keymap.set("n", "<leader>on", function() require("opencode").command("session_new") end, { desc = "New session" })
          vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("messages_half_page_up") end, { desc = "Messages half page up" })
          vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("messages_half_page_down") end, { desc = "Messages half page down" })
          vim.keymap.set({ "n", "v" }, "<leader>os", function() require("opencode").select() end, { desc = "Select prompt" })
        end,
      }
    '';
  };
}
