install() {
  pkgdesc+=' - python library'
  depends=('python')

  cd ${dendro_buildroot}
  python3 -m installer --destdir="$dendro_installloc" ${dendro_buildroot}/brotli1.1.0/dist/*.whl
  /usr/bin/install -Dm 644 LICENSE -t "$dendro_installloc/usr/share/licenses/brotli/"
}

build(){
	echo "Bitch!"
}

prepare(){
	echo "Suck my dendro"
}
