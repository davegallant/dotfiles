{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment = { variables = { LANG = "en_US.UTF-8"; }; };

  networking = { hostName = "demeter"; };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixFlakes;

  programs.zsh = {
    enable = true;
    # https://github.com/nix-community/home-manager/issues/108#issuecomment-340397178
    enableCompletion = false;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  system.stateVersion = 4;
}
