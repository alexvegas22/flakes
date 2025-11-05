{ pkgs, ... }: {
  programs.dconf.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
