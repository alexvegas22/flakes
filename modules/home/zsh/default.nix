{ config
, pkgs
, ...
} @ args: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "kubectl"];
    };

    shellAliases = {

      # nixos
      ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      nbst = "sudo nixos-rebuild switch --flake ~/flakes#touch";
      nbsr = "sudo nixos-rebuild switch --flake ~/flakes#rugged";
      update = "nix flake update --flake ~/flakes" ;
      # python
      pmv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      # server
      serv="ssh serv@192.168.0.30";
      v34l="ssh -p 2222 alex@v34l.com";
      git-v34l="ssh git@v34l.com";

      # other
      ls="ls --color=auto";
      grep="grep --color=auto";
      e="emacsclient -nw";
      se="sudo emacsclient -nw";
      smake="sudo make clean install";
    };

    initContent = ''
      export KUBECONFIG=$HOME/.kube/config
      export KREW_ROOT=$HOME/.krew
      export PATH="${pkgs.krew}/bin:${pkgs.nix}/bin:${pkgs.stdenv}/bin:${pkgs.bash}/bin:${pkgs.zsh}/bin:$KREW_ROOT/bin:$PATH"
      if [ -f ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
        source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      fi
      if [ -f '/home/alex/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/alex/Downloads/google-cloud-sdk/path.zsh.inc';
      fi

      if [ -f '/home/alex/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/alex/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

    '';

  };
}
