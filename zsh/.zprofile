#
## .zprofile

export GOPATH=$HOME/go
export NXTOOLS=/opt/devkitpro/tools
#export CARGO_HOME=$HOME/.cargo
#export CARGO=$HOME/.cargo/bin
export LINARO=$HOME/.apps/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu
export LIN=$HOME/.app/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi
export PICO=$HOME/pico
export PICO_SDK_PATH=$HOME/.apps/pico-sdk
export CMAKE_C_COMPILER=/usr/bin/arm-none-eabi-gcc
#export CMAKE_CXX_COMPILER=/usr/bin/arm-none-eabi-g++
export LUAROCKS=$HOME/.luarocks
export LUA_PATH='/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;/usr/lib64/lua/5.4/?.lua;/usr/lib64/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/michael/.luarocks/share/lua/5.4/?.lua;/home/michael/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/lib64/lua/5.4/?.so;/usr/lib64/lua/5.4/loadall.so;./?.so;/home/michael/.luarocks/lib/lua/5.4/?.so;/usr/lib/lua/5.4/?.so'
export PATH=$PATH:/home/michael/.local/bin:$GOPATH/bin:/usr/local/go/bin:/bin:$NXTOOLS/bin
