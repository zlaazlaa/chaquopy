# #!/bin/bash

# set -eu

# export NDK_TOOLCHAIN=/opt/android-sdk/ndk/27.2.12479018/toolchains/llvm/prebuilt/linux-x86_64
# export THE_TARGET=aarch64-linux-android24
# export THE_TARGET_WITHOUT_API=aarch64-linux-android
# export THE_PREFIX=/opt/android-sdk/ndk/27.2.12479018/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr
# export PREFIX=/home/ubuntu/chaquopy/server/pypi/packages/tiktoken/PREFIX
# export HOST_TRIPLE=aarch64-linux-android

# export LDSHARED="$NDK_TOOLCHAIN/bin/clang++ -fuse-ld=lld -shared --target=$THE_TARGET"

# echo ">>> The target is: $THE_TARGET_WITHOUT_API"

# cat > linker_cmd.sh <<_EOF
# #!/bin/bash
# set -eu
# $LDSHARED \$@
# _EOF
# chmod a+x linker_cmd.sh

# echo ">>> LDSHARED IS: $LDSHARED"
# echo ">>> Linker command:"
# cat linker_cmd.sh

# cat > config.tmp <<_EOF
# [target.$THE_TARGET_WITHOUT_API]
# linker = "$(realpath linker_cmd.sh)"
# rustflags = ["-C", "link-args=-L$THE_PREFIX/lib --target=$THE_TARGET  -Wl,--build-id=sha1 -Wl,--no-rosegment -Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libgcc_real.a -Wl,--exclude-libs,libunwind.a -lm"]

# [term]
# quiet = false          # whether cargo output is quiet
# verbose = true         # whether cargo provides verbose output
# color = 'auto'         # whether cargo colorizes output
# progress.when = 'auto' # whether cargo shows progress bar
# progress.width = 80    # width of progress bar
# _EOF

# cat config.tmp
# #read

# mkdir -p .cargo
# mv config.tmp .cargo/config

# # export CARGO_BUILD_TARGET=$HOST_TRIPLE
# # export PYO3_CROSS_LIB_DIR=/home/ubuntu/miniconda3/envs/build-wheel-3.12/lib/python3.12
# # export PYO3_CROSS_PYTHON_VERSION=3.12
# #export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER=/opt/android-sdk/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64/bin/ld.lld

# # python -m pip install --target=$PREFIX .
# python setup.py build_ext
# #python setup.py install
# #python -m pip install .
