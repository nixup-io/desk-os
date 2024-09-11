{pkgs}: {modulesPath, ...}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    (modulesPath + "/virtualisation/qemu-vm.nix")
  ];

  config = {
    virtualisation = {
      memorySize = 8192;
      useBootLoader = true;
      useEFIBoot = true;
      qemu.options = [
        "-enable-kvm"
        "-vga virtio"
        "-display gtk,full-screen=on,grab-on-hover=on"
      ];
    };

    networking.hostName = "desk-os-demo";

    # Localization
    time.timeZone = "Europe/Brussels";
    i18n.defaultLocale = "nl_NL.UTF-8";
    services.xserver.xkb.layout = "nl";

    services.displayManager.autoLogin = {
      enable = true;
      user = "demo";
    };
    security.sudo.wheelNeedsPassword = false;
    users.users.demo = {
      createHome = true;
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      initialPassword = "demo";
    };

    system.stateVersion = "24.05";
  };
}
