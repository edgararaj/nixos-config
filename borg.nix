{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    borgbackup
  ];

  services.borgbackup.jobs = {
    # for a local backup
    picturesBackup = { 
      paths = [ "/home/earaujo/Pictures/" ];
      exclude = [ "'**/.cache'" ];
      doInit = false;
      repo =  "borg@raspberrypi:/home/borg/backups";
      encryption = {
        mode = "repokey-blake2";
        passCommand = "echo pasta";
      };
      environment = { BORG_RSH = "ssh -i /home/earaujo/.ssh/id_ed25519"; };
      compression = "auto,lzma";
      startAt = "daily";
    };
  };
}
