local colorscheme = "tokyonight-night"

-- if the colorscheme is not installed it will not cause an error
local status_ok, _ = pcall(vim.cmd,"colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
