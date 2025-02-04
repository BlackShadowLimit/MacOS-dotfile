return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-tree/nvim-web-devicons", -- Ensure this is installed
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local devicons = require("nvim-web-devicons") -- For file icons

      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            preview_cutoff = 6,
            width = 0.8,
            height = 0.9,
            preview_height = 0.6,
            -- Remove results_height as it is not supported by the vertical layout strategy
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-r>"] = require("telescope._extensions.file_browser.actions").rename, -- Add rename keybinding here
            },
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                ["<C-d>"] = require("telescope._extensions.file_browser.actions").remove,
                ["<C-n>"] = require("telescope._extensions.file_browser.actions").create,
                ["<C-r>"] = require("telescope._extensions.file_browser.actions").rename, -- Add rename keybinding here as well
              },
            },
            -- Customize the file display format to remove permissions and size
            display = function(entry)
              local filename = entry.name
              local filetype = vim.fn.fnamemodify(filename, ":e") -- Get the file extension as filetype
              local icon = devicons.get_icon(filename, filetype) or "" -- Get file icon using nvim-web-devicons
              local last_modified = os.date("%Y-%m-%d", vim.fn.getftime(entry.path)) -- Get last modified date

              -- Only display the file icon, filename, and last modified date, remove permissions and size
              return string.format("%s %-40s %s", icon, filename, last_modified)
            end,
          },
          project = {
            base_dirs = { "~/projects" },
            hidden_files = true,
          },
        },
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("project")

      vim.api.nvim_set_keymap(
        "n",
        "<leader>e",
        ":Telescope file_browser<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
