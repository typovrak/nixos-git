{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.git = ''
		cp ${./.gitconfig} ${home}/.gitconfig
		chown ${username}:${group} ${home}/.gitconfig
		chmod 600 ${home}/.gitconfig

		mkdir -p ${home}/projects
		chown ${username}:${group} ${home}/projects
		chmod 755 ${home}/projects
	'';

	environment.systemPackages = with pkgs; [
		git
	];
}
