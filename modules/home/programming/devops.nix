{ pkgs, ... }: {
  home.packages = with pkgs; [
    awscli
    kubectl
    velero
    kube-score
    kubebuilder
    kubernetes
    kubernetes-helm
    omnictl
    podman
  ];
}
