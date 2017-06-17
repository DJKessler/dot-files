# cross compile toolchain
toolchain_dir="$HOME/Projects/armadillo/armadillo-toolchain"
if [ -d "$toolchain_dir/usr/bin" ]; then
  export PATH="$PATH:$toolchain_dir/usr/bin"
  toolchain_file="$toolchain_dir/usr/share/buildroot/toolchainfile.cmake"
  alias cmake-arm="$toolchain_dir/usr/bin/cmake"
  alias cmake-arm-cfg="cmake-arm -DCMAKE_TOOLCHAIN_FILE=$toolchain_file"
fi
