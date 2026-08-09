{ pkgs, config, inputs, ...}:

{
  environment.systemPackages = with pkgs; [
    brightnessctl

    (prismlauncher.override { #übergibt Java an prism
    jdks = [ graalvmPackages.graalvm-ce zulu8 zulu17 zulu ];
    })
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

  networking.networkmanager.enable = true;
}
