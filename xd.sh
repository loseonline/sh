#!/bin/bash

echo "Video açılıyor..."
xdg-open "https://youtu.be/BU98F_amGtQ?si=ZDg-1jrlFNajrB_S"
touch_device=$(xinput list | grep -i "touchscreen\|elan" | awk -F '=' '{print $2}' | awk '{print $1}')

if [ -n "$touch_device" ]; then
    echo "Dokunmatik ekran cihazı bulundu: $touch_device"

    echo "Dokunmatik ekran devre dışı bırakılıyor..."
    xinput disable "$touch_device"

    echo "3 dakika 15 saniye bekleniyor..."
    sleep 195

    echo "Dokunmatik ekran tekrar etkinleştiriliyor..."
    xinput enable "$touch_device"
else
    echo "Dokunmatik ekran cihazı bulunamadı."
fi

echo "İşlem tamamlandı."
