#!/bin/bash
export PATH=/usr/lib/ccache:$PATH
mkdir ~/blender-git
cd ~/blender-git
git clone https://git.blender.org/blender.git
cd blender
git submodule update --init --recursive
git submodule foreach git checkout master
git submodule foreach git pull --rebase origin master
make update
ls
mkdir build-dir
ls
cd build-dir
ls
cmake ../blender/build_files/build_environment -DDOWNLOAD_DIR=$(pwd)/download -DHARVEST_TARGET=$(pwd)/../lib/linux_x86_64
ls
make -j2 install
ls
cmake ../blender -C../blender/build_files/cmake/config/blender_release.cmake -DOPENAL_LIBRARY=../lib/linux_x86_64/openal/lib/libopenal.a -DOPENAL_INCLUDE_DIR=../lib/linux_x86_64/openal/include
#cd ~/blender-git

#printf 'y\n' | ./blender/build_files/build_environment/install_deps.sh --with-all
#cd ~/blender-git/blender
#make full
