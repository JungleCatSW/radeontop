
# git submodule update --init --recursive

export PKG_CONFIG_PATH="$(pwd)/libpciaccess"
cd drm
./autogen.sh
make
cd ..

#cd libpciaccess
#./autogen.sh
#cd ..
