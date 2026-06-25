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
		bottom
		fish
		fastfetch
		ripgrep
		fd
		eza
		bat
		tree

		ookla-speedtest

		ghostty
		zellij
		yazi
		helix

		parted
		gparted

		remmina
		freerdp
		codex

		flatpak
		nautilus
		firefox
		google-chrome
		discord
		slack
		vscode
		zed
		thunderbird
		kicad
		inkscape
		obs-studio
	];

	services.flatpak = {
		enable = true;
		update.onActivation = true;
		uninstallUnmanaged = true;
		remotes = [{
			name = "flathub";
			location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
		}];
		packages = [
			"io.github.shiftey.Desktop"
		];
	};
	
	nixpkgs.config.allowUnfree = true;
	
	programs.firefox.enable = true;
	programs.fish.enable = true;
}
