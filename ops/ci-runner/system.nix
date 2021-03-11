{ config, pkgs, ... }:
let parameters = import ./parameters.nix;
in {
    boot.loader.grub.enable = true;
    boot.loader.grub.version = 2;
    boot.loader.grub.device = "/dev/sda";

    networking.hostName = "nix-ci";

    i18n.defaultLocale = "de_DE.UTF-8";

    console = {
        font = "Lat2-Terminus16";
        keyMap = "de";
    };

    time.timeZone = "Europe/Berlin";

    environment.systemPackages = with pkgs; [
        wget vim
    ];

    services.openssh.enable = true;

    users.users.root.openssh.authorizedKeys.keys = parameters.sshKeys;

    system.stateVersion = "19.03";
}
