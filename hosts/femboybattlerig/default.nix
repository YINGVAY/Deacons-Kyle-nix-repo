{
  imports = [
    ../../roles/desktop.nix

    ./hardware.nix
    ./storage.nix
  ];

  networking.hostName = "femboybattlerig";
  
  base.user.deacon.enable = true;

  base.hyprland.enable = true;

  #base.virtualisation.enable = true;

 
}