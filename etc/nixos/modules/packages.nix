{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		micro
		git
		gh
		wget
		curl
		zip
		unzip
		btop
		htop
		fish
		fastfetch
		ripgrep
		fd
		eza
		bat
		tree

		ghostty
		zellij
		yazi
		helix

		gparted

		flatpak
		nautilus
		firefox
		vscode
		thunderbird
	];

	services.flatpak = {
		enable = true;
	};
	
	nixpkgs.config.allowUnfree = true;
	
	programs.firefox.enable = true;
	programs.fish.enable = true;
}
