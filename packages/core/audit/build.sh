prepare() {
  cd $dendro_buildroot/audit-userspace-4.0.3
  pwd
  ls ../
  # use /usr and /bin merge compatible paths in configs and services
  patch -Np1  -i ../audit-4.0-executable_paths.patch

  autoreconf -fiv
}

build() {
  local configure_options=(
    --enable-gssapi-krb5=yes
    --enable-systemd=yes
    --enable-zos-remote
    --libexecdir=/usr/lib/audit
    --prefix=/usr
    --runstatedir=/run
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-apparmor=yes
    --with-io_uring=yes
    --with-libcap-ng=yes
    --with-python3=yes
  )

  cd $dendro_buildroot/audit-userspace-4.0.3
  ls
  ./configure "${configure_options[@]}"
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install

  /usr/bin/install -vDm 644 $dendro_buildroot/audit-userspace-4.0.3/{{README,SECURITY}.md,ChangeLog} -t "dendro_installloc/usr/share/doc/audit/"

  # add rules.d dir to satisfy augenrules
  /usr/bin/install -vdm 755 "$dendro_installloc/etc/audit/rules.d/"
  # add config dir for audisp
  /usr/bin/install -vdm 755 "$dendro_installloc/etc/audisp"

  # add factory files
  /usr/bin/install -vdm 755 "$dendro_installloc/usr/share/factory/"
  cp -av "$dendro_buildroot/etc" "$dendro_installloc/usr/share/factory/"

  # add tmpfiles.d integration for factory files and file permissions
  /usr/bin/install -vDm 644 $dendro_buildroot/audit.tmpfiles "$dendro_installloc/usr/lib/tmpfiles.d/audit.conf"

  # remove legacy files
  rm -frv "$dendro_installloc/usr/lib/audit"
}

package_python-audit() {
  mv -v $dendro_buildroot/* "$dendro_installloc"
}
