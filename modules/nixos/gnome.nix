{ config, pkgs,lib, inputs, ... }:

{
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Disable all default GNOME applications.
  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = [ pkgs.gnome-tour ];
  services.xserver.excludePackages = [ pkgs.xterm ]; 
  environment.systemPackages = with pkgs; [
    graphite-gtk-theme
    pkgs.gnome.gnome-tweaks
    pkgs.gnomeExtensions.user-themes
  ];

}