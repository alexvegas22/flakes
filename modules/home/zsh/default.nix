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
      v34l="ssh serv@v34l.com";
      git-v34l="ssh git@v34l.com";

      # other
      ls="ls --color=auto";
      grep="grep --color=auto";
      shem="emacs -nw";
      sshem="sudo emacs -nw";
      smake="sudo make clean install";
    };

    initExtra = ''
      export KUBECONFIG=$HOME/.kube/config
      export NIX_PATH=flakes=/home/alex/flakes:nixpkgs=nixpkgs
      export KREW_ROOT=$HOME/.krew
      export PATH="${pkgs.krew}/bin:${pkgs.nix}/bin:${pkgs.stdenv}/bin:${pkgs.bash}/bin:${pkgs.zsh}/bin:$KREW_ROOT/bin:$PATH"
      if [ -f ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
        source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      fi
    '';
           
  };
}
