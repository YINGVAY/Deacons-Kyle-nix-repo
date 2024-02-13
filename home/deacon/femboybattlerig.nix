{config, pkgs, inputs, ...}: {
  home.stateVersion = "23.05";

  gtk = {
    enable = true;
    iconTheme.name = "Qogir";
    cursorTheme.name = "Qogir";
  };


  home.packages = with pkgs; [
    
    
    
    gimp
    firefox
    keepassxc
    swaybg
    pavucontrol
    comma
    git-lfs
    obsidian
    libreoffice
  ];

  base.vscode.enable = true;

  base.neovim = {
    enable = true;
    plugins = {
      nerdtree = {
        enable = true;
      };
      startify = {
        enable = true;
      };
      nerdcommenter = {
        enable = true;
        binds = {
          defaultBinds = true;
        };
      };
      ale = {
        enable = true;
      };
      indentLine = {
        enable = true;
        config = {
          char = "['┆', '│']";
        };
      };
      whichKey = {
        enable = true;
      };
      autoPairs = {
        enable = true;
      };
      whiteSpace = {
        enable = true;
      };
      airLine = {
        enable = true;
      };
      easyMotion = {
        enable = true;
      };
      fugitive = {
        enable = true;
      };
      treeSitter = {
        enable = true;
      };
      devicons = {
        enable = true;
      };
      workSpace = {
        enable = true;
        config = {
          autoSession = true;
        };
      };
      autoSave = {
        enable = true;
        onStart = true;
      };
    };
  };
  

base.monitors = {
    monitors = [
      {adapter="HDMI-A-0"; resolution="1920x1080"; framerate=144; position="1920x0";}
      {adapter="DP-0"; resolution="1920x1080"; framerate=165; position="0x0";}
    ];
    workspaces = {
      displayAssociation = [
        {display="DP-0"; workspaces=[{number=1; default=true;} {number=2; default=false;} {number=3; default=false;}];}
        {display="HDMI-A-0"; workspaces=[{number=4; default=true;} {number=5; default=false;} {number=6; default=false;}];}
      ];
    };
    #defaultMonitor = {resolution="default"; mirroring="DVI-D-2";};
  };

  base.thunar.enable = true;
  base.kdeconnect.enable = true;
  base.discord.enable = true;
  base.direnv.enable = true;
  base.fish.enable = true;

  base.stylix.enable = true;

  base.hyprland.enable = true;  

  base.waybar = {
    enable = true;

    middleModules = [ "clock" ];
    rightModules = [
      "network"
      "memory"
      "temperature"
      "battery"
      "cpu"
      "pulseaudio"
      "tray"
    ];

    clock = {
      use24HourTime = false;
      showSeconds = true;
    };
  };
  
  programs = {
    firefox = {
      enable = true;
    };

    vscode = {
      enable = true;
    };

    kitty = {
      enable = true;
      settings = {
        opacity = "0.5";
        confirm_os_window_close = 0;
      };
    };

    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
      ];
    };

    gh = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "YINGVAY";
      userEmail = "d.hendo308@gmail.com";
    };
  };
}
