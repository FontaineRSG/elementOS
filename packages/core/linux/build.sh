prepare(){
  cp /buildsystem/linux/.config $dendro_buildroot/.config
  cd $dendro_buildroot
  make olddefconfig
  make menuconfig
  echo "prepared linux kernel for building"
}

build(){
  cd $dendro_buildroot
  make all -j$(nproc)
  make htmldocs -j$(nproc)
}

install(){

  cd $dendro_buildroot
  local modulesdir="$dendro_installloc/usr/lib/modules/6.13.5-geonix"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  /usr/bin/install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$dendro_installloc/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build
}



