prepare(){
  echo "nothing to prepare"
}

build(){
  echo "nothing to build"
}

install(){
  cd $dendro_buildroot
  local builddir="$dendro_installloc/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    /usr/bin/install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$dendro_installloc/usr/share/doc"
  ln -sr "$builddir/Documentation" "$dendro_installloc/usr/share/doc/linux-6.13.5-geonix"
}
