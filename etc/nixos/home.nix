{
	home.username = "kanta";
	home.homeDirectory = "/home/kanta";

	home.stateVersion = "26.05";

	programs.home-manager.enable = true;

	programs.fuzzel.enable = true;
	programs.mako.enable = true;

	gtk.enable = true;

	home.packages = with pkgs; [
		wl-clipboard
		grim
		slurp
	];
}
