{
	pkgs,
	username,
	fullname,
	vars,
	lib,
	...
}:

{
	# users.group = {
	# 	"${username}" = {
	# 		gid = vars.defaultUserGID;
	# 	};
	# };
	
	users.users = {
		"${username}" = {
			# uid = vars.defaultUserUID;
			# group = "${username}";
			description = "${fullname}";
			isNormalUser = true;
			shell = pkgs.zsh;
			extraGroups = [
				"networkmanager"
				"wheel"
			];
		};
	};
}
