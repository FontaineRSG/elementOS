prepare(){
 echo "nothing to prepare"
}

build(){
 echo "nothing to build"
}

install(){
  mv -v /var/dendro/audit/anemopack/package/etc* "$dendro_installloc"
}
