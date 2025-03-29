{
  config,
  pkgs,
  username,
  ...
}:
{
  environment.sessionVariables.LIBVIRT_DEFAULT_URI = [ "qemu:///system" ];
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        ovmf = {
          enable = true;
          packages = [
            pkgs.OVMFFull
          ];
        };
        swtpm.enable = true;
      };
    };
  };
}