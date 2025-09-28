{ pkgs, ... }: {
  home.packages = with pkgs; [
    awscli
    kubectl
    velero
    kube-score
    kubernetes
    kubernetes-helm
    omnictl
    podman
  ];
}
