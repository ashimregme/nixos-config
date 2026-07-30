{ pkgs, username, ... }:

{
  users.users.${username} = {
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
    hashedPasswordFile = "/home/${username}/nixos-config/users/${username}/password.hash";
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBGRJuGV74kt+oFdir+rNoy/cnJx640DIkFc47C+sfRR ashim@workstation"
    ];
  };

  users.groups.libvirtd.members = [ username ];

  system.activationScripts.setProfilePicture.text = ''
    mkdir -p /var/lib/AccountsService/{icons,users}
    cp /home/${username}/Pictures/profile-pic.jpg /var/lib/AccountsService/icons/${username}
    echo -e "[User]\nIcon=/var/lib/AccountsService/icons/${username}\n" > /var/lib/AccountsService/users/${username}

    chown root:root /var/lib/AccountsService/users/${username}
    chmod 0600 /var/lib/AccountsService/users/${username}

    chown root:root /var/lib/AccountsService/icons/${username}
    chmod 0444 /var/lib/AccountsService/icons/${username}
  '';
}
