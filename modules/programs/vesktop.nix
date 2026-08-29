{ pkgs, inputs, host, config, lib, ... }:

{
  options.my.host.programs.hosts.vesktop = lib.mkOption {
    description = "hosts on which vesktop may be installed";
    default = [];
    type = lib.types.listOf lib.types.str;
  };
  
  config = lib.mkIf (lib.elem host config.my.host.programs.hosts.vesktop) {
    programs.vesktop = {
      enable = true;
      package = pkgs.unstable.vesktop;
      vencord = {
        settings = {
          plugins = {
            NoTrack.enabled = true; #deaktiviert Telemetrie
            PermissionsViewer.enabled = true; #zeigt Rechte von personen auf Servern (Benutzerprofil)
            ClearURLs.enabled = true; #entfernt Tracking-Daten aus URLs
            FixYoutubeEmbeds.enabled = true; #richtige YouTube embeds im Chat
            BetterFolders.enabled = true; #öffnet eigene Spalte für Ordnerinhalte
            BetterRoleDot.enabled = true; #bessere Rolle
            ImplicitRelationships.enabled = true; #zeigt im Profil an, wie man verbunden ist
            RelationshipNotifier.enabled = true; #zeigt im Chat wenn mich jemand entfreundet, blockiert, etc.
            ImageZoom.enabled = true; #richtiger zoom für Bilder
            SilentTyping.enabled = true; #verhindert dass andere sehen wenn ich schreibe
            ValidUser.enabled = true; #zeigt als Icon im profil an, ob es ein bekannter Bot/Spammer ist
          };

          enabledThemes = [];
        };

        themes = {};
      };
    };

    services.arrpc = {
      enable = true;
      package = pkgs.arrpc;
    };
  };
}