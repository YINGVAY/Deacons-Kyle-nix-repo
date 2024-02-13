{config, lib, pkgs, modulesPath, ...}: {
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a73ba422-1f1c-49f5-b195-08037ecc77d9";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8060-8C14";
      fsType = "vfat";
    };
}