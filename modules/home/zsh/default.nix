{ hostname
, config
, pkgs
, ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];

    };
    environment = {
      variables = {
#        NIX_PATH=nixos-config=/home/alex/nixos-config:nixpkgs=nixpkgs;
#        PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH";
        KUBECONFIG=~/.kube/config;
        
      };
    };
    shellAliases = {    

      # nixos
      ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      nbs = "sudo nixos-rebuild switch --flake ~/nixos-config";

      # python
      piv = "python -m venv .venv";
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
  };
}
