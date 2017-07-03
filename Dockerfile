FROM nixos/nix:1.11

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-env -iA nixos.cmake
RUN nix-env -iA nixos.llvm_34
RUN nix-env -iA nixos.gitAndTools.gitFull
RUN nix-env -iA nixos.llvmPackages.clang-unwrapped
RUN nix-env -iA nixos.boost163

# Location where travis config stored
ENV TRAVIS_CONFIG_PATH /travis
VOLUME /travis

# Generally the current working dir will be used as the repo volume
VOLUME /repo
WORKDIR /repo