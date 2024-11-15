{pkgs, lib, config, ... } : {
  
  virtualisation.docker.enable = true;
  users.users.justin.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    docker-compose  
  ];
}
