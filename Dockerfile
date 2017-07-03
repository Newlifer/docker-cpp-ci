FROM dock0/full_arch:latest

RUN pacman -Syu --noconfirm gcc boost cmake llvm icu clang gdb valgrind git doxygen wget make tar p7zip zip unzip unrar
RUN pacman -Sc --noconfirm

# Location where travis config stored
ENV TRAVIS_CONFIG_PATH /travis
VOLUME /travis

# Generally the current working dir will be used as the repo volume
VOLUME /repo
WORKDIR /repo