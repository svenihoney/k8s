{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # https://devenv.sh/basics/
  env.KUBECONFIG = "/home/sven/.kube/config";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    fluxcd
    argocd
    kubectl
    talosctl
    kustomize
    age
    kubernetes-helm
    kubectl-node-shell
    cilium-cli
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/

  enterShell = ''
    export SOPS_AGE_KEY_FILE="$DEVENV_ROOT/age.agekey";
    export TALOSCONFIG="$DEVENV_ROOT/clusters/main/talos/generated/talosconfig";
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
