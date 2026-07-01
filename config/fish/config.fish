# remove greeting
set -g fish_greeting

# starship
starship init fish | source

# allias
abbr ff fastfetch
alias msty="nohup ~/.local/share/msty/AppRun > /dev/null 2>&1 & disown"

# if
if status is-interactive

# Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx OLLAMA_ORIGINS "https://msty.studio"
