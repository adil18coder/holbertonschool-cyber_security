#!/bin/bash

# Skriptin root (administrator) hüquqları ilə işlədiyini yoxlayaq
if [ "$(id -u)" -ne 0 ]; then
    echo "Bu skript root hüquqları ilə işləməlidir. Zəhmət olmasa, sudo ilə çalışdırın."
    exit 1
fi

# iptables qaydalarını sıralı şəkildə göstərmək
echo "Cari iptables qaydaları:"
iptables -L --line-numbers -n
