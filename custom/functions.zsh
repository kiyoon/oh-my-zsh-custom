ghremote() {
	if [ $# -eq 1 ]; then
		echo "git remote add origin https://github.com/$1"
		git remote add origin "https://github.com/$1"
	elif [ $# -eq 2 ]; then
		echo "git remote add $1 https://github.com/$2"
		git remote add "$1" "https://github.com/$2"
	else
		echo "Usage: ghremote [remotename=origin] [username]/[reponame]"
		return 1
	fi
}


envpull() {
	git -C ~/bin/vimrc4ubuntu pull
	~/bin/vimrc4ubuntu/install-linux.sh
	nvim +PlugInstall +qall
	nvim +PlugUpdate +qall

	git -C ~/bin/tmux-conf pull
	~/.tmux/plugins/tpm/scripts/install_plugins.sh
	~/.tmux/plugins/tpm/scripts/update_plugin.sh all

	git -C ~/bin/oh-my-zsh-custom pull
	~/bin/oh-my-zsh-custom/apps-local-install.sh
	omz reload
}

license() {
	if [ $# -ne 1 ]; then
		echo "Usage: license [name]"
		echo
		echo "Available licenses:"
		curl -s https://api.github.com/licenses | jq -r '.[].key'
		return 1
	fi

	curl -s "https://api.github.com/licenses/$1" | jq -r '.body'
}
