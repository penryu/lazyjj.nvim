local M = {}

local Mjj = vim.lazyjj or require('lazyjj')
local health = vim.health or require('health')

function M.check()
	-- Start health check
	health.start('lazyjj.nvim')

	-- Check for required plugins
	if pcall(require, 'plenary') then
		health.ok('plenary.nvim installed')
	else
		health.error('plenary.nvim not installed', {
			'Install plenary.nvim',
			'https://github.com/nvim-lua/plenary.nvim',
		})
	end

	local cmd = Mjj.config.cmd

	-- Check for lazyjj executable
	if vim.fn.executable(cmd) == 1 then
		health.ok(cmd .. ' executable found in PATH')
	else
		health.error(cmd .. ' executable not found', {
			'Install ' .. cmd,
			'Ensure ' .. cmd .. ' is in your PATH',
		})
	end
end

return M
