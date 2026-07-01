{ config, pkgs, ... }:

{
	home.packages = [ pkgs.ghostty ];

	programs.ghostty = {
		enable = true;
		enableFishIntegration = true;

		settings = {
			font-family = "Cascadia Code NF";
			font-size = 13;
			theme = "Everforest Dark Med";
			cursor-style = "bar";
			background-opacity = 0.85;
			window-decoration = false;
		};
	};
}
