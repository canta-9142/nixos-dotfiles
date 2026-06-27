{ config, pkgs, inputs, ... }:

{
	imports = [
		./niri-settings.nix
	];
	
	programs.niri.enable = true;

	nix.settings = {
		substituters = [ "https://cachix.org" ];
		trusted-public-keys = [ "niri.cachix.org-1:Wv0Om60A7RKg0Z3JAoHDf/6+e6t96gGZ6mVNfCgSgEA=" ];
	};

	services.displayManager.gdm.enable = true;
	services.displayManager.defaultSession = "niri";
	
	security.polkit.enable = true;
	services.gnome.gnome-keyring.enable = true;

	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-gtk
			xdg-desktop-portal-gnome
		];

	    config.niri = {
	    	"org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
	    };
	};

	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
	};

	services.power-profiles-daemon.enable = true;
	services.upower.enable = true;

	environment.systemPackages = with pkgs; [
		inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
		inputs.nirimod.packages.${pkgs.system}.default
		
		fuzzel
		waybar
		mako

		swaylock
		swayidle

		wl-clipboard
		grim
		slurp
		swappy

		brightnessctl
		playerctl
		pamixer
		pavucontrol

		xwayland-satellite

		papirus-icon-theme
		adwaita-icon-theme
		bibata-cursors
		nwg-look
	];
}
