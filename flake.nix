{
  description = "qmpwwsd nixos flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-24.05";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    # Manages configs links things into your home directory
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # agenix = {
    #   url = "github:ryantm/agenix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager";
    # };
    # impermanence = {
    #   url = "github:nix-community/impermanence";
    # };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nix-darwin,
      nix-homebrew,
      homebrew-bundle,
      homebrew-core,
      homebrew-cask,
      home-manager,
      # agenix,
      # impermanence,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      nixosModules = import ./modules/nixos;
      darwinModules = import ./modules/darwin;
      homeManagerModules = import ./modules/home-manager;

      legacyPackages = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );

      buildHomeManagerConfig =
        hostname:
        let
          rootPath = "~/nixos/modules/home-manager";
          hostPath = "${rootPath}/hosts/${hostname}";
          sharedPath = "${rootPath}/shared";
        in
        {
          linkHostApp = config: app: config.lib.file.mkOutOfStoreSymlink "${hostPath}/${app}/config";
          linkSharedApp = config: app: config.lib.file.mkOutOfStoreSymlink "${sharedPath}/${app}/config";
        };

      createDarwin =
        hostname: username: fullname: email:
        (
          let
            system = "aarch64-darwin";
            specialArgs = {
              inherit
                inputs
                outputs
                hostname
                username
                fullname
                email
                system
                ;
            };
            modules = (builtins.attrValues darwinModules) ++ [
              (./. + "/hosts/${hostname}")
              # agenix.nixosModules.default
              home-manager.darwinModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users."${username}" = homeManagerModules;
                home-manager.extraSpecialArgs = specialArgs // {
                  homeManagerConfig = buildHomeManagerConfig hostname;
                };
              }
              nix-homebrew.darwinModules.nix-homebrew
              {
                nix-homebrew = {
                  enable = true;
                  user = username;
                  enableRosetta = true;
                  autoMigrate = true;
                  mutableTaps = false;
                  taps = {
                    "homebrew/homebrew-core" = homebrew-core;
                    "homebrew/homebrew-cask" = homebrew-cask;
                    "homebrew/homebrew-bundle" = homebrew-bundle;
                  };
                };
              }
            ];
          in
          nix-darwin.lib.darwinSystem { inherit specialArgs modules; }
        );
    in
    {
      inherit legacyPackages;

      formatter = forAllSystems (system: nixpkgs.legacyPackages."${system}".nixpkgs-fmt);

      # overlays = import ./overlays { inherit inputs; };

      # nixosConfigurations = {
      # };

      darwinConfigurations = {
        qmpwwsd = createDarwin "qmpwwsd" "qmpwwsd" "qmpwwsd" "dreamwinamounts@gmail.com";
      };

      darwinPackages = self.darwinConfigurations.${outputs.networking.hostName}.pkgs;
    };
}
