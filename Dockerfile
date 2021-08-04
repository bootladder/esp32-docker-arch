from archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S git --noconfirm

WORKDIR /opt
RUN git clone --recursive https://github.com/espressif/esp-idf.git

