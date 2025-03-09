prepare() {
  echo "sesh."
}

build() {
  echo "hi alex! shall we meet again -cv2"
}

install() {
  cd $dendro_buildroot/src/python
  env VERSION_RELEASE=2.5.6 python3 setup.py install --root="${dendro_installloc}" --prefix=/usr -O1 --skip-build

}

