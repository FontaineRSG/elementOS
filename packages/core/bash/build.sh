_basever=5.2
_patchlevel=037

prepare() {
  cd "${dendro_buildroot}"
  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    local patch="bash${_basever//.}-$(printf "%03d" $_p)"
    patch -Np0 -i ../"${patch}"
  done
  # add patches from gentoo, fixing various upstream reported issues
  # https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files
  patch -Np0 -i ../bash-5.2_p15-random-ub.patch
  patch -Np0 -i ../bash-5.2_p21-wpointer-to-int.patch
  patch -Np0 -i ../bash-5.2_p32-memory-leaks.patch
  patch -Np0 -i ../bash-5.2_p32-read-delimiter-in-invalid-mbchar.patch
}

build() {
  cd "${dendro_buildroot}"

  _bashconfig=(-DDEFAULT_PATH_VALUE=\'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"\'
               -DSTANDARD_UTILS_PATH=\'\"/usr/bin\"\'
               -DSYS_BASHRC=\'\"/etc/bash.bashrc\"\'
               -DSYS_BASH_LOGOUT=\'\"/etc/bash.bash_logout\"\'
               -DNON_INTERACTIVE_LOGIN_SHELLS)
  export CFLAGS="${CFLAGS} ${_bashconfig[@]}"

  ./configure \
    --prefix=/usr \
    --with-curses \
    --enable-readline \
    --without-bash-malloc \
    --with-installed-readline
	  make -j$(nproc)
}

check() {
  make -C "${dendro_buildroot}" check
}

install() {
  cd "${dendro_buildroot}"

  make DESTDIR="$dendro_installloc" install
  ln -s bash "${dendro_installloc}/usr/bin/sh"
  ln -s bash "${dendro_installloc}/usr/bin/rbash"

  # system-wide configuration files
  /usr/bin/install -Dm644 bash5.2.037/system.bashrc "${dendro_installloc}/etc/bash.bashrc"
  /usr/bin/install -Dm644 bash5.2.037/system.bash_logout "${dendro_installloc}/etc/bash.bash_logout"

  # user configuration file skeletons
  /usr/bin/install -dm755 "${dendro_installloc}/etc/skel/"
  /usr/bin/install -m644 bash5.2.037/dot.bashrc "${dendro_installloc}/etc/skel/.bashrc"
  /usr/bin/install -m644 bash5.2.037/dot.bash_profile "${dendro_installloc}/etc/skel/.bash_profile"
  /usr/bin/install -m644 bash5.2.037/dot.bash_logout "${dendro_installloc}/etc/skel/.bash_logout"
}

prepare() {
	echo "PENGUINS POWER!"
}
