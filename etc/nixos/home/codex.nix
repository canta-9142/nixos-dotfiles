{ config, pkgs, ... }:

{
	systemd.jinji.services.codex-remote = {
		Unit = {
			Description = "Codex CLI Remote Control Daemon";
			After = [ "network.target" ];
		};
		Service = {
			ExecStart = "${pkgs.codex}/bin/codex remote-control start";
			Restart = "always";
		};
		Install = {
			WantedBy = [ "default.target" ];
		};
	};
}
