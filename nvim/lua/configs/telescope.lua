local actions = require "telescope.actions"

require("telescope").setup {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
          ["<C-x>"] = actions.delete_buffer,
        }
      }
    }
  }
}
