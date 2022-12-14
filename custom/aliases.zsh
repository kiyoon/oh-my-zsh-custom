
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
	alias ghc='gh repo clone'
	ghck() {
		gh repo clone kiyoon/$1
	}
fi

alias src='omz reload'

alias ca='conda activate'
alias cc='conda create -n'
alias ns='nvidia-smi'
alias rb='gio trash'

