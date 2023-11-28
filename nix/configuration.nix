# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  virtualisation.docker.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  services.udev.packages = [
    pkgs.yubikey-personalization
  ];
  
  services.pcscd.enable = true;
  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };

  services.mullvad-vpn.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brad = {
    isNormalUser = true;
    description = "Brad Clawsie";
    extraGroups = [ "networkmanager" "wheel" "docker"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    age-plugin-yubikey
    curl
    docker-buildx
    docker-compose
    dos2unix
    fira-code
    fira-code-symbols
    firefox
    fish
    fzf
    gnome.gnome-tweaks
    gnumake
    gnupg
    librewolf
    mullvad
    mullvad-vpn
    nerdfonts
    noto-fonts
    pinentry
    pinentry-curses
    ripgrep
    rlwrap
    tig
    tmux
    unstable.bat
    unstable.deno
    unstable.delta
    unstable.cargo
    unstable.git
    unstable.go
    unstable.golangci-lint
    unstable.gofumpt
    unstable.goimports-reviser
    unstable.gopls
    unstable.go-tools
    unstable.helix
    unstable.hut
    unstable.kitty
    unstable.libgcc
    unstable.nodePackages_latest.typescript-language-server
    unstable.passage
    unstable.perl
    unstable.perl538Packages.CryptX
    unstable.perl538Packages.DataDumperConcise
    unstable.perl538Packages.FileSlurper
    unstable.rustc
    unstable.rust-analyzer
    unstable.starship
    unstable.yubikey-manager
    wget
  ];

  # note after 23.05 fonts.fonts -> fonts.packages
  # see https://nixos.wiki/wiki/Fonts
  fonts.fonts = with pkgs; [
    fira-code
    fira-code-symbols
    nerdfonts
    noto-fonts
  ];

  programs.fish.enable = true;
  users.users.brad.shell = pkgs.fish;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
