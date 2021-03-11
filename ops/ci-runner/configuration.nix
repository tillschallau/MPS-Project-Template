let parameters = import ./parameters.nix;
in {
    network = {
        pkgs = import ./nixpkgs.nix {};
    };

    nix-ci = { config, pkgs, ... }: {
        imports = [
            ./hardware-configuration.nix
            ./system.nix
            ./gitlab-runner.nix
        ];

        deployment = {
            targetHost = parameters.server;
            targetUser = parameters.user;
        };
    };
}
