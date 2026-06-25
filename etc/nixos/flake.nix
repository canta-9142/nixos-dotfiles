{
	description = "NixOS with NNN, Stylix";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		nix-flatpak = {
			url = "github:gmodena/nix-flatpak/main";
		};

		noctalia = {
			url = "github:noctalia-dev/noctalia";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		ghostty = {
			url = "github:ghostty-org/ghostty";
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

	outputs = inputs@{ self, nixpkgs, home-manager, nix-flatpak, noctalia, stylix, ghostty, ... }:
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
					
					stylix.nixosModules.stylix

					({ pkgs, ... }: {
						environment.systemPackages = [
							ghostty.packages.${pkgs.system}.default
						];
					})
					
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.backupFileExtension = "hm-backup";
						home-manager.users.jinji = import ./home.nix;
					}
				];
			};
		};
}
