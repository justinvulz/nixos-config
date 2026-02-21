{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.waybar.enable = true;
  programs.waybar.style = ./../../../config/waybar/style.css;
  programs.waybar.settings = builtins.fromJSON (
    builtins.readFile ./../../../config/waybar/config.jsonc
  );
  # {
  # mainBar = {
  #   "layer" = "top";
  #   "position" = "top";

  #   "modules-left" = [
  #     "niri/workspaces"
  #     "custom/right-arrow-dark"
  #   ];
  #   "modules-center" = [
  #     "custom/left-arrow-dark"
  #     "clock#1"
  #     "custom/left-arrow-light"
  #     "custom/left-arrow-dark"
  #     "clock#2"
  #     "custom/right-arrow-dark"
  #     "custom/right-arrow-light"
  #     "clock#3"
  #     "custom/right-arrow-dark"
  #   ];
  #   "modules-right" = [
  #     "custom/left-arrow-dark"
  #     "pulseaudio"
  #     "custom/left-arrow-light"
  #     "custom/left-arrow-dark"
  #     "memory"
  #     "custom/left-arrow-light"
  #     "custom/left-arrow-dark"
  #     "cpu"
  #     "custom/left-arrow-light"
  #     "custom/left-arrow-dark"
  #     "battery"
  #     "custom/left-arrow-light"
  #     "custom/left-arrow-dark"
  #     "disk"
  #     "custom/left-arrow-light"
  #     "custom/left-arrow-dark"
  #     "tray"
  #   ];

  #   "custom/left-arrow-dark" = {
  #     "format" = "";
  #     "tooltip" = false;
  #   };
  #   "custom/left-arrow-light" = {
  #     "format" = "";
  #     "tooltip" = false;
  #   };
  #   "custom/right-arrow-dark" = {
  #     "format" = "";
  #     "tooltip" = false;
  #   };
  #   "custom/right-arrow-light" = {
  #     "format" = "";
  #     "tooltip" = false;
  #   };

  #   "niri/workspaces" = {
  #     "disable-scroll" = true;
  #     "format" = "{name}";
  #   };

  #   "clock#1" = {
  #     "format" = "{:%a}";
  #     "tooltip" = false;
  #   };
  #   "clock#2" = {
  #     "format" = "{:%H:%M}";
  #     "tooltip" = false;
  #   };
  #   "clock#3" = {
  #     "format" = "{:%m-%d}";
  #     "tooltip" = false;
  #   };

  #   "pulseaudio" = {
  #     "format" = "{icon} {volume:2}%";
  #     "format-bluetooth" = "{icon}  {volume}%";
  #     "format-muted" = "MUTE";
  #     "format-icons" = {
  #       "headphones" = "";
  #       "default" = [
  #         ""
  #         ""
  #       ];
  #     };
  #     "scroll-step" = 5;
  #     "on-click" = "pamixer -t";
  #     "on-click-right" = "pavucontrol";
  #   };
  #   "memory" = {
  #     "interval" = 5;
  #     "format" = "Mem {}%";
  #   };
  #   "cpu" = {
  #     "interval" = 5;
  #     "format" = "CPU {usage:2}%";
  #   };
  #   "battery" = {
  #     "states" = {
  #       "good" = 95;
  #       "warning" = 30;
  #       "critical" = 15;
  #     };
  #     "format" = "{icon} {capacity}%";
  #     "format-icons" = [
  #       ""
  #       ""
  #       ""
  #       ""
  #       ""
  #     ];
  #   };
  #   "disk" = {
  #     "interval" = 5;
  #     "format" = "Disk {percentage_used:2}%";
  #     "path" = "/";
  #   };
  #   "tray" = {
  #     "icon-size" = 20;
  #   };
  # };
  # };
}

#   mainBar = {
#     # Main Config
#     "name" = "top_bar";
#     "layer" = "top"; # Waybar at top layer
#     "position" = "top"; # Waybar position (top|bottom|left|right)
#     "height" = 36; # Waybar height (to be removed for auto height)
#     "spacing" = 4; # Gaps between modules (4px)
#     "modules-left" = [
#       "custom/nixos"
#       "niri/workspaces"
#       "niri/submap"
#     ];
#     "modules-center" = [
#       "clock#time"
#       "custom/separator"
#       "clock#week"
#       "custom/separator_dot"
#       "clock#month"
#       "custom/separator"
#       "clock#calendar"
#     ];
#     "modules-right" = [
#       "wireplumber"
#       "bluetooth"
#       "network"
#       "group/misc"
#       "custom/logout_menu"
#     ];

#     "wireplumber" = {
#       "format" = "{volume}%{icon}";
#       "on-click" = "helvum";
#       "max-volume" = 150;
#       "format-icons" = [
#         ""
#         ""
#         ""
#       ];
#       "scroll-step" = 0.6;
#     };
#     # Modules Config
#     "hyprland/workspaces" = {
#       "on-click" = "activate";
#       # "format" = "{icon}";
#       # "format-icons" = {
#       #   "1" = "󰲠";
#       #   "2" = "󰲢";
#       #   "3" = "󰲤";
#       #   "4" = "󰲦";
#       #   "5" = "󰲨";
#       #   "6" = "󰲪";
#       #   "7" = "󰲬";
#       #   "8" = "󰲮";
#       #   "9" = "󰲰";
#       #   "10" = "󰿬";
#       #   "special" = "";

#       #   # "active" = "";
#       #   # "default" = "";
#       #   # "empty" = ""
#       # };
#       "show-special" = true;
#       # "persistent-workspaces" = {
#       #    "*" = 10;
#       # };
#     };

#     "custom/nixos" = {
#       "format" = " 󱄅";
#       "tooltip" = false;
#       # "on-click" = "nu -c neofetch";
#     };

#     "hyprland/submap" = {
#       "format" = "<span color='#a6da95'>Mode:</span> {}";
#       "tooltip" = false;
#     };

#     "clock#time" = {
#       "format" = "{:%I:%M %p %Ez}";
#       # "locale" = "en_US.UTF-8";
#       # "timezones" = [ "Europe/Kyiv", "America/New_York" ],
#     };

#     "custom/separator" = {
#       "format" = "|";
#       "tooltip" = false;
#     };

#     "custom/separator_dot" = {
#       "format" = "•";
#       "tooltip" = false;
#     };

#     "clock#week" = {
#       "format" = "{:%a}";
#     };

#     "clock#month" = {
#       "format" = "{:%h}";
#     };

#     "clock#calendar" = {
#       "format" = "{:%F}";
#       "tooltip-format" = "<tt><small>{calendar}</small></tt>";
#       "actions" = {
#         "on-click-right" = "mode";
#       };
#       "calendar" = {
#         "mode" = "month";
#         "mode-mon-col" = 3;
#         "weeks-pos" = "right";
#         "on-scroll" = 1;
#         "on-click-right" = "mode";
#         "format" = {
#           "months" = "<span color='#f4dbd6'><b>{}</b></span>";
#           "days" = "<span color='#cad3f5'><b>{}</b></span>";
#           "weeks" = "<span color='#c6a0f6'><b>W{}</b></span>";
#           "weekdays" = "<span color='#a6da95'><b>{}</b></span>";
#           "today" = "<span color='#8bd5ca'><b><u>{}</u></b></span>";
#         };
#       };
#     };

#     "clock" = {
#       "format" = "{:%I:%M %p %Ez | %a • %h | %F}";
#       "format-alt" = "{:%I:%M %p}";
#       "tooltip-format" = "<tt><small>{calendar}</small></tt>";
#       # "locale" = "en_US.UTF-8";
#       # "timezones" = [ "Europe/Kyiv"; "America/New_York" ],
#       "actions" = {
#         "on-click-right" = "mode";
#       };
#       "calendar" = {
#         "mode" = "month";
#         "mode-mon-col" = 3;
#         "weeks-pos" = "right";
#         "on-scroll" = 1;
#         "on-click-right" = "mode";
#         "format" = {
#           "months" = "<span color='#f4dbd6'><b>{}</b></span>";
#           "days" = "<span color='#cad3f5'><b>{}</b></span>";
#           "weeks" = "<span color='#c6a0f6'><b>W{}</b></span>";
#           "weekdays" = "<span color='#a6da95'><b>{}</b></span>";
#           "today" = "<span color='#8bd5ca'><b><u>{}</u></b></span>";
#         };
#       };
#     };

#     "bluetooth" = {
#       "format" = "󰂯";
#       "format-disabled" = "󰂲";
#       "format-connected" = "󰂱 {device_alias}";
#       "format-connected-battery" = "󰂱 {device_alias} (󰥉 {device_battery_percentage}%)";
#       # "format-device-preference" = [ "device1"; "device2" ], # preference list deciding the displayed device
#       "tooltip-format" = ''
#         {controller_alias}	{controller_address} ({status})

#         {num_connections} connected'';
#       "tooltip-format-disabled" = "bluetooth off";
#       "tooltip-format-connected" = ''
#         {controller_alias}	{controller_address} ({status})

#         {num_connections} connected

#         {device_enumerate}'';
#       "tooltip-format-enumerate-connected" = "{device_alias}	{device_address}";
#       "tooltip-format-enumerate-connected-battery" =
#         "{device_alias}	{device_address}	({device_battery_percentage}%)";
#       "max-length" = 35;
#       # "on-click" = "nu -c bluetooth_toggle";
#       "on-click-right" = "blueman-manager";
#     };

#     "network" = {
#       "format" = "󰤭";
#       "format-wifi" = "{icon}({signalStrength}%){essid}";
#       "format-icons" = [
#         "󰤯"
#         "󰤟"
#         "󰤢"
#         "󰤥"
#         "󰤨"
#       ];
#       "format-disconnected" = "󰤫 Disconnected";
#       "tooltip-format" = "wifi <span color='#ee99a0'>off</span>";
#       "tooltip-format-wifi" =
#         ''
#           SSID: {essid}({signalStrength}%); {frequency} MHz
#           Interface: {ifname}
#           IP: {ipaddr}
#           GW: {gwaddr}

#           <span color='#a6da95'>{bandwidthUpBits}</span>	<span color='#ee99a0'>{bandwidthDownBits}</span>	<span color='#c6a0f6'>󰹹{bandwidthTotalBits}</span>'';
#       "tooltip-format-disconnected" = "<span color='#ed8796'>disconnected</span>";
#       # "format-ethernet" = "󰈀 {ipaddr}/{cidr}";
#       # "format-linked" = "󰈀 {ifname} (No IP)";
#       # "tooltip-format-ethernet" ="Interface: {ifname}\nIP: {ipaddr}\nGW: {gwaddr}\nNetmask: {netmask}\nCIDR: {cidr}\n\n<span color='#a6da95'>{bandwidthUpBits}</span>\t<span color='#ee99a0'>{bandwidthDownBits}</span>\t<span color='#c6a0f6'>󰹹{bandwidthTotalBits}</span>";
#       "max-length" = 35;
#       # "on-click" = "nu -c wifi_toggle";
#       # "on-click-right" = "wezterm start nmtui";
#     };

#     "idle_inhibitor" = {
#       "format" = "{icon}";
#       "format-icons" = {
#         "activated" = "󰛐";
#         "deactivated" = "󰛑";
#       };
#       "tooltip-format-activated" = "idle-inhibitor <span color='#a6da95'>on</span>";
#       "tooltip-format-deactivated" = "idle-inhibitor <span color='#ee99a0'>off</span>";
#       "start-activated" = true;
#     };

#     "custom/logout_menu" = {
#       "return-type" = "json";
#       "exec" = "echo '{ \"text\":\"󰐥\", \"tooltip\": \"logout menu\" }'";
#       "interval" = "once";
#       "on-click" = "nu -c wlogout";
#     };

#   };
