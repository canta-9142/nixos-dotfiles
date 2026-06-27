{ config, pkgs, ... }:

{
	systemd.user.services.codex-remote = {
		Unit = {
			Description = "Codex CLI Remote Control Daemon";
			After = [ "network.target" ];
		};
		Service = {
			ExecStart = "${pkgs.codex}/bin/codex remote-control start";
			Restart = "never";
		};
		Install = {
			WantedBy = [ "default.target" ];
		};
	};
}
