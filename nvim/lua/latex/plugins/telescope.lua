return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neo-tree/neo-tree.nvim" },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        telescope.setup({
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    preview_height = 0.6,
                    mirror = false,
                },
            },
        })

        local function select_directory_and_open()
            local initial_cwd = vim.fn.expand("%:p:h")
            local current_cwd = initial_cwd

            builtin.find_files({
                prompt_title = "選擇資料夾",
                cwd = current_cwd,
                find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git", "--absolute-path" },

                on_input_filter_cb = function(prompt)
                    local new_cwd = prompt:match("^~") and vim.fn.expand("~") or initial_cwd

                    if new_cwd ~= current_cwd then
                        current_cwd = new_cwd
                        vim.defer_fn(function()
                            builtin.find_files({
                                prompt_title = "選擇資料夾",
                                cwd = current_cwd,
                                find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git", "--absolute-path" },
                            })
                        end, 100)
                    end
                end,

                attach_mappings = function(prompt_bufnr, map)
                    map("i", "<CR>", function()
                        local selection = action_state.get_selected_entry()
                        if selection then
                            actions.close(prompt_bufnr)
                            vim.cmd("Neotree reveal dir=" .. selection.value)
                        end
                    end)
                    return true
                end,
            })
        end

        vim.api.nvim_create_user_command("OpenFolder", select_directory_and_open, { desc = "選擇當前目錄下的資料夾並開啟 NeoTree" })
    end
}
