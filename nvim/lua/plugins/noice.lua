return {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- add any options here
        routes = {
          {
            filter = {
              event = 'msg_show',
              any = {
                { find = '%d+L, %d+B' },
                { find = '; after #%d+' },
                { find = '; before #%d+' },
                { find = '%d fewer lines' },
                { find = '%d more lines' },
              },
            },
            opts = { skip = true },
          }
        },
        presets = {
          command_palette = true, -- 讓 :cmd 彈出選單
        },
      })

      -- 如果已經安裝 telescope-ui-select，則讓 Noice 使用它
      require("telescope").load_extension("ui-select")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "nvim-telescope/telescope.nvim", -- 確保 Telescope 安裝
      "nvim-telescope/telescope-ui-select.nvim", -- 讓 Noice 使用 Telescope UI
    }
}
