{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.git = ''
		cp ${./.gitconfig} ${home}/.gitconfig
		chown ${username}:${group} ${home}/.gitconfig
		chmod 600 ${home}/.gitconfig
	'';

	environment.systemPackages = with pkgs; [
		git
	];
}
