local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if status_ok then
	vim.g.tokyonight_style = "night"
	vim.g.tokyonight_transparent = true
	vim.cmd([[colorscheme tokyonight]])
end

-- Toggle tokyonight_transparent
function _G.toggle_transparent()
		vim.g.tokyonight_transparent = not vim.g.tokyonight_transparent
		vim.cmd([[colorscheme tokyonight]])
end
