{ config, pkgs, ... }:

{
	networking.hostName = "nixos";
	networking.wireless.enable = true;
	networking.networkmanager.enable = true;

	services.openssh.enable = true;

	networking.firewall = {
		enable = false;
		allowedTCPPorts = [  ];
		allowedUDPPorts = [  ];
	};
}
