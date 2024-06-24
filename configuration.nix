{...}: {
  system.stateVersion = "23.05";

  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    virtualHosts."test-gh.4c9d7b.flakery.xyz" = {
      locations."/" = {
        extraConfig = ''
          add_header Content-Type text/html;
        '';
        return = ''
          200 "<html><body>Hello from Flakery</body></html>
        '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [80];
}
