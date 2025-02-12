return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope._extensions.file_browser.actions")

      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            preview_cutoff = 6,
            width = 0.8,
            height = 0.9,
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-r>"] = fb_actions.rename,
            },
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            hidden = true, -- 顯示 dotfiles
            mappings = {
              ["i"] = {
                ["<C-d>"] = fb_actions.remove,
                ["<C-n>"] = fb_actions.create,
                ["<C-r>"] = fb_actions.rename,
              },
            },
          },
          project = {
            base_dirs = { "~/projects" },
            hidden_files = true,
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },
        },
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("project")
      telescope.load_extension("ui-select")

      -- 設定自動變更 `cwd` 的 Autocmd
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          local bufname = vim.api.nvim_buf_get_name(0) -- 獲取當前打開的檔案路徑
          if bufname ~= "" then
            local dir = vim.fn.fnamemodify(bufname, ":h") -- 獲取該檔案的目錄
            vim.cmd("cd " .. vim.fn.fnameescape(dir)) -- 變更工作目錄
          end
        end,
      })

      -- 設定快捷鍵
      vim.api.nvim_set_keymap(
        "n",
        "<leader>e",
        ":Telescope file_browser<CR>",
        { noremap = true, silent = true }
      )

      vim.api.nvim_set_keymap(
        "n",
        "<leader>s",
        ":Telescope grep_string<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
