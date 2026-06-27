{ config, ... }:

{
	programs.niri.settings = {
		layout = {
			focus-ring = {
				active-color = "#ffb599";
				inactive-color = "#131313";
				urgent-color = "#ffb4ab";
			};

			border = {
				active-color = "#ffb599";
				inactive-color = "#131313";
				urgent-color = "#ffb4ab";
			};

			shadow = {
				color = "#00000070";
			};

			tab-indicator = {
				active-color = "#ffb599";
				inactive-color = "#7b2f0a";
				urgent-color = "#ffb4ab";
			};

			insert-hint = {
				color = "#ffb59980";
			};
		};

		resent-windows = {
			highlight = {
				active-color = "#ffb599";
				urgent-color = "#ffb4ab";
			};
		};
	};
}
