local present, telescope = pcall(require, "telescope")

if not present then
  return
end



local options = {
  defaults = {
    path_display={"tail"},
        prompt_prefix = "$ "
  },
  pickers = {
    find_files = {
      -- I don't like having the cwd prefix in my files
      find_command = { "fd", "-g", "--type", "f" },
   }
  },

  extensions = {
        ["zf-native"] = {
            -- options for sorting file-like items
            file = {
                -- override default telescope file sorter
                enable = true,

                -- highlight matching text in results
                highlight_results = true,

                -- enable zf filename match priority
                match_filename = true,
            },

            -- options for sorting all other items
            generic = {
                -- override default telescope generic item sorter
                enable = true,

                -- highlight matching text in results
                highlight_results = true,

                -- disable zf filename match priority
                match_filename = false,
            },
        }
    },
}

telescope.setup(options)

require("telescope").load_extension("zf-native")
