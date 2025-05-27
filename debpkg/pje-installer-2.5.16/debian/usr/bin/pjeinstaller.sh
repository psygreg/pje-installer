#!/bin/bash

# installation
pje_in () {

    wget https://pje-office.pje.jus.br/pro/pjeoffice-pro-v2.5.16u-linux_x64.zip
    wget -O PJEOfficePro.desktop https://raw.githubusercontent.com/psygreg/pjeoffice-installer/refs/heads/main/usr/share/applications/PJEOfficePro.desktop
    wget -O pjeoffice-pro.png https://raw.githubusercontent.com/psygreg/pjeoffice-installer/refs/heads/main/pjeoffice-pro.png
    unzip pjeoffice-pro-v2.5.16u-linux_x64.zip
    sudo rsync -a pjeoffice-pro /opt
    sudo cp pjeoffice-pro.png /opt/pjeoffice-pro
    sudo cp PJEOfficePro.desktop /usr/share/applications
    sudo chmod +x /opt/pjeoffice-pro/pjeoffice-pro.sh
    rm -rf pjeoffice-pro
    rm pjeoffice-pro-v2.5.16u-linux_x64.zip
    rm pjeoffice-pro.png
    rm PJEOfficePro.desktop

}

#removal
pje_rm () {

    sudo rm -rf /opt/pjeoffice-pro
    sudo rm /usr/share/applications/PJEOfficePro.desktop

}

# menu
while :; do

    CHOICE=$(whiptail --title "PJEOffice Pro" --menu "O que deseja fazer?" 25 78 16 \
        "0" "Instalar PJEOffice Pro" \
        "1" "Remover PJEOffice Pro" \
        "2" "Sair" 3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus != 0 ]; then
        # Exit the script if the user presses Esc
        break
    fi

    case $CHOICE in
    0) pje_in ;;
    1) pje_rm ;;
    2 | q) break ;;
    *) echo "Invalid Option" ;;
    esac
done
