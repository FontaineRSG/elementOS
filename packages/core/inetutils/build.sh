build() {
  cd $dendro_buildroot
  ./configure \
    --prefix=/usr \
    --libexec=/usr/bin \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --without-wrap \
    --with-pam \
    --enable-ftp \
    --enable-ftpd \
    --enable-telnet \
    --enable-telnetd \
    --enable-talk \
    --enable-talkd \
    --enable-rlogin \
    --enable-rlogind \
    --enable-rsh \
    --enable-rshd \
    --enable-rcp \
    --enable-hostname \
    --enable-dnsdomainname \
    --disable-rexec \
    --disable-rexecd \
    --disable-tftp \
    --disable-tftpd \
    --disable-ping \
    --disable-ping6 \
    --disable-logger \
    --disable-syslogd \
    --disable-inetd \
    --disable-whois \
    --disable-uucpd \
    --disable-ifconfig \
    --disable-traceroute
      make
      exit 0
}

install(){
  cd $dendro_buildroot/
  echo "installing with make"
  make DESTDIR="$dendro_installloc" install
  echo "pam install line 1"
  /usr/bin/install -D -m644 "${dendro_buildroot}/rlogin.pam" "${dendro_installloc}/etc/pam.d/rlogin"
  echo "pam install line 2"
  /usr/bin/install -D -m644 "${dendro_buildroot}/rsh.pam" "${dendro_installloc}/etc/pam.d/rsh"
  echo "services install"
  /usr/bin/install -D -m644 "${dendro_buildroot}/ftpd.service" "${dendro_installloc}/usr/lib/systemd/system/ftpd.service"
  /usr/bin/install -D -m644 "${dendro_buildroot}/rlogin@.service" "${dendro_installloc}/usr/lib/systemd/system/rlogin@.service"
  /usr/bin/install -D -m644 "${dendro_buildroot}/rlogin.socket" "${dendro_installloc}/usr/lib/systemd/system/rlogin.socket"
  /usr/bin/install -D -m644 "${dendro_buildroot}/rsh@.service" "${dendro_installloc}/usr/lib/systemd/system/rsh@.service"
  /usr/bin/install -D -m644 "${dendro_buildroot}/rsh.socket" "${dendro_installloc}/usr/lib/systemd/system/rsh.socket"
  /usr/bin/install -D -m644 "${dendro_buildroot}/talk.service" "${dendro_installloc}/usr/lib/systemd/system/talk.service"
  /usr/bin/install -D -m644 "${dendro_buildroot}/talk.socket" "${dendro_installloc}/usr/lib/systemd/system/talk.socket"
  /usr/bin/install -D -m644 "${dendro_buildroot}/telnet@.service" "${dendro_installloc}/usr/lib/systemd/system/telnet@.service"
  /usr/bin/install -D -m644 "${dendro_buildroot}/telnet.socket" "${dendro_installloc}/usr/lib/systemd/system/telnet.socket"

  /usr/bin/install -D -m644 $dendro_buildroot/inetutils.sysusers "$dendro_installloc/usr/lib/sysusers.d/$inetutils.conf"
}

prepare(){
	echo "nothing to be done here."
	exit 0
}
