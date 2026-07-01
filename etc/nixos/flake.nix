{
	description = "NixOS with NNN, Stylix";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		
		nix-flatpak.url = "github:gmodena/nix-flatpak/main";

		niri.url = "github:sodiboo/niri-flake";
		niri.inputs.nixpkgs.follows = "nixpkgs";

		nirimod.url = "github:srinivasr/nirimod";
		nirimod.inputs.nixpkgs.follows = "nixpkgs";

		noctalia.url = "github:noctalia-dev/noctalia";
		noctalia.inputs.nixpkgs.follows = "nixpkgs";

		stylix.url = "github:nix-community/stylix";
		stylix.inputs.nixpkgs.follows = "nixpkgs";

		vicinae.url = "github:vicinaehq/vicinae";
		vicinae.inputs.nixpkgs.follows = "nixpkgs";

		ghostty.url = "github:ghostty-org/ghostty";
		ghostty.inputs.nixpkgs.follows = "nixpkgs";

		zen-browser.url = "github:0xc000022070/zen-browser-flake";
		zen-browser.inputs.nixpkgs.follows = "nixpkgs";

		codex-cli.url = "github:sadjow/codex-cli-nix";
		codex-cli.inputs.nixpkgs.follows = "nixpkgs";

		helix.url = "github:helix-editor/helix";
		helix.inputs.nixpkgs.follows = "nixpkgs";
	};

	nixConfig = {
		extra-substituters = [
			"https://noctalia.cachix.org"
		];

		extra-trusted-public-keys = [
			"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
		];
	};

	outputs = inputs@{ self,
					   nixpkgs,
					   home-manager,
					   nix-flatpak,
					   niri,
					   nirimod,
					   noctalia,
					   stylix,
					   vicinae,
					   ghostty,
					   zen-browser,
					   codex-cli,
					   helix, ... }:
		let
			system = "x86_64-linux";
			hostname = "nixos";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
			nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
				inherit system;

				specialArgs = { inherit inputs; };

				modules = [
					./configuration.nix

					nix-flatpak.nixosModules.nix-flatpak

					niri.nixosModules.niri
					
					stylix.nixosModules.stylix

					({ pkgs, ... }: {
						environment.systemPackages = [
							vicinae.packages.${pkgs.system}.default
							ghostty.packages.${pkgs.system}.default
							zen-browser.packages.${pkgs.system}.default
							codex-cli.packages.${pkgs.system}.default
							helix.packages.${pkgs.system}.default
						];
					})
					
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.jinji = import ./home.nix;
					}
				];
			};
		};
}
