require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true
  },
  per_filetype = {
    ["html"] = {
      enable_close = true 
    },
    ["jinja2"] = {  -- Add this
      enable_close = true
    },
    ["jinja"] = {   -- Add this
      enable_close = true
    }
  }
})
