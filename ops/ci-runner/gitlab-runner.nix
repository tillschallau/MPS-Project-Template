{ config, pkgs, ... }:
let parameters = import ./parameters.nix;
in {
    environment.systemPackages = with pkgs; [ git ];

    services.gitlab-runner = {
        enable = true;
        concurrent = 1;
        services.nix-ci = {
            registrationConfigFile =
                pkgs.writeText "gitlab-registration-config" ''
                    CI_SERVER_URL=https://gitlab.com/
                    REGISTRATION_TOKEN=${parameters.gitlabRegistrationSecret}
                '';
            executor = "shell";
            tagList = [ "nix" ];
        };
    };
}

