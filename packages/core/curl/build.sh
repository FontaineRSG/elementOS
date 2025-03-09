prepare() {
	cd "$dendro_buildroot"/curl8.12.1

	local _c
	for _c in "${_backports[@]}"; do
		if [[ $_c == *..* ]]; then
			git log --oneline --reverse "${_c}"
		else
			git log --oneline -1 "${_c}"
		fi
		git cherry-pick -n -m1 "${_c}"
	done
	for _c in "${_reverts[@]}"; do
		git log --oneline -1 "${_c}"
		git revert -n "${_c}"
	done

	# no '-DEV' in version, release date from tagged commit...
	sed -i \
		-e "/\WLIBCURL_VERSION\W/c #define LIBCURL_VERSION \"${pkgver}\"" \
		-e "/\WLIBCURL_TIMESTAMP\W/c #define LIBCURL_TIMESTAMP \"$(git log -1 --format=%cs "curl-${pkgver//./_}")\"" \
		include/curl/curlver.h

		autoreconf -fi
	}

build() {

	cd "$dendro_buildroot"/curl8.12.1

	# make curl --help deterministic
	# https://github.com/curl/curl/issues/16072
	export COLUMNS=80
	local _configure_options=(
	--prefix='/usr'
	--mandir='/usr/share/man'
	--disable-ldap
	--disable-ldaps
	--disable-manual
	--enable-ipv6
	--enable-threaded-resolver
	--enable-websockets
	--with-gssapi
	--with-libssh2
	--with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'
	)

	mkdir build-curl{,-compat,-gnutls}

	# build curl
	cd "$dendro_buildroot"/curl8.12.1/build-curl

	"$dendro_buildroot"/curl8.12.1/configure \
		"${_configure_options[@]}" \
		--enable-versioned-symbols \
		--with-fish-functions-dir=/usr/share/fish/vendor_completions.d/ \
		--with-openssl \
		--with-openssl-quic \
		--with-zsh-functions-dir=/usr/share/zsh/site-functions/
		sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
		make -j$(nproc)

	# build libcurl-compat
	cd "$dendro_buildroot"/curl8.12.1/build-curl-compat

	"$dendro_buildroot"/curl8.12.1/configure \
		"${_configure_options[@]}" \
		--disable-versioned-symbols \
		--with-openssl \
		--with-openssl-quic
		sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
		make -C lib
		patchelf --set-soname 'libcurl-compat.so.4' ./lib/.libs/libcurl.so

	# build libcurl-gnutls
	cd "$dendro_buildroot"/curl8.12.1/build-curl-gnutls

	"$dendro_buildroot"/curl8.12.1/configure \
		"${_configure_options[@]}" \
		--disable-versioned-symbols \
		--with-gnutls \
		--without-openssl
		sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
		make -C lib
		patchelf --set-soname 'libcurl-gnutls.so.4' ./lib/.libs/libcurl.so
}

check() {
	# make curl --help deterministic
	# https://github.com/curl/curl/issues/16072
	export COLUMNS=80 
	cd build-curl
	# -v: verbose
	# -a: keep going on failure (so we see everything which breaks, not just the first failing test)
	# -k: keep test files after completion
	# -am: automake style TAP output
	# -p: print logs if test fails
	# -j: parallelization
	# disable test 433, since it requires the glibc debug info
	make TFLAGS="-v -a -k -p -j$(nproc) !433" test-nonflaky
}

install() {
	depends+=('openssl' 'libcrypto.so' 'libssl.so')
	provides=('libcurl.so')

	cd "$dendro_buildroot"/curl8.12.1/build-curl

	make DESTDIR="${dendro_installloc}" install
	make DESTDIR="${dendro_installloc}" install -C scripts

	cd "$dendro_buildroot"/curl8.12.1/

	# license
	/usr/bin/install -Dt "${dendro_installloc}/usr/share/licenses/curl" -m0644 COPYING
}
