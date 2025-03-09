prepare() {
  local commit
  local cherry_picks=(
    2d2e97b0eb53fa7f87a3bf1529d8f712dd954480  # fix for CVE-2022-24407
    266f0acf7f5e029afbb3e263437039e50cd6c262  # fix issues with time.h detection https://github.com/cyrusimap/cyrus-sasl/issues/859
    887dbc0435056ec58ee48c4d803f110ade1e4c39  # openssl 3.0 support: https://github.com/cyrusimap/cyrus-sasl/pull/653
    dfaa62392e7caecc6ecf0097b4d73738ec4fc0a8  # openssl 3.0 support: https://github.com/cyrusimap/cyrus-sasl/pull/653
    c2bd3afbca57f176d8c650670ce371444bb7fcc0  # openssl 3.0 support: https://github.com/cyrusimap/cyrus-sasl/pull/653
  )

  cd $dendro_buildroot/libsasl2.1.28
  for commit in "${cherry_picks[@]}"; do
    git cherry-pick -n "$commit"
  done

  autoreconf -fiv
}

build() {
  local configure_options=(
    --disable-krb4
    --disable-macos-framework
    --disable-otp
    --disable-passdss
    --disable-srp
    --disable-srp-setpass
    --disable-static
    --enable-alwaystrue
    --enable-anon
    --enable-auth-sasldb
    --enable-checkapop
    --enable-cram
    --enable-digest
    --enable-gssapi
    --enable-ldapdb
    --enable-login
    --enable-ntlm
    --enable-plain
    --enable-shared
    --enable-sql
    --infodir=/usr/share/info
    --mandir=/usr/share/man
    --prefix=/usr
    --sbin=/usr/bin
    --sysconfdir=/etc
    --with-dblib=gdbm
    --with-devrandom=/dev/urandom
    --with-configdir=/etc/sasl2:/etc/sasl:/usr/lib/sasl2
    --with-ldap
    --with-mysql=/usr
    --with-pam
    --with-pgsql=/usr/lib
    --with-saslauthd=/var/run/saslauthd
    --with-sqlite3=/usr/lib
  )

  cd $dendro_buildroot/libsasl2.1.28
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking by libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot/libsasl2.1.28
  local _target
  make DESTDIR="$dendro_installloc" install-pkgconfigDATA
  for _target in include lib sasldb plugins utils; do
    make DESTDIR="$dendro_installloc" install $_target
  done
  # remove files provided by extra/cyrus-sasl
  rm -fv "$dendro_installloc"/usr/lib/sasl2/lib{gs2,gssapiv2,ldapdb,sql}.so*
}

