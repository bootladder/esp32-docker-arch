from archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S git --noconfirm

WORKDIR /opt
RUN git clone --recursive https://github.com/espressif/esp-idf.git

# from espressif.com docs, "Standard Setup of Toolchain for Linux"
RUN pacman -S --needed gcc git make flex bison gperf python-pip cmake ninja ccache dfu-util libusb --noconfirm

WORKDIR /opt/esp-idf
RUN ./install.sh esp32
RUN ./install.sh esp32
RUN pacman -S which --noconfirm
RUN . ./export.sh

RUN git checkout v4.2.2
RUN git submodule update --init --recursive

