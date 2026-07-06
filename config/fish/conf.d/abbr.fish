status is-interactive; or return

# Abbrs (expand inline, show real command in history)
abbr ff fastfetch
abbr cl tty-clock -c

# Aliases (need real shell logic, can't be plain abbrs)
alias msty="nohup ~/.local/share/msty/AppRun > /dev/null 2>&1 & disown"
