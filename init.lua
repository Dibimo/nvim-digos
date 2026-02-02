require("config.keymaps")
require("config.options")
require("config.lazy")
require("config.colorscheme")
require("config.spell")
require("config.aerial")
require("config.relative-keys")

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

