{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible
    awscli
    kubectl
    velero
    k9s
    kube-score
    kubebuilder
    kubernetes
    kubernetes-helm
    talosctl
    fluxcd
    argocd
    vault
    omnictl
    opentofu
    podman
  ];
}
