#
## .zprofile

export GOPATH=$HOME/go
export NXTOOLS=/opt/devkitpro/tools
#export CARGO_HOME=$HOME/.cargo
#export CARGO=$HOME/.cargo/bin
#export LINARO=$HOME/.apps/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu
#export LIN=$HOME/.app/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabi
export PICO=$HOME/pico
export PICO_SDK_PATH=$HOME/.apps/pico-sdk
export BL60X_SDK_PATH=$HOME/git/bl602/bl_iot_sdk
export CONFIG_CHIP_NAME=BL602
#export CMAKE_C_COMPILER=/usr/bin/arm-none-eabi-gcc
#export CMAKE_CXX_COMPILER=/usr/bin/arm-none-eabi-g++
export FLYCTL_INSTALL=$HOME/.fly

export PATH=$PATH:/home/michael/.local/bin:$HOME/.bin:$GOPATH/bin:/usr/local/go/bin:/bin:$NXTOOLS/bin:$FLYCTL_INSTALL/bin:$LINARO/bin:$LIN/bin
