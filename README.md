# linux-configs
Linux workstation configration files

## Get Config

```
sudo apt-get update
sudo apt-get install git
```

```
cd ~
git clone --no-checkout  https://github.com/mluatgmxdotch/linux-configs.git configs
cd configs
git config user.name "tux"
git config user.email "tux@localhost"
git config core.worktree "../../"
git reset --hard origin/master
```

# Set Terminal
```
sudo update-alternatives --config x-terminal-emulator
```
# Get Fonts
Microsoft Font
```
sudo apt update && sudo apt install ttf-mscorefonts-installer
```
Install Termnus fonts 
https://files.ax86.net/terminus-ttf/#download

# Install Shell
Install oh-my-zsh now
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
```
# Install Spelling
Install swiss german

https://addons.mozilla.org/en-US/firefox/addon/dictionary-german-swiss/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search

# Get Envs
Install Lxd & Ansible
```
sudo snap install lxd
init lxd
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```

# Gen SSH Keys
```
ssh-keygen -t rsa
```


# Provision machines
```
mkdir ~/work
cd ~/envs/lxd
ansible-playbook playbook.yml

# Disable update-grub

vim /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="text"
sudo update-grub


# Install Grub Theme

wget -P /tmp https://github.com/shvchk/poly-dark/raw/master/install.sh
less /tmp/install.sh
bash /tmp/install.sh
