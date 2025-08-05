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

		mkdir -p ${home}/projects/freelancing
		chown ${username}:${group} ${home}/projects/freelancing
		chmod 755 ${home}/projects/freelancing

		mkdir -p ${home}/projects/freelancing/comet-data
		chown ${username}:${group} ${home}/projects/freelancing/comet-data
		chmod 755 ${home}/projects/freelancing/comet-data

		cp ${./.gitconfig-comet-data} ${home}/projects/freelancing/comet-data/.gitconfig
		chown ${username}:${group} ${home}/projects/freelancing/comet-data/.gitconfig
		chmod 600 ${home}/projects/freelancing/comet-data/.gitconfig
	'';

	environment.systemPackages = with pkgs; [
		git
	];
}
