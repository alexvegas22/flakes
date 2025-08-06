{ pkgs, ... }: {
  home.packages = with pkgs; [
    awscli
    kubectl
    kube-score
    kubernetes
    kubernetes-helm
    podman
  ];
}
