FROM nixos/nix:1.11

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable
RUN nix-channel --update

RUN nix-build -A cmake '<nixpkgs>'
RUN nix-build -A llvm_34 '<nixpkgs>'
RUN nix-build -A gitAndTools.gitFull '<nixpkgs>'
RUN nix-build -A llvmPackages.clang-unwrapped '<nixpkgs>'
RUN nix-build -A boost163 '<nixpkgs>'

# Location where travis config stored
ENV TRAVIS_CONFIG_PATH /travis
VOLUME /travis

# Generally the current working dir will be used as the repo volume
VOLUME /repo
WORKDIR /repo