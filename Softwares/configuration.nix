# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "anix";
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  virtualisation.docker.enable = true;

  time.timeZone = "Asia/Kolkata";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    copyq
    cvs
    docker
    elinks
    firefox
    gcc
    git
    gnumake
    guake
    i3
    htop
    keynav
    mercurial
    mosh
    mpv
    neovim
    ranger
    rtorrent
    ruby_2_4
    smplayer
    subversion
    tmux
    udiskie
    vimHugeX
    vlc
    wget
    wirelesstools
    wpa_supplicant
    xclip
    xfce.terminal
    xorg.xmodmap
    youtube-dl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.windowManager = {
    i3 = {
      enable = true;
      package = pkgs.i3;
    };
    default = "i3";
  };

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.alex = {
    isNormalUser = true;
    home = "/home/alex";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "17.09"; # Did you read the comment?

}
