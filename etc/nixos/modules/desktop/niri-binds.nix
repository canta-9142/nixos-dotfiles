{ config, ... }:

{
	programs.niri.settings.binds = {
		"Mod+Shift+Slash".action.how-hotkey-overlay = null;

		"Mod+T"       = { hotkey-overlay.title = "Open a Terminal: ghostty"; action.spawn = [ "ghostty" ]; };
		"Super+Space" = { hotkey-overlay.title = "Open a Launcher: fuzzel"; action.spawn-sh = [ "pkill fuzell || fuzzel" ]; };
		"Super+Alt+L" = { hotkey-overlay.title = "Lock the Screen: swaylock"; action.spawn = [ "swaylock" ]; };

		"XF86AudioRaiseVolume"  = { allow-when-locked = true; action.spawn-sh = [ "wpctl set-volume @DEFALUT_AUDIO_SINK@ 0.1+ -l 1.0" ]; };
		"XF86AudioLowerVolume"  = { allow-when-locked = true; action.spawn-sh = [ "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-" ]; };
		"XF86AudioMute"         = { allow-when-locked = true; action.spawn-sh = [ "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" ]; };

		"XF86AudioPlay"         = { allow-when-locked = true; action.spawn-sh = [ "playerctl play-pause" ]; };
		"XF86AudioStop"         = { allow-when-locked = true; action.spawn-sh = [ "playerctl stop" ]; };
		"XF86AudioPrev"         = { allow-when-locked = true; action.spawn-sh = [ "playerctl previous" ]; };
		"XF86AudioNext"         = { allow-when-locked = true; action.spawn-sh = [ "playerctl next" ]; };

		"XF86MonBrightnessUp"   = { allow-when-locked = true; action.spawn-sh = [ "brightnessctl --class=backlight set +10%" ]; };
		"XF86MonBrightnessDown" = { allow-when-locked = true; action.spawn-sh = [ "brightnessctl --class=backlight set 10%-" ]; };

		"Mod+O" = { repeat = false; action.toggle-overview = null; };
		"Mod+Q" = { repeat = false; action.close-window = null; };

		"Mod+Left".action.focus-column-left = null;
		"Mod+Right".action.focus-column-right = null;
		"Mod+Down".action.focus-window-down = null;
		"Mod+Up".action.focus-window-up = null;

		"Mod+Ctrl+Left".action.move-column-left = null; 
		"Mod+Ctrl+Right".action.move-column-right = null;
		"Mod+Ctrl+Down".action.move-window-down = null;
		"Mod+Ctrl+Up".action.move-window-up = null;

		"Mod+Shift+Left".action.focus-monitor-left = null;
		"Mod+Shift+Right".action.focud-monitor-right = null;
		"Mod+Shift+Down".action.focus-workspace-down = null;
		"Mod+Shift+Up".action.focus-workspace-up = null;

		"Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = null;
		"Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = null; 
		"Mod+Shift+Ctrl+Down".action.move-column-to-workspace-down = null;
		"Mod+Shift+Ctrl+Up".action.move-column-to-workspace-up = null;

		"Mod+R".action.switch-preset-column-width = null;
		"Mod+Shift+R".action.switch-preset-column-width-back = null;

		"Mod+F".action.maximize-column = null;
		"Mod+Shift+F".action.fullscreen-window = null;

		"Mod+C".action.center-column = null;

		"Mod+Minus".action.set-column-width = "-10%";
		"Mod+Equal".aciton.set-column-width = "+10%";

		"Mod+V".action.toggle-window-floating = null;
		"Mod+Shift+V".actios.witch-focus-between-floating-and-tiling = null;

		"Print".action.screenshot = null;
		"Ctrl+Print".action.screenshot-screen = null;
		"Alt+Print".action.screenshot-window = null;

		"Mod+Escape" = { allow-inhibiting = true; action.toggle-keyboard-shortcuts-inhibit = null; };

		"Mod+Shift+E".action.quit = null;
		"Ctrl+Alt+Delete".action.quit = null;

		"Mod+Shift+P".action.power-off-monitors = null;
	};
}
