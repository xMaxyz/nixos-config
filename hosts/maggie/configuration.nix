# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, modulesPath, host, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      #back-end
      ./hardware.nix
      ../../modules/sys/boot.nix
      ../../modules/sys/swap.nix
      ../../modules/sys/misc.nix

      #user-space
      ../../modules/usr/users.nix
      ../../modules/usr/services.nix
      ../../modules/usr/packages.nix
    ];
  
  networking.hostName = "${host}"; # definded by name in flake.nix
  boot.kernelPackages = pkgs.linuxPackages_6_12;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
