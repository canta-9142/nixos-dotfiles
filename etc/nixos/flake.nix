{
	description = "NixOS with NNN";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		noctalia = {
			url = "github:noctalia-dev/noctalia";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix-flatpak = {
			url = "github:gmodena/nix-flatpak/main";
		};
	};

	nixConfig = {
		extra-substituters = [
			"https://noctalia.cachix.org"
		];

		extra-trusted-public-keys = [
			"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
		];
	};

	outputs = inputs@{ self, nixpkgs, noctalia, nix-flatpak, ... }:
		let
			system = "x86_64-linux";
			hostname = "nixos";
		in {
			nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
				inherit system;

				specialArgs = {
					inherit inputs;
				};

				modules = [
					./configuration.nix
					nix-flatpak.nixosModules.nix-flatpak
				];
			};
		};
}
