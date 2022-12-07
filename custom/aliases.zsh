
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
alias ns='nvidia-smi'
alias rb='gio trash'

alias ghremote="git remote add origin https://github.com/$1"
