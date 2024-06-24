{...}: {
  system.stateVersion = "23.05";

  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedOptimizations = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    virtualHosts."testing2.52b353.flakery.xyz" = {
      forceSSL = true;
      enableACME = true;
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
  security.acme = {
    acceptTerms = true;
    defaults.email = "foo@bar.com";
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
