#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master
function doIt() {
	
	echo "Sync config scripts"
	echo "============================"
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".dropbox" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-GPL.txt" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "Dictionaries"  \
		--exclude "QuickLooksPlugins"  \
		--exclude "root"  \
		-av --no-perms . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile
