
if (( $+commands[exa] )); then
	alias ls='exa'
	alias ll='exa -alF'
	alias la='exa -a'
	alias l='exa -F'
fi

if (( $+commands[nvim] )); then
	alias v=nvim
	alias vi=nvim
	alias vim=nvim
	alias vimdiff='nvim -d'
	alias diffview='nvim +DiffviewOpen'
	alias dv='nvim +DiffviewOpen'
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

# slurm
alias sq='squeue -u $USER'
idamnii() {
        srun --time=0-05:00:00 --gres=gpu:$2 --partition=PGR-Standard -w damnii$1 --cpus-per-task=$3 --pty bash
}
