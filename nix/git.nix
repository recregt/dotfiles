{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "recregt";
      user.email = "203110092+recregt@users.noreply.github.com";
      init.defaultBranch = "main";
      core = {
        editor = config.home.sessionVariables.EDITOR;
        autocrlf = "input";
      };
      pull.rebase = true;
      push.autoSetupRemote = true;
      diff.tool = "delta";
      merge.conflictstyle = "diff3";
      color.ui = "auto";
      credential."https://github.com".helper = [
        ""
        "!${pkgs.gh}/bin/gh auth git-credential"
      ];
      credential."https://gist.github.com".helper = [
        ""
        "!${pkgs.gh}/bin/gh auth git-credential"
      ];
    };
  };
}