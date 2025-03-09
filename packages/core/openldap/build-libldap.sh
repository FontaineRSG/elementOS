install() {

  cd ${dendro_buildroot}
  for dir in include libraries doc/man/man3 ; do
    pushd ${dir}
    make DESTDIR="${dendro_installloc}" install
    popd
  done
  /usr/bin/install -Dm644 -t "$dendro_installloc/usr/share/man/man5" doc/man/man5/ldap.conf.5

  # remove duplicate conf files
  rm "${dendro_installloc}"/etc/openldap/*.default

  # shared library versioning
  ln -sf liblber.so "${dendro_installloc}"/usr/lib/liblber.so.2
  ln -sf libldap.so "${dendro_installloc}"/usr/lib/libldap.so.2

  # license
  /usr/bin/install -Dm644 -t "${dendro_installloc}/usr/share/licenses/libldap" LICENSE
}

build(){
  echo "nothing to build"
}

prepare(){
  echo "openldap has a long-ass dendro script tbh"
}
