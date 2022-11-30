# My ZSH Custom for local/SSH users

I develop often on remote servers that I don't have `sudo` permission. This awesome zsh settings allow you to install **locally, without root permission**.


## Setup

Install zsh (with root):

```bash
sudo apt install zsh
chsh -s $(which zsh)
```

Install zsh locally (if you can't `sudo apt install zsh`):

```bash
source <(curl -sS https://raw.githubusercontent.com/kiyoon/oh-my-zsh-custom/master/zsh-local-install.sh)
```

Add the lines below to your `~/.bashrc` (if you don't have root permission and can't do `chsh`):

```bash
if [[ ($- == *i*) ]];
then
 export SHELL=.local/bin/zsh
 exec .local/bin/zsh -l
fi
```

Install oh-my-zsh:

```zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Clone this repo (recurse submodules):

```zsh
mkdir ~/bin
git clone --recurse-submodules https://github.com/kiyoon/oh-my-zsh-custom ~/bin/oh-my-zsh-custom
mv ~/.zshrc ~/.zshrc.bak
ln -s ~/bin/oh-my-zsh-custom/.zshrc ~/.zshrc
```

Install apps:

```zsh
##### Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)" sh -b "$HOME/.local/bin" -y

##### zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

##### fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

pip3 install --user pygments		# colorize (ccat)
pip3 install --user thefuck			# fix last command
conda config --set changeps1 False	# suppress conda environment name in favour of Starship
```

(Optional) Apps when you have root permission:

```zsh
sudo apt update -y
sudo apt install -y tig exa xclip

##### GitHub Cli
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

gh auth login
gh alias set r repo
```

## Useful commands

Update all plugins:

```zsh
cd $ZSH_CUSTOM
git submodule update --remote
```

