# dotfiles

Personal Arch Linux configuration files.

## Setup

Clone the repo and copy configs:

    git clone https://github.com/humkk/dotfiles.git
    cd dotfiles
    cp -r .config/* ~/.config/
    cp .bashrc ~/.bashrc

## Stack

| Category       | Tool                  |
|----------------|-----------------------|
| WM             | Hyprland              |
| Terminal       | Kitty                 |
| Shell          | Bash                  |
| Editor         | Neovim + Zed          |
| File Manager   | Yazi                  |
| Launcher       | Fuzzel                |
| Fetch          | Fastfetch             |
| Visualizer     | Cava                  |
| System Monitor | Btop                  |
| Theme Engine   | Matugen               |
| Spotify        | Spicetify             |

## Packages

Pacman and AUR package lists are in packages/.

To restore:

    sudo pacman -S --needed - < packages/pacman.txt
    yay -S --needed - < packages/aur.txt

## AUR

brave-bin, cbonsai, peaclock, pipes-rs, protonup-qt,
vesktop, vscodium-bin, yay, zen-browser-bin,
python-inputs, python-steam
