{ config, ... }:

{
  networking.networkmanager.enable = true;
  services = {
    
    #SSH Agent. 
    #do NOT disable this as you won't be able to access the remote host of this repo.
    openssh.enable = true;
    
    #power management service.
    #mainly used for quickshell
    #could be important for anything else that I'm not aware of.
    upower.enable = true;
    
    #file-system trim.
    #synchronises free SSD blocks with SSD controller
    #good for SSD's health and makes it work longer.
    #can be disabled but there's really no reason to.
    fstrim.enable = true;
    
    #enables flatpaks. 
    #self-explaining.
    flatpak.enable = true;
  };

  #makes the timer for fstrim persistent.
  #this makes sure that systemd triggers the service on boot in case 
  #the host was turned off on the timer's due time.
  #Can be turned off, but again, there's no reason to.
  systemd.timers."fstrim".timerConfig.Persistent = true;
}
