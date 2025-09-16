#zsh setup

sudo apt install zsh -y

chsh -s $(which zsh) #no root

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting && git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete && curl https://raw.githubusercontent.com/yvan-allioux/public-setup/main/.zshrc > ~/.zshrc


