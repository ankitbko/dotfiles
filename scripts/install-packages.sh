# install zoxide batcat
echo "Installing zoxide and bat..."
sudo apt update && apt install -y zoxide bat

# install fzf
echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

# install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting plugin for Oh My Zsh..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install zsh-autosuggestions
echo "Installing zsh-autosuggestions plugin for Oh My Zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions