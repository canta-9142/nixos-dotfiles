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

		remmina
		freerdp
		codex

		flatpak
		nautilus
		firefox
		google-chrome
		vscode
		thunderbird
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
			"com.discordapp.Discord"
			"org.kicad.Kicad"
			"com.obsproject.Studio"
		];
	};
	
	nixpkgs.config.allowUnfree = true;
	
	programs.firefox.enable = true;
	programs.fish.enable = true;
}
