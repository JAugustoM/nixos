{ ... }:
{
  den.aspects.virtualisation.libvirtd = { user, ... }: {

    nixos = { pkgs, ... }: {
      programs.dconf.enable = true;

      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };

      virtualisation.spiceUSBRedirection.enable = true;

      environment.systemPackages = with pkgs; [
        gnome-boxes
      ];

      users.users.${user.name}.extraGroups = [
        "libvirtd"
        "kvm"
      ];
    };
  };
}
