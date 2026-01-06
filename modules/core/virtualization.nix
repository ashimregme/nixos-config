{
  config,
  pkgs,
  username,
  ...
}:
{
  environment.sessionVariables = {
    LIBVIRT_DEFAULT_URI = [ "qemu:///system" ];
    NIX_CONF_DIR = "/home/ashim/nixos-config";
  };
  virtualisation = {
    docker = {
      enable = true;
      extraPackages = [ pkgs.docker-buildx ];
    };
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
  };
}