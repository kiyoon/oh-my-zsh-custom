## Setup

Install zsh:

```bash

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

(Optional) If you have a root permission:

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
