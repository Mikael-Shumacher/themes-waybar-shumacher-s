#!/bin/bash

# Verifica se o bluetooth está ligado
powered=$(bluetoothctl show | grep "Powered: yes")
connected=$(bluetoothctl info | grep "Connected: yes")

if [[ -z "$powered" ]]; then
    # Bluetooth desligado
    icon="󰂲"  # mdi-bluetooth-off
    desc="Bluetooth desligado"
elif [[ -n "$connected" ]]; then
    # Bluetooth ligado e conectado
    icon="󰂱 "  # mdi-bluetooth-connected
    desc="Dispositivo conectado"
else
    # Bluetooth ligado mas não conectado
    icon="󰂯"  # mdi-bluetooth
    desc="Bluetooth ligado"
fi

echo "{\"text\": \"$icon\", \"tooltip\": \"$desc\"}"
