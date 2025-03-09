prepare() {
    cd "${dendro_buildroot}"
    autoreconf -fiv
}

build() {
    cd "${dendro_buildroot}"
    ./configure --prefix=/usr
    make
}

install() {
    cd "${dendro_buildroot}"
    make DESTDIR="${dendro_installloc}" install
}

