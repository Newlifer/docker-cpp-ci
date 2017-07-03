FROM pritunl/archlinux:2017-06-17

RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm sudo base-devel gettext cmake git ninja boost libsodium wget python
RUN pacman -Sy --noconfirm 4.0/clang
RUN pacman -Sy --noconfirm 4.0/llvm
RUN echo "nobody ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN pacman -Sy ccache --noconfirm
RUN (echo "y"; echo "y") | pacman -Scc

# Location where travis config stored
ENV TRAVIS_CONFIG_PATH /travis
VOLUME /travis

# Generally the current working dir will be used as the repo volume
VOLUME /repo
WORKDIR /repo