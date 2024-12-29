{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    win-virtio
  ];
}