# SECTION: Configuration editing

# NOTE: Required Packages: neovim

alias edit-zsh="cd $HOME && nvim .zshrc"
alias edit-alacritty="cd $HOME/.config/alacritty && nvim alacritty.toml"
alias edit-neovim="cd $HOME/.config/nvim && nvim ."
alias edit-hyprland="cd $HOME/.config/hypr/ && nvim hyprland.conf"
alias edit-nixos="cd $HOME/dezly-system-setups/nixos-setup/nixos-config/\
&& nvim configuration.nix"

#==============================================================================
# SECTION: NixOS Maintanance

alias os="cd /home/dezly-macauley/dezly-system-setups/"

alias nixos-channel-update="sudo nix-channel --update"

alias nixos-tidy="sudo nix-collect-garbage --delete-older-than 3d"

rebuild_nixos_config() {
    latest_nixos_config="$HOME/dezly-system-setups/nixos-setup/nixos-config"

    # Delete the nixos directory
    sudo rm -rf /etc/nixos/*

    # Generate a new nixos directory
    sudo nixos-generate-config

    # Delete the `configuration.nix` file in that directory
    sudo rm /etc/nixos/configuration.nix

    # Copy everything inside the latest_nixos_config to `/etc/nixos`
    sudo cp -r $latest_nixos_config/* /etc/nixos/

    # Rebuild the system
    sudo nixos-rebuild switch
}

rebuild_and_upgrade_nixos_config() {
    latest_nixos_config="$HOME/dezly-system-setups/nixos-setup/nixos-config"

    # Delete the nixos directory
    sudo rm -rf /etc/nixos/*

    # Generate a new nixos directory
    sudo nixos-generate-config

    # Delete the `configuration.nix` file in that directory
    sudo rm /etc/nixos/configuration.nix

    # Copy everything inside the latest_nixos_config to `/etc/nixos`
    sudo cp -r $latest_nixos_config/* /etc/nixos/

    # Rebuild the system
    sudo nixos-rebuild switch --upgrade
}

#==============================================================================
# SECTION: Screen Brightness

# Controls the brightness of your screen
# WARNING: Do NOT set brightnessctl to 0%

alias bright-lowest="brightnessctl set 1%"
alias bright-low="brightnessctl set 25%"
alias bright-mid="brightnessctl set 50%"
alias bright-high="brightnessctl set 75%"
alias bright-max="brightnessctl set 100%"

#==============================================================================
# SECTION: Internet Management
alias wifi-on="nmcli radio wifi on"
alias flight-mode="nmcli radio all off"

#==============================================================================
# SECTION: Zsh commands

alias reload-shell="exec zsh"

clear_shell_history() {
    cat /dev/null > ~/.zsh_history && \
    rm -f ~/.zsh_history && \
    touch ~/.zsh_history && \
    exec zsh
}

disable_shell_history() {
    unset HISTFILE
    export HISTSIZE=0
}

#==============================================================================
# SECTION: Terminal Outputs 

# NOTE: Required Package: tree, acpi

alias date-time='echo "⌚ $(date +"%d %B %Y ( %I:%M:%S %p )")"'

alias ls-tree="tree --gitignore"

alias battery="acpi"
#==============================================================================
# SECTION: Training Labs

alias lab="cd /home/dezly-macauley/dezly-training-labs/"

#______________________________________________________________________________

alias lab-mysql="cd /home/dezly-macauley/dezly-training-labs/\
database-management/mysql/ && zellij"

#______________________________________________________________________________

alias lab-vanillia-html-css="cd /home/dezly-macauley/dezly-training-labs/\
front-end-development/html-css/vanilla-html-css/ && zellij"

alias lab-vanillia-typescript="cd /home/dezly-macauley/dezly-training-labs/\
front-end-development/typescript/vanilla-typescript/ && zellij"

alias lab-react-typescript="cd /home/dezly-macauley/dezly-training-labs/\
front-end-development/typescript/react-typescript/ && zellij"

alias lab-svelte-typescript="cd /home/dezly-macauley/dezly-training-labs/\
front-end-development/typescript/svelte-typescript/ && zellij"

#==============================================================================
# SECTION: Additional Paths

# NOTE: This will allow you to install npm packages locally.
# But first run this command:
# npm set prefix ~/.npm-global

# Now you can use the `npm install -g name_of_package` you want to install.
export PATH=$HOME/.npm-global/bin:$PATH

#==============================================================================
# SECTION: Appearance

# NOTE: Required Packages: lsd (and any nerd font), bat, starship

alias ls="lsd"
# Use this setting below if you prefer a single vertical column
# alias ls="lsd --oneline"

alias cat="bat"

alias zellij="zellij --layout disable-status-bar"

# WARNING: The line below should be the last line in this `.zshrc` file
# This is to ensure that environment variables, 
# paths and other configurations have been loaded first

eval "$(starship init zsh)"

#==============================================================================
