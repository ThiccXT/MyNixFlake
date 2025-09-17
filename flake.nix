{
  description = "My NixOS Configuration";

  inputs = {
    # Pin to NixOS 25.05 stable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-ai.url = "github:olafkfreund/nix-ai-help";
    
    # Alternative: Use unstable for latest packages
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";  
        modules = [
          # Import your existing configuration files
          ./configuration.nix
          ./hardware-configuration.nix
          ./nvidia.nix
        ];
      };
    };
  };
}
