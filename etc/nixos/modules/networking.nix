{ config, pkgs, ... }:

{
	networking.hostName = "nixos";
	networking.wireless.enable = true;
	networking.networkmanager.enable = true;

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

	services.openssh.enable = true;

	networking.firewall = {
		enable = false;
		allowedTCPPorts = [  ];
		allowedUDPPorts = [  ];
	};
}
