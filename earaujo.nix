{ config, lib, pkgs, ... }:

let 
user = {
  name = "Edgar Araújo";
  email = "edgararaj@gmail.com";
};
in
{
  networking.hostName = "drinkpad"; # Define your hostname.

  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    storageDriver = "btrfs";
  };

  systemd.services.docker = {
    serviceConfig = {
      LimitMEMLOCK = "infinity";  # Allows memlock
    };
  };

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    ensureDatabases = [ "mydatabase" ];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  hardware.sane = {
    enable = true; # enables support for SANE scanners
    extraBackends = [ pkgs.hplipWithPlugin ];
  };

  environment.systemPackages =
  with pkgs;
  let
    php = pkgs.php82.buildEnv { extraConfig = ''
      memory_limit = 4G
      upload_max_filesize = 1G
      max_execution_time = 360
      date.timezone = Europe/Lisbon
    ''; };
  in [
    php
    php82Packages.composer
    quickemu
  ];

  programs.adb.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.command-not-found.enable = true;

  # Prisma:
  environment.variables.PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
  environment.variables.PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
  environment.variables.PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";

  # Android studio:
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "android-studio-stable"
  ];

  programs.java.enable = true;

  home-manager.users.earaujo = { config, pkgs, ...}: {
    home.stateVersion = "24.05";

    #programs.home-manager.enable = true;

    #home.file = {
    #  ".local/bin" = {
    #    source = ./scripts;
    #    recursive = true;
    #  };
    #};

    programs.git = {
      enable = true;
      userName  = user.name;
      userEmail = user.email;
      extraConfig = {
        diff = { tool = "meld"; };
      };
    };

    home.packages = with pkgs; [
      # general
      networkmanager-openvpn
      chromium
      discord
      xorg.libXmu
      libinput
      nerdfonts
      qdirstat
      turbovnc
      wine
      jamesdsp
      onlyoffice-desktopeditors

      # entretainment
      inkscape
      kodi
      mixxx
      mpv
      prismlauncher
      spotify
      stremio
      vlc

      # cli
      ffmpeg
      file
      htop
      imagemagick
      jq
      openvpn
      tree
      unzip
      wl-clipboard
      wol
      zip

      #fuse-3.16.2
      #ibus-1.5.30
      #inter-4.0
      #meson-1.4.2
      #rpi-imager-1.8.5
      #RStudio-2023.12.1+402
      #scrcpy-3.1
      #tla-toolbox-1.7.1
      #wifi-qr-0.3-unstable-2023-09-30
      #xdg-desktop-portal-1.18.4
      #xdg-desktop-portal-gnome-46.2

      
      # dev
      act # run github actions locally
      android-studio
      brmodelo
      cabal-install
      cmake
      code-cursor
      conda
      docker-compose
      dotnetCorePackages.sdk_9_0_1xx
      erlang
      freeglut
      gettext
      gh
      ghc
      gmp
      graphviz
      meld
      mesa
      pipenv
      pkg-config
      postman
      symfony-cli
      texliveFull
      tlaplus
      typst

      # python pkgs
      (python311.withPackages (ps: with ps; [
        jupyterlab
        matplotlib
        networkx
        numpy
        ortools
        pandas
        ply
        pysmt
        requests
        scikitlearn
        scipy
        statsmodels
        z3-solver

        # necessary for https://github.com/tchar/ulauncher-albert-calculate-anything?tab=readme-ov-file#install-for-albert
        pint
        simpleeval
        parsedatetime
        pytz
        babel
      ]))

      # formatters
      nodePackages.prettier
      xmlstarlet # for xml

      # webdev
      corepack_20
      mailpit
      nodePackages.prisma
      nodejs_20
      openssl
      watchman
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.earaujo = {
    description = user.name;
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "scanner" "lp" "kvm" "adbusers" ];
  };
}


