# linux-configs
Linux workstation configration files

```
sudo apt-get update
sudo apt-get install git
```

Get Config
```
cd ~
git clone --no-checkout  https://github.com/mluatgmxdotch/linux-configs.git configs
cd configs
git config user.name "tux"
git config user.email "tux@localhost"
git config core.worktree "../../"
git reset --hard origin/master
```

Set Terminal
```
sudo update-alternatives --config x-terminal-emulator
```

Install Micrsoft Fonts
```
sudo apt update && sudo apt install ttf-mscorefonts-installer
```

Install termnus fonts 
https://files.ax86.net/terminus-ttf/#download

Install oh-my-zsh now
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
```

Install swiss german

https://addons.mozilla.org/en-US/firefox/addon/dictionary-german-swiss/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search


Install Lxd & Ansible
```
sudo snap install lxd
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```
