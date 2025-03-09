prepare() {
  [[ ! -d binutils-gdb ]] && ln -s binutils2.44 binutils-gdb
  mkdir -p binutils-build

  cd "${dendro_buildroot}"/binutils2.44/

  # Turn off development mode (-Werror, gas run-time checks, date in sonames)
  sed -i '/^development=/s/true/false/' bfd/development.sh

  # Creds @Fedora
  # Change the gold configuration script to only warn about
  # unsupported targets.  This allows the binutils to be built with
  # BPF support enabled.
  patch -Np1 -i "${dendro_buildroot}"/binutils2.44/gold-warn-unsupported.patch
}

build() {
  cd ${dendro_buildroot}/binutils2.44/

  "${dendro_buildroot}"/binutils2.44/gdb/configure \
    --prefix=/usr \
    --sysconfdir="${dendro_installloc}"/etc \
    --with-lib-path=/usr/lib:/usr/local/lib \
    --with-bugurl=https://gitlab.archlinux.org/archlinux/packaging/packages/binutils/-/issues \
    --enable-cet \
    --enable-colored-disassembly \
    --enable-default-execstack=no \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-install-libiberty \
    --enable-jansson \
    --enable-ld=default \
    --enable-new-dtags \
    --enable-pgo-build=lto \
    --enable-plugins \
    --enable-relro \
    --enable-shared \
    --enable-targets=x86_64-pep,bpf-unknown-none \
    --enable-threads \
    --disable-gdb \
    --disable-gdbserver \
    --disable-libdecnumber \
    --disable-readline \
    --disable-sim \
    --disable-werror \
    --with-debuginfod \
    --with-pic \
    --with-system-zlib

  make -j$(nproc) -O tooldir=/usr

  # Extract the FSF All Permissive License
  # <https://www.gnu.org/prep/maintain/html_node/License-Notices-for-Other-Files.html>
  # used for some linker scripts.
  tail -n 5 "${dendro_buildroot}"/binutils2.44/ld/scripttempl/README > FSFAP
}

check() {
  cd ${dendro_buildroot}/binutils2.44/

  # Use minimal flags for testsuite
  # ld testsuite uses CFLAGS_FOR_TARGET and requires -g
  # gold testsuite requires CXXFLAGS/CFLAGS with default PIE/PIC disabled
  make -O CFLAGS_FOR_TARGET="-O2 -g" \
          CXXFLAGS="-O2 -no-pie -fno-PIC" \
          CFLAGS="-O2 -no-pie" \
          LDFLAGS="" \
          check || true
}

install() {
  cd ${dendro_buildroot}/binutils2.44/
  make prefix="${dendro_installloc}"/usr tooldir="${dendro_installloc}"/usr install

  # install PIC version of libiberty
  /usr/bin/install -m644 libiberty/pic/libiberty.a "${dendro_installloc}"/usr/lib

  # Remove unwanted files
  rm -f "${dendro_installloc}"/usr/share/man/man1/{dlltool,windres,windmc}*

  # No shared linking to these files outside binutils
  rm -f "${dendro_installloc}"/usr/lib/lib{bfd,opcodes}.so
  tee "${dendro_installloc}"/usr/lib/libbfd.so << EOS
/* GNU ld script */

INPUT( /usr/lib/libbfd.a -lsframe -liberty -lz -lzstd -ldl )
EOS

  tee "${dendro_installloc}"/usr/lib/libopcodes.so << EOS
/* GNU ld script */

INPUT( /usr/lib/libopcodes.a -lbfd )
EOS

  # install FSF All Permissive License
  /usr/bin/install -Dm644 -t "${dendro_installloc}"/usr/share/licenses/binutils/ FSFAP
}

