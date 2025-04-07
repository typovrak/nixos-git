# nixos-git

nixos-git = fetchGit {
    url = "https://github.com/typovrak/nixos-git.git";
	ref = "main";
};

(import "${nixos-git}/configuration.nix")
