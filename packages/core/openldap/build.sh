prepare() {
  cp openldap.* $dendro_buildroot
  cd $dendro_buildroot

  # change perms from 0644 to 0755
  sed -i 's|-m 644 $(LIBRARY)|-m 755 $(LIBRARY)|' libraries/{liblber,libldap}/Makefile.in

  # change rundir to /run/openldap
  sed -i 's|#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "ldapi"|#define LDAPI_SOCK LDAP_DIRSEP "run" LDAP_DIRSEP "openldap" LDAP_DIRSEP "ldapi"|' include/ldap_defaults.h
  sed -i 's|%LOCALSTATEDIR%/run|/run/openldap|' servers/slapd/slapd.{conf,ldif}
  sed -i 's|-$(MKDIR) $(DESTDIR)$(localstatedir)/run|-$(MKDIR) $(DESTDIR)/run/openldap|' servers/slapd/Makefile.in

  # modify upstream systemd service
  sed -i -e "s|EnvironmentFile.*|EnvironmentFile=-/etc/conf.d/slapd|" -e "s/slapd -d 0/\0 -u ldap -g ldap/" servers/slapd/slapd.service
}

_extra_modules=(
  'nssov'
  'autogroup'
  'lastbind'
  'passwd/sha2'
  'allowed'
  'noopsrch'
)


build() {
  export CC=clang
  export CXX=clang++
  cd $dendro_buildroot
  autoreconf -fvi
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var/lib/openldap \
    --sbindir=/usr/bin \
    --enable-dynamic \
    --enable-syslog \
    --enable-ipv6 \
    --enable-local \
    --enable-crypt \
    --enable-spasswd \
    --enable-modules \
    --enable-backends \
    --enable-argon2 \
    --with-argon2=libsodium \
    --disable-wt \
    --enable-overlays=mod \
    --with-cyrus-sasl \
    --with-threads
  #cp /usr/bin/libtool libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make

  # build extra modules
  for module in "${_extra_modules[@]}"; do
    make -C "contrib/slapd-modules/$module" \
      OPT="$CFLAGS $CPPFLAGS" \
      prefix=/usr \
      libexecdir=/usr/lib \
      sysconfdir=/etc/openldaip 
  done
}

install() {


  cd $dendro_buildroot
  for dir in clients servers doc/man/man{1,5,8}; do
    pushd ${dir}
    make DESTDIR="${dendro_installloc}" install
    popd
  done

  # install extra modules
  for module in "${_extra_modules[@]}"; do
    make -C "contrib/slapd-modules/$module" \
      prefix=/usr \
      libexecdir=/usr/lib \
      sysconfdir=/etc/openldap \
      DESTDIR="$dendro_installloc" install

    # passwd/sha2 has no man page, so skip it
    if [ -f "contrib/slapd-modules/$module/slapo-$module.5" ]; then
      /usr/bin/install -m644 -t "$dendro_installloc/usr/share/man/man5" \
        "contrib/slapd-modules/$module/slapo-$module.5"
    fi
  done

  # let systemd-tmpfiles generate this directory
  rm -r "${dendro_installloc}"/run

  # get rid of duplicate conf files
  rm "${dendro_installloc}"/etc/openldap/*.default

  ln -s ../lib/slapd "${dendro_installloc}"/usr/bin/slapd

  chown root:439 "${dendro_installloc}"/etc/openldap/slapd.{conf,ldif}
  chmod 640 "${dendro_installloc}"/etc/openldap/slapd.{conf,ldif}

  # systemd integration
  /usr/bin/install -Dm644 "${dendro_buildroot}"/openldap.tmpfiles "${dendro_installloc}"/usr/lib/tmpfiles.d/openldap.conf
  /usr/bin/install -Dm644 "${dendro_buildroot}"/openldap.sysusers "${dendro_installloc}"/usr/lib/sysusers.d/openldap.conf

  # license
  /usr/bin/install -Dm644 -t "${dendro_installloc}"/usr/share/licenses/openldap LICENSE
}

