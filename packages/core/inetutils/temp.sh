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
  echo "chmod"
  chmod -s "$dendro_installloc"/usr/bin/{rcp,rlogin,rsh}
  echo "pam install"
  install -D -m644 "${dendro_buildroot}/rlogin.pam" "${dendro_installloc}/etc/pam.d/rlogin"
  install -D -m644 "${dendro_buildroot}/rsh.pam" "${dendro_installloc}/etc/pam.d/rsh"
  echo "services install"
  install -D -m644 "${dendro_buildroot}/ftpd.service" "${dendro_installloc}/usr/lib/systemd/system/ftpd.service"
  install -D -m644 "${dendro_buildroot}/rlogin@.service" "${dendro_installloc}/usr/lib/systemd/system/rlogin@.service"
  install -D -m644 "${dendro_buildroot}/rlogin.socket" "${dendro_installloc}/usr/lib/systemd/system/rlogin.socket"
  install -D -m644 "${dendro_buildroot}/rsh@.service" "${dendro_installloc}/usr/lib/systemd/system/rsh@.service"
  install -D -m644 "${dendro_buildroot}/rsh.socket" "${dendro_installloc}/usr/lib/systemd/system/rsh.socket"
  install -D -m644 "${dendro_buildroot}/talk.service" "${dendro_installloc}/usr/lib/systemd/system/talk.service"
  install -D -m644 "${dendro_buildroot}/talk.socket" "${dendro_installloc}/usr/lib/systemd/system/talk.socket"
  install -D -m644 "${dendro_buildroot}/telnet@.service" "${dendro_installloc}/usr/lib/systemd/system/telnet@.service"
  install -D -m644 "${dendro_buildroot}/telnet.socket" "${dendro_installloc}/usr/lib/systemd/system/telnet.socket" 

  install -D -m644 ../inetutils.sysusers "$dendro_installloc/usr/lib/sysusers.d/$inetutils.conf"
  exit 0
}

prepare(){
	echo "nothing to be done here."
	exit 0
}
