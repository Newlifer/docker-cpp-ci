FROM nixos/nix:1.11

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable
RUN nix-channel --update

RUN nix-env -iA cmake
RUN nix-env -iA llvm_34
RUN nix-env -iA gitAndTools.gitFull
RUN nix-env -iA llvmPackages.clang-unwrapped
RUN nix-env -iA boost163

# Location where travis config stored
ENV TRAVIS_CONFIG_PATH /travis
VOLUME /travis

# Generally the current working dir will be used as the repo volume
VOLUME /repo
WORKDIR /repo