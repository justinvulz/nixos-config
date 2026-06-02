{
  niri =
    { inputs, pkgs, ... }:
    {

      programs.niri.enable = true;
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd niri-session";
            user = "greeter";
          };
        };
      };

      environment.variables.NIXOS_OZONE_WL = "1";
      environment.systemPackages = with pkgs; [
        tuigreet
        #   inputs.hyprswitch.packages.x86_64-linux.default
      ];

    };
}
