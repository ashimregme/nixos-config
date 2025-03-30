{
  pkgs,
  inputs,
  username,
  host,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.05";
      };
      programs.home-manager.enable = true; # Let Home Manager install and manage itself.
    };
    backupFileExtension = "backup";
  };

  users = {
    users.${username} = {
      isNormalUser = true;
      description = "Ashim Regmi";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "i2c"
        "adbusers"
        "libvirtd"
        "kvm"
        "qemu-libvirtd"
      ];
      # Generated using mkpasswd
      hashedPassword = "$6$p4bLCfzviuVdPdJQ$JHovVk/cj9VbKN3J5hsRde2Gc5U.snCDWsvhA0K3hYiFWgo1A.S8jWr08UT29VPDN5U5dT7..KlvcGIit4KYG/";
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBGRJuGV74kt+oFdir+rNoy/cnJx640DIkFc47C+sfRR ashim@workstation"
      ];
    };
    groups.libvirtd.members = ["${username}"];
  };

  services = {
    udev.packages = [
      pkgs.android-udev-rules
    ];
  };

  # set profile picture
  system.activationScripts.script.text = ''
    mkdir -p /var/lib/AccountsService/{icons,users}
    cp /home/ashim/Pictures/profile-pic.jpg /var/lib/AccountsService/icons/ashim
    echo -e "[User]\nIcon=/var/lib/AccountsService/icons/ashim\n" > /var/lib/AccountsService/users/ashim

    chown root:root /var/lib/AccountsService/users/ashim
    chmod 0600 /var/lib/AccountsService/users/ashim

    chown root:root /var/lib/AccountsService/icons/ashim
    chmod 0444 /var/lib/AccountsService/icons/ashim
  '';
}