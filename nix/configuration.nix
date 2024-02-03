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

  networking.hostName = "nixos";
  networking.extraHosts = ''
    192.168.122.11 archlinux
  '';

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

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.printing.enable = false;

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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

  users.users.brad = {
    isNormalUser = true;
    description = "Brad Clawsie";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    age
    age-plugin-yubikey
    alacritty
    aspell
    aspellDicts.en
    curl
    docker
    docker-buildx
    docker-compose
    dos2unix
    fira-code
    fira-code-symbols
    firefox
    fish
    fzf
    gcc13
    gnome.gnome-tweaks
    gnumake
    gnupg
    libgcc
    librewolf
    llvmPackages_17.clangUseLLVM
    llvmPackages_17.libcxxClang
    mullvad
    mullvad-vpn
    nerdfonts
    noto-fonts
    openssl
    pkg-config
    pinentry
    pinentry-curses
    ripgrep
    tig
    tmux
    unstable.ack
    unstable.bat
    unstable.deno
    unstable.delta
    unstable.cargo
    unstable.clippy
    unstable.emacs-nox
    unstable.git
    unstable.go
    unstable.golangci-lint
    unstable.gofumpt
    unstable.gopls
    unstable.gotools
    unstable.go-tools
    unstable.helix
    unstable.hut
    unstable.libgcc
    unstable.nodePackages_latest.typescript-language-server
    unstable.passage
    unstable.perl
    unstable.perl538Packages.CryptX
    unstable.perl538Packages.DataDumperConcise
    unstable.perl538Packages.FileSlurper
    unstable.starship
    unstable.yubikey-manager
    unzip
    wget
    zig
    zls
  ];

  # see https://nixos.wiki/wiki/Fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    nerdfonts
    noto-fonts
  ];

  programs.fish.enable = true;
  users.users.brad.shell = pkgs.fish;

  system.stateVersion = "23.05"; # do not touch
}
