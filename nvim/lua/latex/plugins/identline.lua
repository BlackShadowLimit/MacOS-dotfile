return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        exclude = {
            filetypes = {
                "alpha",
                "mason",
                "lazy",
                "neotree",
                "toggleterminal",
                "dashboard",
            },
        }
    },
}
