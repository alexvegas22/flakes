{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible
    awscli
    cilium-cli
    kubectl
    velero
    k9s
    sops
    forgejo-cli
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
