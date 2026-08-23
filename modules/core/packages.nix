{ pkgs, config, inputs, ...}:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    btop
    fastfetch
    tree
    curl
  ];
  
  programs = {
    zsh.enable = true;
    git.enable = true;
    niri.enable = true;
  };

  security = {
    doas = {
      enable = true;
      wheelNeedsPassword = true;
      extraRules = [{
        groups = [ "wheel" ];
        keepEnv = true;
        persist = true;
      }];
    };
    
    sudo = {
      enable = true;
    };
  };
}
