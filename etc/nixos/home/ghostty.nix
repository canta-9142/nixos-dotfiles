{ config, pkgs, ... }:

{
	home.packages = [ pkgs.ghostty ];

	programs.ghostty = {
		enable = true;
		enableFishIntegration = true;

		settings = {
			font-family = "Cascadia Code NF";
			font-size = 12;
			theme = "Everforest Dark Hard";
			cursor-style = "bar";
			background-opacity = 0.85;
			window-decoration = false;
		};
	};
}
