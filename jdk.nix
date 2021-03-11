import (builtins.fetchGit {
    name = "open-jdk";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "c83e13315caadef275a5d074243c67503c558b3b";
}) {}
