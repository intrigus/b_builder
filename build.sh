export PATH = /usr/lib/ccache:$PATH
mkdir ~/blender-git
cd ~/blender-git
git clone https://git.blender.org/blender.git
cd blender
git submodule update --init --recursive
git submodule foreach git checkout master
git submodule foreach git pull --rebase origin master
make update
cd ~/blender-git
./blender/build_files/build_environment/install_deps.sh
cd ~/blender-git/blender
make full
