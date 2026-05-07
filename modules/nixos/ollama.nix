{
  ollama =
    {
      config,
      pkgs,
      lib,
      inputs,
      ...
    }:

    {

      services.ollama = {
        enable = true;
        package = pkgs.ollama-vulkan;
        environmentVariables = {
          "OLLAMA_ORIGINS" = "*";
        };
        host = "0.0.0.0";
      };
      networking.firewall.allowedTCPPorts = [
        11434
      ];

    };
}
