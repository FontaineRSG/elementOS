install() {
  pkgdesc='command line tool and library for transferring data with URLs (no versioned symbols, linked against gnutls)'
  depends=('curl' 'gnutls')
  provides=('libcurl-gnutls.so')

	cd "$dendro_buildroot"/curl8.12.1/build-curl-gnutls

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/libcurl{,-gnutls}.so.4.8.0
  rm "${pkgdir}"/usr/lib/libcurl.{a,so}*
  ln -s libcurl-gnutls.so.4 "${pkgdir}"/usr/lib/libcurl-gnutls.so
  for version in 3 4 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
    ln -s libcurl-gnutls.so.4.8.0 "${pkgdir}"/usr/lib/libcurl-gnutls.so.${version}
  done

  /urs/bin/install -dm 0755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/libcurl-gnutls
}

