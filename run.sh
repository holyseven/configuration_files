
sudo apt install vim 
# some checking (vim --version, +python or +python3) for YouCompleteMe
sudo apt-get install python-dev python3-dev
sudo apt-get install build-essential cmake
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/holyseven/configuration_files.git
# copy .vimrc to ~/  # this is a customed vim configuration file

vim +PluginInstall +qall
# then following the steps in https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64, 
# summary below
cd ~/.vim/bundle/YouCompleteMe/
./install.py

if 
Exuberant Ctags not found in PATH. You need to install Ctags to make Indexer work.
sudo apt-get install exuberant-ctags

sudo apt install vim-gnome
