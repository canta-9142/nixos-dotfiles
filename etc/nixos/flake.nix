{
	description = "NixOS with NNN, Stylix";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		
		nix-flatpak.url = "github:gmodena/nix-flatpak/main";

		nirimod.url = "github:srinivasr/nirimod";
		nirimod.inputs.nixpkgs.follows = "nixpkgs";

		noctalia.url = "github:noctalia-dev/noctalia";
		noctalia.inputs.nixpkgs.follows = "nixpkgs";

		stylix.url = "github:nix-community/stylix";
		stylix.inputs.nixpkgs.follows = "nixpkgs";

		ghostty.url = "github:ghostty-org/ghostty";

		codex-cli.url = "github:sadjow/codex-cli-nix";

		zen-browzer.url = "github:youwen5/zen-browser-flake";
		zen-browser.inputs.nixpkgs.follows = "nixpkgs";

		helix.url = "github:helix-editor/helix";
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
					   nirimod,
					   noctalia,
					   stylix,
					   ghostty,
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
					
					stylix.nixosModules.stylix

					({ pkgs, ... }: {
						environment.systemPackages = [
							ghostty.packages.${pkgs.system}.default
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

			devShells.${system}.default = pkgs.mkShell {
				buildInputs = with pkgs; [
					zed-editor

					gcc
					go
					nodejs
					pnpm
					python314
				];
				shellHook = ''
					echo ""
				'';
			};
		};
}
