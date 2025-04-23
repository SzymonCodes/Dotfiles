{
  description = "Simon's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
    let
      configuration = { pkgs, config, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget

        nixpkgs.config.allowUnfree = true;
        nixpkgs.config.allowBroken = true;

        environment.systemPackages =
          [ 
            # IDE
            pkgs.neovim
            pkgs.tmux
            pkgs.duckdb
            pkgs.tidy-viewer
            pkgs.quarto
            pkgs.micromamba

            # CLIs 
            pkgs.starship
            pkgs.fzf
            pkgs.neofetch
            pkgs.stow
            pkgs.zoxide
            pkgs.zsh-autosuggestions
            pkgs.zsh-syntax-highlighting
            pkgs.bat
            pkgs.ripgrep
            pkgs.cmatrix

            # GitHub
            pkgs.git
            pkgs.git-credential-manager

            # Language servers for Neovim
            pkgs.lua-language-server
            pkgs.pyright

            # System
            pkgs.mkalias
          ];

        homebrew = {
          enable = true;
          taps = [
            "FelixKratz/formulae"
          ];
          casks = [
            "affinity-designer"
            "affinity-photo"
            "logi-options+"
            "ghostty"
            "1password"
            "1password-cli"
            "nikitabobko/tap/aerospace"
            "appcleaner"
            "google-chrome"
            "obsidian"
            "spotify"
            "raycast"
          ];
          onActivation.cleanup = "zap";
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
        };

        fonts.packages = [
          pkgs.nerd-fonts.jetbrains-mono
        ];

        system.activationScripts.applications.text = let
          env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
            pathsToLink = "/Applications";
          };
        in
          pkgs.lib.mkForce ''
            # Set up applications.
            echo "setting up /Applications..." >&2
            rm -rf /Applications/Nix\ Apps
            mkdir -p /Applications/Nix\ Apps
            find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
            while read -r src; do
              app_name=$(basename "$src")
              echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
            done
          '';

        system.defaults = {
          dock.autohide = true;
          dock.wvous-br-corner = 1;
	  dock.mru-spaces = false;
	  dock.show-recents = false;
          dock.persistent-apps = [
              "/Applications/Ghostty.app"
              "/Applications/Obsidian.app"
              "/Applications/Google Chrome.app"
              "/Applications/Spotify.app"
              "/System/Applications/Music.app"
              "/Applications/AppCleaner.app"
          ];
          finder.FXPreferredViewStyle = "Nlsv";
          loginwindow.GuestEnabled = false;
          NSGlobalDomain.AppleICUForce24HourTime = true;
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
          NSGlobalDomain.KeyRepeat = 2;
        };

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Enable alternative shell support in nix-darwin.
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 6;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in
      {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
        modules = [ 
          configuration 
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;

              user = "szymon";

              autoMigrate = true;
            };
          }
        ];
      };
    };
}
