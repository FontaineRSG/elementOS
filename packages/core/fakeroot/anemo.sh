#!/bin/sh

post_install() {
  usr/bin/ldconfig -r .
}

post_upgrade() {
  usr/bin/ldconfig -r .
}

pre_remove() {
  usr/bin/ldconfig -r .
}


