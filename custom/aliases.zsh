
if (( $+commands[exa] )); then
	alias ls='exa'
	alias ll='exa -alF'
	alias la='exa -a'
	alias l='exa -F'
fi

if (( $+commands[nvim] )); then
	alias vi=nvim
	alias vim=nvim
	alias vimdiff='nvim -d'
fi

if (( $+commands[gh] )); then
	alias ghr='gh repo'
	alias ghb='gh browse'
fi

alias src='omz reload'

alias ca='conda activate'
alias cc='conda create -n'
alias ns='nvidia-smi'
alias rb='gio trash'

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
	nvim +qall

	git -C ~/bin/tmux-conf pull
	~/.tmux/plugins/tpm/scripts/install_plugins.sh
	~/.tmux/plugins/tpm/scripts/update_plugin.sh all

	git -C ~/bin/oh-my-zsh-custom pull
	~/bin/oh-my-zsh-custom/apps-local-install.sh
	omz reload
}
