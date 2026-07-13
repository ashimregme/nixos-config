{
  config,
  pkgs,
  flakeRoot,
  username,
  ...
}:
{
  environment.sessionVariables = {
    LIBVIRT_DEFAULT_URI = [ "qemu:///system" ];
    NIX_CONF_DIR = flakeRoot;
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