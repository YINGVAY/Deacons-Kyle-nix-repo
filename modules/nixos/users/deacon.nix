{ config, inputs, lib, self, pkgs, ... }:
let
  inherit (lib)
    mkEnableOption
    mkIf
    mkMerge
    mkOption
    recursiveUpdate
    types
    ;

  cfg = config.base;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options.base = {
    user.deacon = {
      enable = mkEnableOption "deacon User";

      homeConfig = mkOption {
        type = types.attrs;
        default = { };
      };

      baseConfig = mkOption {
        type = types.attrs;
        default = { };
      };
    };
  };

  config = mkIf cfg.user.deacon.enable {
    users = {
      defaultUserShell=pkgs.fish;
      users.deacon = {
        isNormalUser = true;
        description = "deacon";
        extraGroups = config.shared.system.users.perms;
      };
    };

    security.sudo.extraRules= [
      { users = [ "deacon" ];
          commands = [
            { command = "ALL" ;
              options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
            }
          ];
        }
    ];

    home-manager.extraSpecialArgs = { inherit inputs self; };
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.deacon = mkMerge [
      cfg.homeConfig
      cfg.user.deacon.homeConfig
      {
        imports = [
          ../../home
          (../../../home/deacon + "/${config.networking.hostName}.nix")
        ];

        home.username = "deacon";
        home.homeDirectory = "/home/deacon";

        programs.home-manager.enable = true;

        base = recursiveUpdate
          cfg.homeBaseConfig
          cfg.user.deacon.baseConfig;
      }
    ];
  };
}
