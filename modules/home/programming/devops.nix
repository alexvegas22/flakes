{ pkgs, ... }: {
  home.packages = with pkgs; [
    awscli
    kubectl
    kubernetes
    kubernetes-helm
    podman
    vault
  ];
}
