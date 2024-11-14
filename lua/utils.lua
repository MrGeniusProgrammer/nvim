local M = {}

-- Create a custom list and picker
M.pick_from_list = function(prompt_title, results, on_select)
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local finders = require("telescope.finders")
	local pickers = require("telescope.pickers")
	local sorters = require("telescope.sorters")

	pickers
		.new({}, {
			prompt_title = prompt_title,
			finder = finders.new_table({
				results = results,
			}),
			sorter = sorters.get_generic_fuzzy_sorter(), -- sorting method

			attach_mappings = function(prompt_bufnr, map)
				-- On selecting an item, run the following action
				local function on_primitive_select()
					local selection = action_state.get_selected_entry()
					on_select(selection[1])
					actions.close(prompt_bufnr) -- Close the picker window
				end

				-- Define the keybindings, for example, pressing <CR> to select
				map("i", "<CR>", on_primitive_select)
				map("n", "<CR>", on_primitive_select)

				return true
			end,
		})
		:find()
end

return M
