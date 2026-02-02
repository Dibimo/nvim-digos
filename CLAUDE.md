# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration written in Lua, using lazy.nvim as the plugin manager. The configuration is modular, with plugins organized by category and keymaps separated into logical groups.

## Architecture

### Configuration Structure

The main entry point is `init.lua`, which loads configuration modules in this order:
1. Keymaps (`config.keymaps`)
2. Options (`config.options`)
3. Lazy plugin manager (`config.lazy`)
4. Colorscheme (`config.colorscheme`)
5. Additional configurations (spell, aerial, relative-keys)

### Plugin Organization

Plugins are organized into five categories under `lua/plugins/`:

- **ui/**: Visual elements (themes, bufferline, lualine, colors-highlight, render-markdown)
- **editor/**: Editing enhancements (autopairs, comment, surround, autotag, noice, copilot, copilot-chat)
- **coding/**: Code-related tools (treesitter, completion, sqlua, typst)
- **lsp/**: Language Server Protocol setup (lsp.lua, mason-lspconfig.lua, lsp-file-operations.lua)
- **tools/**: Utility plugins (telescope, neo-tree, lazygit, persisted, aerial, flash, gitsings)

Each plugin is defined as a separate Lua file that returns a lazy.nvim plugin spec.

### LSP Configuration

LSP setup follows a specific pattern:

1. **Main LSP config** (`lua/plugins/lsp/lsp.lua`):
   - Sets up nvim-lspconfig with Mason
   - Configures capabilities with cmp-nvim-lsp
   - Uses new `vim.lsp.config()` API for server configuration
   - Defines LspAttach autocmd with standard keymaps
   - Enables servers using `vim.lsp.enable()`

2. **Server-specific configs** (`lua/plugins/lsp/servers/*.lua`):
   - Each language has its own file (lua.lua, javascript.lua, python.lua, etc.)
   - Uses `vim.lsp.config('server_name', {...})` to configure each server
   - Defines root_markers, settings, and filetypes per server

3. **Mason integration** (`lua/plugins/lsp/mason-lspconfig.lua`):
   - Auto-installs LSP servers listed in `ensure_installed`
   - Uses custom Mason registry from Crashdummyy for additional servers

### Keymap Organization

Keymaps are split into logical modules under `lua/config/keymaps/`:

- `init.lua`: Loads all keymap modules, sets mapleader to `<Space>`
- `general.lua`: Basic vim operations (save, clipboard, diagnostics)
- `navigation.lua`: Buffer and window navigation
- `telescope.lua`: Telescope fuzzy finder keymaps
- `neo-tree.lua`: File explorer keymaps
- `sessions.lua`: Session management with persisted.nvim
- `gitsings.lua`: Git integration keymaps
- `spell.lua`: Spell checking keymaps

### Key Technical Details

**Mason Custom Registry**: Uses both official Mason registry and Crashdummyy's registry for additional language servers (configured in both `init.lua` and `mason-lspconfig.lua`).

**Session Management**: Persisted.nvim is configured with a custom branch detection fix for subdirectories, autoload/autosave enabled, and filters to avoid saving plugin buffers.

**Bufferline Git Integration**: Custom integration between bufferline and gitsigns shows git status (added/changed/removed lines and branch name) in the buffer line.

**Treesitter Text Objects**: Extensive text object configuration for functions, classes, and parameters with movement keymaps (`]f`, `[f`, `]c`, `[c`).

**Completion**: nvim-cmp configured with LSP, buffer, path, and snippet sources. Tab/S-Tab for navigation, Enter to confirm.

**Diagnostic Display**: Configured quickfix/location list to auto-close after selecting an item (line 115-135 in lsp.lua).

**Filetype-Specific Settings**:
- C# files use 4 spaces for indentation
- Markdown/text files enable word wrap
- Auto-removes trailing whitespace on save

## Common Commands

### Plugin Management
```vim
:Lazy          " Open lazy.nvim UI
:Lazy sync     " Install, update, and clean plugins
:Mason         " Open Mason UI for LSP/tools management
```

### LSP Operations
```vim
gd             " Go to definition
gD             " Go to declaration
gi             " Go to implementation
gr             " List references
K              " Hover documentation
<C-k>          " Signature help
<leader>rn     " Rename symbol
<leader>ca     " Code actions
<leader>lf     " Format buffer
<leader>d      " Show diagnostic float
```

### File Navigation
```vim
<leader>ff     " Find files (Telescope)
<leader>fg     " Live grep (Telescope)
<leader>fb     " Find buffers (Telescope)
<leader>e      " Toggle Neo-tree file explorer
```

### Session Management
```vim
<leader>ss     " Save session
<leader>sl     " Load session
<leader>sf     " Find sessions (Telescope)
<leader>sd     " Delete session
```

### Git Operations
```vim
<leader>lg     " Open LazyGit
```

### Buffer/Window Navigation
```vim
[b             " Next buffer
]b             " Previous buffer
<leader>c      " Close buffer
<C-h/j/k/l>    " Navigate windows
```

## Important Implementation Notes

1. **New LSP API**: This config uses Neovim's newer `vim.lsp.config()` and `vim.lsp.enable()` APIs (available in Neovim 0.11+), not the older lspconfig `setup()` pattern.

2. **Lazy Loading**: Most plugins are lazy-loaded via events, commands, or keys for faster startup time.

3. **Custom Transparency**: Background transparency configuration is present but commented out (lines 64-84 in options.lua) - designed for Neovide.

4. **Portuguese Keymaps**: Some keymaps use Portuguese keyboard layout (`çç` for save, `jj` for escape).

5. **Session Issues**: Per roadmp.md, there's a known issue with persistence not working correctly.

6. **Disabled Features**: C# LSP (roslyn) is currently disabled (commented out in lsp.lua line 75 and 88).
