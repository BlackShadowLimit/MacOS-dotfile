return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
	config = function()
    require('dashboard').setup ({
  	theme = 'doom',
  	config = {
    	header = {
								"",
								"",
								"",
								"",
								"",
                "██████╗  █████╗ ██╗  ██╗███████╗██████╗     ███████╗████████╗",
                "██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗    ██╔════╝╚══██╔══╝",
                "██████╔╝███████║█████╔╝ █████╗  ██████╔╝    ███████╗   ██║   ",
                "██╔══██╗██╔══██║██╔═██╗ ██╔══╝  ██╔══██╗    ╚════██║   ██║   ",
                "██████╔╝██║  ██║██║  ██╗███████╗██║  ██║    ███████║   ██║██╗",
                "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝╚═╝",
								"",
								"",
								"",
								"",
								"",
								"",
								"",
				},
    	center = {
      	{
        	icon = '􀣘 ',
        	icon_hl = 'Title',
        	desc = ' New File...',
        	desc_hl = 'String',
        	key = 'n',
					key_hl = '',
					key_format = '		%s',
					action = "ene | startinsert"
      	},
				{
					icon = '􀉂 ',
					icon_hl = 'Title',
					desc = ' Open File...',
					desc_hl = 'String',
					key = 'o',
					key_hl = '',
					key_format = '		%s',
					action = ":lua require('telescope.builtin').find_files()"

				},
				{
					icon = '􀫿 ',
					icon_hl = 'Title',
					desc = ' Open Recentfile...',
					desc_hl = 'String',
					key = 'r',
					key_hl = '',
					key_format = '		%s',
					action = ":lua vim.cmd('edit ' .. vim.v.oldfiles[1])"
				},
				{
					icon = '􀭥 ',
					icon_hl = 'Title',
					desc = ' Search text',
					desc_hl = 'String',
					key = 's',
					key_hl = '',
					key_format = '		%s',
					action = ":lua require('telescope.builtin').grep_string()"
				},
				{
					icon = '􀍟 ',
					icon_hl = 'Title',
					desc = ' Preference', 
					desc_hl = 'String',
					key = 'c',
					key_hl = '',
					key_format = '		%s',
					action = function() 
						vim.cmd('cd ~/.config/nvim')
						vim.cmd('NvimTreeToggle')
					end
				},
				{
					icon = '􀻵 ',
					icon_hl = 'Title',
					desc = ' Quit',
					desc_hl = 'String',
					key = 'q',
					key_hl = '',
					key_format = '		%s',
					action = "qa"
				},	

    	},
		footer = {}
  	}
	})
  	end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
