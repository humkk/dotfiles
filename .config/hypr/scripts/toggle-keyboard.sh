#!/bin/bash

STATE_FILE="/tmp/hypr-kb-layout"
CONF="$HOME/.config/hypr/hyprland.conf"

if [ ! -f "$STATE_FILE" ] || [ "$(cat $STATE_FILE)" = "br" ]; then
    sed -i 's/kb_layout = br/kb_layout = us/' "$CONF"
    sed -i 's/kb_variant = abnt2/kb_variant =/' "$CONF"
    sed -i 's/kb_model = abnt2/kb_model =/' "$CONF"
    echo "us" > "$STATE_FILE"
    hyprctl reload
    notify-send -t 2000 "⌨️ Layout: US" "Teclado alterado para inglês (US)"
else
    sed -i 's/kb_layout = us/kb_layout = br/' "$CONF"
    sed -i 's/kb_variant =/kb_variant = abnt2/' "$CONF"
    sed -i 's/kb_model =/kb_model = abnt2/' "$CONF"
    echo "br" > "$STATE_FILE"
    hyprctl reload
    notify-send -t 2000 "⌨️ Layout: PT-BR" "Teclado alterado para português (ABNT2)"
fi