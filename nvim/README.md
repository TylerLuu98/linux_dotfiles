# Neovim Configuration

This repository contains my personal Neovim configuration files, designed to create a powerful, efficient, and customizable editing environment.

## Structure

- `init.lua`: Main configuration file that loads all modules
- `lua/`: Directory containing configuration modules:
  - `plugins.lua`: Plugin management with lazy.nvim
  - `keymaps.lua`: Custom keybindings
  - `options.lua`: Neovim general settings
  - `autocmds.lua`: Autocommands for various events
  - Other module files for specific plugins and functionality

## Features

- Modern plugin management with lazy.nvim
- LSP (Language Server Protocol) integration
- Code completion and snippets
- Fuzzy finding capabilities
- Git integration
- Syntax highlighting and treesitter support
- Custom themes and status line
- File navigation and management
- Terminal integration

## Installation

1. Clone this repository to your Neovim configuration directory:

   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.config/dotfiles
   ```

2. Make sure to link the nvim directory to your Neovim config location:

   ```bash
   ln -s ~/.config/dotfiles/nvim ~/.config/nvim
   ```

3. Start Neovim, and plugins will be automatically installed on the first run:
   ```bash
   nvim
   ```

## Dependencies

- Neovim (0.8.0 or later recommended)
- git
- A Nerd Font (for icons)
- npm/node (for many LSP servers)
- Additional language-specific tools depending on your development needs

## Customization

This configuration is designed to be modular. To customize:

1. Edit the specific module files in `lua/` directory
2. Add new plugins in `lua/plugins.lua`
3. Change keymappings in `lua/keymaps.lua`
4. Modify general options in `lua/options.lua`

## Key Bindings

| Key Binding  | Description            |
| ------------ | ---------------------- |
| `<Space>`    | Leader key             |
| `<Leader>ff` | Find files             |
| `<Leader>fg` | Live grep              |
| `<Leader>fb` | Browse buffers         |
| `<Leader>e`  | Open file explorer     |
| `gd`         | Go to definition       |
| `K`          | Show hover information |

For a complete list of keybindings, refer to `lua/keymaps.lua`.

## License

MIT

---

Feel free to fork and adapt this configuration to your needs!
