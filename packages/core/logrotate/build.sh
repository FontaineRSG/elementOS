prepare() {
  cp logrotate.conf "$dendro_buildroot"
	cd "$dendro_buildroot"

	echo '#!/bin/true' > test/test-0110.sh

	# remove the install section from timer, as we enable it by default
	sed -i '/^\[Install\]$/,$d' examples/logrotate.timer
}

build() {
	cd "$dendro_buildroot"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
		--with-compress-command=/usr/bin/gzip \
		--with-uncompress-command=/usr/bin/gunzip \
		--with-default-mail-command=/usr/bin/mail \
		--with-acl
	make
}

install() {
	cd "$dendro_buildroot"

	make DESTDIR="$dendro_installloc" install

	/usr/bin/install -dm755 "$dendro_installloc/etc/logrotate.d"
	/usr/bin/install -Dm644 "logrotate.conf" "$dendro_installloc/etc/logrotate.conf"

	/usr/bin/install -D -m644 examples/logrotate.timer "${pkgdir}/usr/lib/systemd/system/logrotate.timer"
	/usr/bin/install -D -m644 examples/logrotate.service "${pkgdir}/usr/lib/systemd/system/logrotate.service"
	/usr/bin/install -d -m755 "$dendro_installloc/usr/lib/systemd/system/timers.target.wants"
	ln -s logrotate.timer "$dendro_installloc/usr/lib/systemd/system/timers.target.wants/logrotate.timer"
}

