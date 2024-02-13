{config, lib, pkgs, modulesPath, ...}: {
fileSystems."/" =
    { device = "/dev/disk/by-uuid/d7770e91-bafb-4e49-9c6a-d153105cdbc6";
      fsType = "ext4";
    };
}