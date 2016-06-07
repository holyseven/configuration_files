sudo apt-get update
sudo apt-get install -y terminator chromium-browser tmux qtcreator meld git glances

# git ssh 
# https://help.github.com/articles/checking-for-existing-ssh-keys/


# vim install
# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
# https://github.com/yangyangwithgnu/use_vim_as_ide#1
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev git
git clone git@github.com:vim/vim.git
cd vim/
./configure --with-features=huge --enable-pythoninterp --enable-multibyte --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
sudo make install

# vim plugins
sudo apt-get install exuberant-ctags
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
## Then copy the .vimrc and .ycm_....py to ~/
## Enter vim or gvim to install plugins.
## for the plugin youcompleteme, there is something to do. see https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64

## cuda 
# https://developer.nvidia.com/cuda-downloads
# Maybe need reboot

# opencv
# http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html
sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install libatlas-base-dev

mkdir ~/phdwork
mkdir ~/phdwork/opencv2.4
mkdir ~/phdwork/opencv3
cd ~/phdwork
git clone https://github.com/Itseez/opencv_contrib.git

# This is interesting`
sudo apt-get build-dep opencv

cd ~/phdwork/opencv2.4
git clone https://github.com/Itseez/opencv.git --branch 2.4
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local/opencv2.4 -D OPENCV_EXTRA_MODULES_PATH=/home/jacques/phdwork/opencv_contrib/modules ..
sudo make install -j8


cd ~/phdwork/opencv3
git clone https://github.com/Itseez/opencv.git
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local/opencv3 -D OPENCV_EXTRA_MODULES_PATH=/home/jacques/phdwork/opencv_contrib/modules -D WITH_TBB=ON -D WITH_V4L=ON WITH_QT=ON -D WITH_OPENGL=ON -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF ..
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local/opencv3 -D WITH_TBB=ON -D WITH_V4L=ON WITH_QT=ON -D WITH_OPENGL=ON -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF ..
sudo make install -j8


# CUDNN v4
# Download, dezip, and go to the path
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/cudnn.h /usr/local/cuda/include/
sudo ldconfig

# caffe
sudo apt-get install libatlas-base-dev
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
# go to path caffe, mkdir build, change cmakelist.txt

# set(CMAKE_PREFIX_PATH "/usr/local/opencv3")
# find_package( OpenCV 3 REQUIRED )

# go to build 
# cmake ..
# make all -j8


# Set caffe to the path
sudo gvim .bachrc
# add those at end
export CAFFE_ROOT=/home/jacques/phdwork/caffe
export PATH=$CAFFE_ROOT/build/tools:$PATH

# Then in the terminator
source .bachrc
