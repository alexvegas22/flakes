{
  pkgs,
  lib,
  ...
}: {
  documentation = {
    man.cache.enable = true;
    dev.enable = true;
  };
}
