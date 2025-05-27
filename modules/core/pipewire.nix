{ pkgs, ... }: {
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig  = {
      pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 512;
          "default.clock.min-quantum" = 512;
          "default.clock.max-quantum" = 512;
        };
      };
      pipewire-pulse."92.low-latency" = {
        context.modules = [
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              pulse.min.req = "512/48000";
              pulse.default.req = "512/48000";
              pulse.max.req = "512/48000";
              pulse.min.quantum = "512/48000";
              pulse.max.quantum = "512/48000";
            };
          }
        ];
        stream.properties = {
          node.latency = "512/48000";
          resample.quality = 1;
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
