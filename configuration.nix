{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.git = ''
		cat > ${home}/.gitconfig << EOF
[user]
	name = typovrak
	email = typovrak@gmail.com
[init]
	defaultBranch = main
[pull]
	rebase = true
[push]
	autoSetupRemote = true
EOF
		chown ${username}:${group} ${home}/.gitconfig
		chmod 644 ${home}/.gitconfig
	'';

	environment.systemPackages = with pkgs; [
		git
		lazygit
	];
}
