{ config, ...}:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ]; # Applies to all attached keyboards
        settings = {
          main = {
            # Swap left modifier keys
            leftalt = "leftmeta";
            leftmeta = "leftalt";
          };
        };
      };
    };
  };
}