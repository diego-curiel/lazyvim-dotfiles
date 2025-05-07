return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion = {
        ghost_text = { enabled = false },
        menu = {
          auto_show = function(_)
            -- Get the cursor position
            local row, column = unpack(vim.api.nvim_win_get_cursor(0))
            -- Get treesitter node
            local success, node = pcall(vim.treesitter.get_node, {
              pos = { row - 1, math.max(0, column - 1) },
              ignore_injections = false,
            })
            -- Types of nodes that will be rejected in autocomplete
            local reject_node_types = {
              "comment",
              "line_comment",
              "block_comment",
              "string_start",
              "string_content",
              "string_end",
            }
            -- Types of files that will be rejected in autocomplete
            local reject_file_types = {
              "markdown",
              "text",
            }
            -- if the node type is in the rejected types table, then return false
            if success and node and vim.tbl_contains(reject_node_types, node:type()) then
              return false
            end
            -- if the file type is in the rejected types table, then return false
            if vim.tbl_contains(reject_file_types, vim.bo.filetype) then
              return false
            end
            return true
          end,
        },
      }
    end,
  },
}
