#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master
function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-GPL.txt" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "Sublime Text 2"  \
		-av --no-perms . ~
	if [ -d ~/Library ]; then
		if [ ! -d ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages-old ]; then
			mv ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages-old
			mv ~/Library/Application\ Support/Sublime\ Text\ 2/Packages ~/Library/Application\ Support/Sublime\ Text\ 2/Packages-old
			mv ~/Library/Application\ Support/Sublime\ Text\ 2/Pristine\ Packages ~/Library/Application\ Support/Sublime\ Text\ 2/Pristine\ Packages-old
			ln -sf `pwd`/Sublime\ Text\ 2/Installed\ Packages ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages
			ln -sf `pwd`/Sublime\ Text\ 2/Packages ~/Library/Application\ Support/Sublime\ Text\ 2/Packages
			ln -sf `pwd`/Sublime\ Text\ 2/Pristine\ Packages ~/Library/Application\ Support/Sublime\ Text\ 2/Pristine\ Packages
		fi
	fi
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
