{ pkgs, inputs, ... }:

{
	imports = [
		inputs.niri.homeModules.niri
		./niri-noctalia.nix
		./niri-binds.nix
	];

	programs.niri.settings = {
		input = {
			keyboard.xkb = {
				layout = "us";
			};
			touchpad = {
				tap = true;
				dwt = true;
				natural-scroll = true;
				accel-speed = 0.10;
			};
			mouse = {
			};
		};
		
		outputs = {
			"eDP-1" = {
				mode = { width = 1920; height = 1080; refresh = 48.001; };
				scale = 1.0;
				position = { x = 1920; y = 0; };
				is-primary = true;
			};
			"HDMI-A-1" = {
				mode = { width = 1920; height = 1080; refresh = 60; };
				scale = 1.0;
				position = { x = 0; y = 0; };
			};
		};

		layout = {
			gaps = 10;
			
			center-focused-column = "always";
			preset-column-widths = [
				{ propotion = 0.33333; }
				{ propotion = 0.5; }
				{ propotion = 0.66667; }
			];
			default-column-width = {
				propotion = 0.5;
			};
		};

		spawn-at-startup = [
			{ command = [ "noctalia" ]; }
			{ command = [ "mako" ]; }
		];

		hotkey-overlay = {
		};

		screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y%m%d-%H%M%S.png";

		animations = {
		};

		window-rule = [
			{
				geometry-corener-radius = 15;
				clip-to-geometry = true;
			}
		];
	};
}
