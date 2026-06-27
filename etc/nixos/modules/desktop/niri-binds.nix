{ config, ... }:

{
	programs.niri.settings.binds = with config.lib.niri.actions; {
		"Mod+Shift+Slash" = show-hotkey-overlay;

		"Mod+T"       = { hotkey-overlay.title = "Open a Terminal: ghostty"; action = spawn "ghostty"; };
		"Super+Space" = { hotkey-overlay.title = "Open a Launcher: fuzzel"; action = spawn-sh "pkill fuzell || fuzzel"; };
		"Super+Alt+L" = { hotkey-overlay.title = "Lock the Screen: swaylock"; action = spawn "swaylock"; };

		"XF86AudioRaiseVolume"  = { allow-when-locked = true; action = spawn-sh "wpctl set-volume @DEFALUT_AUDIO_SINK@ 0.1+ -l 1.0"; };
		"XF86AudioLowerVolume"  = { allow-when-locked = true; action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; };
		"XF86AudioMute"         = { allow-when-locked = true; action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; };

		"XF86AudioPlay"         = { allow-when-locked = true; action = spawn-sh "playerctl play-pause"; };
		"XF86AudioStop"         = { allow-when-locked = true; action = spawn-sh "playerctl stop"; };
		"XF86AudioPrev"         = { allow-when-locked = true; action = spawn-sh "playerctl previous"; };
		"XF86AudioNext"         = { allow-when-locked = true; action = spawn-sh "playerctl next"; };

		"XF86MonBrightnessUp"   = { allow-when-locked = true; action = spawn-sh "brightnessctl --class=backlight set +10%"; };
		"XF86MonBrightnessDown" = { allow-when-locked = true; action = spawn-sh "brightnessctl --class=backlight set 10%-"; };

		"Mod+O" = { repeat = false; action = toggle-overview; };
		"Mod+Q" = { repeat = false; action = close-window; };

		"Mod+Left"  = focus-column-left;
		"Mod+Right" = focus-column-right;
		"Mod+Down"  = focus-window-down;
		"Mod+Up"    = focus-window-up;

		"Mod+Ctrl+Left"  = move-column-left;
		"Mod+Ctrl+Right" = move-column-right;
		"Mod+Ctrl+Down"  = move-window-down;
		"Mod+Ctrl+Up"    = move-window-up;

		"Mod+Shift+Left"  = focus-monitor-left;
		"Mod+Shift+Right" = focud-monitor-right;
		"Mod+Shift+Down"  = focus-workspace-down;
		"Mod+Shift+Up"    = focus-workspace-up;

		"Mod+Shift+Ctrl+Left"  = move-column-to-monitor-left;
		"Mod+Shift+Ctrl+Right" = move-column-to-monitor-right;
		"Mod+Shift+Ctrl+Down"  = move-column-to-workspace-down;
		"Mod+Shift+Ctrl+Up"    = move-column-to-workspace-up;

		"Mod+R"       = switch-preset-column-width;
		"Mod+Shift+R" = switch-preset-column-width-back;

		"Mod+F"       = maximize-column;
		"Mod+Shift+F" = fullscreen-window;

		"Mod+C" = center-column;

		"Mod+Minus" = set-column-width "-10%";
		"Mod+Equal" = set-column-width "+10%";

		"Mod+V"       = toggle-window-floating;
		"Mod+Shift+V" = switch-focus-between-floating-and-tiling;

		"Print"       = screenshot;
		"Ctrl+Print"  = screenshot-screen;
		"Alt+Print"   = screenshot-window;

		"Mod+Escape" = { allow-inhibiting = true; action = toggle-keyboard-shortcuts-inhibit; };

		"Mod+Shift+E"     = quit;
		"Ctrl+Alt+Delete" = quit;

		"Mod+Shift+P" = power-off-monitors;
	};
}
