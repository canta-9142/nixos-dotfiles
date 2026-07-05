{ config, pkgs, ... }:

{
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
		theme = "sddm-astronaut-theme";
		extraPackages = with pkgs; [
			libsForQt5.qt5.qtgraficaleffects
		];
	};

	environment.systemPackages = with pkgs; [
		(pkgs.callPackage (pkgs.fetchFromGitHub {
			owner = "Keyitdev";
			repo = "sddm-astronaut-theme";
			sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
		}) {})
	];
}
