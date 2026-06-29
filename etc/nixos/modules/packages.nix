{ config, pkgs, ... }:

{
	
	nixpkgs.config.allowUnfree = true;
	
	programs.firefox.enable = true;
	programs.fish.enable = true;
	
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
		kitty
		zellij
		yazi

		gcc
		go
		nodejs
		pnpm
		mermaid-cli
		python314
		arduino-ide

		ookla-speedtest
		
		netcat
		tcpdump
		wireguard-tools
		wireguard-ui
		remmina
		freerdp

		flatpak
		nautilus
		zathura
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
			"org.gitfourchette.gitfourchette"
		];
	};
}
