{ config, pkgs, lib, ... }:

{
	imports = [
		./home/codex.nix
		./home/niri.nix
		./home/ghostty.nix
		./home/activitywatch.nix
	];

	home.username = "jinji";
	home.homeDirectory = "/home/jinji";

	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	gtk.enable = true;
	xdg.configFile."gtk-3.0/gtk.css".force = lib.mkForce true;
	xdg.configFile."gtk-4.0/gtk.css".force = lib.mkForce true;
		
	home.packages = with pkgs; [
	];
}
