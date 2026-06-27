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

		kitty
		zellij
		yazi
		
		parted
		gparted

		remmina
		freerdp

		flatpak
		nautilus
		chromium
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
