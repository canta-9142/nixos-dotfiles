{ config, pkgs, ... }:

{
	imports = [
		./home/codex.nix
	];

	home.username = "jinji";
	home.homeDirectory = "/home/jinji";

	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	gtk.enable = true;

	home.packages = with pkgs; [
		wl-clipboard
		grim
		slurp
	];
}
