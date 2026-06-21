{ config, pkgs, ... }:

{
	nixpkgs.config.allowUnfree = true;

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

		flatpak
		nautilus
		firefox
		vscode
		thunderbird
	];

	programs.firefox.enable = true;
	programs.fish.enable = true;
}
