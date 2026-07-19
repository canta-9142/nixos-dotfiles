{ config, pkgs, ... }:

{
	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5 = {
			waylandFrontend = true;
			addons = with pkgs; [
				fcitx5-mozc
				fcitx5-gtk
			];
		};
	};
	services.xserver.desktopManager.runXdgAutostartIfNone = true;
	systemd.user.services.fcitx5-restart-after-resume = {
		description = "Restart Fcitx5 after suspend resume";
		wantedBy = [ "suspend.target" "hibernate.target" ];
		after = [ "suspend.target" "hibernate.target" ];
		serviceConfig = {
			Type = "oneshot";
			ExecStart = "${pkgs.fcitx5}/bin/fcitx5-remote -r";
		};
	};
}
