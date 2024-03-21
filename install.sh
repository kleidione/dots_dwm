#!/bin/bash

# Ativa a interrupção em caso de erro
set -e
trap 'echo "Erro na execução do script. Verifique as permissões e pacotes necessários."; exit 1' ERR

# Registro de log
LOG_FILE="instalacao_log.txt"
echo "Início da instalação: $(date)" >> $LOG_FILE

# Atualiza o sistema antes de instalar pacotes
echo "Atualizando o sistema..."
sudo pacman -Syu --noconfirm

# Instala o Xorg e ferramentas essenciais
echo "Instalando o Xorg e ferramentas essenciais..." | tee -a $LOG_FILE
sudo pacman -S --noconfirm xorg-server xorg-xinit xorg-xkill xorg-xsetroot xorg-xrandr

# Instala aplicações gerais
echo "Instalando aplicativos..." | tee -a $LOG_FILE
sudo pacman -S --noconfirm wget git curl p7zip engrampa ntfs-3g hdparm mtools dosfstools cups cpio the_silver_searcher gvfs gvfs-mtp xdg-user-dirs xdg-utils thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler nano pluma ristretto xfce4-screenshooter xfce4-terminal neofetch dmenu hsetroot xcompmgr numlockx pywal firefox-i18n-pt-br polkit-gnome lxappearance vlc qbittorrent

# Cria diretórios necessários caso não existam
echo "Criando diretórios de configuração..."
mkdir -p ~/.config ~/.scripts

# Copia arquivos e configurações
echo "Copiando arquivos e configurações..."
cp -R {Wallpapers,.config,.scripts,.xinitrc,.bashrc,.Xresources} ~/

# Instala temas Vimix
echo "Instalando temas Vimix..." | tee -a $LOG_FILE
sudo cp -R {vimix,vimix-dark} /usr/share/themes/

# Configuração do Xorg
echo "Copiando configurações do Xorg..." | tee -a $LOG_FILE
sudo cp -R xorg.conf.d /etc/X11/

# Instala e compila o DWM
echo "Compilando e instalando o DWM..." | tee -a $LOG_FILE
sudo cp -R dwm /usr/src/ ; cd /usr/src/dwm/ && sudo make clean install

# Baixa e instala o tema de ícones Papirus
echo "Instalando tema de ícones Papirus..." | tee -a $LOG_FILE
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | sudo sh
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/install.sh | sudo sh

# Altera a cor das pastas do Papirus para marrom
echo "Alterando cor das pastas do Papirus para marrom..." | tee -a $LOG_FILE
sudo papirus-folders --color brown

# Finaliza o script
echo "Configuração concluída com sucesso!" | tee -a $LOG_FILE
exit
