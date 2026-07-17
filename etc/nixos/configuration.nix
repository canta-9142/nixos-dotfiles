{ config, pkgs, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/packages.nix
      ./modules/user.nix
      ./modules/networking.nix
      ./modules/audio.nix
      ./modules/desktop/niri.nix
      ./modules/desktop/stylix.nix
      ./modules/desktop/input-method.nix
      ./modules/desktop/fonts.nix
    ];

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable flakes.
  nix.settings.experimental-features = [
  	"nix-command" "flakes"
  ];

  services.udisks2.enable = true;

  security.sudo.extraRules = [
  	{
  	  users = [ "jinji" ];
  	  commands = [
  	    {
	  	  command = "/run/current-system/sw/bin/wg-quick up wg0";
	  	  options = [ "NOPASSWD" ];
  		}
  		{
  		  command = "/run/current-system/sw/bin/wg-quick down wg0";
  		  options = [ "NOPASSWD" ];
  		}
  		{
  		  command = "/run/current-system/sw/bin/wg";
  		  options = [ "NOPASSWD" ];
  		}
  	  ];
  	}
  ];

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing = {
  	enable = true;
  	drivers = [ pkgs.cups-filters ];
  };
  services.avahi = {
  	enable = true;
  	nssmdns4 = true;
  	openFirewall = true;
  };
  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
